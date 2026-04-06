# Literature Domain

This is the canonical domain for source and transformed literature assets.

## Layout
- `raw_pdf/`: source PDFs
  - `inbox/`: staging area for incoming files
  - `curated/`: canonical/curated source PDFs
- `canonical_ai_readable/`: canonical machine-readable notes
  - `external/`: incoming external markdown notes
  - `core/`: curated core notes
- `derived/`: temporary or derived conversion outputs

## Compatibility
Legacy references to `AI_READABLE/` and root-level lecture PDFs are preserved through symlinks.
