#!/usr/bin/env bash
set -euo pipefail

TAXONOMY="${1:-catalog/taxonomy.yaml}"
if [[ ! -f "$TAXONOMY" ]]; then
  echo "Taxonomy file not found: $TAXONOMY" >&2
  exit 1
fi

echo "Taxonomy domains and tags (${TAXONOMY}):"
awk '
  /^tag_domains:/ {
    in_domains=1
    next
  }
  /^naming_rules:/ {
    in_domains=0
    next
  }
  in_domains && /^  [a-z_]+:/ {
    domain=$1
    gsub(":","",domain)
    print "\n- " domain
    next
  }
  in_domains && /^    - [a-z0-9_]+$/ {
    tag=$2
    print "  - " tag
  }
' "$TAXONOMY"
