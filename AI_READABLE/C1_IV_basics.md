---
title: "C1 IV Basics"
note_type: "lecture_translation"
course: "ARE213"
module: "C1"
source_pdf: "C1_IV_basics.pdf"
tags: [are213, econometrics, lecture, iv]
prerequisites: ["A1_regression", "A2_causality", "B_covariate_adjustment"]
concept_notes: ["concepts/Instrumental_variables", "concepts/Exclusion_restriction", "concepts/First_stage_relevance", "concepts/Two_stage_least_squares", "concepts/Weak_instruments"]
related_lectures: ["C2_LATE", "C3_judge_IV", "F_Spillovers_Formula_IV"]
---
# C1: Instrumental Variables Basics Translation

## Source
- PDF filename: `C1_IV_basics.pdf`
- Generated markdown filename: `AI_READABLE/C1_IV_basics.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Part C and C1 outlines: p1-p3, p23, p34, p39
- IV intuition, DAGs, and motivating examples: p4-p22
- IV identification/estimation (Wald, 2SLS, controls, overidentification): p24-p33
- IV for measurement error: p35-p38
- Weak IV diagnostics, finite-sample problems, and robust solutions: p40-p61
- References: p62-p65

## Comprehensive Translation

### Orientation and roadmap
Source pages: p1-p3, p23, p34, p39

Core ideas
- C1 develops baseline IV logic under constant effects and then addresses practical estimation/inference issues.
- Structure: intuition/examples, formal estimation, measurement error application, weak-IV problems.

Definitions and notation
- Endogenous regressor `D` (or `X`), instrument `Z`, outcome `Y`.

Key results/formulas
- Not central on outline slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Treat this as the "IV core" module before LATE heterogeneity extensions in C2.

### IV setup, assumptions, and examples
Source pages: p4-p22

Core ideas
- Instrument `Z` provides exogenous variation in endogenous treatment `D`.
- Causal identification requires relevance and exogeneity/exclusion restrictions.
- Examples show both strong and weak uses of IV in empirical practice.

Definitions and notation
- Structural equation (constant-effect framing): `Y = beta D + u`.
- First stage: `D = pi Z + v` (possibly with controls).
- Core assumptions:
  - Relevance: `Cov(Z,D) != 0`.
  - Exogeneity: `Cov(Z,u)=0`.
  - Exclusion: `Z` affects `Y` only through `D`.

Key results/formulas
- Reduced form: effect of `Z` on `Y` equals structural effect times first stage under assumptions.
- Binary-IV Wald estimand appears as reduced-form over first-stage ratio.

Proof sketch / logic
- Orthogonality `E[Z u]=0` and nonzero first-stage covariance imply point identification of constant-effect parameter.

Examples or exercises
- Quarter-of-birth example (Angrist-Krueger).
- Encouragement designs with noncompliance.
- Natural/historical instruments and overuse cautionary examples (e.g., rainfall).

Interpretation for applied work
- Instrument stories must be defended in institutional terms, not only via regression diagnostics.

### Identification and 2SLS mechanics
Source pages: p24-p33

Core ideas
- IV estimand can be implemented via Wald (special cases) or 2SLS (general linear systems).
- Included covariates require residualized first-stage/reduced-form logic.
- Overidentified systems allow overidentification tests but do not guarantee valid exclusion.

Definitions and notation
- Just-identified IV:
  - `beta_IV = Cov(Z,Y)/Cov(Z,D)`.
- 2SLS with controls:
  - Stage 1: project endogenous variables on instruments and included controls.
  - Stage 2: regress outcome on fitted endogenous components and controls.

Key results/formulas
- Matrix 2SLS:
  - `beta_2SLS = (X'P_Z X)^(-1) X'P_Z Y` in standard notation.
- Multiple endogenous regressors/instruments discussed with rank and exclusion requirements.
- Control-function equivalence in linear settings highlighted.

Proof sketch / logic
- 2SLS solves moment conditions using instrumented variation orthogonal to structural error.

Examples or exercises
- Angrist-Krueger binary instrument illustration.
- Control function interpretation slides.

Interpretation for applied work
- With controls, always reason in residualized space: instrument must explain residualized endogenous variation.

### IV for classical measurement error
Source pages: p35-p38

Core ideas
- Classical measurement error in regressors attenuates OLS toward zero.
- IV restores consistency if instrument is correlated with latent true regressor and exogenous to outcome shock.

Definitions and notation
- Observed noisy regressor: `X_obs = X_true + eta` with classical error assumptions.

Key results/formulas
- OLS attenuation bias formula under classical measurement error.
- IV immunity logic under valid instrument for `X_true`.

Proof sketch / logic
- Measurement error contaminates denominator/orthogonality in OLS; valid IV purges error-contaminated variation.

Examples or exercises
- Lessons slide summarizes contrast between OLS and IV under measurement error.

Interpretation for applied work
- IV can solve endogeneity and measurement-error problems, but weak first stage can still destroy reliability.

### Weak IV, many IV, and robust inference
Source pages: p40-p61

Core ideas
- Weak first stage creates bias toward OLS, large variance, and unreliable conventional CIs.
- Many instruments can induce additional finite-sample bias.
- Robust practices include weak-IV diagnostics and weak-robust inference procedures.

Definitions and notation
- First-stage strength diagnostics (e.g., first-stage F statistic) are emphasized.
- Anderson-Rubin (AR) tests/confidence sets are presented as weak-IV robust tools.
- Alternative estimators: LIML, JIVE.

Key results/formulas
- Finite-sample IV bias direction: toward OLS when instruments are weak.
- Conventional t-based inference can have severe size distortions under weak instruments.
- AR confidence intervals remain valid under weak identification (possibly wide/disconnected).

Proof sketch / logic
- Weak identification collapses concentration of IV objective around true parameter, invalidating standard normal approximations.

Examples or exercises
- Monte Carlo blocks compare strong IV, weak IV, and many-IV designs for bias/coverage.
- Pre-testing pitfalls discussed.

Interpretation for applied work
- Treat first-stage diagnostics and weak-robust confidence sets as baseline reporting, not optional robustness checks.

### References block
Source pages: p62-p65

Core ideas
- References cover foundational IV methods and modern weak-IV practice.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use cited papers for method choice when facing weak/many-instrument environments.

## Diagnostics, Pitfalls, and Failure Modes
- Invalid exclusion restriction (direct effect of `Z` on `Y`).
- First-stage weakness (small `Cov(Z,D)`), causing bias and poor coverage.
- Overidentification interpreted as proof of validity.
- Many-instrument overfitting bias in 2SLS.
- Sensitivity to small exogeneity violations when first stage is weak.
- Misinterpretation of historical/natural instruments without mechanism-level defense.

## Implementation Checklist
1. Write structural equation and explicit exclusion channel assumptions.
2. Quantify first-stage strength and report diagnostics.
3. Estimate reduced form, first stage, and IV/2SLS in aligned samples/specifications.
4. Include theoretically required controls in both stages.
5. Use robust/clustered SE consistent with sampling/assignment dependence.
6. Report weak-IV robust inference (AR/related) alongside conventional CIs.
7. In overidentified settings, report sensitivity to instrument subsets and alternative estimators (e.g., LIML).
8. Discuss plausibility threats to exogeneity/exclusion with institutional evidence.

## Structured Extract (for agents)
```yaml
module: iv_basics
source_pdf: C1_IV_basics.pdf
source_pages: 65
estimands:
  - Constant-effect IV parameter beta
  - Wald estimand Cov(Z,Y)/Cov(Z,D) in just-identified binary cases
  - 2SLS projection parameter under linear IV moments
identification_assumptions:
  - Relevance: Cov(Z,D) != 0
  - Exogeneity: E[Z*u] = 0
  - Exclusion: Z affects Y only through D
  - Rank conditions for multiple endogenous variables
estimators:
  - Wald IV
  - 2SLS with/without controls
  - LIML and JIVE as alternatives in overidentified/weak settings
inference_methods:
  - Robust/cluster-robust asymptotic inference
  - Weak-IV robust tests and confidence sets (e.g., AR)
diagnostics:
  - First-stage F and related weak-IV diagnostics
  - Reduced-form sanity checks
  - Overidentification tests (with caveats)
  - Sensitivity to instrument set and control set
failure_modes:
  - Exclusion violations
  - Weak first stage
  - Many-instrument bias
  - Overreliance on conventional t-tests under weak identification
open_questions:
  - Are instruments strong enough in relevant subsamples?
  - Is exogeneity credible given institutional details?
  - Which weak-robust method should be primary for reporting?
```

## Extraction Gaps
- Some equations/symbols are partially degraded in text extraction (matrix notation, hats, superscripts).
- Several examples are slide-graphic heavy; extraction preserves titles and major text but not all visual annotations.

## Retrieval Tags
- `instrumental-variables`
- `wald-estimator`
- `2sls`
- `exclusion-restriction`
- `first-stage`
- `weak-iv`
- `anderson-rubin`
- `liml`
- `jive`
- `measurement-error`

## Appendix A: Slide-by-Slide Source Index

- p1: Part C: Instrumental Variables
- p2: Part C outline
- p3: C1 outline
- p4: Instrumental variable DAGs
- p5: Instrumental variable DAGs (2)
- p6: IV with constant effects
- p7: IV identification with constant effects
- p8: Example 1: Angrist and Krueger (1991)
- p9: First stage
- p10: Reduced form
- p11: Exogeneity of QoB
- p12: Example 2: Encouragement designs
- p13: RCT with two-sided noncompliance
- p14: Example 3: Ingenious IVs from natural experiments
- p15: Example 4: Historical instruments
- p16: Example 4: Historical instruments (cont.)
- p17: Example 5: Overusing an instrument
- p18: Usage of rainfall IV
- p19: Often (but not always) a problem
- p20: Failure of exogeneity
- p21: Example 6: IV for structural equations
- p22: Recap
- p23: Outline
- p24: IV identification and estimation
- p25: Angrist and Krueger with single binary IV
- p26: Two-stage least squares (2SLS)
- p27: IV with included controls
- p28: IV with included controls (2)
- p29: IV with included controls (3)
- p30: Multiple endogenous variables & IVs
- p31: Overidentified case
- p32: 2SLS as a control function estimator
- p33: Control function approach to IV
- p34: Outline
- p35: IV for classical measurement error
- p36: Bias of OLS
- p37: IV estimation is immune
- p38: Lessons
- p39: Outline
- p40: Weak IV: Overview
- p41: Weak IV: Overview (2)
- p42: Weak IV: Overview (3)
- p43: Sensitivity to exogeneity violations
- p44: Large asymptotic variance of IV
- p45: F-statistics
- p46: Finite-sample bias towards OLS
- p47: Monte Carlo: Single strong IV
- p48: Tests and coverage: Single strong IV
- p49: Monte Carlo: Weak IV
- p50: Tests and coverage: Weak IV
- p51: Monte Carlo: Many IV
- p52: Tests and coverage: Many IV
- p53: Many IV bias in practice
- p54: What to do?
- p55: Pre-testing for weak IVs
- p56: Pre-testing for weak IVs (2)
- p57: Weak-robust inference
- p58: Properties of AR confidence intervals
- p59: Alternative estimators with overidentification: LIML
- p60: Alternative estimators: JIVE
- p61: Aside: Two-Sample IV
- p62: References I
- p63: References II
- p64: References III
- p65: References IV

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p4: Exclusion in potential outcomes notation: `Y(d,z) = Y(d,z') = Y(d)` for all `d,z,z'`.
- p6: Structural equation (constant effect): `Y_i = tau D_i + epsilon_i`.
- p6: First stage: `D_i = pi Z_i + u_i`.
- p6: Instrument exogeneity: `Cov(Z_i, epsilon_i)=0`.
- p6: Reduced form: `Y_i = rho Z_i + e_i`, with `rho = tau pi`.
- p7: IV ratio: `tau = rho/pi = Cov(Z_i,Y_i)/Cov(Z_i,D_i)`.
- p24: Moment condition form: `Cov(Z_i, Y_i - tau D_i)=0`.
- p24: Wald estimand for binary instrument:
  - `tau = [E(Y|Z=1)-E(Y|Z=0)] / [E(D|Z=1)-E(D|Z=0)]`.
- p26: 2SLS uses first-stage fitted treatment and yields same IV estimand in just-identified linear case.
- p28-p31: matrix form of linear IV moments and 2SLS implementation (`beta_2SLS = (X'P_Z X)^(-1) X'P_Z Y` in standard notation).
- p35: Measurement-error setup `X = X* + xi`.
- p36: Attenuation in classical measurement error:
  - `beta_OLS = Cov(Y,X)/Var(X) = beta * Var(X*) / (Var(X*) + Var(xi))`.

Equation-fidelity note:
- Several matrix lines on p28-p31 are partially truncated in extraction; the standard 2SLS matrix expression is included to preserve intended formula content.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `Z`: instrument; `D`: endogenous regressor/treatment; `Y`: outcome.
- `pi`: first-stage coefficient; `rho`: reduced-form coefficient; `tau`: structural effect.
- `u`, `epsilon`, `e`: first-stage, structural, and reduced-form disturbances.
- `X`: included exogenous controls; `P_Z`: projection onto instrument space.
- `beta_2SLS`: linear IV estimator in matrix notation.

Reconciled extraction artifacts:
- Extracted ratio lines are normalized to `tau = Cov(Z,Y)/Cov(Z,D)` and binary Wald form.
- Truncated matrix moments are mapped to standard 2SLS expression with residualized-controls interpretation.
- Weak-IV discussion symbols (F-statistics, AR sets) are preserved in standard econometric notation.

## Concept Links
- Prerequisites: [[A1_regression]], [[A2_causality]], [[B_covariate_adjustment]]
- Core concepts: [[concepts/Instrumental_variables]], [[concepts/Exclusion_restriction]], [[concepts/First_stage_relevance]], [[concepts/Two_stage_least_squares]]
- Assumptions: [[concepts/Exclusion_restriction]], [[concepts/First_stage_relevance]]
- Estimands: [[concepts/Instrumental_variables]]
- Estimation and inference: [[concepts/Two_stage_least_squares]], [[concepts/Weak_instruments]]
- Connected lectures: [[C2_LATE]], [[C3_judge_IV]], [[F_Spillovers_Formula_IV]]
- Global map: [[ECONOMETRICS_MAP]]
