# Improvement Plan

## Objective and Scope
- Project: spillovers_01 post-calibration recheck
- Inputs used:
  - `reports/qa/phase6_benchmarks/spillovers_01/method_memo.md`
  - `reports/qa/phase6_benchmarks/spillovers_01/audit_report_postcal.md`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| SP1 | critical | Implement explicit exposure mapping in model | None | medium | Align estimator with interference design |
| SP2 | major | Add placebo and mapping sensitivity checks | SP1 | medium | Validate exposure robustness |
| SP3 | major | Add dependence-robust inference sensitivity | SP1 | small | Improve uncertainty validity |
| SP4 | minor | Document mapping assumptions in code comments | SP1 | small | Improve transparency and reproducibility |

## Sequenced Execution Plan
1. SP1
2. SP2
3. SP3
4. SP4

## Minimum Viable Credibility Path
1. SP1
2. One placebo/mapping sensitivity check from SP2

## Acceptance Checks
- SP1: primary and alternative mappings included in model.
- SP2: placebo/mapping sensitivity table produced.
- SP3: dependence-robust inference comparison reported.
- SP4: mapping assumptions documented in script.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/spillovers_01/audit_report_postcal.md`
