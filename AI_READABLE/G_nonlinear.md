---
title: "G Nonlinear Models"
note_type: "lecture_translation"
course: "ARE213"
module: "G"
source_pdf: "G_nonlinear.pdf"
tags: [are213, econometrics, lecture, nonlinear, ppml]
prerequisites: ["A1_regression", "A2_causality"]
concept_notes: ["concepts/Nonlinear_multiplicative_models", "concepts/PPML", "concepts/Asymptotic_normality", "concepts/Heteroskedasticity_robust_SE"]
related_lectures: ["A1_regression", "D2_Canonical_DiD"]
---
# G: Nonlinear Models with Multiplicative Effects Translation

## Source
- PDF filename: `G_nonlinear.pdf`
- Generated markdown filename: `AI_READABLE/G_nonlinear.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline: p1-p2, p12
- Multiplicative models, zeros, and estimation methods (NLLS/PPML/FE): p3-p11
- Causal interpretation under heterogeneity and zeros: p13-p17
- Closing and references: p18-p20

## Comprehensive Translation

### Orientation
Source pages: p1-p2

Core ideas
- Module studies outcomes where multiplicative effects are natural (rates, trade flows, counts, expenditures).
- Focus: why log-linear OLS can fail, especially with zeros and heteroskedasticity.

Definitions and notation
- Multiplicative mean model framework.

Key results/formulas
- None central on intro slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Model choice should be driven by conditional-mean structure and support (including zeros).

### Multiplicative effects and estimation
Source pages: p3-p11

Core ideas
- Log-transforming outcomes can drop zeros and induce retransformation bias.
- Exponential conditional mean models estimated in levels are often preferable.
- PPML handles zeros naturally and is robust to many forms of heteroskedasticity under correct mean specification.

Definitions and notation
- Exponential mean model:
  - `E[Y|X] = exp(X'beta)`.
- Estimation methods discussed:
  - Nonlinear least squares (NLLS)
  - Poisson pseudo-maximum likelihood (PPML)
  - PPML with high-dimensional fixed effects.

Key results/formulas
- PPML score conditions impose orthogonality of residuals `Y - exp(X'beta)` with regressors.
- In multiplicative models, coefficients map to semi-elastic or elasticity interpretations depending on regressor transformations.

Proof sketch / logic
- QMLE consistency of PPML requires correct conditional mean, not Poisson variance correctness.

Examples or exercises
- Application slide illustrates practical implementation context.

Interpretation for applied work
- Defaulting to log-OLS with ad hoc zero handling is typically inferior to directly modeling levels with exponential mean.

### Causal interpretation with heterogeneity and zeros
Source pages: p13-p17

Core ideas
- Causal interpretation of nonlinear coefficients requires explicit assumptions about treatment-effect heterogeneity and model structure.
- Presence/absence of zeros changes which transformations and estimands are meaningful.

Definitions and notation
- Cases separated in slides:
  - without zeros,
  - with zeros,
  - with zeros plus causal heterogeneity concerns.

Key results/formulas
- PPML DiD extension for multiplicative policy effects appears as robust alternative to log-linear DiD when outcomes include zeros.

Proof sketch / logic
- Conditional-mean restrictions identify multiplicative causal contrasts; misspecification can mix causal and compositional changes.

Examples or exercises
- Dedicated sequence comparing interpretation in zero-free vs zero-including settings.

Interpretation for applied work
- Clarify whether parameter captures proportional changes in mean outcome and whether that target matches policy question.

### Closing and references
Source pages: p18-p20

Core ideas
- Closing slide plus references for nonlinear/multiplicative estimation and causal interpretation.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for inference and implementation details under high-dimensional fixed effects.

## Diagnostics, Pitfalls, and Failure Modes
- Dropping zeros in log-linear models induces selection/interpretation distortions.
- Retransformation bias when modeling `log(Y)` instead of `E[Y|X]`.
- Separation/convergence issues in PPML with sparse outcomes and many FE.
- Misinterpreting nonlinear coefficients as constant additive effects.
- Ignoring heteroskedasticity implications for log-OLS.

## Implementation Checklist
1. Decide whether target is additive or multiplicative treatment effect on conditional mean.
2. Inspect zero mass and outcome support.
3. Estimate exponential-mean models (PPML/NLLS) as primary when zeros are present.
4. Use FE-compatible PPML if panel/high-dimensional structure is required.
5. Check convergence/separation diagnostics.
6. Interpret coefficients in multiplicative terms and report economically meaningful effect translations.
7. Compare to log-OLS only as sensitivity, not default.

## Structured Extract (for agents)
```yaml
module: nonlinear_multiplicative_models
source_pdf: G_nonlinear.pdf
source_pages: 20
estimands:
  - Multiplicative effects on E[Y|X]
  - Policy effects in PPML/PPML-DiD frameworks
identification_assumptions:
  - Correct conditional-mean specification
  - Exogeneity assumptions aligned with causal design
  - Support conditions with zeros handled in model, not by exclusion
estimators:
  - NLLS for exponential mean models
  - PPML
  - PPML with fixed effects
inference_methods:
  - Robust sandwich inference for QMLE settings
  - Cluster-robust inference in panel/DiD contexts
diagnostics:
  - Zero-mass and support diagnostics
  - Convergence/separation checks
  - Sensitivity to model functional form
  - Comparison against log-linear alternatives
failure_modes:
  - Log transformation bias with zeros
  - Retransformation errors
  - Separation in PPML-FE
  - Misinterpretation of nonlinear coefficients
open_questions:
  - Is multiplicative mean structure empirically plausible?
  - Do conclusions hold across PPML and alternative nonlinear estimators?
  - How should heterogeneous proportional effects be summarized?
```

## Extraction Gaps
- Page 10 is text-empty in extraction.
- Some formulas and symbol accents are partially degraded by text extraction.

## Retrieval Tags
- `nonlinear-models`
- `multiplicative-effects`
- `ppml`
- `nlls`
- `zeros`
- `ppml-fixed-effects`
- `ppml-did`

## Appendix A: Slide-by-Slide Source Index

- p1: Part G: Models with Multiplicative Effects
- p2: G Outline
- p3: Multiplicative effects
- p4: Issue of zeros
- p5: Modeling multiplicative effects
- p6: Estimating the exponential model
- p7: Nonlinear least squares (NLLS)
- p8: PPML
- p9: PPML with fixed effects
- p10: [NO_TEXT]
- p11: Application
- p12: Outline
- p13: A causal interpretation and heterogeneous effects
- p14: Case without zeros
- p15: Case with zeros
- p16: Case with zeros (2)
- p17: PPML diff-in-diff
- p18: Thanks!
- p19: References I
- p20: References II

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p3: Log-linear model:
  - `log Y_i = beta' X_i + epsilon_i`, with `E[epsilon_i|X_i]=0`.
- p5: Alternative multiplicative/additive mean models:
  - `Y_i = exp(beta'X_i) U_i`, `E[U_i|X_i]=1`
  - `Y_i = exp(beta'X_i) + epsilon_i`, `E[epsilon_i|X_i]=0`.
- p5: Common mean restriction in #2/#3:
  - `E[Y_i|X_i] = exp(beta'X_i)`.
- p6: General moment condition class:
  - `E[g(X_i) * (Y_i - exp(beta'X_i))] = 0`.
- p7: NLLS objective:
  - `beta_NLLS = arg min_b sum_i (Y_i - exp(b'X_i))^2`.
- p8: PPML log-likelihood kernel:
  - `L = sum_i (Y_i * beta'X_i - exp(beta'X_i)) + const`.
- p8: PPML score/moment condition:
  - `sum_i X_i (Y_i - exp(beta'X_i)) = 0`.
- p9: Panel PPML with FE mean:
  - `E[Y_it|X_i,alpha_i] = exp(alpha_i + beta'X_it)`.
- p9: Two-way FE PPML extension:
  - `E[Y_it|X_i,alpha_i] = exp(alpha_i + gamma_t + beta'X_it)`.
- p14: Binary-treatment interpretations:
  - `tau_OLS = E[log Y_i(1) - log Y_i(0)]`.
  - `tau_PPML = log E[Y_i(1)] - log E[Y_i(0)]`.
  - `exp(tau_PPML)-1 = E[Y_i(1)-Y_i(0)] / E[Y_i(0)]`.
- p17: PPML DiD untreated mean model:
  - `E[Y_it(0) | E_i=e] = exp(alpha_e + beta_t)`.

Equation-fidelity note:
- Some PPML/NLLS FOCs are line-broken in extraction; standardized objective/score forms above preserve the intended equations.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `mu(X_i,beta)=exp(X_i'beta)`: conditional-mean function.
- `beta_NLLS`, `beta_PPML`: NLLS and PPML estimators.
- `tau_OLS`, `tau_PPML`: treatment-effect parameters under log-OLS and PPML parameterizations.
- `CATT_{e,t}`: cohort-time effect in PPML DiD framing.

Reconciled extraction artifacts:
- Equivalent multiplicative formulations (`Y=exp(X'beta)U` vs additive-error mean model) are normalized to shared mean condition `E[Y|X]=exp(X'beta)`.
- PPML score equations are standardized as `sum X_i (Y_i-exp(X_i'beta))=0`.
- Extensive/intensive margin formulas with broken inequality glyphs are represented with explicit probability/conditional-mean notation.

## Concept Links
- Prerequisites: [[A1_regression]], [[A2_causality]]
- Core concepts: [[concepts/Nonlinear_multiplicative_models]], [[concepts/PPML]]
- Assumptions: [[concepts/Asymptotic_normality]], [[concepts/Heteroskedasticity_robust_SE]]
- Estimands: [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/PPML]], [[concepts/Nonlinear_multiplicative_models]]
- Connected lectures: [[A1_regression]], [[D2_Canonical_DiD]]
- Global map: [[ECONOMETRICS_MAP]]
