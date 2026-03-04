---
title: "E2 RDD Extensions"
note_type: "lecture_translation"
course: "ARE213"
module: "E2"
source_pdf: "E2_RDD_extensions.pdf"
tags: [are213, econometrics, lecture, rdd, extensions]
prerequisites: ["E1_RDD_basics", "C2_LATE", "B_covariate_adjustment"]
concept_notes: ["concepts/Fuzzy_RDD", "concepts/Regression_discontinuity", "concepts/Local_randomization_RDD", "concepts/LATE", "concepts/Exclusion_restriction"]
related_lectures: ["F_Spillovers_Formula_IV", "D4_DiD_extensions"]
---
# E2: Regression Discontinuity Extensions Translation

## Source
- PDF filename: `E2_RDD_extensions.pdf`
- Generated markdown filename: `AI_READABLE/E2_RDD_extensions.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline blocks: p1-p2, p6, p12, p14, p26, p29
- Fuzzy RD identification and estimation: p3-p5
- Discrete running variables and bias-aware/honest approaches: p7-p9
- RD in time: p10-p11
- Covariates and multi-cutoff/multi-score settings (including spatial boundaries): p13, p15-p25
- Local randomization approach: p27-p28
- Extrapolating RD effects: p30-p32
- References: p33-p36

## Comprehensive Translation

### Orientation
Source pages: p1-p2

Core ideas
- E2 extends sharp RD to settings with imperfect compliance, discrete scores, multiple cutoffs, and spatial boundaries.

Definitions and notation
- Inherited RD notation with cutoff-based assignment.

Key results/formulas
- None central on outline slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Extensions adapt RD logic to policy environments where canonical assumptions hold only approximately.

### Fuzzy RD
Source pages: p3-p5

Core ideas
- At cutoff, treatment probability jumps but not from 0 to 1.
- Identification uses local IV logic at threshold.

Definitions and notation
- Fuzzy RD estimand:
  - `tau_FRD = [jump in E[Y|R]] / [jump in E[D|R]]` at `R=c`.

Key results/formulas
- Local Wald ratio identifies local average treatment effect for cutoff compliers under exclusion/continuity assumptions.

Proof sketch / logic
- Same continuity logic as sharp RD combined with IV scaling by first-stage discontinuity.

Examples or exercises
- Fuzzy RD examples slide.

Interpretation for applied work
- Weak first-stage jump at cutoff creates weak-identification concerns analogous to weak-IV settings.

### Discrete running variables and honest inference
Source pages: p7-p9

Core ideas
- Coarse/discrete scores reduce local-comparison granularity and complicate conventional RD asymptotics.
- Honest/bias-aware methods explicitly bound approximation error.

Definitions and notation
- Discrete support around cutoff; finite support points in local window.

Key results/formulas
- Honest intervals account for possible misspecification bias rather than assuming it vanishes quickly.

Proof sketch / logic
- With limited support points, nonparametric bias cannot be ignored asymptotically; robust intervals must include bias component.

Examples or exercises
- Two-slide sequence on honest approach.

Interpretation for applied work
- For coarse assignment scores, honest methods are often more credible than conventional local-polynomial inference.

### RD in time
Source pages: p10-p11

Core ideas
- Running variable is calendar time around policy change date.
- Identification threats include confounding shocks and temporal manipulation not present in cross-sectional score designs.

Definitions and notation
- Time index as forcing variable with threshold date.

Key results/formulas
- Same discontinuity estimand form but stronger assumptions on smooth evolution of untreated outcomes around date.

Proof sketch / logic
- Continuity in untreated temporal trend near cutoff date is required.

Examples or exercises
- Conceptual slide on how to think about RD in time.

Interpretation for applied work
- RD-in-time requires strong event-isolation arguments and robustness to nearby shocks/seasonality.

### Covariates, multiple cutoffs/scores, and spatial RD
Source pages: p13, p15-p25

Core ideas
- Covariates can improve precision or adjust for discrete-support imbalance.
- Multiple cutoffs/running variables require pooling rules and comparability assumptions.
- Spatial discontinuity designs treat geographic boundaries as cutoffs.

Definitions and notation
- Cases covered:
  - single running variable with heterogeneous cutoff,
  - multiple cutoffs,
  - multiple running variables with one discontinuity boundary.

Key results/formulas
- Boundary-point effects and pooled effects are distinguished.
- Distance-based estimators can be problematic near irregular boundaries; improved pooled estimators are discussed.

Proof sketch / logic
- Identification remains local at each cutoff/boundary point; aggregation needs explicit weighting and homogeneity assumptions.

Examples or exercises
- Spatial discontinuity sequence with pointwise and pooled estimands.

Interpretation for applied work
- In multi-cutoff and spatial settings, reporting both local and pooled effects clarifies transportability.

### Local randomization and extrapolation
Source pages: p27-p32

Core ideas
- Local randomization treats units in a narrow window around cutoff as if randomized.
- Extrapolation methods attempt to move beyond cutoff-local effects under extra structure.

Definitions and notation
- Window choice is key nuisance decision in local-randomization RD.

Key results/formulas
- Randomization-based inference within chosen window.
- Extrapolation requires assumptions about treatment-effect evolution away from cutoff.

Proof sketch / logic
- Narrow-window randomization trades bias (credibility) against variance (sample size).

Examples or exercises
- Dedicated window-choice and extrapolation slide sequence.

Interpretation for applied work
- Extrapolation claims should be clearly separated from baseline local RD identification.

### References block
Source pages: p33-p36

Core ideas
- References support fuzzy/discrete/spatial/extrapolation RD methods.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for method-specific inference and software implementations.

## Diagnostics, Pitfalls, and Failure Modes
- Weak jump in treatment probability in fuzzy RD.
- Coarse running-variable support invalidating smooth asymptotic approximations.
- Confounding calendar shocks in RD-in-time.
- Aggregation errors in multi-cutoff/spatial designs.
- Overstated extrapolation beyond local identification window.

## Implementation Checklist
1. Determine extension type (fuzzy/discrete/time/multi-cutoff/spatial/local-randomization).
2. Re-define estimand and assumptions for that extension.
3. Estimate jump(s) with methods suited to support structure.
4. Use honest/bias-aware or weak-robust inference where needed.
5. Run extension-specific diagnostics (first-stage jump, boundary checks, time-shock checks).
6. Distinguish local identification from extrapolated claims.

## Structured Extract (for agents)
```yaml
module: rdd_extensions
source_pdf: E2_RDD_extensions.pdf
source_pages: 36
estimands:
  - Fuzzy RD local Wald effect at cutoff
  - Local effects with discrete running variables
  - Spatial boundary effects (pointwise and pooled)
  - Extrapolated effects under additional assumptions
identification_assumptions:
  - Continuity of potential outcomes at cutoff/boundary
  - Exclusion and relevance for fuzzy RD
  - Appropriate local comparability/window assumptions
  - Additional structure for extrapolation
estimators:
  - Fuzzy RD ratio estimators
  - Honest/bias-aware RD estimators for discrete support
  - Spatial pooling estimators
  - Local-randomization estimators
inference_methods:
  - Robust/local-polynomial and honest intervals
  - Randomization inference in local-randomization windows
  - Weak-IV-style caution in fuzzy settings
diagnostics:
  - First-stage discontinuity checks
  - Support/discreteness diagnostics
  - Time-shock sensitivity for RD-in-time
  - Boundary and pooling sensitivity checks
failure_modes:
  - Weak fuzzy first stage
  - Coarse-score bias under naive inference
  - Invalid pooling across heterogeneous cutoffs
  - Overreach in extrapolation
open_questions:
  - Which extension best matches assignment mechanics?
  - Is local randomization credible in any practical window?
  - How robust are pooled or extrapolated effects?
```

## Extraction Gaps
- Some geometry/plot details in spatial RD slides are not fully captured by text extraction.
- Symbols for limits/subscripts are occasionally degraded.

## Retrieval Tags
- `fuzzy-rd`
- `discrete-running-variable`
- `honest-inference`
- `rd-in-time`
- `multiple-cutoffs`
- `spatial-rd`
- `local-randomization`
- `rd-extrapolation`

## Appendix A: Slide-by-Slide Source Index

- p1: Part E: Regression Discontinuity
- p2: E2 Outline
- p3: Fuzzy RDD
- p4: Fuzzy RDD examples
- p5: Identification and estimation
- p6: Outline
- p7: Discrete running variables
- p8: An honest (bias-aware) approach
- p9: An honest (bias-aware) approach (2)
- p10: RD in time
- p11: How to think about RD in time?
- p12: Outline
- p13: Adding covariates
- p14: Outline
- p15: Multiple cutoffs or running variables
- p16: #1: Scalar running variable, single heterogeneous cutoff
- p17: #2: Scalar running variable, multiple cutoffs
- p18: #3: Multiple running variables, single discontinuity
- p19: Special case: Spatial discontinuity designs
- p20: Effects at a single boundary point
- p21: Effects at a single boundary point: Identification
- p22: Effects at a single boundary point: Estimation
- p23: Problems of distance-based estimation
- p24: Pooled effect
- p25: Pooled effect: better estimators
- p26: Outline
- p27: Local randomization approach to RDDs
- p28: Choosing the window
- p29: Outline
- p30: Extrapolating RD estimates
- p31: Extrapolating RD estimates (2)
- p32: Extrapolating RD estimates (3)
- p33: References I
- p34: References II
- p35: References III
- p36: References IV

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p3: Fuzzy RD instrument around cutoff:
  - `Z_i = 1[X_i >= c]` with `D_i != Z_i` generally.
- p5: Fuzzy RD local Wald estimand:
  - `tau_FRD = tau_Y / tau_D`
  - `= E[Y_i(1)-Y_i(0) | D_i(1) > D_i(0), X_i = c]` (binary-treatment case).
- p7: With discrete running variable, limit objects `lim_{x down/up c} E[Y|X=x]` may fail to exist.
- p8: Honest/bias-aware approach bounds curvature:
  - choose `M` to bound curvature of `E[Y|X]` and obtain a partially identified set for `tau`.
- p13: Covariate-adjusted local-linear equation:
  - `Y_i = tau D_i + gamma_0 + gamma_1(X_i-c) + gamma_2(X_i-c)D_i + delta'W_i + error`.
- p16: Multiple-cutoff setup:
  - `D_i = 1[X_i >= C_i]`, `C_i in {c_1,...,c_K}`.
  - subgroup effect `tau_c = E[Y_i(1)-Y_i(0) | X_i=c, C_i=c]`.
- p21: Spatial boundary estimand at point `b`:
  - `tau(b)` as inside-vs-outside limit difference of `E[Y|X=x]` approaching boundary.
- p27: Local-randomization window assumption:
  - `X_i independent Y_i(d) | X_i in [c-h, c+h]`.
- p30: Extrapolation derivative at cutoff:
  - `phi = d/dx E[Y_i(1)-Y_i(0)|X_i=x] at x=c`, and near-cutoff approximation
  - `E[Y_i(1)-Y_i(0)|X_i=x] approx tau + phi (x-c)`.

Equation-fidelity note:
- Spatial RD limit notation is split across lines in extraction; standardized expressions above preserve the intended boundary-limit estimands.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `Z_i=1[X_i>=c]`: fuzzy-RD instrument.
- `tau_Y`, `tau_D`: reduced-form and first-stage discontinuities.
- `tau_FRD = tau_Y/tau_D`: fuzzy-RD local Wald estimand.
- `C_i`: cutoff label in multi-cutoff designs; `tau_c`: cutoff-specific effect.
- `b in B`: boundary point in spatial RD; `tau(b)` boundary-local effect.
- `phi`: derivative used in local extrapolation from cutoff.

Reconciled extraction artifacts:
- Multi-cutoff pooled formulas with broken densities are normalized to weighted averages over cutoff-specific effects.
- Spatial boundary limit notation is harmonized into inside/outside boundary limits.
- Local-randomization window assumptions are written with explicit interval `[c-h, c+h]`.

## Concept Links
- Prerequisites: [[E1_RDD_basics]], [[C2_LATE]], [[B_covariate_adjustment]]
- Core concepts: [[concepts/Fuzzy_RDD]], [[concepts/Regression_discontinuity]], [[concepts/Local_randomization_RDD]]
- Assumptions: [[concepts/Exclusion_restriction]], [[concepts/First_stage_relevance]], [[concepts/Regression_discontinuity]]
- Estimands: [[concepts/LATE]], [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/Fuzzy_RDD]], [[concepts/Local_randomization_RDD]]
- Connected lectures: [[F_Spillovers_Formula_IV]], [[D4_DiD_extensions]]
- Global map: [[ECONOMETRICS_MAP]]
