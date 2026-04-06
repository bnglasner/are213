# Migration Notes

## Implemented in Phase 1
- Reframed repository docs around a general econometrics storehouse objective.
- Standardized workflow documentation to use run-scoped outputs through `run_dir`.
- Updated agent and skill contracts to reference `<run_dir>/...` output paths.
- Extended `platform/agents/stage_gate_checks.sh` with run-directory and `RUN_DIR` support.
- Added structure scaffolding: `docs/`, `catalog/`, `platform/`, `literature/`, `runs/`.
- Added initial catalog manifests for literature and tools.
- Expanded `.gitignore` for runtime and derived-artifact hygiene.
- Added structural validation tooling and CI workflow.

## Deferred to Later Phases
- Physically move existing files into `literature/`, `platform/`, and `runs/`.
- Convert historical report paths to fully run-scoped conventions.
- Add richer metadata and version tracking to catalogs.
- Add automated migration scripts for path rewrites in archived outputs.

## Implemented in Phase 2
- Physically moved core domains to canonical paths:
  - `platform/{agents,skills,templates,scripts}`
  - `literature/{raw_pdf,canonical_ai_readable,derived}`
  - `runs/{runtime,examples,qa,archive}`
- Added compatibility symlinks for legacy root paths (`agents`, `skills`, `templates`, `scripts`, `reports`, `AI_READABLE`, and root PDF names).
- Added and executed automated path rewrite tooling for canonical references.
- Added ingestion tooling for future materials:
  - `platform/scripts/intake_material.sh`
  - `platform/scripts/register_literature_entry.sh`
  - `platform/scripts/validate_literature_catalog.sh`
  - `docs/MATERIAL_INGESTION.md`
