#!/usr/bin/env bash
set -euo pipefail

ruby <<'RUBY'
require "yaml"
require "fileutils"
require "date"

CATALOG_PATH = "catalog/external_repo_catalog.yaml"
OUT_DIR = "literature/canonical_ai_readable/external/repos"
INDEX_PATH = "literature/canonical_ai_readable/external/repo_tool_nodes.md"

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

FileUtils.mkdir_p(OUT_DIR)

entries.each do |entry|
  id = entry.fetch("id")
  page_path = File.join(OUT_DIR, "#{id}.md")

  key_files = entry["key_files_artifacts"]
  key_files_block =
    if key_files == "unspecified"
      "- unspecified"
    else
      key_files.map { |x| "- `#{x}`" }.join("\n")
    end

  use_cases = entry["ai_agent_use_cases"]
  use_cases_block =
    if use_cases == "unspecified"
      "- unspecified"
    else
      use_cases.map { |x| "- #{x}" }.join("\n")
    end

  line_span = catalog.dig("provenance", "repo_line_spans", entry["repo_slug"]) || "unspecified"

  page = <<~MD
  # Tool Node: `#{entry['repo_slug']}`

  - Repo URL: `#{entry['repo_url']}`
  - Priority: `#{entry['recommended_priority']}`
  - Source section: #{entry['source_section']}

  ## Profile

  - Owner: `#{entry['owner_name']}`
  - Affiliation: `#{entry['owner_affiliation']}`
  - Primary scope: `#{entry['primary_scope']}`
  - Primary language: `#{entry['primary_language']}`
  - Last update signal: `#{entry['last_update_signal']}`
  - Stars: `#{entry['stars']}`
  - Forks: `#{entry['forks']}`
  - Watchers: `#{entry['watchers']}`
  - License: `#{entry['license']}`

  ## Key Files and Artifacts

  #{key_files_block}

  ## Installation Status

  - `#{entry['installation_status']}`

  ## AI-Agent Use Cases

  #{use_cases_block}

  ## Metadata Completeness

  - `#{entry['metadata_completeness_note']}`

  ## Provenance

  - Source report: `deep-research-report.md`
  - Provenance line span: `#{line_span}`
  MD

  File.write(page_path, page)
end

rows = entries.map do |entry|
  "| `#{entry['repo_slug']}` | `#{entry['recommended_priority']}` | `repos/#{entry['id']}.md` |"
end.join("\n")

index = <<~MD
# External Repo Tool Nodes

This index materializes one tool-node page per repository from `catalog/external_repo_catalog.yaml`.

| Repo slug | Priority | Tool node page |
|---|---|---|
#{rows}

## Notes

- Missing metadata is preserved as literal `unspecified`.
- Provenance is carried from `catalog/external_repo_catalog.yaml`.
MD

File.write(INDEX_PATH, index)

puts "[PASS] Rendered #{entries.length} tool-node pages into #{OUT_DIR}."
puts "[PASS] Rendered index: #{INDEX_PATH}."
RUBY
