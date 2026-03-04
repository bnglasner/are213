# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
- Design target: IV/LATE
- Estimand target: LATE of completion on earnings

## Estimator-Spec Alignment Checks
- IV estimator is present but does not report first-stage strength outputs.

## Inference Checks
- Standard error specification: not clearly justified in script.
- Clustering strategy: not explicitly set.
- Small-sample / bootstrap / randomization inference checks: weak-IV robust inference missing.

## Robustness and Falsification Coverage
- Present checks: none beyond baseline model.
- Missing checks: exclusion placebos, subgroup first-stage, weak-IV robust intervals.

## Findings by Severity
### Critical
- Issue:
  - Issue type: `inference`
  - Evidence: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
  - Why it matters: Weak-IV conditions can invalidate conventional intervals and distort inference.
  - Concrete fix: Add first-stage strength diagnostics and weak-IV robust confidence intervals.
  - Verification step: Report F-statistics and robust interval estimates in final table.

### Major
- Issue:
  - Issue type: `design`
  - Evidence: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
  - Why it matters: Exclusion violation would invalidate IV causal interpretation.
  - Concrete fix: Add placebo outcomes/mechanism checks.
  - Verification step: Confirm no meaningful instrument effect on placebo outcomes.

### Minor
- Issue:
  - Issue type: `implementation`
  - Evidence: `reports/qa/phase6_benchmarks/iv_01/pseudocode.R`
  - Why it matters: Undocumented SE/clustering settings reduce auditability and comparability.
  - Concrete fix: Explicitly set and document clustering/SE choices.
  - Verification step: Add inference block with rationale comments.

### Nice-to-have
- None while unresolved high-priority design/inference risks remain.

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
