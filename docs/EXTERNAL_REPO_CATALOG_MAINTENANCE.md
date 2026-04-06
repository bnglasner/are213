# External Repo Catalog Maintenance

## Purpose

Operational checklist for maintaining:

- `catalog/external_repo_catalog.yaml`
- `literature/canonical_ai_readable/external/academic_econ_repo_catalog.md`
- `literature/canonical_ai_readable/external/repo_tool_nodes.md`
- `platform/skills/design-mapper/references/repo-tool-routing.md`

## Cadence

- Default cadence: quarterly (every 90 days).
- Trigger ad-hoc refresh when major method repos materially change.

## Quarterly Checklist

1. Regenerate tool-node pages from catalog:
```bash
platform/scripts/render_external_repo_tool_nodes.sh
```
2. Regenerate metadata-gap backlog from catalog:
```bash
platform/scripts/build_external_repo_metadata_backlog.sh
```
3. Run reference/path validation:
```bash
platform/scripts/check_internal_refs.sh
```
4. Run literature catalog validation:
```bash
platform/scripts/validate_literature_catalog.sh
```
5. Run external repo catalog contract validation:
```bash
platform/scripts/validate_external_repo_catalog.sh
```
6. Run freshness check:
```bash
platform/scripts/check_external_repo_catalog_freshness.sh
```
7. Confirm reconciliation block still reflects source inconsistencies.
8. Confirm every catalog entry still has a corresponding tool-node page.
9. Confirm every routed repo in `repo-tool-routing.md` exists in the external catalog.
10. Update `updated_on` and maintenance notes after refresh.

## Policy Constraints

- Preserve missing values as literal `unspecified`.
- Keep updates additive and non-destructive.
- Use snake_case IDs and enum-like tags.
- If source inconsistencies remain unresolved, keep them explicitly documented.

## Review-Packet Workflow

1. Create a packet batch:
```bash
platform/scripts/create_external_metadata_review_packets.sh --run-id <run_id> --limit <n>
```
2. Fill packet evidence and set `review.status` to `approved` or `blocked`.
3. Apply approved packets:
```bash
platform/scripts/apply_external_metadata_packets.sh --run-id <run_id>
```
4. Rebuild backlog and validate:
```bash
platform/scripts/build_external_repo_metadata_backlog.sh
platform/scripts/validate_external_repo_catalog.sh
```
