# Repository Architecture (Phase 2)

## Goal
Support a long-lived econometrics storehouse for:
- general and design-specific econometric tools
- reusable skills and agent workflows
- literature and concept references
- reproducible run artifacts

## Phase 2 Status
Phase 2 establishes canonical domains and keeps compatibility shims:
- canonical operational paths: `platform/agents/`, `platform/skills/`, `platform/templates/`, `platform/scripts/`
- canonical run paths: `runs/`
- canonical literature paths: `literature/`
- compatibility shims preserve legacy paths (`agents`, `skills`, `templates`, `scripts`, `reports`, `AI_READABLE`)

## Canonical Domains
- `platform/`
  - destination domain for reusable tooling interfaces, wrappers, and shared execution logic
- `literature/`
  - `raw_pdf/`: source PDFs (`inbox/` for staging, `curated/` for promoted set)
  - `canonical_ai_readable/`: stable machine-readable notes (`external/` staging, `core/` curated)
  - `derived/`: temporary or transformed literature artifacts
- `runs/`
  - canonical domain for runtime examples/qa/archive
- `catalog/`
  - machine-readable inventories for literature and tools
  - includes taxonomy registry (`catalog/taxonomy.yaml`) used to validate literature tags

## Active Operational Domains
- `platform/agents/`
- `platform/skills/`
- `platform/templates/`
- `platform/scripts/`
- `runs/`
- `literature/canonical_ai_readable/`

## Run Directory Convention
Each workflow execution should use one run-scoped directory:
- recommended today: `runs/runtime/<run_id>/`
- required stage outputs:
  - `research_brief.yaml`
  - `method_memo.md`
  - `assumption_audit.md`
  - `audit_report.md`
  - `improvement_plan.md`

`platform/agents/stage_gate_checks.sh` supports:
1. `platform/agents/stage_gate_checks.sh <run_dir>`
2. `RUN_DIR=<run_dir> platform/agents/stage_gate_checks.sh`
3. legacy explicit-file invocation

## Canonical Literature Rule
- Use `literature/canonical_ai_readable/` as canonical machine-readable references.
- Treat MarkItDown outputs and backups as derived artifacts.
- Use `platform/scripts/intake_material.sh` for staging intake and `platform/scripts/promote_material.sh` for promotion to curated/core.
