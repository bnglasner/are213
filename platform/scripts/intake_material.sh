#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  platform/scripts/intake_material.sh \
    --id <entry_id> \
    --title <title> \
    --pdf <path/to/source.pdf> \
    --tags <tag1,tag2,...> \
    [--inference-tags <tag1,tag2,...>] \
    [--domain-tags <tag1,tag2,...>] \
    [--pdf-tier <inbox|curated>] \
    [--md-tier <external|core>] \
    [--md <path/to/canonical.md>] \
    [--taxonomy <catalog/taxonomy.yaml>] \
    [--strict-tags] \
    [--overwrite]

Behavior:
- Copies PDF into literature/raw_pdf/<tier>.
- Copies provided markdown into literature/canonical_ai_readable/<tier> OR creates a stub markdown if --md is omitted.
- Registers the entry in catalog/literature_catalog.yaml.
USAGE
}

ID=""
TITLE=""
PDF_SRC=""
MD_SRC=""
TAGS=""
INFERENCE_TAGS=""
DOMAIN_TAGS="methodology"
OVERWRITE=0
STRICT_TAGS=0
TAXONOMY_FILE="catalog/taxonomy.yaml"
PDF_TIER="inbox"
MD_TIER="external"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --id)
      ID="${2:-}"
      shift 2
      ;;
    --title)
      TITLE="${2:-}"
      shift 2
      ;;
    --pdf)
      PDF_SRC="${2:-}"
      shift 2
      ;;
    --md)
      MD_SRC="${2:-}"
      shift 2
      ;;
    --tags)
      TAGS="${2:-}"
      shift 2
      ;;
    --inference-tags)
      INFERENCE_TAGS="${2:-}"
      shift 2
      ;;
    --domain-tags)
      DOMAIN_TAGS="${2:-}"
      shift 2
      ;;
    --pdf-tier)
      PDF_TIER="${2:-}"
      shift 2
      ;;
    --md-tier)
      MD_TIER="${2:-}"
      shift 2
      ;;
    --taxonomy)
      TAXONOMY_FILE="${2:-}"
      shift 2
      ;;
    --strict-tags)
      STRICT_TAGS=1
      shift
      ;;
    --overwrite)
      OVERWRITE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$ID" || -z "$TITLE" || -z "$PDF_SRC" || -z "$TAGS" ]]; then
  echo "Missing required argument(s)." >&2
  usage
  exit 1
fi

if [[ ! -f "$PDF_SRC" ]]; then
  echo "PDF source file not found: $PDF_SRC" >&2
  exit 1
fi

if [[ "$PDF_TIER" != "inbox" && "$PDF_TIER" != "curated" ]]; then
  echo "--pdf-tier must be one of: inbox, curated" >&2
  exit 1
fi

if [[ "$MD_TIER" != "external" && "$MD_TIER" != "core" ]]; then
  echo "--md-tier must be one of: external, core" >&2
  exit 1
fi

PDF_BASE="$(basename "$PDF_SRC")"
PDF_DST="literature/raw_pdf/${PDF_TIER}/${PDF_BASE}"

mkdir -p "literature/raw_pdf/${PDF_TIER}" "literature/canonical_ai_readable/${MD_TIER}"

copy_file() {
  local src="$1"
  local dst="$2"
  if [[ -f "$dst" && "$OVERWRITE" -ne 1 ]]; then
    echo "Target exists (use --overwrite to replace): $dst" >&2
    return 1
  fi
  cp "$src" "$dst"
}

copy_file "$PDF_SRC" "$PDF_DST"

if [[ -n "$MD_SRC" ]]; then
  if [[ ! -f "$MD_SRC" ]]; then
    echo "Markdown source file not found: $MD_SRC" >&2
    exit 1
  fi
  MD_BASE="$(basename "$MD_SRC")"
  MD_DST="literature/canonical_ai_readable/${MD_TIER}/${MD_BASE}"
  copy_file "$MD_SRC" "$MD_DST"
else
  STEM="${PDF_BASE%.pdf}"
  MD_DST="literature/canonical_ai_readable/${MD_TIER}/${STEM}.md"
  if [[ -f "$MD_DST" && "$OVERWRITE" -ne 1 ]]; then
    echo "Target exists (use --overwrite to replace): $MD_DST" >&2
    exit 1
  fi
  cat > "$MD_DST" <<EOF_STUB
# ${TITLE}

## Source
- PDF: ${PDF_DST}

## Status
- TODO: replace this stub with canonical machine-readable notes.
EOF_STUB
fi

REGISTER_CMD=(
  platform/scripts/register_literature_entry.sh
  --id "$ID"
  --title "$TITLE"
  --source-pdf "$PDF_DST"
  --canonical-md "$MD_DST"
  --tags "$TAGS"
  --inference-tags "$INFERENCE_TAGS"
  --domain-tags "$DOMAIN_TAGS"
  --taxonomy "$TAXONOMY_FILE"
)

if [[ "$STRICT_TAGS" -eq 1 ]]; then
  REGISTER_CMD+=(--strict-tags)
fi

"${REGISTER_CMD[@]}"

echo "Ingested material: $ID"
