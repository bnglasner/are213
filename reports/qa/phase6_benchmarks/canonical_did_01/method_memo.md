# Method Memo

## Design Summary
- Primary design family: Canonical DiD
- Secondary/backup design family: Panel FE (descriptive fallback)
- Target estimand: ATT under parallel trends

## Routed Families
- Family: Canonical DiD
  - Role: `primary`
  - Why selected: treatment varies by group and time in a two-period frame.
  - Assumptions required: parallel trends, no anticipation, stable composition.
  - Diagnostics required: pre-trend leads, placebo timing, composition checks.
  - Confidence: `high`

## Identification Assumptions
1. Treated and control groups would have evolved similarly absent treatment.
2. No meaningful anticipation before policy starts.
3. Group composition changes are not treatment-induced.

## Threats to Validity
### Internal Validity
- Differential trends.
- Anticipatory adjustments.

### External Validity
- ATT may not transport beyond included regions.

## Required Diagnostics and Falsification Tests
1. Pre-trend event-style tests.
2. Placebo adoption timing.
3. Sensitivity to composition and controls.

## Evidence Review
- Observed evidence: DiD lecture and concept notes emphasize pre-trend and placebo diagnostics.
- Inferred concern: current script omits these checks.

## Risk Rating
- Overall: `medium`
- What would change this rating: successful pre-trend/placebo tests.

## Cited Local Sources
- `AI_READABLE/D2_Canonical_DiD.md`
- `AI_READABLE/concepts/Parallel_trends.md`
- `AI_READABLE/concepts/Event_study.md`
