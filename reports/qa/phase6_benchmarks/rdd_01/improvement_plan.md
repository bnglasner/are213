# Improvement Plan

## Objective and Scope
- Project: rdd_01 benchmark
- Inputs used:
  - `reports/qa/phase6_benchmarks/rdd_01/method_memo.md`
  - `reports/qa/phase6_benchmarks/rdd_01/audit_report.md`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| RD1 | critical | Add manipulation/density checks | None | small | Validate RDD assignment integrity |
| RD2 | major | Add bandwidth and local polynomial sensitivity | RD1 | medium | Ensure local estimate robustness |
| RD3 | minor | Add covariate continuity checks | RD1 | small | Improve comparability evidence |

## Sequenced Execution Plan
1. RD1
2. RD2
3. RD3

## Minimum Viable Credibility Path
1. RD1
2. One bandwidth sweep from RD2

## Acceptance Checks
- RD1: manipulation test output reported.
- RD2: bandwidth sensitivity table produced.
- RD3: covariate continuity checks reported.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/rdd_01/audit_report.md`
