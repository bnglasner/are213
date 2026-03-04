# Assumption Audit

## Scope
- Project: Judge-leniency IV study of detention effects on conviction
- Primary design family: IV/LATE
- Inputs reviewed:
  - `reports/dry_runs/phase3_dry_run_01_research_brief.yaml`
  - `reports/dry_runs/phase3_dry_run_01_method_memo.md`
  - `AI_READABLE/C1_IV_basics.md`
  - `AI_READABLE/C2_LATE.md`
  - `AI_READABLE/C3_judge_IV.md`

## Assumption Register
| Assumption | Design Component | Evidence Status | Diagnostics | Failure Signature | Severity |
|---|---|---|---|---|---|
| Quasi-random judge assignment | Instrument exogeneity | uncertain | Balance of predetermined covariates by judge-leniency bins and assignment process audit | Systematic covariate imbalance across leniency bins | critical |
| Instrument relevance | First stage | uncertain | First-stage estimates and F-statistics overall and by subgroup | Weak or unstable first-stage estimates | major |
| Exclusion restriction | Structural channel | unsupported | Placebo outcomes/channels and mechanism controls | Instrument predicts non-treatment channels or predetermined outcomes | critical |
| Monotonicity | LATE interpretation | uncertain | Subgroup sign consistency in first stage and institutional argument checks | Sign reversals in first-stage effects across key groups | major |
| Dependence-robust inference | Standard errors | uncertain | Cluster-level sensitivity and alternative dependence-robust SEs | Inference conclusions reverse under plausible clustering choices | major |

## Diagnostic Sequence
1. Verify assignment quality and first-stage strength before any second-stage interpretation.
2. Run exclusion/placebo diagnostics and document direct-channel risks.
3. Stress-test inference with alternative clustering/dependence corrections.

## Priority Findings
### Critical
- Exclusion restriction has no direct supporting evidence in the current dry-run materials; requires targeted placebo and mechanism tests.
- Assignment exogeneity is not empirically demonstrated yet; must verify with covariate balance and assignment-process audit.

### Major
- First-stage strength may vary by subgroup; weak-IV robust procedures may be required.
- LATE interpretation remains fragile until monotonicity plausibility is documented.
- Inference may be sensitive to clustering choice in court/judge settings.

### Minor
- None in dry run.

### Nice-to-have
- Add external-validity transport checks across jurisdictions or time periods.

## Evidence vs Inference
- Observed evidence:
  - Judge-IV framework and assumptions are emphasized in local lecture notes.
  - Weak-IV and LATE interpretation caveats are explicitly discussed in IV modules.
- Inferred concerns:
  - Exclusion and assignment assumptions likely dominate identification risk in real applications.
  - Dependence structure in court data can materially affect uncertainty quantification.

## Cited Local Sources
- `AI_READABLE/C3_judge_IV.md`
- `AI_READABLE/C1_IV_basics.md`
- `AI_READABLE/C2_LATE.md`
- `AI_READABLE/concepts/Exclusion_restriction.md`
- `AI_READABLE/concepts/First_stage_relevance.md`
- `AI_READABLE/concepts/LATE.md`
