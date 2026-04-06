#!/usr/bin/env bash
set -euo pipefail

CATALOG="catalog/literature_catalog.yaml"
TAXONOMY="catalog/taxonomy.yaml"

if [[ ! -f "$CATALOG" ]]; then
  echo "Catalog not found: $CATALOG" >&2
  exit 1
fi

if [[ ! -f "$TAXONOMY" ]]; then
  echo "Taxonomy not found: $TAXONOMY" >&2
  exit 1
fi

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

flatten_tag_lines() {
  local lines_file="$1"
  local field_name="$2"
  local out_file="$3"

  sed -E "s/^    ${field_name}: \[(.*)\]$/\1/" "$lines_file" \
    | tr ',' '\n' \
    | sed 's/^ *//; s/ *$//' \
    | rg --no-filename '^[a-z0-9_]+$' > "$out_file" || true
}

FAIL=0

fail() {
  echo "[FAIL] $1"
  FAIL=$((FAIL + 1))
}

pass() {
  echo "[PASS] $1"
}

IDS_TMP="$(mktemp)"
SRC_TMP="$(mktemp)"
MD_TMP="$(mktemp)"
FAMILY_LINES_TMP="$(mktemp)"
INFERENCE_LINES_TMP="$(mktemp)"
DOMAIN_LINES_TMP="$(mktemp)"
FAMILY_TAGS_TMP="$(mktemp)"
INFERENCE_TAGS_TMP="$(mktemp)"
DOMAIN_TAGS_TMP="$(mktemp)"
VALID_METHOD_TAGS="$(mktemp)"
VALID_INFERENCE_TAGS="$(mktemp)"
VALID_DOMAIN_TAGS="$(mktemp)"

rg --no-filename '^  - id: ' "$CATALOG" | sed 's/^  - id: //' > "$IDS_TMP" || true
rg --no-filename '^[[:space:]]*source_pdf: ' "$CATALOG" | sed 's/^[[:space:]]*source_pdf: //; s/^"//; s/"$//' > "$SRC_TMP" || true
rg --no-filename '^[[:space:]]*canonical_markdown: ' "$CATALOG" | sed 's/^[[:space:]]*canonical_markdown: //; s/^"//; s/"$//' > "$MD_TMP" || true
rg --no-filename '^    family_tags: \[.*\]$' "$CATALOG" > "$FAMILY_LINES_TMP" || true
rg --no-filename '^    inference_tags: \[.*\]$' "$CATALOG" > "$INFERENCE_LINES_TMP" || true
rg --no-filename '^    domain_tags: \[.*\]$' "$CATALOG" > "$DOMAIN_LINES_TMP" || true

extract_domain_tags "$TAXONOMY" "method_family" "$VALID_METHOD_TAGS"
extract_domain_tags "$TAXONOMY" "inference" "$VALID_INFERENCE_TAGS"
extract_domain_tags "$TAXONOMY" "domain_application" "$VALID_DOMAIN_TAGS"

ID_COUNT="$(wc -l < "$IDS_TMP" | tr -d ' ')"
SRC_COUNT="$(wc -l < "$SRC_TMP" | tr -d ' ')"
MD_COUNT="$(wc -l < "$MD_TMP" | tr -d ' ')"
FAMILY_LINE_COUNT="$(wc -l < "$FAMILY_LINES_TMP" | tr -d ' ')"
INFERENCE_LINE_COUNT="$(wc -l < "$INFERENCE_LINES_TMP" | tr -d ' ')"
DOMAIN_LINE_COUNT="$(wc -l < "$DOMAIN_LINES_TMP" | tr -d ' ')"
METHOD_TAG_COUNT="$(wc -l < "$VALID_METHOD_TAGS" | tr -d ' ')"
INF_TAG_COUNT="$(wc -l < "$VALID_INFERENCE_TAGS" | tr -d ' ')"
DOM_TAG_COUNT="$(wc -l < "$VALID_DOMAIN_TAGS" | tr -d ' ')"

if [[ "$ID_COUNT" -eq 0 ]]; then
  fail "No ids found in catalog."
else
  pass "Found $ID_COUNT catalog ids."
fi

if [[ "$METHOD_TAG_COUNT" -eq 0 || "$INF_TAG_COUNT" -eq 0 || "$DOM_TAG_COUNT" -eq 0 ]]; then
  fail "One or more taxonomy domains are empty."
else
  pass "Loaded taxonomy domains (method=$METHOD_TAG_COUNT, inference=$INF_TAG_COUNT, domain=$DOM_TAG_COUNT)."
fi

if [[ "$ID_COUNT" -ne "$SRC_COUNT" || "$ID_COUNT" -ne "$MD_COUNT" ]]; then
  fail "Entry field counts are inconsistent (ids=$ID_COUNT, source_pdf=$SRC_COUNT, canonical_markdown=$MD_COUNT)."
else
  pass "Core entry field counts are aligned."
fi

if [[ "$ID_COUNT" -ne "$FAMILY_LINE_COUNT" || "$ID_COUNT" -ne "$INFERENCE_LINE_COUNT" || "$ID_COUNT" -ne "$DOMAIN_LINE_COUNT" ]]; then
  fail "Tag field counts are inconsistent (ids=$ID_COUNT, family=$FAMILY_LINE_COUNT, inference=$INFERENCE_LINE_COUNT, domain=$DOMAIN_LINE_COUNT)."
else
  pass "Every entry has family_tags, inference_tags, and domain_tags."
fi

DUPES="$(sort "$IDS_TMP" | uniq -d)"
if [[ -n "$DUPES" ]]; then
  echo "$DUPES" | sed 's/^/[FAIL] Duplicate id: /'
  FAIL=$((FAIL + 1))
else
  pass "No duplicate ids."
fi

while IFS= read -r id; do
  [[ -z "$id" ]] && continue
  if [[ ! "$id" =~ ^[a-z0-9_]+$ ]]; then
    fail "id is not snake_case: $id"
  fi
done < "$IDS_TMP"

if rg -n '^    family_tags: \[\s*\]$' "$CATALOG" >/dev/null 2>&1; then
  fail "family_tags cannot be empty."
else
  pass "family_tags are populated for all entries."
fi

if rg -n '^    domain_tags: \[\s*\]$' "$CATALOG" >/dev/null 2>&1; then
  fail "domain_tags cannot be empty."
else
  pass "domain_tags are populated for all entries."
fi

while IFS= read -r p; do
  [[ -z "$p" ]] && continue
  if [[ ! "$p" =~ ^literature/raw_pdf/.+\.pdf$ ]]; then
    fail "source_pdf has non-canonical path: $p"
    continue
  fi
  if [[ ! -f "$p" ]]; then
    fail "source_pdf missing: $p"
  fi
done < "$SRC_TMP"

while IFS= read -r p; do
  [[ -z "$p" ]] && continue
  if [[ ! "$p" =~ ^literature/canonical_ai_readable/.+\.md$ ]]; then
    fail "canonical_markdown has non-canonical path: $p"
    continue
  fi
  if [[ ! -f "$p" ]]; then
    fail "canonical_markdown missing: $p"
  fi
done < "$MD_TMP"

flatten_tag_lines "$FAMILY_LINES_TMP" "family_tags" "$FAMILY_TAGS_TMP"
flatten_tag_lines "$INFERENCE_LINES_TMP" "inference_tags" "$INFERENCE_TAGS_TMP"
flatten_tag_lines "$DOMAIN_LINES_TMP" "domain_tags" "$DOMAIN_TAGS_TMP"

unknown_tags_for_domain() {
  local used_file="$1"
  local valid_file="$2"
  local label="$3"
  local unknown_file

  unknown_file="$(mktemp)"
  : > "$unknown_file"

  while IFS= read -r t; do
    [[ -z "$t" ]] && continue
    if ! rg -x "$t" "$valid_file" >/dev/null 2>&1; then
      echo "$t" >> "$unknown_file"
    fi
  done < "$used_file"

  if [[ -s "$unknown_file" ]]; then
    sort -u "$unknown_file" | sed "s/^/[FAIL] Unknown ${label} tag: /"
    FAIL=$((FAIL + 1))
  else
    pass "All ${label} tags are in taxonomy.${label}"
  fi

  rm -f "$unknown_file"
}

unknown_tags_for_domain "$FAMILY_TAGS_TMP" "$VALID_METHOD_TAGS" "method_family"
unknown_tags_for_domain "$INFERENCE_TAGS_TMP" "$VALID_INFERENCE_TAGS" "inference"
unknown_tags_for_domain "$DOMAIN_TAGS_TMP" "$VALID_DOMAIN_TAGS" "domain_application"

UPDATED_ON="$(rg --no-filename '^updated_on: ' "$CATALOG" | sed 's/^updated_on: //')"
if [[ -z "$UPDATED_ON" || ! "$UPDATED_ON" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
  fail "updated_on is missing or not YYYY-MM-DD."
else
  pass "updated_on is valid: $UPDATED_ON"
fi

rm -f \
  "$IDS_TMP" "$SRC_TMP" "$MD_TMP" \
  "$FAMILY_LINES_TMP" "$INFERENCE_LINES_TMP" "$DOMAIN_LINES_TMP" \
  "$FAMILY_TAGS_TMP" "$INFERENCE_TAGS_TMP" "$DOMAIN_TAGS_TMP" \
  "$VALID_METHOD_TAGS" "$VALID_INFERENCE_TAGS" "$VALID_DOMAIN_TAGS"

if [[ "$FAIL" -gt 0 ]]; then
  echo "Catalog validation failed with $FAIL issue(s)."
  exit 1
fi

echo "Catalog validation passed."
