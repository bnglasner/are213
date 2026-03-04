# Improvement Plan

## Objective and Scope
- Project: Phase 4 dry run staggered DiD pseudo-code audit
- Inputs used:
  - `reports/dry_runs/phase4_dry_run_01_audit_report.md`
  - `reports/dry_runs/phase4_dry_run_01_pseudocode.R`

## Consolidated Backlog
| ID | Severity | Task | Dependency | Effort | Expected credibility gain |
|---|---|---|---|---|---|
| P1 | critical | Implement heterogeneity-robust staggered DiD estimator and compare against TWFE | None | medium | Prevent biased/invalid dynamic effects from estimator pathology |
| P2 | major | Rebuild sample to include valid controls and justify exclusions | P1 | medium | Restore design-consistent identification basis |
| P3 | major | Add pre-trend and placebo timing diagnostics | P2 | small | Directly test key DiD assumptions |
| P4 | major | Add inference sensitivity across clustering/dependence structures | P2 | small | Improve validity of uncertainty statements |
| P5 | minor | Validate treatment timing variable used for event-time construction | P2 | small | Reduce measurement-driven distortions |
| P6 | nice-to-have | Add session/version logging | P1 | small | Improve reproducibility and auditability |

## Sequenced Execution Plan
1. Execute P1 and establish baseline comparison table (TWFE vs robust staggered DiD).
2. Execute P2 and rerun all models on corrected sample definition.
3. Execute P3 and P4 to finalize assumption and inference validation.
4. Execute P5 and P6 to harden QA and reproducibility.

## Minimum Viable Credibility Path
1. Complete P1 + P2.
2. Complete at least one pre-trend/placebo test (P3) and one clustering sensitivity check (P4).

## Acceptance Checks
- P1: Robust estimator output produced and divergence vs TWFE documented.
- P2: Control-group rules documented and reflected in sample counts.
- P3: Lead/placebo test table generated and interpreted.
- P4: Inference sensitivity table generated across at least two dependence assumptions.
- P5: Cohort timing QA table generated with mismatch rate reported.
- P6: Session info artifact created and linked in report.

## Cited Local Sources
- `reports/dry_runs/phase4_dry_run_01_audit_report.md`
- `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
