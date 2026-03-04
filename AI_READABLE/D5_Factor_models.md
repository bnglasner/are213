---
title: "D5 Factor Models and SCM"
note_type: "lecture_translation"
course: "ARE213"
module: "D5"
source_pdf: "D5_Factor_models.pdf"
tags: [are213, econometrics, lecture, synthetic-control, factor-models]
prerequisites: ["D2_Canonical_DiD", "D3_Staggered_adoption"]
concept_notes: ["concepts/Synthetic_control", "concepts/Factor_models", "concepts/Parallel_trends", "concepts/Fixed_effects"]
related_lectures: ["D3_Staggered_adoption", "D4_DiD_extensions"]
---
# D5: Synthetic Controls and Factor-Model Methods Translation

## Source
- PDF filename: `D5_Factor_models.pdf`
- Generated markdown filename: `AI_READABLE/D5_Factor_models.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline: p1-p2, p20
- SCM motivation, construction, and inference: p3-p19
- Factor-model framing and links to modern estimators: p21-p28
- References: p29-p31

## Comprehensive Translation

### Orientation and setting
Source pages: p1-p4

Core ideas
- D5 addresses policy-evaluation settings where canonical DiD PTA is implausible.
- Synthetic control and factor-model approaches relax additive untreated-trend assumptions.

Definitions and notation
- Treated unit(s), donor pool, pre-treatment outcomes/covariates.

Key results/formulas
- Not central on intro slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- SCM/factor methods are especially useful with one/few treated units and rich pre-treatment data.

### Synthetic control method (SCM)
Source pages: p5-p19

Core ideas
- SCM constructs a weighted combination of controls to match treated unit pre-treatment trajectory.
- Post-treatment treated-minus-synthetic gap estimates treatment effect under latent-factor stability.

Definitions and notation
- Donor weights `w_j >= 0`, `sum_j w_j = 1`.
- Pre-treatment fit objective minimizes discrepancy in outcomes/predictors.

Key results/formulas
- Synthetic outcome:
  - `Y_t^{syn} = sum_j w_j Y_{jt}`.
- Effect estimate at `t`:
  - `tau_t = Y_t^{treated} - Y_t^{syn}`.
- Inference often permutation/placebo based rather than classical large-sample formulas.

Proof sketch / logic
- If untreated treated-unit path lies in convex hull of donor untreated paths pre-treatment and latent structure is stable, synthetic trajectory approximates counterfactual.

Examples or exercises
- Abadie et al. California smoking-tax case appears throughout.
- "Spaghetti" placebo plots used for significance-style interpretation.

Interpretation for applied work
- Pre-treatment fit quality is central; poor fit undermines causal interpretation.

### Factor models and modern hybrids
Source pages: p21-p28

Core ideas
- Interactive fixed effects/factor models generalize SCM by modeling latent common factors with unit-specific loadings.
- Modern estimators combine DiD and SCM insights.

Definitions and notation
- Factor structure (conceptual):
  - `Y_it(0) = alpha_i + lambda_t + f_t' l_i + e_it`.
- Methods shown:
  - Synthetic DiD (Arkhangelsky et al.).
  - Imputation/matrix-completion approaches (Athey et al.).

Key results/formulas
- Synthetic DiD combines weighting over units and time to balance pre-treatment outcomes.
- Matrix-completion estimators recover missing untreated potential outcomes under low-rank assumptions.

Proof sketch / logic
- Latent-factor restrictions allow interpolation/extrapolation of untreated outcomes beyond additive TWFE structure.

Examples or exercises
- Slides comparing SCM vs factor approaches and discussing tuning choices.

Interpretation for applied work
- Method choice should match data richness, number of treated units, and plausibility of low-rank latent structure.

### References block
Source pages: p29-p31

Core ideas
- References cover SCM, synthetic DiD, and matrix-completion/factor methods.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for inference details and tuning/regularization guidance.

## Diagnostics, Pitfalls, and Failure Modes
- Poor pre-treatment fit in SCM.
- Donor-pool contamination or treated-like shocks among controls.
- Overfitting pre-period noise with weak out-of-sample credibility.
- Misinterpretation of placebo p-values in small donor pools.
- Incorrect latent-factor assumptions in matrix completion/factor models.

## Implementation Checklist
1. Define treated unit(s), intervention date, and donor pool restrictions.
2. Evaluate pre-treatment fit before interpreting post-treatment gaps.
3. Run placebo/permutation analyses for inference context.
4. Compare SCM with synthetic DiD/factor-imputation alternatives.
5. Test sensitivity to donor pool, predictor set, and pre-period window.
6. Document identifying assumptions (convex-hull fit, latent-factor stability, low-rank structure).

## Structured Extract (for agents)
```yaml
module: synthetic_control_factor_models
source_pdf: D5_Factor_models.pdf
source_pages: 31
estimands:
  - Time-varying treatment effect gaps for treated units
  - Aggregated post-treatment effects under SCM/factor assumptions
identification_assumptions:
  - Credible untreated counterfactual from weighted donors or latent-factor model
  - Stable pre/post mapping of latent structure
  - No major post-treatment confounders differentially affecting treated unit
estimators:
  - Synthetic control (convex donor weights)
  - Synthetic DiD
  - Factor-model imputation / matrix completion
inference_methods:
  - Placebo/permutation inference
  - Asymptotic or resampling methods for factor-based estimators
diagnostics:
  - Pre-treatment fit quality
  - Placebo gap distribution
  - Donor-pool sensitivity
  - Tuning-parameter sensitivity
failure_modes:
  - Poor fit and extrapolation risk
  - Donor contamination
  - Overfitting pre-period noise
  - Invalid latent-factor assumptions
open_questions:
  - Which donor set and pre-period window yield credible fit without overfitting?
  - Are conclusions robust across SCM and factor-based alternatives?
  - How should uncertainty be communicated with small donor pools?
```

## Extraction Gaps
- Several slides are figure-heavy (synthetic-control plots), with limited quantitative detail in text extraction.
- Some symbols/accents are degraded by extraction.

## Retrieval Tags
- `synthetic-control`
- `synthetic-did`
- `factor-models`
- `matrix-completion`
- `policy-evaluation`
- `placebo-inference`
- `interactive-fixed-effects`

## Appendix A: Slide-by-Slide Source Index

- p1: Part D: Panel Data Methods
- p2: D5 outline
- p3: Setting
- p4: Setting (2)
- p5: Motivating example: Abadie et al. (2010)
- p6: Motivating example: Abadie et al. (2010)
- p7: DiD vs. Synthetic control method (SCM)
- p8: How does it work?
- p9: Synthetic California (Abadie et al., 2010)
- p10: Details
- p11: Details (2)
- p12: Abadie et al. (2010) example (cont.)
- p13: Inference
- p14: Inference in Abadie et al. (2010): Spaghetti plot
- p15: Inference details
- p16: Inference details (2)
- p17: Diagnostic testing and robustness
- p18: Some extensions
- p19: SCM: When and why?
- p20: Outline
- p21: Factor model
- p22: Factor models vs. SCM
- p23: Strategy #1: Synthetic DiD (Arkhangelsky et al. (2021))
- p24: Strategy #1: Synthetic DiD (Arkhangelsky et al. (2021))
- p25: Choosing
- p26: Strategy #2: Imputation with factor models
- p27: Athey et al. (2021) matrix completion approach
- p28: Athey et al. (2021) matrix completion approach
- p29: References I
- p30: References II
- p31: References III

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p4: Single treated-unit/period effect target:
  - `tau_{NT} = Y_{NT} - Y_{NT}(0)`.
- p7: DiD donor-average counterfactual (special case):
  - `Y_{NT}(0) = (1/N_0) sum_{i=1}^{N_0} Y_{iT}`.
- p7-p8: SCM counterfactual:
  - `Y_{NT}(0) = sum_{i=1}^{N_0} omega_i Y_{iT}`
  - with `omega_i >= 0` and `sum_i omega_i = 1`.
- p13-p15: Placebo/permutation inference compares treated post-fit error to donor-placebo distribution.
- p21-p22: Interactive-factor untreated outcome model:
  - `Y_it(0) = alpha_i + beta_t + L_it + epsilon_it`
  - `L_it = sum_{r=1}^R S_{ir} F_{tr}`.
- p24-p25: Synthetic DiD combines unit and time weights; ATT built from weighted treated-minus-control post/pre contrasts.
- p26: Low-rank structure condition:
  - `rank(L) = R` is small.

Equation-fidelity note:
- Some optimization objectives/weight constraints are displayed graphically and extracted with truncation; core SCM/SDID/factor equations are preserved above.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `N_0`, `T_0`: donor units and pre-treatment periods.
- `omega_i`: donor weights; `v_t`: time weights (Synthetic DiD).
- `tau_{NT}`: treated-unit post-period effect in canonical SCM setup.
- `Y_it(0)=alpha_i+beta_t+L_it+epsilon_it`: factor untreated model.
- `L_it = sum_r S_ir F_tr`: loadings-by-factors decomposition.

Reconciled extraction artifacts:
- Convex-weight constraints are standardized as `omega_i >= 0`, `sum omega_i = 1`.
- Low-rank factor notation is normalized with `rank(L)=R`.
- Broken objective lines are mapped to standard SCM/SDID weighted pre-fit loss representations.

## Concept Links
- Prerequisites: [[D2_Canonical_DiD]], [[D3_Staggered_adoption]]
- Core concepts: [[concepts/Synthetic_control]], [[concepts/Factor_models]], [[concepts/Parallel_trends]]
- Assumptions: [[concepts/Factor_models]], [[concepts/Parallel_trends]]
- Estimands: [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/Synthetic_control]], [[concepts/Factor_models]]
- Connected lectures: [[D3_Staggered_adoption]], [[D4_DiD_extensions]]
- Global map: [[ECONOMETRICS_MAP]]
