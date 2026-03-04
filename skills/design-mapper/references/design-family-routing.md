# Design Family Routing Rules

## Purpose
Map `reports/research_brief.yaml` to:
1. Primary design family.
2. Optional overlay families.
3. Required assumptions and diagnostics for `reports/method_memo.md`.

## Required Inputs from Research Brief
- `primary_estimand`
- `treatment_definition`
- `outcome_definition`
- `unit_of_observation`
- `sample_construction`
- `design_family_candidate` (if supplied)
- `known_threats`

If any required input is missing, return to intake and append to `open_questions`.

## Routing Decision Tree

### Rule 1: Randomized Assignment
Route to `RCT` when treatment assignment is random (or algorithmically randomized with known probabilities).
- Primary references: `AI_READABLE/A2_causality.md`
- Must-check assumptions: assignment exogeneity, protocol fidelity, attrition balance, interference handling.

### Rule 2: Threshold-Based Assignment
Route to `RDD` when treatment is assigned by a cutoff in a running variable.
- Primary references: `AI_READABLE/E1_RDD_basics.md`, `AI_READABLE/E2_RDD_extensions.md`
- Must-check assumptions: continuity at cutoff, no manipulation around threshold, bandwidth robustness.

### Rule 3: Instrument-Induced Variation
Route to `IV/LATE` when causal variation comes from an instrument shifting treatment.
- Primary references: `AI_READABLE/C1_IV_basics.md`, `AI_READABLE/C2_LATE.md`
- Must-check assumptions: relevance, exclusion, monotonicity (if LATE interpretation).

### Rule 4: Timing-Based Policy Variation (Two-Group/Two-Period Baseline)
Route to `Canonical DiD` when treated/control groups are compared over time with a parallel-trends identifying assumption.
- Primary references: `AI_READABLE/D2_Canonical_DiD.md`
- Must-check assumptions: parallel trends, no anticipation, composition stability.

### Rule 5: Multi-Cohort Timing Adoption
Route to `Staggered Adoption DiD` when units adopt treatment in different periods.
- Primary references: `AI_READABLE/D3_Staggered_adoption.md`
- Must-check assumptions: cohort-specific trend validity, estimator robustness to heterogeneity, event-time support.

### Rule 6: Conditional Ignorability Strategy
Route to `Selection on Observables` when treatment selection is addressed with observables (matching, weighting, AIPW).
- Primary references: `AI_READABLE/B_covariate_adjustment.md`
- Must-check assumptions: CIA plausibility, overlap/common support, model balance diagnostics.

### Rule 7: Exposure/Network Dependence
Add `Spillover Overlay` when outcomes depend on others' treatment or exposure maps.
- Primary references: `AI_READABLE/F_Spillovers_Formula_IV.md`, `AI_READABLE/A2_causality.md`
- Must-check assumptions: exposure mapping validity, interference structure, inference dependence correction.

### Rule 8: Nonlinear Outcome Process
Add `Nonlinear Estimation Overlay` when outcomes are count/nonnegative and multiplicative effects are targeted.
- Primary references: `AI_READABLE/G_nonlinear.md`
- Must-check assumptions: link-function relevance, interpretation of coefficients, separation/zero handling.

## Tie-Breaking and Multi-Label Rules
1. Prefer the design implied by assignment mechanism over estimator choice.
2. Use one primary family and any number of overlays.
3. If multiple primary families remain plausible, report top two with disambiguation tests.

## Required Output Format
For each routed family, output:
- `family`
- `why_selected`
- `assumptions_required`
- `diagnostics_required`
- `key_references`
- `confidence` (`high|medium|low`)

## Minimum Diagnostic Set by Family
- RCT: balance checks, attrition analysis, assignment mechanism verification.
- Selection on observables: overlap diagnostics, covariate balance, sensitivity to hidden bias framing.
- IV/LATE: first-stage strength, alternative instruments/specs, weak-IV robust inference path.
- Canonical DiD: pre-trend/event-study checks, placebo timing, composition tests.
- Staggered DiD: estimator choice justification, event-time support, weight/pathology checks.
- RDD: McCrary/manipulation diagnostics, bandwidth/specification robustness, local covariate continuity.
- Spillover overlay: placebo exposure mappings, alternative neighborhood definitions, dependence-robust SE strategy.
- Nonlinear overlay: PPML vs alternatives, influence/outlier sensitivity, interpretation consistency.
