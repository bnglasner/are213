# Assumption Audit

## Scope
- Project: Staggered policy adoption and employment outcomes
- Primary design family: Staggered DiD
- Inputs reviewed:
  - `reports/examples/end_to_end/phase5_dry_run_01_research_brief.yaml`
  - `reports/examples/end_to_end/phase5_dry_run_01_method_memo.md`
  - `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`

## Assumption Register
| Assumption | Design Component | Evidence Status | Diagnostics | Failure Signature | Severity |
|---|---|---|---|---|---|
| Cohort-specific parallel trends | Identification | uncertain | Joint lead tests by cohort and matched-trend robustness | Significant lead effects or cohort-specific differential trends | critical |
| No anticipation | Event-time validity | unsupported | Placebo timing and lead-window checks | Strong pre-adoption treatment effects | major |
| Heterogeneity-robust estimator validity | Estimation | unsupported | Compare robust staggered DiD estimator to naive TWFE | Divergent dynamic effects and sign/magnitude instability | critical |
| Event-time coding correctness | Data construction | uncertain | Adoption-year QA and event-time consistency checks | Discontinuous or implausible event-time paths | major |
| Dependence-correct inference | Inference | uncertain | Cluster and dependence-robust sensitivity table | Significance changes under plausible clustering alternatives | major |

## Diagnostic Sequence
1. Validate event-time coding and sample composition.
2. Run robust estimator comparison and pre-trend/anticipation diagnostics.
3. Finalize with inference sensitivity checks.

## Priority Findings
### Critical
- Robust staggered estimator checks are missing in current pseudo-code.
- Parallel trends diagnostics are not implemented.

### Major
- No anticipation diagnostics are absent.
- Event-time coding validation is not documented.
- Inference robustness to dependence is not assessed.

### Minor
- None in this dry run.

### Nice-to-have
- Add subgroup heterogeneity and transportability checks.

## Evidence vs Inference
- Observed evidence:
  - Pseudo-code uses naive TWFE only and omits pre-trend/placebo checks.
  - Lecture references require robust staggered methods and diagnostics.
- Inferred concerns:
  - Current implementation likely overstates confidence in dynamic effects.

## Cited Local Sources
- `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
- `AI_READABLE/D3_Staggered_adoption.md`
- `AI_READABLE/D2_Canonical_DiD.md`
- `AI_READABLE/concepts/Staggered_adoption_DiD.md`
