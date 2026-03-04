# Method Memo

## Design Summary
- Primary design family: IV/LATE
- Secondary/backup design family: Selection on observables (sensitivity benchmark only)
- Target estimand: LATE of detention on conviction for judge-assignment compliers

## Routed Families
- Family: IV/LATE
  - Role: `primary`
  - Why selected: Treatment variation is induced by quasi-random judge leniency rather than direct randomization.
  - Assumptions required: relevance, exclusion, quasi-random assignment, monotonicity for LATE interpretation.
  - Diagnostics required: first-stage strength, exclusion-placebo probes, subgroup monotonicity stress tests.
  - Confidence: `medium`
- Family: Spillovers/Exposure
  - Role: `overlay`
  - Why selected: Court environment or judge behavior may create correlated treatment exposure beyond own case.
  - Assumptions required: no unmodeled interference or valid dependence correction.
  - Diagnostics required: clustering/dependence-robust inference sensitivity checks.
  - Confidence: `low`

## Identification Assumptions
1. Judge assignment is as-good-as-random conditional on court-time controls.
2. Judge leniency affects conviction primarily through detention decision (exclusion).
3. Judge leniency materially shifts detention decisions (relevance).
4. No defiers with respect to leniency-induced detention propensity (monotonicity).

## Threats to Validity
### Internal Validity
- Non-random assignment by case type or docket process.
- Exclusion violations through judge channels unrelated to detention.
- Weak first stage in narrow subsamples.

### External Validity
- LATE may not generalize beyond marginal defendants.
- Jurisdiction-specific judge behavior may limit transportability.

## Required Diagnostics and Falsification Tests
1. Estimate first-stage strength overall and by major subgroups; flag weak-IV segments.
2. Run placebo checks on predetermined outcomes and pre-decision covariates by leniency instrument.
3. Probe exclusion via alternative controls capturing direct judge-channel mechanisms.
4. Re-estimate with dependence-robust inference choices (cluster level sensitivity).

## Evidence Review
- Observed evidence: lecture materials define judge designs as IV problems with exclusion/relevance/monotonicity sensitivity.
- Inferred concern: exclusion and assignment quality are the highest-risk assumptions for this design.

## Risk Rating
- Overall: `medium`
- What would change this rating: strong and stable first stage plus credible exclusion/placebo evidence would lower risk; systematic placebo failures would raise risk to high.

## Cited Local Sources
- `AI_READABLE/C3_judge_IV.md`
- `AI_READABLE/C1_IV_basics.md`
- `AI_READABLE/C2_LATE.md`
- `AI_READABLE/concepts/Exclusion_restriction.md`
- `AI_READABLE/concepts/First_stage_relevance.md`
- `AI_READABLE/concepts/Judge_leniency_designs.md`
