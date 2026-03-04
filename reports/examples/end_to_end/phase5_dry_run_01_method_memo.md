# Method Memo

## Design Summary
- Primary design family: Staggered adoption DiD
- Secondary/backup design family: Canonical DiD (benchmark only)
- Target estimand: Dynamic cohort-aware treatment effects in event time

## Routed Families
- Family: Staggered DiD
  - Role: `primary`
  - Why selected: Treatment timing varies by adoption cohort across regions.
  - Assumptions required: parallel trends by cohort, no anticipation, valid comparison set, estimator robustness to heterogeneity.
  - Diagnostics required: pre-trend/event-study diagnostics, cohort support checks, robust estimator comparisons.
  - Confidence: `high`
- Family: Spillovers/Exposure
  - Role: `overlay`
  - Why selected: Regional policy diffusion may generate cross-region interference.
  - Assumptions required: limited spillovers or valid exposure modeling.
  - Diagnostics required: neighbor-exposure placebo checks and dependence-aware inference sensitivity.
  - Confidence: `medium`

## Identification Assumptions
1. In absence of treatment, cohorts would have followed comparable trends after conditioning on controls/FE.
2. Units do not systematically adjust outcomes before official adoption timing (no anticipation).
3. Estimator aggregates cohort effects without harmful weighting distortions.

## Threats to Validity
### Internal Validity
- Differential pre-trends across cohorts.
- Event-time coding errors from mismeasured adoption year.
- Implicit weighting pathologies from naive TWFE implementation.

### External Validity
- Effects may vary across cohorts and regions with different baseline conditions.

## Required Diagnostics and Falsification Tests
1. Joint lead tests and placebo adoption timing checks.
2. Robust estimator comparison against naive TWFE.
3. Event-time support and cohort-balance diagnostics.
4. Clustering/dependence-robust inference sensitivity.

## Evidence Review
- Observed evidence: local lecture materials explicitly warn about TWFE failures in staggered settings and emphasize robust alternatives.
- Inferred concern: current pseudo-code likely fails core staggered-design robustness checks.

## Risk Rating
- Overall: `high`
- What would change this rating: passing lead/placebo tests plus stable results across heterogeneity-robust estimators and inference choices would lower risk.

## Cited Local Sources
- `AI_READABLE/D2_Canonical_DiD.md`
- `AI_READABLE/D3_Staggered_adoption.md`
- `AI_READABLE/D4_DiD_extensions.md`
- `AI_READABLE/concepts/Staggered_adoption_DiD.md`
- `AI_READABLE/concepts/Parallel_trends.md`
