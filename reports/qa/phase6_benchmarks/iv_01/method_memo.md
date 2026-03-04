# Method Memo

## Design Summary
- Primary design family: IV/LATE
- Secondary/backup design family: Selection on observables (sensitivity only)
- Target estimand: LATE for instrument-induced compliers

## Routed Families
- Family: IV/LATE
  - Role: `primary`
  - Why selected: Instrument shifts treatment but is plausibly exogenous.
  - Assumptions required: relevance, exclusion, monotonicity.
  - Diagnostics required: first-stage strength, placebo outcomes, weak-IV robust inference.
  - Confidence: `medium`

## Identification Assumptions
1. Center assignment shifts completion.
2. Assignment affects earnings only via completion.
3. No defiers for assignment-completion response.

## Threats to Validity
### Internal Validity
- Weak first-stage in some groups.
- Direct center effects on earnings may violate exclusion.

### External Validity
- LATE may not generalize to non-compliers.

## Required Diagnostics and Falsification Tests
1. First-stage estimates and F-statistics overall and by subgroup.
2. Placebo outcomes and mechanism checks for exclusion.
3. Weak-IV robust confidence intervals.

## Evidence Review
- Observed evidence: IV lectures and concept notes emphasize weak-IV and exclusion checks.
- Inferred concern: current code likely omits minimum weak-IV diagnostics.

## Risk Rating
- Overall: `high`
- What would change this rating: strong/stable first-stage and passed placebo checks.

## Cited Local Sources
- `AI_READABLE/C1_IV_basics.md`
- `AI_READABLE/C2_LATE.md`
- `AI_READABLE/concepts/Weak_instruments.md`
- `AI_READABLE/concepts/Exclusion_restriction.md`
