#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   agents/stage_gate_checks.sh [research_brief.yaml] [method_memo.md] [audit_report.md] [improvement_plan.md]
# Defaults:
#   reports/research_brief.yaml reports/method_memo.md reports/audit_report.md reports/improvement_plan.md

RB_FILE="${1:-reports/research_brief.yaml}"
MM_FILE="${2:-reports/method_memo.md}"
AR_FILE="${3:-reports/audit_report.md}"
IP_FILE="${4:-reports/improvement_plan.md}"

FAILURES=0

fail() {
  echo "[FAIL] $1"
  FAILURES=$((FAILURES + 1))
}

pass() {
  echo "[PASS] $1"
}

require_file() {
  local file="$1"
  local label="$2"
  if [[ -s "$file" ]]; then
    pass "$label exists and is non-empty: $file"
  else
    fail "$label missing or empty: $file"
  fi
}

require_yaml_scalar() {
  local file="$1"
  local key="$2"
  local label="$3"
  if rg -n "^[[:space:]]*${key}:[[:space:]]*.+$" "$file" >/dev/null 2>&1; then
    # Reject empty quoted or empty unquoted scalars.
    if rg -n "^[[:space:]]*${key}:[[:space:]]*(\"\"|''|)$" "$file" >/dev/null 2>&1; then
      fail "$label is empty: ${key} in $file"
    else
      pass "$label present: ${key}"
    fi
  else
    fail "$label missing: ${key} in $file"
  fi
}

require_line_pattern() {
  local file="$1"
  local pattern="$2"
  local label="$3"
  if rg -n "$pattern" "$file" >/dev/null 2>&1; then
    pass "$label"
  else
    fail "$label (pattern not found: $pattern)"
  fi
}

echo "== Gate 1: Intake Output Check =="
require_file "$RB_FILE" "research brief"
require_yaml_scalar "$RB_FILE" "research_question" "research question"
require_yaml_scalar "$RB_FILE" "primary_estimand" "primary estimand"
require_yaml_scalar "$RB_FILE" "treatment_definition" "treatment definition"
require_yaml_scalar "$RB_FILE" "outcome_definition" "outcome definition"
require_yaml_scalar "$RB_FILE" "sample_construction" "sample construction"
require_yaml_scalar "$RB_FILE" "design_family_candidate" "design family candidate"
require_line_pattern "$RB_FILE" "^[[:space:]]*observed_evidence:" "observed evidence section present"
require_line_pattern "$RB_FILE" "^[[:space:]]*open_questions:" "open questions section present"

echo "== Gate 2: Method Output Check =="
require_file "$MM_FILE" "method memo"
require_line_pattern "$MM_FILE" "^## Design Summary" "method memo design summary present"
require_line_pattern "$MM_FILE" "^## Routed Families" "method memo routed families present"
require_line_pattern "$MM_FILE" "^## Identification Assumptions" "method memo assumptions section present"
require_line_pattern "$MM_FILE" "^## Required Diagnostics and Falsification Tests" "method memo diagnostics section present"
require_line_pattern "$MM_FILE" "^## Risk Rating" "method memo risk rating section present"
require_line_pattern "$MM_FILE" "^## Cited Local Sources" "method memo citations section present"

echo "== Gate 3: Audit Output Check =="
require_file "$AR_FILE" "audit report"
require_line_pattern "$AR_FILE" "^## Findings by Severity" "audit report findings section present"
require_line_pattern "$AR_FILE" "^### Critical" "critical findings subsection present"
require_line_pattern "$AR_FILE" "^### Major" "major findings subsection present"
require_line_pattern "$AR_FILE" "^## Prioritized Fix Plan" "prioritized fix plan section present"
require_line_pattern "$AR_FILE" "^## What Would Change the Conclusion" "conclusion-change section present"
require_line_pattern "$AR_FILE" "Verification step" "verification steps documented"
require_line_pattern "$AR_FILE" "^## Cited Local Sources" "audit citations section present"

echo "== Gate 4: Improvement Plan Check =="
require_file "$IP_FILE" "improvement plan"
require_line_pattern "$IP_FILE" "^## Consolidated Backlog" "improvement backlog section present"
require_line_pattern "$IP_FILE" "^## Sequenced Execution Plan" "improvement sequence section present"
require_line_pattern "$IP_FILE" "^## Minimum Viable Credibility Path" "minimum credibility path section present"
require_line_pattern "$IP_FILE" "^## Acceptance Checks" "improvement acceptance checks present"
require_line_pattern "$IP_FILE" "^## Cited Local Sources" "improvement citations section present"

echo "== Summary =="
if [[ "$FAILURES" -eq 0 ]]; then
  echo "All stage gates passed."
  exit 0
else
  echo "$FAILURES stage-gate check(s) failed."
  exit 1
fi
