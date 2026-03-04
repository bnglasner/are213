---
title: "E1 RDD Basics"
note_type: "lecture_translation"
course: "ARE213"
module: "E1"
source_pdf: "E1_RDD_basics.pdf"
tags: [are213, econometrics, lecture, rdd]
prerequisites: ["A2_causality", "A1_regression"]
concept_notes: ["concepts/Regression_discontinuity", "concepts/Local_randomization_RDD", "concepts/Cluster_robust_inference"]
related_lectures: ["E2_RDD_extensions", "D2_Canonical_DiD"]
---
# E1: Regression Discontinuity Basics Translation

## Source
- PDF filename: `E1_RDD_basics.pdf`
- Generated markdown filename: `AI_READABLE/E1_RDD_basics.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline blocks: p1-p2, p10, p28, p34
- Sharp RD setup, identification, and design checklist: p3-p9
- RD plotting and local-polynomial estimation workflow: p11-p27
- Falsification/manipulation tests: p29-p33
- Applied cautionary examples and lessons: p35-p40
- References: p41-p43

## Comprehensive Translation

### Orientation and setup
Source pages: p1-p9

Core ideas
- Sharp RD identifies local causal effects at a cutoff where treatment assignment jumps deterministically.
- Credibility comes from continuity of potential outcomes in the running variable at the threshold.

Definitions and notation
- Running variable `R`, cutoff `c`, treatment `D = 1[R >= c]` (sharp design).
- Potential outcomes `Y(1), Y(0)`.

Key results/formulas
- Sharp RD estimand:
  - `tau_RD = lim_{r downarrow c} E[Y|R=r] - lim_{r uparrow c} E[Y|R=r]`
  - identified if both potential-outcome regressions are continuous at `c`.

Proof sketch / logic
- Units near cutoff are comparable in latent characteristics under continuity; discontinuity in `Y` is attributed to treatment jump.

Examples or exercises
- Initial example slides plus checklist for sharp RD implementation.

Interpretation for applied work
- RD identifies a local effect at cutoff, not necessarily global treatment effect.

### RD plotting and estimation mechanics
Source pages: p11-p27

Core ideas
- Visual diagnostics and local estimators are central.
- Local linear regression near cutoff is preferred over high-order global polynomials.
- Bandwidth choice drives bias-variance tradeoff.

Definitions and notation
- Local linear fits estimated separately on each side of cutoff.
- Bandwidth `h` selects window around `c`.

Key results/formulas
- Local linear RD estimator from side-specific linear fits at cutoff.
- MSE-optimal bandwidth logic and data-driven selectors.
- Bias-corrected (RBC) inference adjusts for non-negligible local bias.

Proof sketch / logic
- Local polynomial approximation reduces boundary bias relative to naive bins/global fits.
- Robust bias correction uses higher-order derivative estimation to recenter inference.

Examples or exercises
- RD plot detail slides, binscatter vs scatterplot, optimal-bandwidth and rdrobust implementation slides.

Interpretation for applied work
- Report both point estimate and sensitivity to plausible bandwidth ranges; avoid relying on one arbitrary `h`.

### Falsification and manipulation diagnostics
Source pages: p29-p33

Core ideas
- RD validity requires no precise manipulation of running variable around cutoff.
- Covariates and placebo outcomes should not jump at threshold (unless theoretically expected).

Definitions and notation
- Density continuity test (McCrary-style intuition) checks bunching near cutoff.

Key results/formulas
- Placebo RD estimates at fake cutoffs.
- Density discontinuity statistics around cutoff.

Proof sketch / logic
- If units sort around cutoff, continuity assumption can fail, biasing RD estimate.

Examples or exercises
- Dedicated slides on placebo tests, density discontinuity, and practical implementations.

Interpretation for applied work
- Diagnostic failures call for redesign/reinterpretation, not just additional controls.

### Cautionary examples
Source pages: p35-p40

Core ideas
- Empirical examples show RD can fail despite appealing design narratives.
- Careful contextual validation is necessary.

Definitions and notation
- Not formula-heavy; focus is design interpretation.

Key results/formulas
- None central beyond prior estimand formula.

Proof sketch / logic
- Context-specific institutional behaviors can invalidate continuity/no-manipulation assumptions.

Examples or exercises
- Gilraine (2025) and Barfort-Klemmensen-Larsen example blocks.

Interpretation for applied work
- Treat RD as design + diagnostics package, not a one-line estimator.

### References block
Source pages: p41-p43

Core ideas
- References support RD estimation, bandwidth choice, and diagnostics.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for implementation details and edge-case inference.

## Diagnostics, Pitfalls, and Failure Modes
- Manipulation/sorting around cutoff.
- Overreliance on global polynomials or poor bandwidth choices.
- Ignoring bias in local estimators when using conventional SE.
- Misinterpreting local effect as global policy effect.
- Weak/noisy RD plots with sparse support near cutoff.

## Implementation Checklist
1. Define running variable, cutoff, and assignment rule precisely.
2. Plot outcome vs running variable with transparent bin choices.
3. Estimate local linear RD with data-driven bandwidth.
4. Report RBC inference and bandwidth sensitivity.
5. Check covariate continuity/placebo outcomes.
6. Run density/manipulation tests near cutoff.
7. Interpret effect as local-to-cutoff and discuss external validity.

## Structured Extract (for agents)
```yaml
module: rdd_basics
source_pdf: E1_RDD_basics.pdf
source_pages: 43
estimands:
  - Sharp RD cutoff effect tau_RD
identification_assumptions:
  - Continuity of potential outcomes at cutoff
  - No precise manipulation of running variable near cutoff
  - Correct assignment rule at threshold
estimators:
  - Local linear RD estimator
  - Local polynomial variants
  - Bias-corrected RD estimators
inference_methods:
  - Robust bias-corrected confidence intervals
  - Bandwidth-robust sensitivity analysis
diagnostics:
  - RD plots and side-specific fits
  - Placebo cutoff tests
  - Covariate balance/continuity checks
  - Density discontinuity tests
failure_modes:
  - Sorting/manipulation
  - Bandwidth misspecification
  - Polynomial overfitting
  - Overgeneralization beyond cutoff-local effect
open_questions:
  - How sensitive are estimates to bandwidth/kernel/order choices?
  - Is manipulation plausible institutionally?
  - Is local effect policy-relevant for target population?
```

## Extraction Gaps
- Plot-heavy slides lose some annotation details in text extraction.
- Mathematical symbols occasionally degraded (subscripts/superscripts).

## Retrieval Tags
- `rdd`
- `sharp-rd`
- `local-linear`
- `bandwidth`
- `bias-correction`
- `placebo-tests`
- `density-test`

## Appendix A: Slide-by-Slide Source Index

- p1: Part E: Regression Discontinuity
- p2: E1 Outline
- p3: Setting
- p4: Identification
- p5: Examples
- p6: Examples (2)
- p7: Is RDD a special case of something?
- p8: Answer key
- p9: Checklist for sharp RD
- p10: Outline
- p11: RD plot
- p12: RD plot: Details
- p13: Binscatter vs. scatterplot
- p14: Estimation
- p15: Estimation (2)
- p16: Local linear regression
- p17: Local linear regression (2)
- p18: Local linear regression (3)
- p19: Bandwidth choice
- p20: Optimal bandwidth choice
- p21: Estimating optimal bandwidth
- p22: Estimating optimal bandwidth (2)
- p23: Intermediate summary
- p24: Bias-corrected inference
- p25: rdrobust with default options
- p26: If you insist to report bias-corrected estimate
- p27: Robustness to bandwidth choice
- p28: Outline
- p29: Falsification tests
- p30: Placebo RD plots and estimates
- p31: Discontinuity of density (bunching) test
- p32: Discontinuity of density in practice
- p33: Convenient implementation
- p34: Outline
- p35: A cautionary tale
- p36: Gilraine (2025): Effect of air filters on student achievement
- p37: Gilraine (2025): Effect of air filters on student achievement
- p38: Barfort, Klemmensen, and Larsen (2021)
- p39: Lessons from Barfort et al. (2021)?
- p40: Lessons from Barfort et al. (2021)?
- p41: References I
- p42: References II
- p43: References III

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p3: Sharp RD assignment:
  - `D_i = 1[X_i >= c]`.
- p3-p4: Continuity identification condition at cutoff for `E[Y_i(d)|X_i=x]`.
- p4: Sharp RD estimand:
  - `tau_RD = lim_{x downarrow c} E[Y_i|X_i=x] - lim_{x uparrow c} E[Y_i|X_i=x]`
  - `= E[Y_i(1)-Y_i(0) | X_i = c]` under continuity assumptions.
- p12: Global polynomial plotting equation (diagnostic, not preferred estimator):
  - `Y_i = alpha_0 + alpha_1(X_i-c) + ... + alpha_p (X_i-c)^p + error`.
- p17-p18: Local polynomial estimators are side-specific kernel-weighted argmin problems around `c`.
- p18: Local-linear interaction implementation:
  - `Y_i = tau D_i + gamma_0 + gamma_1(X_i-c) + gamma_2(X_i-c)D_i + error`.
- p20: MSE decomposition logic for bandwidth choice:
  - `MSE approx h^{2(p+1)} B^2 + V/(N h)`.
- p24: RBC inference motivation when bias and SE are same order at MSE-optimal bandwidth.

Equation-fidelity note:
- Argmin objective displays on p17-p18 are partially truncated in extraction; full kernel-weighted local-polynomial form is preserved conceptually.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `X_i`: running variable; `c`: cutoff.
- `D_i=1[X_i>=c]`: sharp assignment rule.
- `tau_RD`: cutoff-local treatment effect.
- `h`: bandwidth; `p`: local polynomial order.
- `kappa(.)`: kernel weights.
- `B`, `V`: leading bias and variance terms in MSE expansion.

Reconciled extraction artifacts:
- Side limits are normalized as `lim_{x downarrow c}` and `lim_{x uparrow c}`.
- Local-polynomial argmin equations are represented in standard kernel-weighted form where extraction truncates hats/subscripts.
- RBC notation is standardized to bias-corrected point and SE adjustments.

## Concept Links
- Prerequisites: [[A2_causality]], [[A1_regression]]
- Core concepts: [[concepts/Regression_discontinuity]], [[concepts/Local_randomization_RDD]]
- Assumptions: [[concepts/Regression_discontinuity]], [[concepts/SUTVA]]
- Estimands: [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/Regression_discontinuity]], [[concepts/Local_randomization_RDD]]
- Connected lectures: [[E2_RDD_extensions]], [[D2_Canonical_DiD]]
- Global map: [[ECONOMETRICS_MAP]]
