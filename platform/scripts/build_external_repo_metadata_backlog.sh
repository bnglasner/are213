#!/usr/bin/env bash
set -euo pipefail

ruby <<'RUBY'
require "yaml"
require "date"
require "set"

CATALOG_PATH = "catalog/external_repo_catalog.yaml"
OUT_PATH = "catalog/external_repo_metadata_backlog.yaml"

unless File.exist?(CATALOG_PATH)
  warn "[FAIL] Missing catalog: #{CATALOG_PATH}"
  exit 1
end

catalog = YAML.safe_load(File.read(CATALOG_PATH), permitted_classes: [Date], aliases: false)
entries = catalog["entries"]

unless entries.is_a?(Array) && !entries.empty?
  warn "[FAIL] Catalog entries are missing or empty."
  exit 1
end

existing_backlog = {}
if File.exist?(OUT_PATH)
  begin
    parsed = YAML.safe_load(File.read(OUT_PATH), permitted_classes: [Date], aliases: false)
    existing_queue = parsed["queue"]
    if existing_queue.is_a?(Array)
      existing_queue.each do |item|
        next unless item.is_a?(Hash)
        key = item["repo_slug"].to_s
        next if key.empty?
        existing_backlog[key] = item
      end
    end
  rescue StandardError
    # Ignore parse errors from previous file and regenerate fresh.
  end
end

priority_rank = {
  "high" => 1,
  "medium_high" => 2,
  "medium" => 3,
  "low" => 4,
  "unspecified" => 5
}

tracked_fields = [
  "owner_affiliation",
  "primary_language",
  "last_update_signal",
  "stars",
  "forks",
  "watchers",
  "license",
  "key_files_artifacts",
  "installation_status"
]

allowed_status = Set.new(%w[pending in_review approved applied blocked])
preserved_fields = %w[
  status
  next_action
  reviewer
  reviewed_on
  decision_note
  active_run_id
  packet_path
  packet_generated_on
  last_applied_on
  last_packet_path
  applied_field_count
]

queue = entries.map do |entry|
  unspecified_fields = tracked_fields.select do |field|
    value = entry[field]
    value == "unspecified"
  end

  partial_signal_fields = tracked_fields.select do |field|
    value = entry[field]
    value.is_a?(String) && value != "unspecified" && value.include?("unspecified")
  end

  existing = existing_backlog.fetch(entry["repo_slug"].to_s, {})
  existing_status = existing["status"].to_s
  status = allowed_status.include?(existing_status) ? existing_status : "pending"
  next_action = existing["next_action"].to_s
  next_action = "perform_follow_up_metadata_pass_from_permitted_sources_and_update_external_repo_catalog" if next_action.empty?

  item = {
    "id" => entry["id"],
    "repo_slug" => entry["repo_slug"],
    "recommended_priority" => entry["recommended_priority"],
    "unspecified_field_count" => unspecified_fields.length,
    "unspecified_fields" => unspecified_fields,
    "partial_signal_field_count" => partial_signal_fields.length,
    "partial_signal_fields" => partial_signal_fields,
    "status" => status,
    "next_action" => next_action,
    "notes" => "generated_from_literal_unspecified_markers_without_inference"
  }

  preserved_fields.each do |field|
    next if %w[status next_action].include?(field)
    next unless existing.key?(field)
    value = existing[field]
    next if value.nil?
    item[field] = value
  end

  if item["status"] == "applied" && item["unspecified_field_count"] > 0
    item["status"] = "pending"
    item.delete("active_run_id")
    item.delete("packet_path")
  end

  item
end

sorted_queue = queue.sort_by do |item|
  [
    priority_rank.fetch(item["recommended_priority"], 99),
    -item["unspecified_field_count"],
    -item["partial_signal_field_count"],
    item["repo_slug"]
  ]
end

summary = {
  "total_repos" => entries.length,
  "repos_with_unspecified_fields" => sorted_queue.count { |x| x["unspecified_field_count"] > 0 },
  "repos_without_unspecified_fields" => sorted_queue.count { |x| x["unspecified_field_count"] == 0 },
  "total_unspecified_field_instances" => sorted_queue.map { |x| x["unspecified_field_count"] }.sum,
  "high_priority_repos_with_unspecified_fields" => sorted_queue.count do |x|
    x["recommended_priority"] == "high" && x["unspecified_field_count"] > 0
  end,
  "status_counts" => {
    "pending" => sorted_queue.count { |x| x["status"] == "pending" },
    "in_review" => sorted_queue.count { |x| x["status"] == "in_review" },
    "approved" => sorted_queue.count { |x| x["status"] == "approved" },
    "applied" => sorted_queue.count { |x| x["status"] == "applied" },
    "blocked" => sorted_queue.count { |x| x["status"] == "blocked" }
  }
}

backlog = {
  "version" => 1,
  "updated_on" => Date.today.iso8601,
  "source_catalog" => CATALOG_PATH,
  "generation_method" => "derived_from_literal_unspecified_values_in_tracked_fields",
  "tracked_fields" => tracked_fields,
  "priority_ordering" => %w[high medium_high medium low unspecified],
  "summary" => summary,
  "queue" => sorted_queue
}

File.write(OUT_PATH, backlog.to_yaml(line_width: -1))
puts "[PASS] Wrote metadata backlog: #{OUT_PATH}"
puts "[PASS] Queue size: #{sorted_queue.length} repos."
RUBY
