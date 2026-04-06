# Contributing

## Design Principles
- Keep operational workflows reproducible and run-scoped.
- Separate canonical assets from derived artifacts.
- Prefer machine-readable catalogs for discoverability.

## New Tools, Skills, and Agents
1. Add or update files in `platform/agents/`, `platform/skills/`, and `platform/templates/`.
2. Keep output paths run-scoped (`<run_dir>/...`) in docs/contracts.
3. Update `catalog/tool_catalog.yaml` with new components.
4. Run structural checks before commit.

## Literature Additions
1. Add raw source to `literature/raw_pdf/`.
2. Add canonical markdown to `literature/canonical_ai_readable/`.
3. Register entries in `catalog/literature_catalog.yaml`.
4. Place temporary transforms in `literature/derived/`.
5. Ensure tags are registered in `catalog/taxonomy.yaml`.
6. Promote stable assets from staging (`inbox`/`external`) to curated (`curated`/`core`) when ready.

Preferred automation:
1. `platform/scripts/intake_material.sh ...`
2. `platform/scripts/validate_literature_catalog.sh`
3. `platform/scripts/promote_material.sh --id <entry_id>`

## Runtime Artifacts
- Store active outputs under `runs/runtime/<run_id>/`.
- Keep examples and QA artifacts under `runs/examples/` and `runs/qa/`.
- Avoid committing ad hoc runtime scratch files.
