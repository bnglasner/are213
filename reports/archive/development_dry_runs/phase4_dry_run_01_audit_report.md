# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
- Design target: Staggered adoption DiD
- Estimand target: Dynamic treatment effects relative to pre-treatment baseline

## Estimator-Spec Alignment Checks
- Code uses naive TWFE event-study specification without a heterogeneity-robust staggered DiD estimator.
- Sample restricts to ever-treated units, removing never-treated comparison units without documented rationale.

## Inference Checks
- Standard error specification: one-way clustering on `unit_id` only.
- Clustering strategy: no robustness to calendar-time or multiway clustering.
- Small-sample / bootstrap / randomization inference checks: none present.

## Robustness and Falsification Coverage
- Present checks: none.
- Missing checks: pre-trend joint tests, placebo timing tests, alternative event-window definitions, estimator robustness checks.

## Findings by Severity
### Critical
- Issue: Estimator is not robust to heterogeneous treatment effects in staggered adoption settings.
  - Evidence: `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Naive TWFE event-study coefficients can be contaminated by implicit negative/invalid weights and mis-aggregated cohort effects.
  - Concrete fix: Add a heterogeneity-robust staggered DiD estimator and compare dynamic effects against TWFE output.
  - Verification step: Confirm sign/magnitude stability across robust estimator and TWFE; document any divergence.

### Major
- Issue: Removing never-treated units without justification compromises comparison structure.
  - Evidence: `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Treatment-effect identification may rely on valid control cohorts; ad hoc exclusion can induce bias.
  - Concrete fix: Rebuild analysis sample with explicit control-group rule and sensitivity checks.
  - Verification step: Re-estimate with and without exclusions and compare pre-trend diagnostics.
- Issue: No pre-trend or placebo diagnostics.
  - Evidence: `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Parallel trends and no anticipation assumptions are untested.
  - Concrete fix: Add lead-joint tests and placebo adoption timing exercises.
  - Verification step: Report formal test statistics and confidence intervals for leads/placebos.
- Issue: Inference relies on one clustering choice only.
  - Evidence: `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Standard errors may be understated under alternative dependence structures.
  - Concrete fix: Add clustering sensitivity (time, two-way, or dependence-robust alternatives).
  - Verification step: Confirm whether significance conclusions persist across inference choices.

### Minor
- Issue: Event-time construction uses `treat_year_reported` without consistency checks.
  - Evidence: `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Mis-measured treatment timing can distort dynamic treatment profiles.
  - Concrete fix: Add cohort-year validation checks and assert monotonic event-time transitions.
  - Verification step: Produce QA table comparing reported and validated treatment year by unit.

### Nice-to-have
- Issue: Script lacks reproducibility metadata (seed/version/session capture).
  - Evidence: `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Harder to audit exact computational environment.
  - Concrete fix: Add session info and package-version logging block.
  - Verification step: Persist session metadata artifact with each run.

## Prioritized Fix Plan
1. Replace/add estimator with heterogeneity-robust staggered DiD implementation and reconcile results.
2. Restore/justify control-group composition and add pre-trend/placebo diagnostics.
3. Add inference sensitivity across plausible dependence structures and clustering levels.

## What Would Change the Conclusion
- If robust staggered DiD estimates materially differ from TWFE estimates in sign or magnitude.
- If lead/placebo tests indicate strong pre-trends or anticipation.
- If significance disappears under dependence-robust inference choices.

## Cited Local Sources
- `reports/dry_runs/phase4_dry_run_01_pseudocode.R`
- `AI_READABLE/D3_Staggered_adoption.md`
- `AI_READABLE/D2_Canonical_DiD.md`
- `AI_READABLE/concepts/Staggered_adoption_DiD.md`
- `AI_READABLE/concepts/Parallel_trends.md`
