# Improvement Plan

## Objective and Scope
- Project: iv_01 post-calibration recheck
- Inputs used:
  - `reports/qa/phase6_benchmarks/iv_01/method_memo.md`
  - `reports/qa/phase6_benchmarks/iv_01/audit_report_postcal.md`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| IV1 | critical | Add weak-IV diagnostics and robust intervals | None | small | Avoid invalid IV inference |
| IV2 | major | Add exclusion placebo/mechanism tests | IV1 | medium | Strengthen identification credibility |
| IV3 | minor | Standardize SE/clustering configuration | IV1 | small | Improve traceability and comparability |

## Sequenced Execution Plan
1. IV1
2. IV2
3. IV3

## Minimum Viable Credibility Path
1. IV1
2. One exclusion placebo from IV2

## Acceptance Checks
- IV1: F-statistics and weak-IV robust intervals reported.
- IV2: Placebo outcome results included.
- IV3: Inference configuration explicitly documented.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/iv_01/audit_report_postcal.md`
