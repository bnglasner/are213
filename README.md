# ARE213 Econometrics Storehouse

This repository is being migrated into a durable storehouse for econometric tools, reusable skills, agents, and literature artifacts.

Phase 2 completes the structural migration:
- operational domains are now canonical under `platform/`
- literature assets are now canonical under `literature/`
- run artifacts are now canonical under `runs/`
- legacy root paths remain available through compatibility shims

## Core Components (Current)
- `platform/agents/`: orchestration and stage-gate behavior
- `platform/skills/`: reusable skill definitions and contracts
- `platform/templates/`: canonical output templates
- `runs/`: runtime, examples, QA benchmarks, and archives
- `literature/canonical_ai_readable/`: canonical machine-readable lecture and concept notes

## Compatibility Shims
Legacy paths still resolve to canonical domains:
- `agents`, `skills`, `templates`, `scripts` -> `platform/*`
- `AI_READABLE` -> `literature/canonical_ai_readable`
- `reports/` -> `runs/`

## Run Directory Convention
All workflow stages should write to one run-scoped directory:
- recommended: `runs/runtime/<run_id>/`
- all stage outputs: `research_brief.yaml`, `method_memo.md`, `assumption_audit.md`, `audit_report.md`, `improvement_plan.md`

`platform/agents/stage_gate_checks.sh` now supports:
1. a run directory input: `platform/agents/stage_gate_checks.sh runs/runtime/<run_id>`
2. explicit file inputs (legacy mode)
3. `RUN_DIR` environment variable mode

## Literature Canonical Rule
- Source PDFs live under `literature/raw_pdf/`:
  - staging: `literature/raw_pdf/inbox/`
  - curated: `literature/raw_pdf/curated/`
- Canonical machine-readable notes live under `literature/canonical_ai_readable/`:
  - staging: `literature/canonical_ai_readable/external/`
  - curated/core: `literature/canonical_ai_readable/core/`
- Derived or temporary conversions belong under `literature/derived/`.
- Catalog entries in `catalog/literature_catalog.yaml` should include `family_tags`, `inference_tags`, and `domain_tags`, validated against `catalog/taxonomy.yaml`.

## Literature Workflow
1. Ingest staged files and register metadata:
```bash
platform/scripts/intake_material.sh \
  --id <entry_id> \
  --title "<title>" \
  --pdf /path/to/source.pdf \
  --tags <family_tag1,family_tag2> \
  --inference-tags <optional_inference_tags> \
  --domain-tags <domain_tags> \
  --pdf-tier inbox \
  --md-tier external
```
2. Promote stable staged items to curated/core:
```bash
platform/scripts/promote_material.sh --id <entry_id>
```
3. Validate catalog integrity:
```bash
platform/scripts/validate_literature_catalog.sh
```

## Quick Start
1. Create a run folder:
```bash
RUN_DIR="runs/runtime/<run_id>"
mkdir -p "$RUN_DIR"
```
2. Produce stage outputs into that folder.
3. Validate gates:
```bash
platform/agents/stage_gate_checks.sh "$RUN_DIR"
```

## Documentation and Catalogs
- Architecture and migration notes: `docs/`
- Material ingestion workflow: `docs/MATERIAL_INGESTION.md`
- Taxonomy and tag rules: `docs/TAXONOMY.md`
- External repo catalog contract: `docs/EXTERNAL_REPO_CATALOG_CONTRACT.md`
- External repo maintenance runbook: `docs/EXTERNAL_REPO_CATALOG_MAINTENANCE.md`
- Planned storehouse domains: `platform/`, `literature/`, `runs/`
- Inventories: `catalog/literature_catalog.yaml`, `catalog/external_repo_catalog.yaml`, `catalog/tool_catalog.yaml`
- External metadata backlog: `catalog/external_repo_metadata_backlog.yaml`
- External repo companion: `literature/canonical_ai_readable/external/academic_econ_repo_catalog.md`
- External repo tool-node index: `literature/canonical_ai_readable/external/repo_tool_nodes.md`
- Design-mapper external routing reference: `platform/skills/design-mapper/references/repo-tool-routing.md`
- Taxonomy registry: `catalog/taxonomy.yaml`
- Catalog tag fields: `family_tags`, `inference_tags`, `domain_tags`

## External Repo Validation
- `platform/scripts/render_external_repo_tool_nodes.sh`
- `platform/scripts/build_external_repo_metadata_backlog.sh`
- `platform/scripts/create_external_metadata_review_packets.sh --run-id <run_id> --limit <n>`
- `platform/scripts/apply_external_metadata_packets.sh --run-id <run_id>`
- `platform/scripts/validate_external_repo_catalog.sh`
- `platform/scripts/check_external_repo_catalog_freshness.sh`

## Legacy Course Context
Original ARE213 lecture PDFs and materials are retained for continuity while the repository transitions to a broader econometrics platform.
