# Improvement Plan

## Objective and Scope
- Project: staggered_did_01 benchmark
- Inputs used:
  - `reports/qa/phase6_benchmarks/staggered_did_01/method_memo.md`
  - `reports/qa/phase6_benchmarks/staggered_did_01/audit_report.md`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| SD1 | critical | Add robust staggered estimator | None | medium | Remove core estimator bias risk |
| SD2 | major | Add cohort support and lead/placebo diagnostics | SD1 | medium | Validate identifying assumptions |
| SD3 | minor | Add inference sensitivity | SD1 | small | Improve reliability of uncertainty |

## Sequenced Execution Plan
1. SD1
2. SD2
3. SD3

## Minimum Viable Credibility Path
1. SD1
2. Lead/placebo checks from SD2

## Acceptance Checks
- SD1: robust estimator output produced.
- SD2: support table and lead/placebo outputs produced.
- SD3: SE sensitivity table produced.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/staggered_did_01/audit_report.md`
