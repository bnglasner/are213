# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
- Design target: Staggered adoption DiD
- Estimand target: Dynamic treatment effects

## Estimator-Spec Alignment Checks
- Estimator currently implemented as naive TWFE event study only.
- Control-group composition rule is inconsistent with intake brief requirement to include valid comparisons.

## Inference Checks
- Standard error specification: one-way clustering on `unit_id`.
- Clustering strategy: no alternative clustering/dependence checks.
- Small-sample / bootstrap / randomization inference checks: absent.

## Robustness and Falsification Coverage
- Present checks: none.
- Missing checks: lead/placebo tests, cohort support diagnostics, estimator robustness comparisons.

## Findings by Severity
### Critical
- Issue: Staggered design estimated only with naive TWFE.
  - Evidence: `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Heterogeneous effects can bias TWFE event-study interpretation in staggered settings.
  - Concrete fix: Implement heterogeneity-robust staggered DiD estimator and compare event profiles.
  - Verification step: Report side-by-side dynamic estimates with divergence summary.

### Major
- Issue: Never-treated units removed without design rationale.
  - Evidence: `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Can distort comparison set and invalidate identifying variation.
  - Concrete fix: Restore valid controls and document sample construction logic.
  - Verification step: Provide sample-count and balance table before/after correction.
- Issue: No pre-trend or placebo timing diagnostics.
  - Evidence: `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Core identifying assumptions remain untested.
  - Concrete fix: Add lead-joint tests and placebo adoption timing exercises.
  - Verification step: Produce formal lead/placebo test table and interpretation.
- Issue: Inference lacks dependence robustness.
  - Evidence: `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Statistical confidence may be overstated.
  - Concrete fix: Add clustering sensitivity and dependence-robust alternatives.
  - Verification step: Show inference sensitivity summary across methods.

### Minor
- Issue: Event-time construction uses unvalidated cohort-year variable.
  - Evidence: `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Timing misclassification can blur dynamic effects.
  - Concrete fix: Add QA checks for cohort-year integrity.
  - Verification step: Output mismatch diagnostics and corrected variable check.

### Nice-to-have
- Issue: Reproducibility metadata absent.
  - Evidence: `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
  - Why it matters: Harder to reproduce exact audit context.
  - Concrete fix: Log package versions and session metadata.
  - Verification step: Save session artifact with run output.

## Prioritized Fix Plan
1. Replace/add heterogeneity-robust staggered DiD estimator and reconcile against TWFE.
2. Correct sample design and add lead/placebo diagnostics.
3. Add inference sensitivity and event-time QA checks.

## What Would Change the Conclusion
- Dynamic treatment effects that remain stable across robust estimators and inference choices.
- Null lead/placebo diagnostics supporting no anticipation and credible trends.

## Cited Local Sources
- `reports/archive/development_dry_runs/phase4_dry_run_01_pseudocode.R`
- `AI_READABLE/D3_Staggered_adoption.md`
- `AI_READABLE/D2_Canonical_DiD.md`
- `AI_READABLE/concepts/Parallel_trends.md`
