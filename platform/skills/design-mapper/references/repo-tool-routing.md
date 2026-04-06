# External Repo Tool Routing

## Purpose

Map method-design queries to external econometrics repositories from `deep-research-report.md` using three routing keys:

- `estimand_type`
- `identification_assumptions`
- `data_structure`

This file is a reference layer for agent-side method routing. Missing metadata remains `unspecified` by design.

## Routing Matrix

| estimand_type | identification_assumptions | data_structure | recommended_repos |
|---|---|---|---|
| dynamic_att_or_group_time_att | parallel_trends, no_anticipation, cohort_specific_support | panel_staggered_adoption | `bcallaway11/did`, `pedrohcgs/DRDID`, `chaisemartinPackages/did_multiplegt`, `borusyak/did_imputation`, `lsun20/eventstudyinteract` |
| panel_att_under_latent_factor_structure | factor_model_stability, weighted_counterfactual_feasibility | panel_with_pre_post_periods | `synth-inference/synthdid`, `xuyiqing/gsynth` |
| local_treatment_effect_at_cutoff | continuity_at_cutoff, no_running_variable_manipulation, bandwidth_validity | single_cutoff_cross_section_or_panel | `rdpackages/rdrobust` |
| heterogeneous_treatment_effects_or_iv_heterogeneity | overlap_support, forest_consistency, instrument_validity_for_iv_forests | high_dimensional_covariates_cross_section_or_panel | `grf-labs/grf` |
| linear_panel_or_iv_parameters | strict_or_sequential_exogeneity_or_valid_instruments, fixed_effect_absorption_validity | panel_or_repeated_cross_section | `bashtage/linearmodels`, `FixedEffects/FixedEffectModels.jl` |
| volatility_and_time_series_parameters | stationarity_or_local_stationarity_as_required_by_selected_model_or_test | univariate_or_multivariate_time_series | `bashtage/arch` |
| structural_demand_parameters | utility_specification_validity, instrument_validity, market_structure_assumptions | market_product_panel_data | `jeffgortmaker/pyblp` |
| bayesian_svar_irfs_and_structural_shocks | prior_specification_validity, identification_by_sign_zero_narrative_restrictions | macro_time_series | `bsvars/bsvars`, `bsvars/bsvarSIGNs` |
| conceptual_design_explanation | assumption_set_depends_on_target_design | mixed | `scunning1975/mixtape` |

## Family Guidance: When to Use / When Not to Use

### Modern DiD and Event Study Family

- Repos: `bcallaway11/did`, `pedrohcgs/DRDID`, `chaisemartinPackages/did_multiplegt`, `borusyak/did_imputation`, `lsun20/eventstudyinteract`
- When to use: staggered adoption, dynamic treatment effects, concern about TWFE weighting/pathologies.
- When not to use: no plausible parallel-trends design, no usable pre-period structure, or severe support violations in event time.

### Synthetic Control and Synthetic DiD Family

- Repos: `synth-inference/synthdid`, `xuyiqing/gsynth`
- When to use: treated units can be represented by weighted controls and panel structure supports synthetic counterfactual construction.
- When not to use: donor pool is weak, pre-treatment fit cannot be achieved, or required panel structure is absent.

### RD Family

- Repos: `rdpackages/rdrobust`
- When to use: assignment is tied to a running-variable cutoff with local continuity assumptions.
- When not to use: no credible threshold assignment mechanism or manipulation around cutoff is dominant and unresolved.

### Causal ML and Heterogeneous Effects Family

- Repos: `grf-labs/grf`
- When to use: target is CATE/heterogeneity discovery with rich covariates and sufficient sample size.
- When not to use: sample is too small for stable forest estimation or interpretability demands conflict with complex ML estimators.

### Panel/IV Toolkit Family

- Repos: `bashtage/linearmodels`, `FixedEffects/FixedEffectModels.jl`
- When to use: classical panel or IV estimands with substantial fixed-effects needs and implementation in Python/Julia.
- When not to use: design identification itself is unresolved (tool choice cannot rescue invalid assumptions).

### Time-Series and Financial Econometrics Family

- Repos: `bashtage/arch`
- When to use: volatility modeling, unit-root testing, cointegration workflows, and financial returns diagnostics.
- When not to use: target estimand is cross-sectional causal effect without a time-series structure.

### Structural IO Family

- Repos: `jeffgortmaker/pyblp`
- When to use: random-coefficients demand estimation and structural counterfactual analysis in IO settings.
- When not to use: reduced-form causal estimands are sufficient and structural assumptions are unnecessary or unsupported.

### Bayesian Macroeconometrics Family

- Repos: `bsvars/bsvars`, `bsvars/bsvarSIGNs`
- When to use: Bayesian SVAR inference, impulse-response analysis, and sign/zero/narrative restrictions.
- When not to use: no macro time-series context or no appetite for prior-driven modeling.

### Pedagogy and Conceptual Support Family

- Repos: `scunning1975/mixtape`
- When to use: explanation-first support, concept mapping, and teaching-oriented examples.
- When not to use: you need a production-grade package API for direct estimator execution.

## Notes

- This routing reference is constrained to the source report and does not add external metadata.
- Repositories with sparse metadata should be considered candidates for a follow-up metadata pass before strict automation.
