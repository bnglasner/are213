# Improvement Plan

## Objective and Scope
- Project: iv_01 benchmark
- Inputs used:
  - `reports/qa/phase6_benchmarks/iv_01/method_memo.md`
  - `reports/qa/phase6_benchmarks/iv_01/audit_report.md`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| IV1 | critical | Add weak-IV diagnostics and robust intervals | None | small | Prevent invalid IV inference |
| IV2 | major | Add exclusion placebo/mechanism tests | IV1 | medium | Strengthen identification credibility |
| IV3 | minor | Standardize SE/clustering configuration | IV1 | small | Improve transparency and reproducibility |

## Sequenced Execution Plan
1. Complete IV1.
2. Complete IV2.
3. Complete IV3.

## Minimum Viable Credibility Path
1. Complete IV1.
2. Run one exclusion placebo test from IV2.

## Acceptance Checks
- IV1: F-statistics and weak-IV robust intervals reported.
- IV2: Placebo outcome results included.
- IV3: Inference config explicitly documented.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/iv_01/audit_report.md`
