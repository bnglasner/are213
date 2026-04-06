# External Repo Catalog Contract

## Scope

This contract defines minimum structure and quality rules for:

- `catalog/external_repo_catalog.yaml`
- `catalog/external_repo_metadata_backlog.yaml`
- `literature/canonical_ai_readable/external/academic_econ_repo_catalog.md`
- `platform/skills/design-mapper/references/repo-tool-routing.md`

The source of truth for content remains `deep-research-report.md`.

## Core Rules

1. Preserve missing values as literal `unspecified` (do not infer).
2. Use snake_case for IDs/tags/enum-like values.
3. Keep changes additive and non-destructive.
4. Preserve explicit report inconsistencies in `analytics.reconciliation_status` and `analytics.internal_inconsistencies`.
5. Keep repository URLs canonical as `https://github.com/<owner>/<repo>`.

## Required Top-Level Fields (`external_repo_catalog.yaml`)

- `version`
- `updated_on`
- `source_report`
- `data_contract`
- `methodology`
- `analytics`
- `provenance`
- `entries`

## Required `methodology` Fields

- `inclusion_criteria` (non-empty list)
- `exclusion_criteria` (non-empty list)
- `limitations` (non-empty list)

## Required `analytics` Fields

- `subfield_taxonomy_used`
- `subfield_counts_reported`
- `recency_buckets`
- `internal_inconsistencies`
- `reconciliation_status`

## Required `reconciliation_status` Fields

- `status` (allowed: `resolved`, `unresolved`)
- `report_declared_shortlist_n`
- `report_bar_chart_total`
- `report_summary_table_count`
- `report_detailed_heading_count`
- `canonical_catalog_entry_count`
- `canonical_catalog_coverage_note`
- `resolution_policy`
- `next_action`

## Required Per-Entry Fields

- `id`
- `repo_slug`
- `repo_url`
- `owner_name`
- `owner_affiliation`
- `primary_scope`
- `primary_language`
- `last_update_signal`
- `stars`
- `forks`
- `watchers`
- `license`
- `recommended_priority`
- `key_files_artifacts`
- `installation_status`
- `ai_agent_use_cases`
- `metadata_completeness_note`
- `source_section`

## Allowed `recommended_priority` Values

- `high`
- `medium_high`
- `medium`
- `low`
- `unspecified`

## Collection and Consistency Rules

- `entries[*].id` must be unique and snake_case.
- `entries[*].repo_slug` must be unique.
- `entries[*].repo_url` must match `https://github.com/<repo_slug>`.
- `entries[*].key_files_artifacts` is either:
  - a non-empty list of strings, or
  - the literal `unspecified`.
- `entries[*].ai_agent_use_cases` is either:
  - a non-empty list of strings, or
  - the literal `unspecified`.
- `analytics.reconciliation_status.canonical_catalog_entry_count` must equal `len(entries)`.

## Cross-File Consistency Rules

- Every `repo_slug` in `external_repo_catalog.yaml` must appear in:
  - `academic_econ_repo_catalog.md` (as a repo section), and
  - either the routing matrix or family guidance in `repo-tool-routing.md`.
- Every repo referenced in `repo-tool-routing.md` must exist in `external_repo_catalog.yaml`.
- `external_repo_metadata_backlog.yaml` queue must contain the same repo slugs as `external_repo_catalog.yaml`.

## Backlog Workflow Rules

- Allowed backlog statuses: `pending`, `in_review`, `approved`, `applied`, `blocked`.
- Review packets are generated under `runs/runtime/<run_id>/external_metadata_pass/packets/`.
- Only packets with `review.status: approved` are eligible for apply.
- Approved packets must include non-`unspecified` reviewer, reviewed date, and decision note.

## Validation Entry Point

Run:

```bash
platform/scripts/build_external_repo_metadata_backlog.sh
platform/scripts/create_external_metadata_review_packets.sh --run-id <run_id> --limit <n>
# reviewer edits packets and sets review.status/review metadata
platform/scripts/apply_external_metadata_packets.sh --run-id <run_id>
platform/scripts/validate_external_repo_catalog.sh
```
