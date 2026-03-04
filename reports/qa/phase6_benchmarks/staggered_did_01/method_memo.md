# Method Memo

## Design Summary
- Primary design family: Staggered DiD
- Secondary/backup design family: Canonical DiD benchmark
- Target estimand: Dynamic cohort-aware effects

## Routed Families
- Family: Staggered DiD
  - Role: `primary`
  - Why selected: treatment starts at different times across cohorts.
  - Assumptions required: cohort-parallel trends, no anticipation, robust aggregation.
  - Diagnostics required: robust estimator comparison, event support diagnostics, lead/placebo checks.
  - Confidence: `high`

## Identification Assumptions
1. Cohort-specific parallel trends.
2. No anticipation.
3. Robust estimator recovers interpretable aggregation.

## Threats to Validity
### Internal Validity
- Naive TWFE contamination.
- Cohort imbalance.

### External Validity
- Dynamic effects may vary by cohort context.

## Required Diagnostics and Falsification Tests
1. Robust estimator vs TWFE comparison.
2. Event-time support table by cohort.
3. Lead/placebo diagnostics.

## Evidence Review
- Observed evidence: staggered adoption materials warn against naive TWFE only.
- Inferred concern: baseline script omits key staggered diagnostics.

## Risk Rating
- Overall: `high`
- What would change this rating: robust estimator agreement and passing lead/placebo checks.

## Cited Local Sources
- `AI_READABLE/D3_Staggered_adoption.md`
- `AI_READABLE/concepts/Staggered_adoption_DiD.md`
- `AI_READABLE/concepts/Event_study.md`
