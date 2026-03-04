# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/qa/phase6_benchmarks/rdd_01/pseudocode.R`
- Design target: RDD
- Estimand target: local effect at cutoff

## Estimator-Spec Alignment Checks
- Uses global polynomial model without explicit local-RD framework.

## Inference Checks
- Standard error specification: not explicitly robust/local.
- Clustering strategy: not documented.
- Small-sample / bootstrap / randomization inference checks: absent.

## Robustness and Falsification Coverage
- Present checks: none.
- Missing checks: manipulation test, bandwidth sensitivity, covariate continuity.

## Findings by Severity
### Critical
- Issue: No cutoff manipulation/density check.
  - Evidence: `reports/qa/phase6_benchmarks/rdd_01/pseudocode.R`
  - Why it matters: Sorting around threshold can invalidate design.
  - Concrete fix: Add density/manipulation diagnostic.
  - Verification step: Report manipulation test output near cutoff.

### Major
- Issue: No bandwidth sensitivity analysis.
  - Evidence: `reports/qa/phase6_benchmarks/rdd_01/pseudocode.R`
  - Why it matters: Results may be driven by arbitrary window choice.
  - Concrete fix: Estimate across standard bandwidth set.
  - Verification step: Report estimate stability table.
- Issue: Global polynomial specification not justified as local estimator.
  - Evidence: `reports/qa/phase6_benchmarks/rdd_01/pseudocode.R`
  - Why it matters: Functional-form extrapolation can bias local effect.
  - Concrete fix: Use local polynomial RD specification with robustness checks.
  - Verification step: Compare local estimates to baseline.

### Minor
- Issue: No covariate continuity checks.
  - Evidence: `reports/qa/phase6_benchmarks/rdd_01/pseudocode.R`
  - Why it matters: Weakens support for local comparability.
  - Concrete fix: Add covariate continuity tests.
  - Verification step: Show null discontinuities in predetermined covariates.

### Nice-to-have
- Issue: Reproducibility metadata absent.
  - Evidence: `reports/qa/phase6_benchmarks/rdd_01/pseudocode.R`
  - Why it matters: Hard to replicate benchmark output.
  - Concrete fix: Add session logging.
  - Verification step: Save session info artifact.

## Prioritized Fix Plan
1. Add manipulation/density diagnostics.
2. Implement local bandwidth and polynomial sensitivity workflow.
3. Add covariate continuity and inference documentation.

## What Would Change the Conclusion
- Stable local estimates across bandwidths with passed manipulation and continuity diagnostics.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/rdd_01/pseudocode.R`
- `AI_READABLE/E1_RDD_basics.md`
