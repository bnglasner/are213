---
title: "A1 Regression"
note_type: "lecture_translation"
course: "ARE213"
module: "A1"
source_pdf: "A1_regression.pdf"
tags: [are213, econometrics, lecture, foundations, regression]
prerequisites: []
concept_notes: ["concepts/Regression_and_CEF", "concepts/OLS", "concepts/Frisch_Waugh_Lovell", "concepts/Omitted_variable_bias", "concepts/Heteroskedasticity_robust_SE", "concepts/Cluster_robust_inference"]
related_lectures: ["A2_causality", "B_covariate_adjustment", "D1_Panels", "G_nonlinear"]
---
# A1: Key Facts About Regression. Statistical Inference Translation

## Source
- PDF filename: `A1_regression.pdf`
- Generated markdown filename: `AI_READABLE/A1_regression.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Title and global outline: p1-p2, p13, p18, p23, p31, p43
- Course intro and syllabus context: p3-p12
- Some econometric vocabulary (model, estimand, identification, estimator): p14-p17
- What is regression and why use it (CEF as prediction/descriptive/causal tool): p19-p22
- Why linear regression (five reasons and weighted-slope interpretation): p24-p30
- Linear regression mechanics (transformations, FWL, OVB, weights): p32-p42
- Statistical inference (asymptotics, robust SE, clustered/multi-way/spatial SE): p45-p62
- References: p63-p64
- Visual interlude slide: p44

## Comprehensive Translation

### Orientation and course framing
Source pages: p1-p12

Core ideas
- The course emphasizes rigorous causal empirical work with intuition plus key proofs.
- Canonical research designs are framed as shared identification strategies in economics.
- Students are expected to choose appropriate designs, understand assumptions, and critique empirical work.

Definitions and notation
- No single formal model dominates this block; it introduces scope: unconfoundedness, IV, DiD, RDD, factor/synthetic methods, spillovers, and nonlinear topics.

Key results/formulas
- No central derivation; p12 includes background true/false checks on covariance/conditional expectation concepts.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Background check questions:
  - `Cov[Y,X] = E[Y (X-E[X])]`
  - continuity/discreteness and conditioning questions.

Interpretation for applied work
- Treat this block as methodological motivation: design first, estimator second.

### 1) Econometric vocabulary: model, estimands, identification, estimators
Source pages: p14-p17

Core ideas
- Distinguish model assumptions, target population objects (estimands), and sample procedures (estimators).
- Identification is about what is pinned down by observed-variable distributions, not by notation alone.
- An estimator has an induced population estimand under a data-generating process, even absent a structural model.

Definitions and notation
- Model: variables + restrictions on their joint distribution.
- Example linear model: `Y = beta_0 + beta_1 X + epsilon`; useful only with restrictions like `E[epsilon | X]=0`.
- Estimand: non-stochastic population object (e.g., `beta_0 + 2 beta_1`, `E[tau_i]`).
- Point identification: unique value consistent with observed distribution.
- OLS estimator:
  - `beta_hat = (X'X)^(-1) X'Y`
- OLS estimand:
  - `beta_OLS = E[XX']^(-1) E[XY]`, with `beta_hat ->p beta_OLS` in random sampling under weak conditions.

Key results/formulas
- Under `E[epsilon|X]=0`, scalar-slope example yields `beta_1 = Cov[Y,X]/Var[X]`.
- In heterogeneous-effects setup (`Y_i = tau_i X_i + epsilon_i`, `X_i` independent of `(tau_i, epsilon_i)`), `E[tau_i] = Cov[Y,X]/Var[X]`.
- Same estimator can target very different objects across models (e.g., mixture of demand and supply slopes in simultaneous-equation example).

Proof sketch / logic
- Identification arguments are moment-based: solve population orthogonality conditions for unknown objects.

Examples or exercises
- Demand-supply system example where OLS of `Q` on `P` identifies variance-weighted blend of demand/supply parameters.

Interpretation for applied work
- Always report both: (i) estimator used and (ii) estimand under stated assumptions; otherwise coefficient interpretation is ambiguous.

### 2) What is regression and why use it
Source pages: p19-p22

Core ideas
- Regression is the conditional expectation function (CEF): `h(x)=E[Y|X=x]`.
- CEF serves descriptive, predictive, and sometimes causal goals.
- Under squared loss, CEF is the optimal predictor.

Definitions and notation
- `E[Y|X]=h(X)` as random variable.
- Prediction objective:
  - `h(.) = arg min_g E[(Y - g(X))^2]`.
- CEF residual: `Y - E[Y|X]`.

Key results/formulas
- CEF residual properties:
  - mean zero
  - orthogonal to any measurable `g(X)`.
- Exercise extension: under absolute loss `|Y-g(X)|`, conditional median is optimal predictor; check-loss leads to conditional quantiles.

Proof sketch / logic
- Use law of iterated expectations to establish orthogonality.
- Complete-the-square expansion proves CEF optimality under quadratic loss.

Examples or exercises
- Explicit proof slide for CEF optimality.
- Exercise on median/check-loss prediction.

Interpretation for applied work
- If objective is prediction with chosen loss, match estimator to that loss (mean/median/quantile), not automatically OLS.

### 3) Why linear regression
Source pages: p24-p30

Core ideas
- OLS is a best linear predictor and best linear approximation to CEF.
- Linear regression is often preferred for tractability, interpretability, and high-dimensional settings.
- With scalar regressor, OLS slope is a convexly weighted average of local CEF slopes even when CEF is nonlinear.

Definitions and notation
- Population OLS:
  - `beta_OLS = arg min_b E[(Y - X'b)^2]`
  - FOC: `E[X(Y - X'beta_OLS)] = 0`
  - solution: `beta_OLS = E[XX']^(-1) E[XY]`.
- Discrete scalar `X in {x_0 < ... < x_K}`:
  - `beta_OLS = sum_{k=1}^K omega_k * (h(x_k)-h(x_{k-1}))/(x_k-x_{k-1})`
  - `omega_k >= 0`, `sum_k omega_k = 1`.
- Continuous scalar `X`:
  - `beta_OLS = integral omega(x) h'(x) dx`, `omega(x) >= 0`, integral of weights equals 1.

Key results/formulas
- Weight formula uses `Cov[1{X>=threshold}, X]/Var[X]`.
- If `E[Y|X]` is linear, CEF equals linear predictor exactly.
- Joint normality and saturated-discrete-regressor cases ensure CEF linearity (in specified regressors).

Proof sketch / logic
- Use decomposition of `h(X)` into step functions for discrete case.
- Apply covariance identities to represent OLS as average slope.

Examples or exercises
- Exercise: if `X` Gaussian, show `beta_OLS = E[h'(X)]`.
- Binary-treatment saturated model `X=(1,D)` gives difference in means as slope.

Interpretation for applied work
- Nonlinearity does not invalidate OLS as descriptive slope average, but interpretation depends on weight distribution and support.

### 4) Linear regression mechanics
Source pages: p32-p42

Core ideas
- Core algebraic invariances clarify coefficient interpretation in multi-regressor settings.
- FWL theorem provides interpretable one-dimensional representation of partial effects.
- OVB formula is a mechanical decomposition, not automatically a causal claim.

Definitions and notation
- RHS linear transformation invariance: recoding regressors linearly changes coefficients but not fitted values/residuals.
- Regressing `Y=X_k` on full regressor set returns coefficient vector with 1 on `X_k`, 0 elsewhere.
- Linearity in outcomes:
  - `beta_hat_k = sum_i omega_{ki} Y_i`, weights depend only on `X`.
- LHS linearity: regressing sum of outcomes equals sum of separate-regression coefficients.
- FWL:
  - let `tilde X_k` be residual from regressing `X_k` on `X_-k`;
  - let `tilde Y` be residual from regressing `Y` on `X_-k`;
  - then `beta_k = Cov(tilde X_k, Y)/Var(tilde X_k) = Cov(tilde X_k, tilde Y)/Var(tilde X_k)`.
- OVB setup:
  - long: `Y = beta_0 + beta_1 X_1 + beta_2 X_2 + error`
  - short: `Y = delta_0 + delta_1 X_1 + error`
  - `delta_1 = beta_1 + beta_2 rho`, `rho = Cov[X_1,X_2]/Var[X_1]`.

Key results/formulas
- For non-intercept regressor `k`, OLS weights satisfy:
  - `sum_i omega_{ki} = 0`
  - `sum_i omega_{ki} X_{li} = 0` for `l != k`
  - `sum_i omega_{ki} X_{ki} = 1`.
- FWL implication: if target regressor orthogonal to added controls in population, long/short estimands for that target coincide.
- Gelbach decomposition context: partitions coefficient movement from adding covariate groups.

Proof sketch / logic
- Matrix representation `beta_hat = (X'X)^(-1) X'Y` yields linearity in outcomes.
- FWL proof by substituting orthogonal decompositions of `X_k` and `Y`.
- OVB proof by covariance decomposition of short-regression slope.

Examples or exercises
- Binary regressor coding equivalence.
- Exercise: sign pattern of FWL weights in scalar `X` + intercept regressions.

Interpretation for applied work
- Use FWL to reason about what variation identifies each coefficient and how controls alter weights/comparisons.

### 5) Statistical inference
Source pages: p45-p62

Core ideas
- Asymptotic normality of OLS relies on LLN + CLT for score terms.
- Heteroskedastic-robust SE are default in practice.
- Dependence across observations requires clustered, multi-way clustered, or spatial methods.

Definitions and notation
- Asymptotic expansion:
  - `sqrt(N)(beta_hat - beta_OLS) = (N^{-1} sum X_i X_i')^{-1} (N^{-1/2} sum X_i epsilon_i)`
  - `epsilon_i = Y_i - X_i' beta_OLS`, `E[X_i epsilon_i]=0`.
- Asymptotic variance:
  - `V = E[XX']^(-1) Var[X epsilon] E[XX']^(-1)`.
- Robust sandwich estimator (with finite-sample correction shown in slides):
  - `V_hat = [N/(N-dim(X))] (N^{-1} sum X_iX_i')^{-1} (N^{-1} sum X_i X_i' epsilon_hat_i^2) (N^{-1} sum X_iX_i')^{-1}`
  - `SE(beta_hat_k)=sqrt(V_hat_kk/N)`.
- Cluster setting:
  - cluster index `g(i)`, cross-cluster covariance assumed zero.
  - cluster-level score sums `R_g = sum_{i in g} X_i epsilon_i`.
- Two-way clustering condition:
  - dependence allowed when units share `g` or `h`.
  - estimator assembled as inclusion-exclusion: `Omega = Omega_g + Omega_h - Omega_gh`.
- Spatial HAC/Conley:
  - weighted covariance terms for pairs within distance cutoff `d_max` using kernel `kappa(d(i,j)/d_max)`.

Key results/formulas
- FWL for SE: robust (and homoskedastic) SE for subset coefficients are identical in full vs fully residualized FWL regression (including residualized LHS).
- Cluster inference requires many clusters (`G` large), not just large `N`.
- Inference can fail with too few clusters; with `G=1`, cluster formula degenerates.
- "At what level to cluster" depends on plausible zero-covariance structure for score terms across cluster units.

Proof sketch / logic
- Replace iid score CLT with CLT over independent clusters (or dependence structures appropriate for multi-way/spatial setups).
- Sandwich "meat" changes to reflect allowed covariance blocks.

Examples or exercises
- Exercises on paired-randomized twins and price-level assignment with many price bins.
- Paired fixed-effects caution via de Chaisemartin and Ramirez-Cuellar (2024).
- Clarification: two-way clustering by state and industry is not the same as one-way clustering by state-industry pair.

Interpretation for applied work
- Start by writing plausible dependence graph for score terms `X_i epsilon_i`; choose SE method to match that graph.
- Avoid defaulting to minimal clustering when assignment or shocks are grouped.

### References and non-technical slides
Source pages: p44, p63-p64

Core ideas
- p44 is a visual interlude.
- p63-p64 provide references for clustering, spatial inference, and decomposition methods.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- References identify implementation guidance for few clusters, multi-way clustering, and spatial dependence.

## Diagnostics, Pitfalls, and Failure Modes
- Confusing estimator (`beta_hat`) with estimand (`beta_OLS`) or causal parameter.
- Treating OVB formula as causal diagnosis without model/design assumptions.
- Using homoskedastic SE in applied work despite heteroskedasticity risk.
- Ignoring dependence structure (clustered assignment/sampling/spatial correlation), yielding anti-conservative inference.
- Using clustered SE with too few clusters and assuming reliability.
- Misapplying two-way clustering as one-way clustering on interaction groups.
- Overclustering to very large groups with very few clusters, causing finite-sample distortions.
- Interpreting OLS slope as a local derivative at a point rather than weighted average over support.
- Forgetting FWL equivalence conditions when computing subset-coefficient SE.

## Implementation Checklist
1. State objective: descriptive, predictive, or causal.
2. Write model assumptions separately from estimator definition.
3. Define estimand implied by estimator under your assumptions.
4. For OLS, document regressor support and whether slope is interpreted as average gradient/contrast.
5. Use FWL to inspect identifying variation for each key coefficient.
6. Audit potential omitted-variable channels with explicit `delta_1 = beta_1 + beta_2 rho` logic.
7. Default to heteroskedastic-robust SE unless a stronger justified structure is used.
8. Map dependence structure of `X_i epsilon_i` and choose inference: one-way cluster, two-way cluster, or spatial HAC.
9. Verify adequate number of clusters (or use few-cluster methods when needed).
10. Report sensitivity of inference to clustering level and kernel/cutoff choices for spatial methods.

## Structured Extract (for agents)
```yaml
module: regression
source_pdf: A1_regression.pdf
source_pages: 64
estimands:
  - CEF h(x) = E[Y|X=x]
  - OLS estimand beta_OLS = E[XX']^{-1}E[XY]
  - Partial slope beta_k via FWL residualized covariance ratio
  - Short-vs-long slope relationship delta_1 = beta_1 + beta_2*rho
identification_assumptions:
  - Moment conditions such as E[epsilon|X]=0 when claiming structural coefficients
  - Non-singularity of E[XX']
  - Dependence restrictions appropriate for inference method (iid, clustered, multi-way, spatial)
estimators:
  - OLS beta_hat = (X'X)^{-1}X'Y
  - FWL residual-on-residual regression for partial effects
  - Robust sandwich variance estimator
  - Cluster-robust, two-way cluster-robust, and spatial HAC variance estimators
inference_methods:
  - Asymptotic normal inference under LLN+CLT
  - Heteroskedasticity-robust SE
  - One-way clustered SE
  - Multi-way clustered SE via inclusion-exclusion
  - Conley spatially clustered SE
diagnostics:
  - Check mapping from research question to estimand
  - Inspect regressor coding/transform invariances
  - Evaluate dependence structure for score terms X_i*epsilon_i
  - Cluster-count adequacy checks
  - Sensitivity of SE to clustering level and spatial cutoff
failure_modes:
  - Misinterpreting predictive coefficients as causal without design assumptions
  - Incorrect SE from ignoring dependence or using too few clusters
  - Confusing two-way clustering with clustering on interaction groups
  - Overstating local-derivative interpretation of OLS under nonlinearity
open_questions:
  - Which estimand best aligns with each empirical objective in the project?
  - Is dependence best represented by assignment clusters, sampling clusters, or geography?
  - Are few-cluster corrections or randomization-based inference needed?
  - How sensitive are conclusions to alternative clustering choices?
```

## Extraction Gaps
- p10 and p44 are non-text/image-heavy slides with minimal extractable text.
- Some symbols are degraded by PDF text extraction (occasional hats, primes, and matrix notation spacing), but formulas are reconstructed from legible context.
- p57 figure content (paired FE clustering comparison) is image-only in extracted text; only caption-level content is available.

## Retrieval Tags
- `regression`
- `cef`
- `ols-estimand`
- `fwl`
- `ovb`
- `robust-se`
- `clustered-se`
- `multiway-clustering`
- `spatial-hac`
- `identification-vs-estimation`
- `causal-vs-predictive`

## Appendix A: Slide-by-Slide Source Index

- p1: Part A: Regression and causality
- p2: Outline
- p3: Acknowledgments
- p4: What is this course about (1)
- p5: What is this course about (2)
- p6: What is this course about (3)
- p7: You should be able to
- p8: Course outline (1)
- p9: Course outline (2)
- p10: The course in brief
- p11: Readings
- p12: Check your background: True/False
- p13: Outline
- p14: Econometric vocabulary: Model
- p15: Econometric vocabulary: Estimands and Identification
- p16: Econometric vocabulary: Estimators
- p17: Examples: OLS estimand in different models
- p18: Outline
- p19: Regression and its uses
- p20: Regression as optimal prediction
- p21: Proposition proof
- p22: Regression as optimal prediction: Exercise
- p23: Outline
- p24: Definition
- p25: Five reasons for linear regression
- p26: Five reasons for linear regression (cont.)
- p27: What does #4 mean?
- p28: Proof of #4: Discrete X
- p29: Proof of #4: Continuous X
- p30: Five reasons for linear regression (cont.)
- p31: Outline
- p32: (Linear) regression mechanics: Key results
- p33: #1: Linear transformations of RHS variables
- p34: #2: Regressing Y= Xk on X1, . . . , XK
- p35: #3: OLS is a linear estimator
- p36: #3: Proof
- p37: A note on weights
- p38: #4: Linear transformations of the LHS variable
- p39: #5: Partialling out: Frisch-Waugh-Lovell (FWL) theorem
- p40: #5: Proof
- p41: Implications of FWL
- p42: #6: Omitted variable bias
- p43: Outline
- p44: As seen on the BART...
- p45: N
- p46: 
- p47: FWL for standard errors
- p48: Beyond random samples
- p49: Statistical inference beyond random samples
- p50: Cluster-robust inference
- p51: Derivation #1
- p52: Derivation #2
- p53: More on clustering
- p54: At what level to cluster?
- p55: At what level to cluster? (2)
- p56: Exercises
- p57: Regressions with pair fixed effects: Its complicated
- p58: Multi-way clustering
- p59: Multi-way clustering (2)
- p60: Multi-way clustering (3)
- p61: Spatially-clustered standard errors
- p62: Spatially-clustered standard errors: Notes
- p63: References I
- p64: References II

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p12: covariance identity `Cov[Y,X] = E[Y*(X-E[X])]`.
- p14-p15: baseline linear model and identification condition:
  - `Y = beta_0 + beta_1 X + epsilon`, with `E[epsilon|X]=0`.
  - then `beta_1 = Cov[Y,X]/Var[X]`.
- p15: heterogeneous-effects example under random assignment:
  - `Y_i = tau_i X_i + epsilon_i`, `X_i independent (tau_i, epsilon_i)`.
  - implies `E[tau_i] = Cov[Y,X]/Var[X]`.
- p16: OLS estimator and estimand:
  - `beta_hat = (X'X)^(-1)X'Y`.
  - `beta_OLS = E[XX']^(-1)E[XY]`.
- p19-p21: CEF definitions and optimal prediction:
  - `h(x)=E[Y|X=x]`.
  - `h(.) = arg min_g E[(Y-g(X))^2]`.
  - orthogonality `E[(Y-h(X))g(X)] = 0`.
- p24-p25: population OLS problem:
  - `beta_OLS = arg min_b E[(Y-X'b)^2]`.
  - FOC `E[X(Y-X'beta_OLS)] = 0`.
- p27-p29: scalar-`X` weighting interpretation:
  - `beta_OLS` is weighted average of slope increments/derivatives of `E[Y|X=x]`.
  - discrete-case weights from `Cov(1[X>=x_k],X)/Var(X)`, nonnegative and summing to 1.
- p39-p40: FWL theorem:
  - `beta_k = Cov(tilde X_k, Y)/Var(tilde X_k) = Cov(tilde X_k, tilde Y)/Var(tilde X_k)`.
- p42: OVB formula:
  - `delta_1 = beta_1 + beta_2*rho`, `rho = Cov(X_1,X_2)/Var(X_1)`.
- p45: asymptotic OLS distribution:
  - `sqrt(N)(beta_hat - beta_OLS) -> N(0, V)`
  - `V = E[XX']^{-1} Var[X epsilon] E[XX']^{-1}`.
- p46: robust (sandwich) variance estimator and robust SE definition.
- p50-p53: one-way cluster-robust variance uses within-cluster score covariance.
- p58-p60: two-way clustering inclusion-exclusion form `Omega = Omega_g + Omega_h - Omega_gh`.
- p61: spatial HAC/Conley-style variance uses kernel-weighted pair covariances within distance cutoff.

Equation-fidelity note:
- Some matrix displays and summation limits are line-broken in extraction; formulas above preserve the slide-intended equations in normalized notation.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `Y`, `X`: outcome and regressor vector.
- `h(x)=E[Y|X=x]`: conditional expectation function.
- `beta_hat`: sample OLS estimator; `beta_OLS`: population projection parameter.
- `tilde X_k`, `tilde Y`: FWL residualized regressors/outcome.
- `delta_1`, `beta_1`, `beta_2`, `rho`: short/long OVB symbols.
- `Omega`: generic covariance matrix in sandwich/cluster formulas.

Reconciled extraction artifacts:
- Hat and tilde marks in extracted text are normalized to `_hat` and `tilde` notation.
- Broken matrix expressions are normalized to standard forms (e.g., `beta_hat=(X'X)^(-1)X'Y`).
- Cluster indices `g(i), h(i)` and kernel symbol `kappa` are preserved in ASCII.

## Concept Links
- Prerequisites: None
- Core concepts: [[concepts/Regression_and_CEF]], [[concepts/OLS]], [[concepts/Frisch_Waugh_Lovell]], [[concepts/Omitted_variable_bias]]
- Assumptions: [[concepts/Asymptotic_normality]], [[concepts/Heteroskedasticity_robust_SE]], [[concepts/Cluster_robust_inference]], [[concepts/Multiway_clustering]], [[concepts/Spatial_HAC]]
- Estimands: [[concepts/OLS]]
- Estimation and inference: [[concepts/Frisch_Waugh_Lovell]], [[concepts/Heteroskedasticity_robust_SE]], [[concepts/Cluster_robust_inference]]
- Connected lectures: [[A2_causality]], [[B_covariate_adjustment]], [[D1_Panels]], [[G_nonlinear]]
- Global map: [[ECONOMETRICS_MAP]]
