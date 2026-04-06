#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  platform/scripts/create_external_metadata_review_packets.sh \
    --run-id <run_id> \
    [--limit <n>] \
    [--status <pending|approved|blocked|in_review|applied>] \
    [--backlog <catalog/external_repo_metadata_backlog.yaml>] \
    [--catalog <catalog/external_repo_catalog.yaml>]

Behavior:
- Creates one review packet per selected backlog entry.
- Writes packets under runs/runtime/<run_id>/external_metadata_pass/packets/.
- Updates backlog entry status to in_review for generated packets.
- Appends checkpoint log entries in the run directory.
USAGE
}

RUN_ID=""
LIMIT="0"
STATUS_FILTER="pending"
BACKLOG="catalog/external_repo_metadata_backlog.yaml"
CATALOG="catalog/external_repo_catalog.yaml"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --run-id)
      RUN_ID="${2:-}"
      shift 2
      ;;
    --limit)
      LIMIT="${2:-}"
      shift 2
      ;;
    --status)
      STATUS_FILTER="${2:-}"
      shift 2
      ;;
    --backlog)
      BACKLOG="${2:-}"
      shift 2
      ;;
    --catalog)
      CATALOG="${2:-}"
      shift 2
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

if [[ ! "$LIMIT" =~ ^[0-9]+$ ]]; then
  echo "--limit must be a non-negative integer" >&2
  exit 1
fi

RUN_DIR="runs/runtime/${RUN_ID}/external_metadata_pass"
PACKET_DIR="${RUN_DIR}/packets"
MANIFEST_PATH="${RUN_DIR}/packet_manifest.yaml"
CHECKPOINT_LOG="${RUN_DIR}/checkpoints.log"

mkdir -p "$PACKET_DIR"

ruby - "$BACKLOG" "$CATALOG" "$RUN_ID" "$LIMIT" "$STATUS_FILTER" "$PACKET_DIR" "$MANIFEST_PATH" "$CHECKPOINT_LOG" <<'RUBY'
require "yaml"
require "date"
require "fileutils"

backlog_path, catalog_path, run_id, limit_s, status_filter, packet_dir, manifest_path, checkpoint_log = ARGV
limit = limit_s.to_i

unless File.exist?(backlog_path)
  warn "[FAIL] Missing backlog: #{backlog_path}"
  exit 1
end

unless File.exist?(catalog_path)
  warn "[FAIL] Missing catalog: #{catalog_path}"
  exit 1
end

backlog = YAML.safe_load(File.read(backlog_path), permitted_classes: [Date], aliases: false)
catalog = YAML.safe_load(File.read(catalog_path), permitted_classes: [Date], aliases: false)

queue = backlog["queue"]
entries = catalog["entries"]

unless queue.is_a?(Array) && entries.is_a?(Array)
  warn "[FAIL] Invalid backlog or catalog structure."
  exit 1
end

entry_by_slug = {}
entries.each do |entry|
  entry_by_slug[entry["repo_slug"].to_s] = entry
end

selected = queue.select { |item| item["status"].to_s == status_filter }
selected = selected.first(limit) if limit > 0

if selected.empty?
  puts "[PASS] No backlog entries matched status=#{status_filter.inspect}."
  exit 0
end

packets_written = []
today = Date.today.iso8601

selected.each do |item|
  slug = item["repo_slug"].to_s
  entry = entry_by_slug[slug]
  unless entry.is_a?(Hash)
    warn "[FAIL] Backlog repo not found in catalog: #{slug}"
    next
  end

  packet = {
    "version" => 1,
    "run_id" => run_id,
    "generated_on" => today,
    "repo" => {
      "id" => entry["id"],
      "repo_slug" => entry["repo_slug"],
      "recommended_priority" => entry["recommended_priority"],
      "source_section" => entry["source_section"]
    },
    "current_values" => {
      "owner_affiliation" => entry["owner_affiliation"],
      "primary_language" => entry["primary_language"],
      "last_update_signal" => entry["last_update_signal"],
      "stars" => entry["stars"],
      "forks" => entry["forks"],
      "watchers" => entry["watchers"],
      "license" => entry["license"],
      "key_files_artifacts" => entry["key_files_artifacts"],
      "installation_status" => entry["installation_status"]
    },
    "proposed_updates" => {
      "owner_affiliation" => entry["owner_affiliation"],
      "primary_language" => entry["primary_language"],
      "last_update_signal" => entry["last_update_signal"],
      "stars" => entry["stars"],
      "forks" => entry["forks"],
      "watchers" => entry["watchers"],
      "license" => entry["license"],
      "key_files_artifacts" => entry["key_files_artifacts"],
      "installation_status" => entry["installation_status"]
    },
    "evidence" => {
      "source_report" => "deep-research-report.md",
      "supporting_sources" => [
        "unspecified"
      ],
      "notes" => "fill_with_verified_evidence_before_approval"
    },
    "review" => {
      "status" => "in_review",
      "reviewer" => "unspecified",
      "reviewed_on" => "unspecified",
      "decision_note" => "unspecified"
    }
  }

  packet_path = File.join(packet_dir, "#{entry['id']}.yaml")
  File.write(packet_path, packet.to_yaml(line_width: -1))
  packets_written << packet_path

  item["status"] = "in_review"
  item["active_run_id"] = run_id
  item["packet_path"] = packet_path
  item["packet_generated_on"] = today
  item["next_action"] = "review_packet_and_set_review_status_to_approved_or_blocked"
end

manifest = {
  "version" => 1,
  "run_id" => run_id,
  "generated_on" => today,
  "status_filter" => status_filter,
  "packet_count" => packets_written.length,
  "packets" => packets_written
}

File.write(manifest_path, manifest.to_yaml(line_width: -1))
backlog["updated_on"] = today
File.write(backlog_path, backlog.to_yaml(line_width: -1))

File.open(checkpoint_log, "a") do |f|
  f.puts("[#{today}] generated #{packets_written.length} packet(s) for status=#{status_filter} run_id=#{run_id}")
  packets_written.each do |path|
    f.puts("[#{today}] packet=#{path}")
  end
end

puts "[PASS] Wrote #{packets_written.length} review packet(s) to #{packet_dir}."
puts "[PASS] Wrote manifest: #{manifest_path}."
RUBY
