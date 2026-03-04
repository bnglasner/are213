# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/qa/phase6_benchmarks/staggered_did_01/pseudocode.R`
- Design target: Staggered DiD
- Estimand target: Dynamic treatment effects

## Estimator-Spec Alignment Checks
- Script uses naive TWFE event-study only.

## Inference Checks
- Standard error specification: one-way cluster by unit.
- Clustering strategy: no sensitivity tests.
- Small-sample / bootstrap / randomization inference checks: absent.

## Robustness and Falsification Coverage
- Present checks: none.
- Missing checks: robust estimator comparison, cohort support, placebo leads.

## Findings by Severity
### Critical
- Issue: No heterogeneity-robust staggered estimator.
  - Evidence: `reports/qa/phase6_benchmarks/staggered_did_01/pseudocode.R`
  - Why it matters: Naive TWFE can produce misleading dynamic effects.
  - Concrete fix: Implement robust staggered DiD estimator.
  - Verification step: Compare robust and TWFE event paths.

### Major
- Issue: No cohort event-support diagnostics.
  - Evidence: `reports/qa/phase6_benchmarks/staggered_did_01/pseudocode.R`
  - Why it matters: Sparse support can distort dynamic estimates.
  - Concrete fix: Add cohort-by-event-time support table.
  - Verification step: Confirm adequate support in reported event window.
- Issue: No lead/placebo diagnostics.
  - Evidence: `reports/qa/phase6_benchmarks/staggered_did_01/pseudocode.R`
  - Why it matters: Parallel trends and anticipation remain untested.
  - Concrete fix: Add lead-joint and placebo timing checks.
  - Verification step: Report lead/placebo test output.

### Minor
- Issue: No inference sensitivity.
  - Evidence: `reports/qa/phase6_benchmarks/staggered_did_01/pseudocode.R`
  - Why it matters: SE conclusions may be fragile.
  - Concrete fix: Add alternative clustering checks.
  - Verification step: Inference sensitivity table.

### Nice-to-have
- Issue: Reproducibility logging absent.
  - Evidence: `reports/qa/phase6_benchmarks/staggered_did_01/pseudocode.R`
  - Why it matters: Harder replication.
  - Concrete fix: Add session metadata logging.
  - Verification step: Save session info output.

## Prioritized Fix Plan
1. Add robust staggered estimator.
2. Add cohort support and lead/placebo diagnostics.
3. Add inference sensitivity checks.

## What Would Change the Conclusion
- Stable dynamic effects across robust and TWFE estimators with passing diagnostics.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/staggered_did_01/pseudocode.R`
- `AI_READABLE/D3_Staggered_adoption.md`
