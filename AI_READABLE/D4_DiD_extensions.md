---
title: "D4 DiD Extensions"
note_type: "lecture_translation"
course: "ARE213"
module: "D4"
source_pdf: "D4_DiD_extensions.pdf"
tags: [are213, econometrics, lecture, did, extensions]
prerequisites: ["D2_Canonical_DiD", "D3_Staggered_adoption", "B_covariate_adjustment"]
concept_notes: ["concepts/Difference_in_differences", "concepts/Parallel_trends", "concepts/Interference_and_spillovers", "concepts/Selection_on_observables", "concepts/Staggered_adoption_DiD"]
related_lectures: ["D5_Factor_models", "F_Spillovers_Formula_IV", "E2_RDD_extensions"]
---
# D4: Difference-in-Differences Extensions Translation

## Source
- PDF filename: `D4_DiD_extensions.pdf`
- Generated markdown filename: `AI_READABLE/D4_DiD_extensions.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline blocks: p1-p3, p14, p17, p21, p27
- DiD with covariates/trends and partial identification: p4-p13
- Restrictions on treatment effects: p15-p16
- Anticipation and spillovers: p18-p20
- Continuous intensity and treatment reversals: p22-p26
- Repeated cross-sections, two-dimensional setups, triple differences: p28-p33
- References: p34-p36

## Comprehensive Translation

### Orientation
Source pages: p1-p3

Core ideas
- D4 extends baseline DiD to realistic complications: covariates, anticipation, spillovers, continuous treatments, reversals, and richer data structures.

Definitions and notation
- Standard DiD notation inherited from D2/D3.

Key results/formulas
- Not central on intro slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Extensions are necessary when canonical assumptions are visibly violated.

### Covariates, trends, and partial identification
Source pages: p4-p13

Core ideas
- Adding covariates can improve precision/credibility if done in assumption-consistent ways.
- Naive inclusion of unit-specific trends can overfit and absorb treatment variation.
- Partial identification offers bounds when point identification is not credible.

Definitions and notation
- Covariate-adjusted DiD and trend-augmented specifications.
- Partial-ID framework with restrictions on deviations from PTA.

Key results/formulas
- Bound construction under restricted trend deviations (conceptual block in slides).
- Sampling noise complicates bound estimation; inference for bounds is addressed.

Proof sketch / logic
- Replace point identifying assumptions with inequality restrictions to obtain identified sets.

Examples or exercises
- California-focused illustration and state-specific trend sensitivity.

Interpretation for applied work
- When PTA is doubtful, bounded statements can be more defensible than fragile point estimates.

### Restrictions on treatment effects
Source pages: p15-p16

Core ideas
- Shape/sign/dynamic restrictions on effects can tighten inference and interpretation.

Definitions and notation
- Restrictions may include monotonicity or smoothness of treatment response across horizons.

Key results/formulas
- Restrictions transform identified set and estimation strategy.

Proof sketch / logic
- Add theory-driven constraints to underidentified or weakly identified dynamic paths.

Examples or exercises
- Two-slide block on treatment-effect restrictions.

Interpretation for applied work
- Restrictions should be justified substantively, not chosen solely to sharpen estimates.

### Anticipation and spillovers
Source pages: p18-p20

Core ideas
- Treatment may affect outcomes before measured start date (anticipation).
- Other units may be affected by treated units (spillovers), violating SUTVA/no-interference assumptions.

Definitions and notation
- Anticipatory effects and interference channels in potential-outcomes framing.

Key results/formulas
- Canonical DiD estimands are biased if pre-period outcomes already reflect treatment anticipation or spillovers.

Proof sketch / logic
- Violations contaminate untreated counterfactual trend comparisons.

Examples or exercises
- Dedicated spillovers slides.

Interpretation for applied work
- Re-define exposure/timing to explicitly model anticipation/spillovers when they are plausible.

### Continuous treatment intensity and reversals
Source pages: p22-p26

Core ideas
- DiD can handle dosage/intensity treatments, but interpretation shifts to marginal/intensity effects.
- Treatment reversals require dynamic exposure accounting and may invalidate one-time-adoption formulas.

Definitions and notation
- Continuous-treatment DiD variants.
- Reversal settings where treatment can switch on/off.

Key results/formulas
- Coefficients in continuous-treatment DiD are weighted average slope effects under parallel untreated trends.

Proof sketch / logic
- Similar DiD differencing logic applies with continuous exposure under linearization/functional assumptions.

Examples or exercises
- Four-slide sequence on continuous intensity.

Interpretation for applied work
- Be explicit whether estimand is per-unit-intensity marginal effect or contrast between policy bundles.

### Repeated cross-sections and triple differences
Source pages: p28-p33

Core ideas
- DiD is feasible without panel tracking if repeated cross-sections are comparable over time.
- Triple-difference (DDD) designs add an extra differencing dimension to remove additional confounding trends.

Definitions and notation
- DDD subtracts a second control difference from canonical DiD contrast.

Key results/formulas
- DDD identifying equation conceptually:
  - `(DiD in target dimension) - (DiD in auxiliary comparison dimension)`.

Proof sketch / logic
- Third difference removes confounding shocks common to first two dimensions under expanded parallel-trends assumptions.

Examples or exercises
- Three-slide triple-difference sequence plus caution that DDD is not equivalent to generic heterogeneity analysis.

Interpretation for applied work
- DDD can improve credibility but imposes stronger comparability assumptions across all dimensions.

### References block
Source pages: p34-p36

Core ideas
- References support advanced DiD variants and diagnostics.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references to align chosen extension with application-specific threats.

## Diagnostics, Pitfalls, and Failure Modes
- Adding bad controls or inappropriate trends that absorb treatment signal.
- Ignoring anticipation/spillovers and misinterpreting ATT.
- Treating continuous exposure coefficients as universal marginal effects.
- Applying DDD without validating third-dimension comparability.
- Overstating precision in partially identified settings.

## Implementation Checklist
1. Diagnose which canonical DiD assumptions fail in the application.
2. Choose extension (covariates, bounds, anticipation modeling, spillovers, DDD) matching that failure.
3. Define revised estimand under chosen extension.
4. Estimate baseline and extension models side by side.
5. Conduct extension-specific diagnostics (trend sensitivity, anticipation windows, spillover mapping).
6. For partial-ID, report identified sets and inference transparently.
7. Explain incremental assumptions added by each extension.

## Structured Extract (for agents)
```yaml
module: did_extensions
source_pdf: D4_DiD_extensions.pdf
source_pages: 36
estimands:
  - Covariate-adjusted DiD effects
  - Partially identified treatment-effect bounds
  - Continuous-intensity DiD effects
  - Triple-difference effects
identification_assumptions:
  - Extended parallel-trends assumptions conditional on design
  - Correct handling of anticipation and interference when present
  - Additional comparability assumptions for DDD dimensions
estimators:
  - Covariate/trend-augmented DiD regressions
  - Partial-identification bound estimators
  - Continuous-treatment DiD specifications
  - Repeated-cross-section and DDD estimators
inference_methods:
  - Robust/clustered asymptotic inference
  - Bound inference for partially identified parameters
diagnostics:
  - Trend-sensitivity checks
  - Anticipation and spillover diagnostics
  - Comparability checks for DDD dimensions
  - Functional-form checks for continuous treatment
failure_modes:
  - Model overfitting with inappropriate trends
  - Unmodeled anticipation/spillovers
  - Misinterpretation of continuous-treatment coefficients
  - Invalid DDD comparison structure
open_questions:
  - Which extension best addresses the primary threat to canonical DiD validity?
  - Are additional assumptions for that extension empirically credible?
  - Is a bound-based conclusion preferable to fragile point identification?
```

## Extraction Gaps
- Some equations are lightly corrupted in extraction around symbols/superscripts.
- Visual examples (maps/plots) retain headings but lose detailed annotations in plain text.

## Retrieval Tags
- `did-extensions`
- `partial-identification`
- `anticipation-effects`
- `spillovers`
- `continuous-treatment-did`
- `treatment-reversals`
- `repeated-cross-sections`
- `triple-differences`

## Appendix A: Slide-by-Slide Source Index

- p1: Part D: Panel Data Methods
- p2: Extensions
- p3: D4 outline
- p4: DiD with covariates (1)
- p5: DiD with covariates (2)
- p6: DiD with covariates: What NOT to do
- p7: Results without and with state-specific trends
- p8: Example of California
- p9: Example of California (2)
- p10: Partial identification approach
- p11: Simplified case: N= 
- p12: With sampling noise
- p13: Partial identification approach (contd)
- p14: Outline
- p15: Restrictions on treatment effects
- p16: Restrictions on treatment effects (2)
- p17: Outline
- p18: Anticipation effects
- p19: Spillovers (1)
- p20: Spillovers (2)
- p21: Outline
- p22: Continuous treatment intensity (1)
- p23: Continuous treatment intensity (2)
- p24: Continuous treatment intensity (3)
- p25: Continuous treatment intensity (4)
- p26: Treatment reversals
- p27: Outline
- p28: Repeated cross-sections
- p29: Two-dimensional cross-sections
- p30: Triple-differences (1)
- p31: Triple-differences (2)
- p32: Triple-differences (3)
- p33: Triple-diff = effect heterogeneity
- p34: References I
- p35: References II
- p36: References III

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p4: Covariate-adjusted untreated model:
  - `E[Y_it(0)] = alpha_i + beta_t + gamma' X_it`.
- p5: Conditional parallel trends for non-staggered DiD:
  - `E[Delta Y_it(0) | G_i=1, X_i] = E[Delta Y_it(0) | G_i=0, X_i]`.
- p10: Rambachan-Roth differential-trend notation:
  - `delta_t = E[Y_it(0)-Y_{i,t-1}(0) | G_i=1] - E[Y_it(0)-Y_{i,t-1}(0) | G_i=0]`.
  - PTA implies `delta_t=0`.
- p16: Restriction-based treatment-effect modeling:
  - `tau_it = Gamma' W_it` (generic structured-effects representation).
- p16: Estimation skeleton in restricted model:
  - `Y_it = alpha_i + beta_t + D_it * Gamma' W_it + error`.
- p19: Two-period spillover setup:
  - `Y_i2(D_2) = Y_i2(0) + tau_i2(D_2)`.
  - DiD identifies relative effect `E[tau_i2(D_2)|D_i2=1] - E[tau_i2(D_2)|D_i2=0]`.
- p24: Reversal setting assumption example:
  - `E[Delta Y_i2(d) | D_i1=d, D_i2] = E[Delta Y_i2(d) | D_i1=d]`.
- p29/p31: Two-dimensional/DDD-style untreated models include additive structures like
  - `E[Y_ig(0)] = alpha_i + beta_g` and richer `E[Y_igt(0)] = alpha_it + beta_gt + gamma_ig`.

Equation-fidelity note:
- Some continuous-treatment weighting formulas are split across lines in extraction; equations above preserve intact definitions/assumptions shown in the deck.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `delta_t`: differential untreated-trend deviation from PTA.
- `Gamma'W_it`: structured treatment-effect model used for restriction-based estimation.
- `D_it`: binary or continuous treatment intensity (context-dependent).
- `Y_igt`: outcome with extra dimension `g` in repeated-cross-section or DDD settings.

Reconciled extraction artifacts:
- Partial-ID slope/deviation bounds are represented with `delta_t` and bound parameters (e.g., curvature/trend bounds) in ASCII.
- Triple-difference equations with multiple FE terms are normalized to additive `alpha`, `beta`, `gamma` components.
- Reversal/continuous-treatment assumptions with broken conditionals are rewritten as explicit conditional-expectation restrictions.

## Concept Links
- Prerequisites: [[D2_Canonical_DiD]], [[D3_Staggered_adoption]], [[B_covariate_adjustment]]
- Core concepts: [[concepts/Difference_in_differences]], [[concepts/Parallel_trends]], [[concepts/Interference_and_spillovers]], [[concepts/Selection_on_observables]]
- Assumptions: [[concepts/Parallel_trends]], [[concepts/Interference_and_spillovers]]
- Estimands: [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/Staggered_adoption_DiD]], [[concepts/Selection_on_observables]]
- Connected lectures: [[D5_Factor_models]], [[F_Spillovers_Formula_IV]], [[E2_RDD_extensions]]
- Global map: [[ECONOMETRICS_MAP]]
