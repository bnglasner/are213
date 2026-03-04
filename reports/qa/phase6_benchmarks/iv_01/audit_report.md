# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
- Design target: IV/LATE
- Estimand target: LATE of completion on earnings

## Estimator-Spec Alignment Checks
- IV estimator is present but lacks explicit first-stage output and subgroup checks.

## Inference Checks
- Standard error specification: not clearly justified in script.
- Clustering strategy: not explicitly set.
- Small-sample / bootstrap / randomization inference checks: weak-IV robust inference missing.

## Robustness and Falsification Coverage
- Present checks: none beyond baseline model.
- Missing checks: exclusion placebos, subgroup first-stage, weak-IV robust intervals.

## Findings by Severity
### Critical
- Issue: Weak-IV diagnostics and robust inference are missing.
  - Evidence: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
  - Why it matters: Point estimates may be biased and confidence intervals misleading under weak instruments.
  - Concrete fix: Add first-stage strength diagnostics and weak-IV robust confidence intervals.
  - Verification step: Report F-statistics and robust interval estimates in final table.

### Major
- Issue: Exclusion restriction is untested.
  - Evidence: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
  - Why it matters: Direct instrument channels can invalidate causal interpretation.
  - Concrete fix: Add placebo outcomes/mechanism checks.
  - Verification step: Confirm no meaningful instrument effect on placebo outcomes.

### Minor
- Issue: Inference settings are not documented.
  - Evidence: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
  - Why it matters: Hard to evaluate inferential validity and reproducibility.
  - Concrete fix: Explicitly set and document clustering/SE choices.
  - Verification step: Add inference block with rationale comments.

### Nice-to-have
- Issue: Script does not log environment metadata.
  - Evidence: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
  - Why it matters: Reduces reproducibility.
  - Concrete fix: Add session/package version logging.
  - Verification step: Persist session info artifact.

## Prioritized Fix Plan
1. Implement weak-IV diagnostics and robust inference.
2. Add exclusion placebos/mechanism tests.
3. Document and standardize inference settings.

## What Would Change the Conclusion
- Strong first stage with robust intervals consistent with baseline estimate.
- Placebo tests showing no direct instrument channel.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
- `AI_READABLE/C1_IV_basics.md`
- `AI_READABLE/C2_LATE.md`
