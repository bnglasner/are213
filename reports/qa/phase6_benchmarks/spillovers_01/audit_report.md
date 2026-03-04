# Econometric Code Audit Report

## Scope
- Reviewed files: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
- Design target: Spillovers/Exposure
- Estimand target: direct effect under explicit exposure mapping

## Estimator-Spec Alignment Checks
- Model includes own treatment only; no exposure mapping term is implemented.

## Inference Checks
- Standard error specification: clustered by village.
- Clustering strategy: no alternative dependence checks.
- Small-sample / bootstrap / randomization inference checks: absent.

## Robustness and Falsification Coverage
- Present checks: baseline model only.
- Missing checks: alternative exposure mappings, placebo exposures, dependence sensitivity.

## Findings by Severity
### Critical
- Issue: Exposure mapping is absent despite spillover design target.
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Estimated effect does not correspond to stated causal design under interference.
  - Concrete fix: Implement explicit exposure mapping variables and model terms.
  - Verification step: Re-estimate with at least one primary and one alternative mapping.

### Major
- Issue: No placebo or alternative exposure checks.
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Cannot assess mapping robustness or spurious exposure effects.
  - Concrete fix: Add placebo exposure definitions and sensitivity checks.
  - Verification step: Report stability and placebo null patterns.
- Issue: Dependence-robust inference not stress-tested.
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Uncertainty may be mischaracterized with network dependence.
  - Concrete fix: Add inference sensitivity under plausible dependence structures.
  - Verification step: Compare significance across inference methods.

### Minor
- Issue: Exposure assumptions not documented in script comments.
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Hard to audit design rationale.
  - Concrete fix: Document mapping assumptions and variable construction.
  - Verification step: Add reproducible mapping documentation block.

### Nice-to-have
- Issue: No session metadata output.
  - Evidence: `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
  - Why it matters: Weak reproducibility trace.
  - Concrete fix: Add session logging.
  - Verification step: Save session artifact.

## Prioritized Fix Plan
1. Implement explicit exposure mapping in model.
2. Add placebo and mapping sensitivity checks.
3. Add dependence-robust inference sensitivity.

## What Would Change the Conclusion
- Effects that remain stable across exposure mappings and inference settings.

## Cited Local Sources
- `reports/qa/phase6_benchmarks/spillovers_01/pseudocode.R`
- `AI_READABLE/F_Spillovers_Formula_IV.md`
