---
title: "B Covariate Adjustment"
note_type: "lecture_translation"
course: "ARE213"
module: "B"
source_pdf: "B_covariate_adjustment.pdf"
tags: [are213, econometrics, lecture, selection-on-observables]
prerequisites: ["A1_regression", "A2_causality"]
concept_notes: ["concepts/Selection_on_observables", "concepts/Conditional_independence_assumption", "concepts/Overlap_common_support", "concepts/Propensity_score", "concepts/Inverse_probability_weighting", "concepts/Double_robust_AIPW", "concepts/Neyman_orthogonality"]
related_lectures: ["C1_IV_basics", "D4_DiD_extensions", "E2_RDD_extensions"]
---
# B: Covariate Adjustment and Selection on Observables Translation

## Source
- PDF filename: `B_covariate_adjustment.pdf`
- Generated markdown filename: `AI_READABLE/B_covariate_adjustment.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline: p1-p3, p12, p18, p25
- Identification under selection on observables (CIA + overlap): p4-p11
- Regression adjustment details and weighting interpretation: p13-p17
- Propensity score theorems and implementations: p19-p24
- Double robustness and orthogonality: p26-p30
- References: p31

## Comprehensive Translation

### Orientation and problem setup
Source pages: p1-p3

Core ideas
- The module addresses causal identification when treatment is not randomized.
- Main strategy: impose selection-on-observables assumptions and use covariates to reconstruct counterfactuals.

Definitions and notation
- Potential outcomes: `Y(1), Y(0)`.
- Observed treatment: `D in {0,1}`.

Key results/formulas
- None yet beyond framing.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- This module is the baseline for observational causal designs before moving to IV/DiD/RD.

### Identification with CIA and overlap
Source pages: p4-p11

Core ideas
- If assignment is conditionally as-good-as-random after conditioning on pre-treatment covariates `X`, treatment effects are identified.
- Counterfactual means are identified by imputation across units with similar `X`.

Definitions and notation
- Conditional independence assumption (CIA): `(Y(1),Y(0)) independent D | X`.
- Overlap/common support: `0 < P(D=1|X=x) < 1` on support of `X`.
- CEFs by treatment state:
  - `h_1(x)=E[Y|D=1,X=x]=E[Y(1)|X=x]`
  - `h_0(x)=E[Y|D=0,X=x]=E[Y(0)|X=x]`.

Key results/formulas
- ATE under CIA + overlap:
  - `ATE = E[h_1(X)-h_0(X)]`.
- ATT analog:
  - `ATT = E[h_1(X)-h_0(X) | D=1]`.
- IPW representation (ATE):
  - `E[D*Y/e(X)] - E[(1-D)*Y/(1-e(X))]`, where `e(X)=P(D=1|X)`.

Proof sketch / logic
- CIA identifies missing potential outcomes conditional on `X`; overlap ensures both treatment states observed for each covariate profile used for identification.

Examples or exercises
- Returns-to-college illustration used to motivate selection problems and covariate adjustment.

Interpretation for applied work
- Identification quality depends more on covariate richness/relevance than on estimator choice alone.

### Regression adjustment
Source pages: p13-p17

Core ideas
- Regression adjustment estimates `h_0(x), h_1(x)` (or a single interacted model) and averages predicted counterfactuals.
- Misspecification risk is central if functional form is too restrictive.

Definitions and notation
- Uninteracted specification can force homogeneous treatment effects.
- Interacted/nonparametric/flexible models allow heterogeneous effects by covariates.

Key results/formulas
- Imputation form:
  - `ATE = E[ h_1(X)-h_0(X) ]` estimated via fitted models.
- Weighted interpretation in linear projections: coefficient can be a variance-weighted average of heterogeneous effects under linear restrictions.

Proof sketch / logic
- Plug-in estimator from estimated outcome models under CIA.

Examples or exercises
- Slides contrast uninteracted and heterogeneous-effect versions, including a weighting proof slide.

Interpretation for applied work
- If treatment effects vary strongly with `X`, interacted/flexible specifications are preferred over a pooled linear adjustment.

### Propensity score methods
Source pages: p19-p24

Core ideas
- Propensity score is a balancing score; conditioning on `e(X)` can replace high-dimensional matching on `X`.
- Multiple implementations are presented: regression on score, blocking/matching, reweighting.

Definitions and notation
- Propensity score: `e(X)=P(D=1|X)`.
- Rosenbaum-Rubin theorems imply:
  - if CIA holds on `X`, it holds on `e(X)`.

Key results/formulas
- IPW weights for ATE:
  - treated weight proportional to `1/e(X)`.
  - control weight proportional to `1/(1-e(X))`.
- Normalized/stabilized weighting variants appear in practice.

Proof sketch / logic
- Balancing-score reduction maps multidimensional covariate balancing to one-dimensional score balancing.

Examples or exercises
- Step-by-step p-score workflow slides: estimate score, assess overlap/balance, estimate effects with chosen p-score method.

Interpretation for applied work
- Score estimation is a nuisance task; post-score diagnostics (balance and overlap) are mandatory.

### Double robustness and Neyman orthogonality
Source pages: p26-p30

Core ideas
- Doubly robust estimators combine outcome regression and propensity weighting.
- Consistency can be achieved if either model is correct (not necessarily both).
- Orthogonality reduces sensitivity to small nuisance-model errors.

Definitions and notation
- AIPW/DR score combines imputation and inverse-probability residual correction.

Key results/formulas
- Canonical AIPW form (ATE):
  - `[m_1(X)-m_0(X)] + D*(Y-m_1(X))/e(X) - (1-D)*(Y-m_0(X))/(1-e(X))`, averaged over sample.
- Double robustness: unbiased if either `m_d(X)` or `e(X)` is correctly specified.
- Neyman orthogonality: moment condition has first-order insensitivity to nuisance perturbations at truth.

Proof sketch / logic
- Influence-function representation decomposes effect estimate into target signal + orthogonal correction terms.

Examples or exercises
- Slides present intuition via "idea of double robustness" and "automatic double robustness".

Interpretation for applied work
- DR/AIPW is usually the default observational estimator when rich controls are available and overlap is adequate.

### References block
Source pages: p31

Core ideas
- References anchor CIA/propensity and DR methods in classic literature.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for implementation details and finite-sample guidance.

## Diagnostics, Pitfalls, and Failure Modes
- Hidden confounding: CIA fails when relevant pre-treatment predictors are omitted.
- Overlap failures: extreme propensities create unstable weights and extrapolation risk.
- Poor propensity models: balancing fails even if predictive fit seems strong.
- Outcome-model misspecification under pure regression adjustment.
- Post-treatment controls or colliders introduce bias.
- Unchecked finite-sample instability from large IPW weights.

## Implementation Checklist
1. Define treatment, outcome, and pre-treatment covariate set `X` from a causal graph/domain model.
2. Assess overlap in raw covariates and in estimated propensity score.
3. Estimate `e(X)` and run balance diagnostics after weighting/matching.
4. Estimate outcome models `m_1(X), m_0(X)` with flexible heterogeneity where needed.
5. Compute DR/AIPW estimate as primary specification; report RA/IPW as complements.
6. Diagnose influence of extreme weights and trim/restrict support if justified.
7. Report sensitivity to covariate set and functional-form choices.
8. State identification assumptions explicitly and separate from estimation choices.

## Structured Extract (for agents)
```yaml
module: covariate_adjustment
source_pdf: B_covariate_adjustment.pdf
source_pages: 31
estimands:
  - ATE = E[Y(1)-Y(0)]
  - ATT = E[Y(1)-Y(0)|D=1]
  - ATU = E[Y(1)-Y(0)|D=0]
identification_assumptions:
  - Conditional independence: (Y(1),Y(0)) independent D | X
  - Overlap: 0 < P(D=1|X) < 1
  - Consistency: Y = Y(D)
estimators:
  - Regression adjustment / imputation
  - Matching or blocking on X or e(X)
  - IPW reweighting
  - AIPW / doubly robust estimators
inference_methods:
  - Asymptotic sandwich/robust inference
  - Bootstrap where appropriate for matching/complex nuisances
diagnostics:
  - Covariate balance checks
  - Propensity overlap/support checks
  - Extreme-weight diagnostics
  - Model-fit and sensitivity checks
failure_modes:
  - Hidden confounding
  - Lack of overlap
  - Post-treatment control bias
  - Nuisance-model misspecification with non-orthogonal estimators
open_questions:
  - Which covariates are necessary to make CIA plausible?
  - Is overlap adequate for policy-relevant subgroups?
  - Are treatment effects sufficiently heterogeneous to require flexible models?
```

## Extraction Gaps
- Mathematical notation on some slides is partially degraded in plain-text extraction (subscripts/superscripts and hats).
- Only one references slide is extracted; full citation formatting should be checked in the original PDF if bibliographic precision is needed.

## Retrieval Tags
- `selection-on-observables`
- `cia`
- `overlap`
- `propensity-score`
- `matching`
- `ipw`
- `aipw`
- `double-robustness`
- `neyman-orthogonality`


## Appendix A: Slide-by-Slide Source Index

- p1: Part B: Covariate Adjustment. Selection on Observables
- p2: Outline
- p3: What if treatment is not randomly assigned?
- p4: Illustration: Returns to College Degree
- p5: Identification assumptions
- p6: Identification under CIA + overlap
- p7: Imputation representation
- p8: Matching / Imputation
- p9: Regression adjustment
- p10: Pscore reweighting (for ATE)
- p11: Continuous covariates
- p12: Outline
- p13: Regression adjustment
- p14: How to estimate h0(), h1()?
- p15: Uninteracted regression
- p16: Uninteracted regression with heterogeneous effects
- p17: Variance weighting: Proof
- p18: Outline
- p19: Propensity score theorems (Rosenbaum and Rubin, 1983)
- p20: P-score methods: Steps
- p21: P-score adjustment methods: Regression
- p22: P-score adjustment methods: Blocking/Matching
- p23: P-score adjustment methods: Reweighting (IPW)
- p24: P-score adjustment methods: Reweighting (2)
- p25: Outline
- p26: Idea of double robustness
- p27: Automatic double robustness
- p28: Augmented IPW (AIPW)
- p29: Augmented IPW (2)
- p30: Double robustness and Neyman orthogonality
- p31: References I

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p5: `0 < P(D_i = 1 | X_i) < 1` (overlap).
- p6: `CATE(x) = E[Y_i(1) - Y_i(0) | X_i = x]`.
- p6: `h_1(x) = E[Y | D=1, X=x]`, `h_0(x) = E[Y | D=0, X=x]`.
- p6: `CATE(x) = h_1(x) - h_0(x)`.
- p6: `ATE = E[CATE(X_i)] = E[h_1(X_i) - h_0(X_i)]`.
- p6: `ATT = E[CATE(X_i) | D_i=1]`.
- p7: `ATT = E[Y_i - h_0(X_i) | D_i=1]`.
- p7: `ATE = E[(Y_i-h_0(X_i))D_i + (h_1(X_i)-Y_i)(1-D_i)]`.
- p13: `E[Y(d)|X] = E[Y|D=d,X] = h_d(X)`, for `d in {0,1}`.
- p16-p17: `beta_OLS = E[CATE(X_i) * omega(X_i)] / E[omega(X_i)]`, with `omega(X_i)=Var(D_i|X_i)=p(X_i)(1-p(X_i))`.
- p19: propensity score definition `p(X)=P(D=1|X)` and balancing reduction idea `D independent (Y_0,Y_1) | p(X)` (under CIA).
- p23: IPW identification ingredients `E[D Y / p(X)] = E[Y(1)]`, `E[(1-D)Y/(1-p(X))]=E[Y(0)]`.
- p23-p24: ATE IPW form `ATE = E[D Y / p(X) - (1-D)Y/(1-p(X))]`.
- p28-p29: AIPW score form combines outcome regression and IPW correction for each treatment arm.

Equation-fidelity note:
- p24 and p28-p29 include partially garbled symbolic lines in extraction; equations above follow the legible algebraic structure used on those slides.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `X`: pre-treatment covariates; `D`: treatment indicator; `Y`: outcome.
- `p(X)=P(D=1|X)`: propensity score.
- `h_d(x)=E[Y|D=d,X=x]` for `d in {0,1}`.
- `CATE(x)=E[Y(1)-Y(0)|X=x]`; `ATE`, `ATT` as aggregated effects.
- `omega(X)=Var(D|X)=p(X)(1-p(X))`: OLS weighting object in linear adjustment.
- `m_d(X)`: outcome-regression nuisance in AIPW; `e(X)` interchangeable with `p(X)`.

Reconciled extraction artifacts:
- Garbled CIA line is normalized to conditional independence `(Y(1),Y(0)) independent D | X`.
- HT/Hajek lines are represented with standard IPW notation where denominator formatting broke.
- AIPW score terms are normalized to conventional semiparametric form.

## Concept Links
- Prerequisites: [[A1_regression]], [[A2_causality]]
- Core concepts: [[concepts/Selection_on_observables]], [[concepts/Conditional_independence_assumption]], [[concepts/Overlap_common_support]], [[concepts/Propensity_score]]
- Assumptions: [[concepts/Conditional_independence_assumption]], [[concepts/Overlap_common_support]]
- Estimands: [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/Inverse_probability_weighting]], [[concepts/Double_robust_AIPW]], [[concepts/Neyman_orthogonality]]
- Connected lectures: [[C1_IV_basics]], [[D4_DiD_extensions]], [[E2_RDD_extensions]]
- Global map: [[ECONOMETRICS_MAP]]
