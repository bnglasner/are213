#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  platform/scripts/promote_material.sh \
    --id <entry_id> \
    [--catalog <catalog/literature_catalog.yaml>] \
    [--dry-run] \
    [--overwrite]

Behavior:
- Promotes source PDF path from literature/raw_pdf/inbox/... to literature/raw_pdf/curated/...
- Promotes canonical markdown path from literature/canonical_ai_readable/external/... to literature/canonical_ai_readable/core/...
- Moves files on disk and updates catalog paths for the selected id.
USAGE
}

ID=""
CATALOG="catalog/literature_catalog.yaml"
DRY_RUN=0
OVERWRITE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --id)
      ID="${2:-}"
      shift 2
      ;;
    --catalog)
      CATALOG="${2:-}"
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
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

if [[ -z "$ID" ]]; then
  echo "--id is required" >&2
  usage
  exit 1
fi

if [[ ! -f "$CATALOG" ]]; then
  echo "Catalog not found: $CATALOG" >&2
  exit 1
fi

if ! rg -n "^  - id: ${ID}$" "$CATALOG" >/dev/null 2>&1; then
  echo "Catalog id not found: $ID" >&2
  exit 1
fi

ENTRY="$(awk -v id="$ID" '
  $0 ~ "^  - id: " id "$" {in_entry=1; next}
  in_entry && /^  - id: / {in_entry=0}
  in_entry && /^    source_pdf: / {
    sub("^    source_pdf: ", "")
    src=$0
  }
  in_entry && /^    canonical_markdown: / {
    sub("^    canonical_markdown: ", "")
    md=$0
  }
  END {
    if (src != "" && md != "") {
      print src "|" md
    }
  }
' "$CATALOG")"

if [[ -z "$ENTRY" ]]; then
  echo "Could not parse source_pdf/canonical_markdown for id: $ID" >&2
  exit 1
fi

OLD_SRC="${ENTRY%%|*}"
OLD_MD="${ENTRY##*|}"
OLD_SRC="${OLD_SRC#\"}"
OLD_SRC="${OLD_SRC%\"}"
OLD_MD="${OLD_MD#\"}"
OLD_MD="${OLD_MD%\"}"

NEW_SRC="$OLD_SRC"
NEW_MD="$OLD_MD"

if [[ "$OLD_SRC" == literature/raw_pdf/inbox/* ]]; then
  NEW_SRC="literature/raw_pdf/curated/${OLD_SRC#literature/raw_pdf/inbox/}"
fi

if [[ "$OLD_MD" == literature/canonical_ai_readable/external/* ]]; then
  NEW_MD="literature/canonical_ai_readable/core/${OLD_MD#literature/canonical_ai_readable/external/}"
fi

if [[ "$OLD_SRC" == "$NEW_SRC" && "$OLD_MD" == "$NEW_MD" ]]; then
  echo "No promotable paths for id: $ID"
  echo "source_pdf=$OLD_SRC"
  echo "canonical_markdown=$OLD_MD"
  exit 0
fi

move_file() {
  local old="$1"
  local new="$2"

  if [[ "$old" == "$new" ]]; then
    return 0
  fi

  if [[ "$DRY_RUN" -eq 1 ]]; then
    echo "[DRY-RUN] move $old -> $new"
    return 0
  fi

  if [[ ! -f "$old" ]]; then
    echo "File to promote not found: $old" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$new")"

  if [[ -e "$new" && "$OVERWRITE" -ne 1 ]]; then
    echo "Target exists (use --overwrite): $new" >&2
    exit 1
  fi

  if [[ -e "$new" && "$OVERWRITE" -eq 1 ]]; then
    rm -f "$new"
  fi

  mv "$old" "$new"
}

move_file "$OLD_SRC" "$NEW_SRC"
move_file "$OLD_MD" "$NEW_MD"

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "[DRY-RUN] update catalog for id=$ID"
  echo "[DRY-RUN] source_pdf: $OLD_SRC -> $NEW_SRC"
  echo "[DRY-RUN] canonical_markdown: $OLD_MD -> $NEW_MD"
  exit 0
fi

TMP_CATALOG="$(mktemp)"
awk -v id="$ID" -v src="$NEW_SRC" -v md="$NEW_MD" '
  $0 ~ "^  - id: " id "$" {in_entry=1; print; next}
  in_entry && /^  - id: / {in_entry=0}
  in_entry && /^    source_pdf: / {print "    source_pdf: " src; next}
  in_entry && /^    canonical_markdown: / {print "    canonical_markdown: " md; next}
  {print}
' "$CATALOG" > "$TMP_CATALOG"

mv "$TMP_CATALOG" "$CATALOG"
TODAY="$(date +%F)"
perl -0pi -e "s/^updated_on: .*
/updated_on: ${TODAY}\n/m" "$CATALOG"

echo "Promoted id: $ID"
echo "source_pdf: $OLD_SRC -> $NEW_SRC"
echo "canonical_markdown: $OLD_MD -> $NEW_MD"
