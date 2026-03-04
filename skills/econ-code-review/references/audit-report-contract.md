# Audit Report Output Contract

## Output Path
- `reports/audit_report.md`

## Required Sections
1. `Scope`
2. `Estimator-Spec Alignment Checks`
3. `Inference Checks`
4. `Robustness and Falsification Coverage`
5. `Findings by Severity`
6. `Prioritized Fix Plan`
7. `What Would Change the Conclusion`
8. `Cited Local Sources`

## Finding Format Requirements
For every finding in `critical`, `major`, `minor`, or `nice-to-have`, include:
- `Issue type` (`design|inference|implementation|reproducibility`)
- `Issue`
- `Evidence` (with local file path)
- `Why it matters`
- `Concrete fix`
- `Verification step`

## Severity Rules
- `critical`: likely invalidates core causal interpretation or invalid inference.
- `major`: does not invalidate all conclusions but creates high-risk bias/inference concerns.
- `minor`: unlikely to reverse sign/conclusion but materially improves credibility.
- `nice-to-have`: quality, communication, or precision enhancements.

## Acceptance Gates
1. At least one finding must appear unless reviewer explicitly states no findings.
2. Each `critical`/`major` finding must cite at least one local file.
3. `Prioritized Fix Plan` must include owner suggestion, effort tier, and dependency notes.
4. `What Would Change the Conclusion` must include concrete empirical triggers.
5. When unresolved `critical`/`major` findings exist, report reproducibility-only issues as at most one aggregated `nice-to-have` item.
