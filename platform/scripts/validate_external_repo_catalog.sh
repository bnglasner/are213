#!/usr/bin/env bash
set -euo pipefail

ruby <<'RUBY'
require "yaml"
require "set"
require "date"

CATALOG_PATH = "catalog/external_repo_catalog.yaml"
CONTRACT_PATH = "catalog/external_repo_catalog_contract.yaml"
BACKLOG_PATH = "catalog/external_repo_metadata_backlog.yaml"
COMPANION_PATH = "literature/canonical_ai_readable/external/academic_econ_repo_catalog.md"
ROUTING_PATH = "platform/skills/design-mapper/references/repo-tool-routing.md"

$failures = 0

def pass(msg)
  puts "[PASS] #{msg}"
end

def fail(msg)
  puts "[FAIL] #{msg}"
  $failures += 1
end

def load_yaml(path)
  YAML.safe_load(File.read(path), permitted_classes: [Date], aliases: false)
rescue StandardError => e
  fail("YAML parse failed for #{path}: #{e.message}")
  nil
end

[
  CATALOG_PATH,
  CONTRACT_PATH,
  BACKLOG_PATH,
  COMPANION_PATH,
  ROUTING_PATH
].each do |path|
  if File.exist?(path)
    pass("Found #{path}.")
  else
    fail("Missing required file: #{path}")
  end
end

if $failures.positive?
  puts "External catalog validation failed with #{$failures} issue(s)."
  exit 1
end

catalog = load_yaml(CATALOG_PATH)
contract = load_yaml(CONTRACT_PATH)
backlog = load_yaml(BACKLOG_PATH)

if catalog.nil? || contract.nil? || backlog.nil?
  puts "External catalog validation failed with #{$failures} issue(s)."
  exit 1
end

contract_top = contract.fetch("top_level_required_fields", [])
contract_top.each do |field|
  if catalog.key?(field)
    pass("Top-level field present: #{field}")
  else
    fail("Missing top-level field: #{field}")
  end
end

updated_on = catalog["updated_on"].to_s
if updated_on.match?(/\A\d{4}-\d{2}-\d{2}\z/)
  pass("updated_on is valid: #{updated_on}")
else
  fail("updated_on is missing or invalid: #{updated_on.inspect}")
end

if catalog["source_report"].to_s == "deep-research-report.md" && File.exist?(catalog["source_report"].to_s)
  pass("source_report points to an existing file.")
else
  fail("source_report is missing, non-canonical, or does not exist.")
end

if catalog["data_contract"].to_s == "docs/EXTERNAL_REPO_CATALOG_CONTRACT.md"
  pass("data_contract pointer is canonical.")
else
  fail("data_contract pointer must be docs/EXTERNAL_REPO_CATALOG_CONTRACT.md")
end

methodology = catalog["methodology"] || {}
contract.fetch("methodology_required_fields", []).each do |field|
  value = methodology[field]
  if value.is_a?(Array) && !value.empty?
    pass("methodology.#{field} is a non-empty list.")
  else
    fail("methodology.#{field} must be a non-empty list.")
  end
end

analytics = catalog["analytics"] || {}
contract.fetch("analytics_required_fields", []).each do |field|
  if analytics.key?(field)
    pass("analytics.#{field} is present.")
  else
    fail("Missing analytics field: #{field}")
  end
end

counts = analytics["subfield_counts_reported"] || {}
if counts.is_a?(Hash)
  subtotal = counts
    .reject { |k, _v| k == "reported_total_from_bar_chart" }
    .values
    .map(&:to_i)
    .sum
  reported_total = counts["reported_total_from_bar_chart"].to_i
  if subtotal == reported_total
    pass("subfield_counts_reported subtotal matches reported_total_from_bar_chart (#{reported_total}).")
  else
    fail("subfield_counts_reported mismatch: subtotal=#{subtotal}, reported_total_from_bar_chart=#{reported_total}")
  end
else
  fail("analytics.subfield_counts_reported must be a mapping.")
end

reconciliation = analytics["reconciliation_status"] || {}
contract.fetch("reconciliation_required_fields", []).each do |field|
  if reconciliation.key?(field)
    pass("reconciliation_status.#{field} is present.")
  else
    fail("Missing reconciliation_status field: #{field}")
  end
end

status = reconciliation["status"].to_s
if %w[resolved unresolved].include?(status)
  pass("reconciliation_status.status is valid: #{status}")
else
  fail("reconciliation_status.status must be one of: resolved, unresolved")
end

entries = catalog["entries"]
if entries.is_a?(Array) && !entries.empty?
  pass("entries list is present with #{entries.length} items.")
else
  fail("entries must be a non-empty list.")
  entries = []
end

canonical_count = reconciliation["canonical_catalog_entry_count"].to_i
if canonical_count == entries.length
  pass("reconciliation_status.canonical_catalog_entry_count matches entries length (#{entries.length}).")
else
  fail("canonical_catalog_entry_count=#{canonical_count} does not match entries length=#{entries.length}.")
end

required_entry_fields = contract.fetch("entry_required_fields", [])
allowed_priority = contract.fetch("allowed_recommended_priority", [])

id_set = Set.new
slug_set = Set.new

entries.each_with_index do |entry, idx|
  label = "entries[#{idx}]"
  unless entry.is_a?(Hash)
    fail("#{label} must be an object.")
    next
  end

  required_entry_fields.each do |field|
    value = entry[field]
    if value.nil?
      fail("#{label}.#{field} is missing.")
    elsif value.is_a?(String) && value.strip.empty?
      fail("#{label}.#{field} is empty.")
    else
      pass("#{label}.#{field} present.")
    end
  end

  id = entry["id"].to_s
  if id.match?(/\A[a-z0-9_]+\z/)
    pass("#{label}.id is snake_case.")
  else
    fail("#{label}.id is not snake_case: #{id.inspect}")
  end
  if id_set.include?(id)
    fail("Duplicate id detected: #{id}")
  else
    id_set << id
  end

  slug = entry["repo_slug"].to_s
  if slug.match?(/\A[A-Za-z0-9_.-]+\/[A-Za-z0-9_.-]+\z/)
    pass("#{label}.repo_slug format is valid.")
  else
    fail("#{label}.repo_slug format is invalid: #{slug.inspect}")
  end
  if slug_set.include?(slug)
    fail("Duplicate repo_slug detected: #{slug}")
  else
    slug_set << slug
  end

  expected_url = "https://github.com/#{slug}"
  if entry["repo_url"].to_s == expected_url
    pass("#{label}.repo_url matches repo_slug.")
  else
    fail("#{label}.repo_url must be #{expected_url.inspect}, got #{entry['repo_url'].inspect}")
  end

  priority = entry["recommended_priority"].to_s
  if allowed_priority.include?(priority)
    pass("#{label}.recommended_priority is allowed: #{priority}")
  else
    fail("#{label}.recommended_priority is invalid: #{priority.inspect}")
  end

  %w[key_files_artifacts ai_agent_use_cases].each do |list_field|
    value = entry[list_field]
    if value == "unspecified"
      pass("#{label}.#{list_field} explicitly preserves missingness as unspecified.")
      next
    end
    if value.is_a?(Array) && !value.empty? && value.all? { |x| x.is_a?(String) && !x.strip.empty? }
      pass("#{label}.#{list_field} is a non-empty string list.")
    else
      fail("#{label}.#{list_field} must be `unspecified` or a non-empty list of strings.")
    end
  end
end

provenance = catalog["provenance"] || {}
if provenance["repo_line_spans"].is_a?(Hash)
  missing_spans = slug_set.reject { |slug| provenance["repo_line_spans"].key?(slug) }
  if missing_spans.empty?
    pass("provenance.repo_line_spans covers all repo_slugs.")
  else
    fail("provenance.repo_line_spans missing slugs: #{missing_spans.to_a.sort.join(', ')}")
  end
else
  fail("provenance.repo_line_spans must be a mapping.")
end

companion_text = File.read(COMPANION_PATH)
routing_text = File.read(ROUTING_PATH)

slug_set.each do |slug|
  if companion_text.include?("`#{slug}`")
    pass("Companion doc references #{slug}.")
  else
    fail("Companion doc missing repo reference for #{slug}.")
  end

  if routing_text.include?("`#{slug}`")
    pass("Routing doc references #{slug}.")
  else
    fail("Routing doc missing repo reference for #{slug}.")
  end
end

routing_slug_matches = routing_text.scan(/`([A-Za-z0-9_.-]+\/[A-Za-z0-9_.-]+)`/).flatten.to_set
unknown_in_routing = routing_slug_matches.reject { |slug| slug_set.include?(slug) }
if unknown_in_routing.empty?
  pass("All repo slugs in routing doc exist in the external catalog.")
else
  fail("Routing doc references unknown repo slugs: #{unknown_in_routing.to_a.sort.join(', ')}")
end

if backlog["source_catalog"].to_s == CATALOG_PATH
  pass("Backlog source_catalog matches external catalog path.")
else
  fail("Backlog source_catalog must be #{CATALOG_PATH.inspect}")
end

queue = backlog["queue"]
if queue.is_a?(Array) && !queue.empty?
  pass("Backlog queue is present with #{queue.length} items.")
else
  fail("Backlog queue must be a non-empty list.")
  queue = []
end

allowed_status = Set.new(%w[pending in_review approved applied blocked])
required_backlog_fields = %w[
  id
  repo_slug
  recommended_priority
  unspecified_field_count
  unspecified_fields
  partial_signal_field_count
  partial_signal_fields
  status
  next_action
]
queue.each_with_index do |item, idx|
  label = "backlog.queue[#{idx}]"
  unless item.is_a?(Hash)
    fail("#{label} must be an object.")
    next
  end

  required_backlog_fields.each do |field|
    if item[field].nil?
      fail("#{label}.#{field} is missing.")
    else
      pass("#{label}.#{field} is present.")
    end
  end

  status = item["status"].to_s
  if allowed_status.include?(status)
    pass("#{label}.status is allowed: #{status}")
  else
    fail("#{label}.status is invalid: #{status.inspect}")
  end

  if item["unspecified_fields"].is_a?(Array)
    if item["unspecified_fields"].length == item["unspecified_field_count"].to_i
      pass("#{label} unspecified field count matches list length.")
    else
      fail("#{label} unspecified_field_count mismatch.")
    end
  else
    fail("#{label}.unspecified_fields must be a list.")
  end
end

backlog_slug_set = queue.map { |x| x["repo_slug"].to_s }.to_set
if backlog_slug_set == slug_set
  pass("Backlog queue repo_slug set matches external catalog entries.")
else
  missing_in_backlog = slug_set - backlog_slug_set
  extra_in_backlog = backlog_slug_set - slug_set
  fail("Backlog/catalog repo_slug mismatch. missing_in_backlog=#{missing_in_backlog.to_a.sort.join(', ')} extra_in_backlog=#{extra_in_backlog.to_a.sort.join(', ')}")
end

summary = backlog["summary"] || {}
total_repos = summary["total_repos"].to_i
if total_repos == entries.length
  pass("Backlog summary.total_repos matches entries length (#{entries.length}).")
else
  fail("Backlog summary.total_repos=#{total_repos} does not match entries length=#{entries.length}.")
end

summary_unspecified = summary["total_unspecified_field_instances"].to_i
queue_unspecified = queue.map { |x| x["unspecified_field_count"].to_i }.sum
if summary_unspecified == queue_unspecified
  pass("Backlog summary.total_unspecified_field_instances matches queue aggregation (#{queue_unspecified}).")
else
  fail("Backlog total_unspecified_field_instances mismatch: summary=#{summary_unspecified}, queue=#{queue_unspecified}")
end

if $failures.positive?
  puts "External catalog validation failed with #{$failures} issue(s)."
  exit 1
end

puts "External catalog validation passed."
RUBY
