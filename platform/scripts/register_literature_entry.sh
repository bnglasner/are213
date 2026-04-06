#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  platform/scripts/register_literature_entry.sh \
    --id <entry_id> \
    --title <title> \
    --source-pdf <literature/raw_pdf/...pdf> \
    --canonical-md <literature/canonical_ai_readable/...md> \
    --tags <tag1,tag2,...> \
    [--inference-tags <tag1,tag2,...>] \
    [--domain-tags <tag1,tag2,...>] \
    [--taxonomy <catalog/taxonomy.yaml>] \
    [--strict-tags]
USAGE
}

extract_domain_tags() {
  local taxonomy_file="$1"
  local domain="$2"
  local out_file="$3"

  awk -v d="$domain" '
    /^tag_domains:/ { in_domains=1; next }
    /^naming_rules:/ { in_domains=0 }
    in_domains && $0 ~ "^  " d ":" { in_target=1; next }
    in_domains && in_target && /^  [a-z_]+:/ { exit }
    in_domains && in_target && /^    - [a-z0-9_]+$/ {
      sub("^    - ", "")
      print
    }
  ' "$taxonomy_file" | sort -u > "$out_file"
}

normalize_csv_tags() {
  local csv="$1"
  local required="$2"
  local out=""
  local tag=""

  if [[ -n "$csv" ]]; then
    while IFS= read -r tag || [[ -n "$tag" ]]; do
      local t
      t="$(echo "$tag" | sed 's/^ *//; s/ *$//')"
      if [[ -z "$t" ]]; then
        continue
      fi
      if [[ ! "$t" =~ ^[a-z0-9_]+$ ]]; then
        echo "[ERROR] Tag must be snake_case: $t" >&2
        return 1
      fi
      if [[ -n "$out" ]]; then
        out+=";"
      fi
      out+="$t"
    done < <(printf '%s\n' "$csv" | tr ',' '\n')
  fi

  if [[ "$required" -eq 1 && -z "$out" ]]; then
    echo "[ERROR] At least one tag is required." >&2
    return 1
  fi

  echo "$out"
}

to_yaml_list() {
  local semi="$1"
  if [[ -z "$semi" ]]; then
    echo "[]"
  else
    echo "[$(echo "$semi" | sed 's/;/, /g')]"
  fi
}

validate_tag_set() {
  local semi="$1"
  local allowed_file="$2"
  local label="$3"
  local unknown=0
  local t

  if [[ -z "$semi" ]]; then
    echo 0
    return 0
  fi

  IFS=';' read -r -a arr <<< "$semi"
  for t in "${arr[@]}"; do
    [[ -z "$t" ]] && continue
    if ! rg -x "$t" "$allowed_file" >/dev/null 2>&1; then
      echo "[WARN] ${label} tag not found in taxonomy: $t"
      unknown=$((unknown + 1))
    fi
  done

  echo "$unknown"
}

ID=""
TITLE=""
SOURCE_PDF=""
CANONICAL_MD=""
FAMILY_TAGS_CSV=""
INFERENCE_TAGS_CSV=""
DOMAIN_TAGS_CSV=""
TAXONOMY_FILE="catalog/taxonomy.yaml"
STRICT_TAGS=0

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
    --source-pdf)
      SOURCE_PDF="${2:-}"
      shift 2
      ;;
    --canonical-md)
      CANONICAL_MD="${2:-}"
      shift 2
      ;;
    --tags)
      FAMILY_TAGS_CSV="${2:-}"
      shift 2
      ;;
    --inference-tags)
      INFERENCE_TAGS_CSV="${2:-}"
      shift 2
      ;;
    --domain-tags)
      DOMAIN_TAGS_CSV="${2:-}"
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

if [[ -z "$ID" || -z "$TITLE" || -z "$SOURCE_PDF" || -z "$CANONICAL_MD" || -z "$FAMILY_TAGS_CSV" ]]; then
  echo "Missing required argument(s)." >&2
  usage
  exit 1
fi

if [[ -z "$DOMAIN_TAGS_CSV" ]]; then
  DOMAIN_TAGS_CSV="methodology"
fi

if [[ ! "$ID" =~ ^[a-z0-9_]+$ ]]; then
  echo "--id must be snake_case: $ID" >&2
  exit 1
fi

if [[ ! "$SOURCE_PDF" =~ ^literature/raw_pdf/.+\.pdf$ ]]; then
  echo "--source-pdf must be under literature/raw_pdf/ and end in .pdf" >&2
  exit 1
fi

if [[ ! "$CANONICAL_MD" =~ ^literature/canonical_ai_readable/.+\.md$ ]]; then
  echo "--canonical-md must be under literature/canonical_ai_readable/ and end in .md" >&2
  exit 1
fi

if [[ ! -f "$SOURCE_PDF" ]]; then
  echo "Source PDF does not exist: $SOURCE_PDF" >&2
  exit 1
fi

if [[ ! -f "$CANONICAL_MD" ]]; then
  echo "Canonical markdown does not exist: $CANONICAL_MD" >&2
  exit 1
fi

CATALOG="catalog/literature_catalog.yaml"
if [[ ! -f "$CATALOG" ]]; then
  echo "Catalog not found: $CATALOG" >&2
  exit 1
fi

if rg -n "^  - id: ${ID}$" "$CATALOG" >/dev/null 2>&1; then
  echo "Catalog entry id already exists: $ID" >&2
  exit 1
fi

if [[ ! -f "$TAXONOMY_FILE" ]]; then
  echo "Taxonomy file not found: $TAXONOMY_FILE" >&2
  exit 1
fi

FAMILY_TAGS_SEMI="$(normalize_csv_tags "$FAMILY_TAGS_CSV" 1)"
INFERENCE_TAGS_SEMI="$(normalize_csv_tags "$INFERENCE_TAGS_CSV" 0)"
DOMAIN_TAGS_SEMI="$(normalize_csv_tags "$DOMAIN_TAGS_CSV" 1)"

VALID_METHOD_TAGS="$(mktemp)"
VALID_INFERENCE_TAGS="$(mktemp)"
VALID_DOMAIN_TAGS="$(mktemp)"

extract_domain_tags "$TAXONOMY_FILE" "method_family" "$VALID_METHOD_TAGS"
extract_domain_tags "$TAXONOMY_FILE" "inference" "$VALID_INFERENCE_TAGS"
extract_domain_tags "$TAXONOMY_FILE" "domain_application" "$VALID_DOMAIN_TAGS"

UNKNOWN_TOTAL=0
UNKNOWN_TOTAL=$((UNKNOWN_TOTAL + $(validate_tag_set "$FAMILY_TAGS_SEMI" "$VALID_METHOD_TAGS" "method_family")))
UNKNOWN_TOTAL=$((UNKNOWN_TOTAL + $(validate_tag_set "$INFERENCE_TAGS_SEMI" "$VALID_INFERENCE_TAGS" "inference")))
UNKNOWN_TOTAL=$((UNKNOWN_TOTAL + $(validate_tag_set "$DOMAIN_TAGS_SEMI" "$VALID_DOMAIN_TAGS" "domain_application")))

if [[ "$UNKNOWN_TOTAL" -gt 0 && "$STRICT_TAGS" -eq 1 ]]; then
  rm -f "$VALID_METHOD_TAGS" "$VALID_INFERENCE_TAGS" "$VALID_DOMAIN_TAGS"
  echo "Unknown tags found and --strict-tags enabled." >&2
  exit 1
fi

FAMILY_TAGS_YAML="$(to_yaml_list "$FAMILY_TAGS_SEMI")"
INFERENCE_TAGS_YAML="$(to_yaml_list "$INFERENCE_TAGS_SEMI")"
DOMAIN_TAGS_YAML="$(to_yaml_list "$DOMAIN_TAGS_SEMI")"
TITLE_ESCAPED="$(printf '%s' "$TITLE" | sed 's/"/\\"/g')"
TODAY="$(date +%F)"

# Update updated_on.
perl -0pi -e "s/^updated_on: .*
/updated_on: ${TODAY}\n/m" "$CATALOG"

cat >> "$CATALOG" <<EOF_APPEND
  - id: ${ID}
    title: "${TITLE_ESCAPED}"
    source_pdf: ${SOURCE_PDF}
    canonical_markdown: ${CANONICAL_MD}
    family_tags: ${FAMILY_TAGS_YAML}
    inference_tags: ${INFERENCE_TAGS_YAML}
    domain_tags: ${DOMAIN_TAGS_YAML}
EOF_APPEND

rm -f "$VALID_METHOD_TAGS" "$VALID_INFERENCE_TAGS" "$VALID_DOMAIN_TAGS"

echo "Registered catalog entry: ${ID}"
