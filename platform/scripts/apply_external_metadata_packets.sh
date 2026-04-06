#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  platform/scripts/apply_external_metadata_packets.sh \
    --run-id <run_id> \
    [--packet-dir <runs/runtime/<run_id>/external_metadata_pass/packets>] \
    [--catalog <catalog/external_repo_catalog.yaml>] \
    [--backlog <catalog/external_repo_metadata_backlog.yaml>] \
    [--allow-overwrite]

Behavior:
- Applies only packet files whose review.status is `approved`.
- Updates catalog entries for fields in proposed_updates.
- Updates backlog statuses and checkpoint log in run directory.
- Preserves source-truth policy: values can remain `unspecified`; no inference is introduced.
USAGE
}

RUN_ID=""
PACKET_DIR=""
CATALOG="catalog/external_repo_catalog.yaml"
BACKLOG="catalog/external_repo_metadata_backlog.yaml"
ALLOW_OVERWRITE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-id)
      RUN_ID="${2:-}"
      shift 2
      ;;
    --packet-dir)
      PACKET_DIR="${2:-}"
      shift 2
      ;;
    --catalog)
      CATALOG="${2:-}"
      shift 2
      ;;
    --backlog)
      BACKLOG="${2:-}"
      shift 2
      ;;
    --allow-overwrite)
      ALLOW_OVERWRITE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$RUN_ID" ]]; then
  echo "--run-id is required" >&2
  usage
  exit 1
fi

if [[ -z "$PACKET_DIR" ]]; then
  PACKET_DIR="runs/runtime/${RUN_ID}/external_metadata_pass/packets"
fi

RUN_DIR="runs/runtime/${RUN_ID}/external_metadata_pass"
CHECKPOINT_LOG="${RUN_DIR}/checkpoints.log"

mkdir -p "$RUN_DIR"

ruby - "$RUN_ID" "$PACKET_DIR" "$CATALOG" "$BACKLOG" "$ALLOW_OVERWRITE" "$CHECKPOINT_LOG" <<'RUBY'
require "yaml"
require "date"
require "set"

run_id, packet_dir, catalog_path, backlog_path, allow_overwrite_s, checkpoint_log = ARGV
allow_overwrite = allow_overwrite_s.to_i == 1

unless Dir.exist?(packet_dir)
  warn "[FAIL] Packet directory not found: #{packet_dir}"
  exit 1
end
unless File.exist?(catalog_path)
  warn "[FAIL] Missing catalog: #{catalog_path}"
  exit 1
end
unless File.exist?(backlog_path)
  warn "[FAIL] Missing backlog: #{backlog_path}"
  exit 1
end

catalog = YAML.safe_load(File.read(catalog_path), permitted_classes: [Date], aliases: false)
backlog = YAML.safe_load(File.read(backlog_path), permitted_classes: [Date], aliases: false)

entries = catalog["entries"]
queue = backlog["queue"]
unless entries.is_a?(Array) && queue.is_a?(Array)
  warn "[FAIL] Invalid catalog/backlog structure."
  exit 1
end

entry_by_id = {}
entry_by_slug = {}
entries.each do |entry|
  entry_by_id[entry["id"].to_s] = entry
  entry_by_slug[entry["repo_slug"].to_s] = entry
end

queue_by_slug = {}
queue.each { |item| queue_by_slug[item["repo_slug"].to_s] = item }

tracked_fields = backlog["tracked_fields"]
unless tracked_fields.is_a?(Array) && !tracked_fields.empty?
  warn "[FAIL] backlog.tracked_fields missing or empty."
  exit 1
end
allowed_fields = tracked_fields.to_set

packet_paths = Dir.glob(File.join(packet_dir, "*.yaml")).sort
if packet_paths.empty?
  puts "[PASS] No packet files found in #{packet_dir}."
  exit 0
end

today = Date.today.iso8601
applied_count = 0
blocked_count = 0
skipped_count = 0

packet_paths.each do |packet_path|
  begin
    packet = YAML.safe_load(File.read(packet_path), permitted_classes: [Date], aliases: false)
  rescue StandardError => e
    warn "[FAIL] Could not parse packet #{packet_path}: #{e.message}"
    skipped_count += 1
    next
  end

  repo = packet["repo"] || {}
  review = packet["review"] || {}
  proposed = packet["proposed_updates"] || {}
  current = packet["current_values"] || {}

  repo_id = repo["id"].to_s
  repo_slug = repo["repo_slug"].to_s
  review_status = review["status"].to_s

  if repo_id.empty? || repo_slug.empty?
    warn "[FAIL] Packet missing repo id/slug: #{packet_path}"
    skipped_count += 1
    next
  end

  entry = entry_by_id[repo_id]
  unless entry && entry["repo_slug"].to_s == repo_slug
    warn "[FAIL] Packet repo does not match catalog entry: #{packet_path}"
    skipped_count += 1
    next
  end

  backlog_item = queue_by_slug[repo_slug]
  unless backlog_item
    warn "[FAIL] Packet repo not found in backlog queue: #{packet_path}"
    skipped_count += 1
    next
  end

  if review_status == "blocked"
    backlog_item["status"] = "blocked"
    backlog_item["reviewer"] = review["reviewer"] || "unspecified"
    backlog_item["reviewed_on"] = review["reviewed_on"] || "unspecified"
    backlog_item["decision_note"] = review["decision_note"] || "unspecified"
    backlog_item["next_action"] = "resolve_blocker_then_regenerate_review_packet"
    blocked_count += 1
    next
  end

  unless review_status == "approved"
    skipped_count += 1
    next
  end

  reviewer = review["reviewer"].to_s
  reviewed_on = review["reviewed_on"].to_s
  decision_note = review["decision_note"].to_s
  if reviewer.empty? || reviewer == "unspecified" || reviewed_on.empty? || reviewed_on == "unspecified" || decision_note.empty? || decision_note == "unspecified"
    warn "[FAIL] Approved packet missing reviewer/reviewed_on/decision_note: #{packet_path}"
    skipped_count += 1
    next
  end

  unless proposed.is_a?(Hash) && !proposed.empty?
    warn "[FAIL] Approved packet has no proposed_updates: #{packet_path}"
    skipped_count += 1
    next
  end

  invalid_fields = proposed.keys.reject { |k| allowed_fields.include?(k) }
  unless invalid_fields.empty?
    warn "[FAIL] Packet has unsupported update fields #{invalid_fields.join(', ')}: #{packet_path}"
    skipped_count += 1
    next
  end

  changed_fields = []
  conflicts = []

  proposed.each do |field, new_value|
    if new_value.nil?
      conflicts << "#{field}:nil_value"
      next
    end

    old_value = entry[field]
    packet_old = current[field]
    if packet_old != old_value
      conflicts << "#{field}:stale_packet_current_value"
      next
    end

    if !allow_overwrite
      old_text = old_value.is_a?(String) ? old_value : nil
      if old_text && old_text != "unspecified" && !old_text.include?("unspecified")
        conflicts << "#{field}:overwrite_not_allowed"
        next
      end
    end

    if old_value != new_value
      entry[field] = new_value
      changed_fields << field
    end
  end

  if conflicts.any?
    backlog_item["status"] = "blocked"
    backlog_item["reviewer"] = reviewer
    backlog_item["reviewed_on"] = reviewed_on
    backlog_item["decision_note"] = "apply_conflicts=#{conflicts.join(';')}"
    backlog_item["next_action"] = "resolve_conflicts_and_regenerate_packet_or_use_allow_overwrite"
    blocked_count += 1
    next
  end

  backlog_item["status"] = "applied"
  backlog_item["reviewer"] = reviewer
  backlog_item["reviewed_on"] = reviewed_on
  backlog_item["decision_note"] = decision_note
  backlog_item["active_run_id"] = run_id
  backlog_item["last_packet_path"] = packet_path
  backlog_item["last_applied_on"] = today
  backlog_item["applied_field_count"] = changed_fields.length

  unresolved = tracked_fields.select { |field| entry[field] == "unspecified" }
  backlog_item["unspecified_field_count"] = unresolved.length
  backlog_item["unspecified_fields"] = unresolved
  backlog_item["next_action"] =
    if unresolved.empty?
      "monitor_for_new_gaps"
    else
      "continue_follow_up_metadata_pass_for_remaining_fields"
    end

  applied_count += 1
end

if applied_count > 0
  catalog["updated_on"] = today
end
backlog["updated_on"] = today

status_counts = {
  "pending" => queue.count { |x| x["status"] == "pending" },
  "in_review" => queue.count { |x| x["status"] == "in_review" },
  "approved" => queue.count { |x| x["status"] == "approved" },
  "applied" => queue.count { |x| x["status"] == "applied" },
  "blocked" => queue.count { |x| x["status"] == "blocked" }
}
backlog["summary"] ||= {}
backlog["summary"]["status_counts"] = status_counts
backlog["summary"]["total_unspecified_field_instances"] = queue.map { |x| x["unspecified_field_count"].to_i }.sum
backlog["summary"]["repos_with_unspecified_fields"] = queue.count { |x| x["unspecified_field_count"].to_i > 0 }
backlog["summary"]["repos_without_unspecified_fields"] = queue.count { |x| x["unspecified_field_count"].to_i == 0 }
backlog["summary"]["total_repos"] = queue.length
backlog["summary"]["high_priority_repos_with_unspecified_fields"] = queue.count do |x|
  x["recommended_priority"] == "high" && x["unspecified_field_count"].to_i > 0
end

File.write(catalog_path, catalog.to_yaml(line_width: -1))
File.write(backlog_path, backlog.to_yaml(line_width: -1))

File.open(checkpoint_log, "a") do |f|
  f.puts("[#{today}] apply_packets run_id=#{run_id} applied=#{applied_count} blocked=#{blocked_count} skipped=#{skipped_count}")
end

puts "[PASS] Packet apply complete: applied=#{applied_count}, blocked=#{blocked_count}, skipped=#{skipped_count}."
puts "[PASS] Updated catalog: #{catalog_path}"
puts "[PASS] Updated backlog: #{backlog_path}"
RUBY
