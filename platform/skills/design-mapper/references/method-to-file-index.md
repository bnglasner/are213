# Method-to-File Index

## Purpose
Provide deterministic retrieval targets for mapping a project from `<run_dir>/research_brief.yaml` to the correct method family documentation.

## Retrieval Order
1. Read `literature/canonical_ai_readable/ECONOMETRICS_MAP.md` for global method graph.
2. Read family-specific lecture translation(s) from `literature/canonical_ai_readable/*.md`.
3. Read assumption anchors from `literature/canonical_ai_readable/concepts/*.md`.
4. Read external tool-node index `literature/canonical_ai_readable/external/repo_tool_nodes.md`.
5. Read external routing matrix `platform/skills/design-mapper/references/repo-tool-routing.md`.

## Design Family Lookup

### RCT and Core Causality
- Primary lectures:
  - `literature/canonical_ai_readable/A2_causality.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/A1_regression.md`
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Potential_outcomes.md`
  - `literature/canonical_ai_readable/concepts/RCT_design.md`
  - `literature/canonical_ai_readable/concepts/SUTVA.md`
  - `literature/canonical_ai_readable/concepts/Randomization_inference.md`

### Selection on Observables / Covariate Adjustment
- Primary lectures:
  - `literature/canonical_ai_readable/B_covariate_adjustment.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/A2_causality.md`
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Selection_on_observables.md`
  - `literature/canonical_ai_readable/concepts/Conditional_independence_assumption.md`
  - `literature/canonical_ai_readable/concepts/Overlap_common_support.md`
  - `literature/canonical_ai_readable/concepts/Propensity_score.md`
  - `literature/canonical_ai_readable/concepts/Inverse_probability_weighting.md`
  - `literature/canonical_ai_readable/concepts/Double_robust_AIPW.md`

### IV / LATE / Judge Designs
- Primary lectures:
  - `literature/canonical_ai_readable/C1_IV_basics.md`
  - `literature/canonical_ai_readable/C2_LATE.md`
  - `literature/canonical_ai_readable/C3_judge_IV.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/F_Spillovers_Formula_IV.md`
  - `literature/canonical_ai_readable/E2_RDD_extensions.md` (fuzzy RD connection)
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Instrumental_variables.md`
  - `literature/canonical_ai_readable/concepts/Exclusion_restriction.md`
  - `literature/canonical_ai_readable/concepts/First_stage_relevance.md`
  - `literature/canonical_ai_readable/concepts/Weak_instruments.md`
  - `literature/canonical_ai_readable/concepts/LATE.md`
  - `literature/canonical_ai_readable/concepts/Two_stage_least_squares.md`
  - `literature/canonical_ai_readable/concepts/Judge_leniency_designs.md`

### Panel FE and Canonical DiD
- Primary lectures:
  - `literature/canonical_ai_readable/D1_Panels.md`
  - `literature/canonical_ai_readable/D2_Canonical_DiD.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/D4_DiD_extensions.md`
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Fixed_effects.md`
  - `literature/canonical_ai_readable/concepts/Difference_in_differences.md`
  - `literature/canonical_ai_readable/concepts/Parallel_trends.md`
  - `literature/canonical_ai_readable/concepts/Event_study.md`
  - `literature/canonical_ai_readable/concepts/Cluster_robust_inference.md`

### Staggered Adoption DiD
- Primary lectures:
  - `literature/canonical_ai_readable/D3_Staggered_adoption.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/D2_Canonical_DiD.md`
  - `literature/canonical_ai_readable/D4_DiD_extensions.md`
  - `literature/canonical_ai_readable/D5_Factor_models.md`
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Staggered_adoption_DiD.md`
  - `literature/canonical_ai_readable/concepts/Event_study.md`
  - `literature/canonical_ai_readable/concepts/Parallel_trends.md`

### Synthetic Control / Factor Models
- Primary lectures:
  - `literature/canonical_ai_readable/D5_Factor_models.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/D3_Staggered_adoption.md`
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Synthetic_control.md`
  - `literature/canonical_ai_readable/concepts/Factor_models.md`

### RDD (Sharp/Fuzzy/Extensions)
- Primary lectures:
  - `literature/canonical_ai_readable/E1_RDD_basics.md`
  - `literature/canonical_ai_readable/E2_RDD_extensions.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/C2_LATE.md` (fuzzy RD as local Wald)
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Regression_discontinuity.md`
  - `literature/canonical_ai_readable/concepts/Fuzzy_RDD.md`
  - `literature/canonical_ai_readable/concepts/Local_randomization_RDD.md`
  - `literature/canonical_ai_readable/concepts/Spatial_HAC.md`

### Spillovers / Exposure Mappings / Shift-Share
- Primary lectures:
  - `literature/canonical_ai_readable/F_Spillovers_Formula_IV.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/A2_causality.md`
  - `literature/canonical_ai_readable/D4_DiD_extensions.md`
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Interference_and_spillovers.md`
  - `literature/canonical_ai_readable/concepts/Formula_instruments_and_recentering.md`
  - `literature/canonical_ai_readable/concepts/Shift_share_IV.md`

### Nonlinear Multiplicative Models / PPML
- Primary lectures:
  - `literature/canonical_ai_readable/G_nonlinear.md`
- Supporting lectures:
  - `literature/canonical_ai_readable/A1_regression.md`
- Concept anchors:
  - `literature/canonical_ai_readable/concepts/Nonlinear_multiplicative_models.md`
  - `literature/canonical_ai_readable/concepts/PPML.md`

## Cross-Cutting Inference Anchors
- `literature/canonical_ai_readable/concepts/Heteroskedasticity_robust_SE.md`
- `literature/canonical_ai_readable/concepts/Cluster_robust_inference.md`
- `literature/canonical_ai_readable/concepts/Multiway_clustering.md`
- `literature/canonical_ai_readable/concepts/Spatial_HAC.md`
