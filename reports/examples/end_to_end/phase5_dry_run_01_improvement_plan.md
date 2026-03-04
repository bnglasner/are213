# Improvement Plan

## Objective and Scope
- Project: Phase 5 end-to-end staggered DiD dry run
- Inputs used:
  - `reports/examples/end_to_end/phase5_dry_run_01_method_memo.md`
  - `reports/examples/end_to_end/phase5_dry_run_01_audit_report.md`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| P1 | critical | Implement heterogeneity-robust staggered DiD estimator and benchmark vs TWFE | None | medium | Eliminates primary estimator-pathology risk |
| P2 | major | Reconstruct sample with explicit control-group rule and QA tables | P1 | medium | Restores identification transparency |
| P3 | major | Add pre-trend and placebo timing diagnostics | P2 | small | Tests core assumptions directly |
| P4 | major | Add clustering/dependence inference sensitivity | P2 | small | Stabilizes uncertainty interpretation |
| P5 | minor | Validate event-time variable construction | P2 | small | Reduces data-construction error risk |
| P6 | nice-to-have | Add reproducibility metadata logging | P1 | small | Improves reproducibility and audit trail |

## Sequenced Execution Plan
1. Execute P1 and produce robust-vs-TWFE comparison outputs.
2. Execute P2 and regenerate estimation datasets/tables.
3. Execute P3 and P4 to finalize identification and inference checks.
4. Execute P5 and P6 for QA and reproducibility hardening.

## Minimum Viable Credibility Path
1. Complete P1 and P2.
2. Complete P3 and one inference sensitivity run from P4.

## Acceptance Checks
- P1: Robust estimator output exists and is compared to TWFE.
- P2: Sample-construction documentation and counts are generated.
- P3: Lead/placebo diagnostics table exists with interpretation.
- P4: Inference sensitivity table exists with conclusion stability note.
- P5: Event-time QA output exists with mismatch rate.
- P6: Session/package metadata log is saved.

## Cited Local Sources
- `reports/examples/end_to_end/phase5_dry_run_01_audit_report.md`
- `reports/examples/end_to_end/phase5_dry_run_01_method_memo.md`
