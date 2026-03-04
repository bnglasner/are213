# Improvement Plan

## Objective and Scope
- Project: spillovers_01 benchmark
- Inputs used:
  - `reports/qa/phase6_benchmarks/spillovers_01/method_memo.md`
  - `reports/qa/phase6_benchmarks/spillovers_01/audit_report.md`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| SP1 | critical | Implement explicit exposure mapping in model | None | medium | Align estimator with interference design |
| SP2 | major | Add placebo and mapping sensitivity checks | SP1 | medium | Validate exposure robustness |
| SP3 | major | Add dependence-robust inference sensitivity | SP1 | small | Improve uncertainty validity |

## Sequenced Execution Plan
1. SP1
2. SP2
3. SP3

## Minimum Viable Credibility Path
1. SP1
2. One placebo exposure test from SP2

## Acceptance Checks
- SP1: primary and alternative mappings included in model.
- SP2: placebo exposure results reported.
- SP3: inference sensitivity table generated.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/spillovers_01/audit_report.md`
