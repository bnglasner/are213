# Material Ingestion Guide

Use this workflow when adding new econometric materials so files, metadata, and references stay consistent.

## Canonical Locations
- Source PDFs: `literature/raw_pdf/`
  - intake staging: `literature/raw_pdf/inbox/`
  - curated/canonical source set: `literature/raw_pdf/curated/`
- Canonical machine-readable notes: `literature/canonical_ai_readable/`
  - external notes staging: `literature/canonical_ai_readable/external/`
  - core curated notes: `literature/canonical_ai_readable/core/`
- Derived transforms/backups: `literature/derived/`
- Metadata index: `catalog/literature_catalog.yaml`
- Tag registry: `catalog/taxonomy.yaml`

## Recommended Workflow
1. Prepare an id and tags.
- id format: short snake-case topic token (example: `iv_weak_instruments_2026`)
- family tags: comma-separated method labels (example: `iv,weak_instruments`)
- inference tags: optional inference labels (example: `weak_iv_robust`)
- domain tags: comma-separated application/context labels (example: `labor` or `methodology`)

2. Ingest files and register catalog entry in one command.
```bash
platform/scripts/intake_material.sh \
  --id iv_weak_instruments_2026 \
  --title "Weak Instruments in Practice" \
  --pdf /path/to/Weak_Instruments.pdf \
  --md /path/to/Weak_Instruments.md \
  --pdf-tier inbox \
  --md-tier external \
  --tags iv,weak_instruments \
  --inference-tags weak_iv_robust \
  --domain-tags labor \
  --strict-tags
```

3. Validate catalog integrity.
```bash
platform/scripts/validate_literature_catalog.sh
```

## Alternate: Register Existing Canonical Files
If files are already in canonical locations:
```bash
platform/scripts/register_literature_entry.sh \
  --id a1_regression_refresh_2026 \
  --title "Key Facts About Regression (Refresh)" \
  --source-pdf literature/raw_pdf/A1_regression.pdf \
  --canonical-md literature/canonical_ai_readable/A1_regression.md \
  --tags general,regression \
  --inference-tags cluster_robust \
  --domain-tags methodology
```

## Promote Stable Materials
Move a cataloged item from staging to curated/core:
```bash
platform/scripts/promote_material.sh --id iv_weak_instruments_2026
```

Preview without moving files:
```bash
platform/scripts/promote_material.sh --id iv_weak_instruments_2026 --dry-run
```

## Automated Import: ITER Bookdown
Import preface + top-level chapters from the ITER bookdown source:
```bash
python3 platform/scripts/import_iter_bookdown.py
```

Recommended first pass (no catalog edits, first 2 items only):
```bash
python3 platform/scripts/import_iter_bookdown.py --limit 2 --no-register --overwrite
```

Dry-run planning only:
```bash
python3 platform/scripts/import_iter_bookdown.py --dry-run
```

Outputs:
- TOC manifest + HTML snapshots: `literature/derived/iter/`
- Canonical markdown staging: `literature/canonical_ai_readable/external/iter/`
- Source PDF receipts: `literature/raw_pdf/inbox/iter/`
- Optional catalog registration: `catalog/literature_catalog.yaml`

## Notes
- `intake_material.sh` creates a markdown stub if `--md` is omitted.
- Re-run with `--overwrite` only when replacing a canonical file intentionally.
- Use `--strict-tags` to enforce that all tags are registered in `catalog/taxonomy.yaml`.
- Use `--pdf-tier curated` and `--md-tier core` when promoting stable materials.
- `intake_material.sh` defaults `--domain-tags methodology` if not provided.
- Preview available tags with `platform/scripts/list_taxonomy_tags.sh`.
