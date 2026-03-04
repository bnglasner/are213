# Method-to-File Index

## Purpose
Provide deterministic retrieval targets for mapping a project from `reports/research_brief.yaml` to the correct method family documentation.

## Retrieval Order
1. Read `AI_READABLE/ECONOMETRICS_MAP.md` for global method graph.
2. Read family-specific lecture translation(s) from `AI_READABLE/*.md`.
3. Read assumption anchors from `AI_READABLE/concepts/*.md`.

## Design Family Lookup

### RCT and Core Causality
- Primary lectures:
  - `AI_READABLE/A2_causality.md`
- Supporting lectures:
  - `AI_READABLE/A1_regression.md`
- Concept anchors:
  - `AI_READABLE/concepts/Potential_outcomes.md`
  - `AI_READABLE/concepts/RCT_design.md`
  - `AI_READABLE/concepts/SUTVA.md`
  - `AI_READABLE/concepts/Randomization_inference.md`

### Selection on Observables / Covariate Adjustment
- Primary lectures:
  - `AI_READABLE/B_covariate_adjustment.md`
- Supporting lectures:
  - `AI_READABLE/A2_causality.md`
- Concept anchors:
  - `AI_READABLE/concepts/Selection_on_observables.md`
  - `AI_READABLE/concepts/Conditional_independence_assumption.md`
  - `AI_READABLE/concepts/Overlap_common_support.md`
  - `AI_READABLE/concepts/Propensity_score.md`
  - `AI_READABLE/concepts/Inverse_probability_weighting.md`
  - `AI_READABLE/concepts/Double_robust_AIPW.md`

### IV / LATE / Judge Designs
- Primary lectures:
  - `AI_READABLE/C1_IV_basics.md`
  - `AI_READABLE/C2_LATE.md`
  - `AI_READABLE/C3_judge_IV.md`
- Supporting lectures:
  - `AI_READABLE/F_Spillovers_Formula_IV.md`
  - `AI_READABLE/E2_RDD_extensions.md` (fuzzy RD connection)
- Concept anchors:
  - `AI_READABLE/concepts/Instrumental_variables.md`
  - `AI_READABLE/concepts/Exclusion_restriction.md`
  - `AI_READABLE/concepts/First_stage_relevance.md`
  - `AI_READABLE/concepts/Weak_instruments.md`
  - `AI_READABLE/concepts/LATE.md`
  - `AI_READABLE/concepts/Two_stage_least_squares.md`
  - `AI_READABLE/concepts/Judge_leniency_designs.md`

### Panel FE and Canonical DiD
- Primary lectures:
  - `AI_READABLE/D1_Panels.md`
  - `AI_READABLE/D2_Canonical_DiD.md`
- Supporting lectures:
  - `AI_READABLE/D4_DiD_extensions.md`
- Concept anchors:
  - `AI_READABLE/concepts/Fixed_effects.md`
  - `AI_READABLE/concepts/Difference_in_differences.md`
  - `AI_READABLE/concepts/Parallel_trends.md`
  - `AI_READABLE/concepts/Event_study.md`
  - `AI_READABLE/concepts/Cluster_robust_inference.md`

### Staggered Adoption DiD
- Primary lectures:
  - `AI_READABLE/D3_Staggered_adoption.md`
- Supporting lectures:
  - `AI_READABLE/D2_Canonical_DiD.md`
  - `AI_READABLE/D4_DiD_extensions.md`
  - `AI_READABLE/D5_Factor_models.md`
- Concept anchors:
  - `AI_READABLE/concepts/Staggered_adoption_DiD.md`
  - `AI_READABLE/concepts/Event_study.md`
  - `AI_READABLE/concepts/Parallel_trends.md`

### Synthetic Control / Factor Models
- Primary lectures:
  - `AI_READABLE/D5_Factor_models.md`
- Supporting lectures:
  - `AI_READABLE/D3_Staggered_adoption.md`
- Concept anchors:
  - `AI_READABLE/concepts/Synthetic_control.md`
  - `AI_READABLE/concepts/Factor_models.md`

### RDD (Sharp/Fuzzy/Extensions)
- Primary lectures:
  - `AI_READABLE/E1_RDD_basics.md`
  - `AI_READABLE/E2_RDD_extensions.md`
- Supporting lectures:
  - `AI_READABLE/C2_LATE.md` (fuzzy RD as local Wald)
- Concept anchors:
  - `AI_READABLE/concepts/Regression_discontinuity.md`
  - `AI_READABLE/concepts/Fuzzy_RDD.md`
  - `AI_READABLE/concepts/Local_randomization_RDD.md`
  - `AI_READABLE/concepts/Spatial_HAC.md`

### Spillovers / Exposure Mappings / Shift-Share
- Primary lectures:
  - `AI_READABLE/F_Spillovers_Formula_IV.md`
- Supporting lectures:
  - `AI_READABLE/A2_causality.md`
  - `AI_READABLE/D4_DiD_extensions.md`
- Concept anchors:
  - `AI_READABLE/concepts/Interference_and_spillovers.md`
  - `AI_READABLE/concepts/Formula_instruments_and_recentering.md`
  - `AI_READABLE/concepts/Shift_share_IV.md`

### Nonlinear Multiplicative Models / PPML
- Primary lectures:
  - `AI_READABLE/G_nonlinear.md`
- Supporting lectures:
  - `AI_READABLE/A1_regression.md`
- Concept anchors:
  - `AI_READABLE/concepts/Nonlinear_multiplicative_models.md`
  - `AI_READABLE/concepts/PPML.md`

## Cross-Cutting Inference Anchors
- `AI_READABLE/concepts/Heteroskedasticity_robust_SE.md`
- `AI_READABLE/concepts/Cluster_robust_inference.md`
- `AI_READABLE/concepts/Multiway_clustering.md`
- `AI_READABLE/concepts/Spatial_HAC.md`
