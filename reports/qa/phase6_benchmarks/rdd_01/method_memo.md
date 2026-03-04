# Method Memo

## Design Summary
- Primary design family: RDD
- Secondary/backup design family: Fuzzy RD (if noncompliance detected)
- Target estimand: local treatment effect at cutoff

## Routed Families
- Family: RDD
  - Role: `primary`
  - Why selected: assignment rule uses a cutoff in running variable.
  - Assumptions required: continuity at cutoff, no manipulation, local comparability.
  - Diagnostics required: density/manipulation tests, bandwidth sensitivity, covariate continuity.
  - Confidence: `high`

## Identification Assumptions
1. Potential outcomes are continuous at cutoff absent treatment.
2. No strategic sorting around threshold.
3. Local polynomial/bandwidth choices are adequate.

## Threats to Validity
### Internal Validity
- Sorting around cutoff.
- Overly global functional form.

### External Validity
- Effect only local near threshold.

## Required Diagnostics and Falsification Tests
1. Density/manipulation tests at cutoff.
2. Bandwidth and polynomial sensitivity.
3. Covariate continuity checks near threshold.

## Evidence Review
- Observed evidence: RDD materials require manipulation and bandwidth diagnostics.
- Inferred concern: script currently omits required local diagnostics.

## Risk Rating
- Overall: `high`
- What would change this rating: stable local estimates across bandwidth/specification with passed manipulation tests.

## Cited Local Sources
- `AI_READABLE/E1_RDD_basics.md`
- `AI_READABLE/E2_RDD_extensions.md`
- `AI_READABLE/concepts/Regression_discontinuity.md`
