---
title: "ARE213 Econometrics Knowledge Graph"
note_type: "hub"
tags: [are213, econometrics, obsidian, map]
---

# ARE213 Econometrics Knowledge Graph

## How to Use
- Start from sequence flow under `Lecture Dependency Path`.
- Jump from lectures to concept notes using links in the `concepts/` folder.
- Use concept notes as canonical notation anchors when symbols vary across modules.

## Lecture Dependency Path
- [[A1_regression]] -> [[A2_causality]]
- [[A2_causality]] -> [[B_covariate_adjustment]]
- [[B_covariate_adjustment]] -> [[C1_IV_basics]] -> [[C2_LATE]] -> [[C3_judge_IV]]
- [[A1_regression]] -> [[D1_Panels]] -> [[D2_Canonical_DiD]] -> [[D3_Staggered_adoption]] -> [[D4_DiD_extensions]] -> [[D5_Factor_models]]
- [[A2_causality]] -> [[E1_RDD_basics]] -> [[E2_RDD_extensions]]
- [[A2_causality]] + [[C1_IV_basics]] + [[D2_Canonical_DiD]] + [[E2_RDD_extensions]] -> [[F_Spillovers_Formula_IV]]
- [[A1_regression]] + [[A2_causality]] -> [[G_nonlinear]]

## Lecture Hubs
- Foundations: [[A1_regression]], [[A2_causality]]
- Selection on observables: [[B_covariate_adjustment]]
- Instrumental variables: [[C1_IV_basics]], [[C2_LATE]], [[C3_judge_IV]]
- Panels and DiD: [[D1_Panels]], [[D2_Canonical_DiD]], [[D3_Staggered_adoption]], [[D4_DiD_extensions]], [[D5_Factor_models]]
- RDD: [[E1_RDD_basics]], [[E2_RDD_extensions]]
- Spillovers and formula IV: [[F_Spillovers_Formula_IV]]
- Nonlinear methods: [[G_nonlinear]]

## Concept Index

### Core Causal Framework
- [[concepts/Potential_outcomes]]
- [[concepts/Fundamental_problem_of_causal_inference]]
- [[concepts/ATE_ATT_ATU]]
- [[concepts/SUTVA]]
- [[concepts/Internal_vs_external_validity]]
- [[concepts/RCT_design]]

### Regression and Inference Foundations
- [[concepts/Regression_and_CEF]]
- [[concepts/OLS]]
- [[concepts/Frisch_Waugh_Lovell]]
- [[concepts/Omitted_variable_bias]]
- [[concepts/Asymptotic_normality]]
- [[concepts/Heteroskedasticity_robust_SE]]
- [[concepts/Cluster_robust_inference]]
- [[concepts/Multiway_clustering]]
- [[concepts/Spatial_HAC]]

### Selection on Observables
- [[concepts/Selection_on_observables]]
- [[concepts/Conditional_independence_assumption]]
- [[concepts/Overlap_common_support]]
- [[concepts/Propensity_score]]
- [[concepts/Inverse_probability_weighting]]
- [[concepts/Double_robust_AIPW]]
- [[concepts/Neyman_orthogonality]]

### Instrumental Variables
- [[concepts/Instrumental_variables]]
- [[concepts/Exclusion_restriction]]
- [[concepts/First_stage_relevance]]
- [[concepts/Two_stage_least_squares]]
- [[concepts/Weak_instruments]]
- [[concepts/LATE]]
- [[concepts/Judge_leniency_designs]]

### Panel, DiD, and Event-Time
- [[concepts/Fixed_effects]]
- [[concepts/Difference_in_differences]]
- [[concepts/Parallel_trends]]
- [[concepts/Event_study]]
- [[concepts/Staggered_adoption_DiD]]
- [[concepts/Synthetic_control]]
- [[concepts/Factor_models]]

### RDD and Local Designs
- [[concepts/Regression_discontinuity]]
- [[concepts/Fuzzy_RDD]]
- [[concepts/Local_randomization_RDD]]

### Spillovers and Exposure Designs
- [[concepts/Interference_and_spillovers]]
- [[concepts/Formula_instruments_and_recentering]]
- [[concepts/Shift_share_IV]]

### Nonlinear and Count-Style Models
- [[concepts/Nonlinear_multiplicative_models]]
- [[concepts/PPML]]

## Reading Routes
- Causal foundations route: [[A2_causality]] -> [[B_covariate_adjustment]] -> [[C1_IV_basics]] -> [[E1_RDD_basics]]
- Policy-evaluation route: [[D2_Canonical_DiD]] -> [[D3_Staggered_adoption]] -> [[D4_DiD_extensions]] -> [[D5_Factor_models]]
- Modern shocks-and-exposure route: [[C1_IV_basics]] -> [[F_Spillovers_Formula_IV]]
- Nonlinear estimation route: [[A1_regression]] -> [[G_nonlinear]]
