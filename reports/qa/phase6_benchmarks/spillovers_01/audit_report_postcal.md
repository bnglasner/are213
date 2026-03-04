# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
- Design target: Spillovers/Exposure
- Estimand target: direct effect under explicit exposure mapping

## Estimator-Spec Alignment Checks
- Model includes own treatment only; no explicit exposure mapping term.

## Inference Checks
- Standard error specification: clustered by village.
- Clustering strategy: no alternative dependence checks.
- Small-sample / bootstrap / randomization inference checks: absent.

## Robustness and Falsification Coverage
- Present checks: baseline model only.
- Missing checks: alternative exposure mappings, placebo exposures, dependence sensitivity.

## Findings by Severity
### Critical
- Issue:
  - Issue type: `design`
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Without exposure mapping, estimated effect does not match stated interference design.
  - Concrete fix: Implement explicit exposure mapping variables and model terms.
  - Verification step: Re-estimate with primary and alternative mappings.

### Major
- Issue:
  - Issue type: `design`
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Cannot assess robustness of mapping assumptions.
  - Concrete fix: Add placebo and alternative exposure checks.
  - Verification step: Report stability and placebo null patterns.
- Issue:
  - Issue type: `inference`
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Network dependence may invalidate single-cluster uncertainty claims.
  - Concrete fix: Add dependence-robust inference sensitivity.
  - Verification step: Compare significance across inference methods.

### Minor
- Issue:
  - Issue type: `implementation`
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Undocumented exposure construction assumptions reduce auditability.
  - Concrete fix: Document mapping assumptions and variable construction.
  - Verification step: Add reproducible mapping documentation block.

### Nice-to-have
- None while unresolved high-priority design/inference risks remain.

## Prioritized Fix Plan
1. Implement explicit exposure mapping in model.
2. Add placebo and mapping sensitivity checks.
3. Add dependence-robust inference sensitivity.

## What Would Change the Conclusion
- Effects stable across exposure mappings and dependence-aware inference methods.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
- `AI_READABLE/F_Spillovers_Formula_IV.md`
