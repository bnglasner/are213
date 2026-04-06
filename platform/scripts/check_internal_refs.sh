#!/usr/bin/env bash
set -euo pipefail

FILES=(
  README.md
  TEAM_DEPLOYMENT_GUIDE.md
  reports/README.md
)

while IFS= read -r f; do
  FILES+=("$f")
done < <(find platform docs catalog runs .github -type f \( -name '*.md' -o -name '*.yaml' -o -name '*.yml' \) | sort)

PATTERN='(AI_READABLE|agents|skills|templates|reports|catalog|docs|scripts|literature|platform|runs)/[A-Za-z0-9_./-]+\.(md|yaml|yml|sh|py|R|csv|pdf)'

TMP_REFS="$(mktemp)"
rg -o --no-filename "$PATTERN" "${FILES[@]}" | sort -u > "$TMP_REFS" || true

MISSING=0
while IFS= read -r ref; do
  case "$ref" in
    runs/research_brief.yaml|\
    runs/method_memo.md|\
    runs/assumption_audit.md|\
    runs/audit_report.md|\
    runs/improvement_plan.md|\
    runs/orchestrator_gate_failures.md|\
    reports/research_brief.yaml|\
    reports/method_memo.md|\
    reports/assumption_audit.md|\
    reports/audit_report.md|\
    reports/improvement_plan.md|\
    reports/orchestrator_gate_failures.md)
      continue
      ;;
  esac

  if [[ ! -e "$ref" ]]; then
    echo "[MISSING] $ref"
    MISSING=$((MISSING + 1))
  fi
done < "$TMP_REFS"

if rg -n "reports/dry_runs/" runs/archive/development_dry_runs >/dev/null 2>&1; then
  echo "[MISSING] legacy broken path prefix found: reports/dry_runs/"
  MISSING=$((MISSING + 1))
fi

rm -f "$TMP_REFS"

if [[ "$MISSING" -gt 0 ]]; then
  echo "Reference integrity check failed with $MISSING issue(s)."
  exit 1
fi

echo "Reference integrity check passed."
