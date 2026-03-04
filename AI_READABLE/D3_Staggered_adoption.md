---
title: "D3 Staggered Adoption"
note_type: "lecture_translation"
course: "ARE213"
module: "D3"
source_pdf: "D3_Staggered_adoption.pdf"
tags: [are213, econometrics, lecture, did, staggered]
prerequisites: ["D2_Canonical_DiD", "D1_Panels"]
concept_notes: ["concepts/Staggered_adoption_DiD", "concepts/Difference_in_differences", "concepts/Event_study", "concepts/Parallel_trends", "concepts/Fixed_effects"]
related_lectures: ["D4_DiD_extensions", "D5_Factor_models"]
---
# D3: Staggered Adoption DiD Translation

## Source
- PDF filename: `D3_Staggered_adoption.pdf`
- Generated markdown filename: `AI_READABLE/D3_Staggered_adoption.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro/outline and setup: p1-p3, p11, p23
- Notation, assumptions, and target estimands: p4-p10
- Problems with conventional TWFE in staggered settings: p12-p22
- Heterogeneity-robust estimators and practice: p24-p47
- References: p48-p50

## Comprehensive Translation

### Orientation and staggered setting
Source pages: p1-p3

Core ideas
- Treatment adoption occurs at different times across cohorts.
- This creates richer variation but also new identification/weighting pitfalls.

Definitions and notation
- Cohort/event-time indexing with first-treatment period by unit.

Key results/formulas
- Not central on intro slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Staggered rollout cannot be treated as a simple extension of 2x2 DiD without additional care.

### Notation, assumptions, and estimands
Source pages: p4-p10

Core ideas
- Module defines cohort-time treatment effects and aggregate targets.
- Dynamic effects and event-time paths are explicit objects of interest.

Definitions and notation
- `ATT(g,t)` style group-time effects (implicit in slide sequence).
- Potential outcomes with untreated path and treatment adoption timing.

Key results/formulas
- Aggregate estimands are weighted averages of cohort-time effects.
- Multiple weighting schemes correspond to different policy questions.

Proof sketch / logic
- Under parallel trends for untreated outcomes, treated-minus-comparison contrasts identify cohort-time effects.

Examples or exercises
- Slides enumerate several estimands and discuss dynamics.

Interpretation for applied work
- Declare estimand before estimator; "effect" is ambiguous in staggered designs.

### Why conventional TWFE fails under heterogeneity
Source pages: p12-p22

Core ideas
- Standard TWFE/event-study can use forbidden comparisons (already-treated units as controls).
- Weights can be negative, creating sign reversals and contamination across horizons.
- Fully dynamic TWFE may be underidentified or spuriously identify long-run effects.

Definitions and notation
- Forbidden comparisons: treated units compared to later-treated/already-treated units.
- Cross-horizon contamination: coefficient at one event time loads effects at other horizons.

Key results/formulas
- Decomposition results show TWFE estimates are weighted sums of many `ATT(g,t)` terms with possibly negative weights.
- Long-run coefficients can be driven by composition/normalization rather than true long-run effects.

Proof sketch / logic
- Projection algebra in staggered designs reveals implicit weighting matrix not aligned with target cohort-time estimands when effects are heterogeneous.

Examples or exercises
- Multiple slides on negative weights, under-identification, spurious long-run estimates, and contamination.

Interpretation for applied work
- Avoid interpreting vanilla TWFE event-study coefficients as clean causal dynamics in staggered adoption settings.

### Heterogeneity-robust estimation and implementation
Source pages: p24-p47

Core ideas
- Recommended workflow: inspect treatment timing/raw trends and use estimators targeting explicit cohort-time effects.
- Two families covered: manual averaging approaches and imputation-based methods.

Definitions and notation
- Manual averaging estimators aggregate cohort-time estimates using transparent weights.
- Imputation estimators predict untreated outcomes then compute treated-minus-imputed effects.
- BJS (Borusyak-Jaravel-Spiess style) methods appear for estimation, SEs, and falsification tests.

Key results/formulas
- Robust estimators avoid forbidden comparisons by using never-treated/not-yet-treated as controls under stated assumptions.
- SE and pre-trend tests are adapted to these estimators.
- Some extended TWFE/local projection variants are discussed as alternatives.

Proof sketch / logic
- Identification from valid untreated comparisons at each cohort-time cell, then explicit aggregation to target estimands.

Examples or exercises
- Comparative event-study graphs across estimator classes.
- Empirical examples and contrasting interpretations across papers.
- Software package slide for implementation.

Interpretation for applied work
- In staggered settings, estimator choice is part of identification, not a minor robustness choice.

### References block
Source pages: p48-p50

Core ideas
- References cover modern heterogeneity-robust DiD methods and debates.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references to map estimator assumptions to application structure.

## Diagnostics, Pitfalls, and Failure Modes
- Negative/implicit weights in TWFE under heterogeneity.
- Use of already-treated units as controls.
- Dynamic-coefficient contamination across event times.
- Weak pre-trend diagnostics if estimand/estimator mismatch persists.
- Misinterpreting package defaults as identification guarantees.

## Implementation Checklist
1. Plot treatment timing and raw outcomes by cohort first.
2. Define target cohort-time and aggregate estimands explicitly.
3. Avoid conventional TWFE for primary inference when heterogeneity is plausible.
4. Estimate heterogeneity-robust group-time effects (manual averaging or imputation-based).
5. Aggregate with transparent policy-relevant weights.
6. Report estimator-specific pre-trend/falsification tests.
7. Compare results across robust estimators and explain differences.
8. Use software implementations that preserve estimator-identification alignment.

## Structured Extract (for agents)
```yaml
module: staggered_did
source_pdf: D3_Staggered_adoption.pdf
source_pages: 50
estimands:
  - Cohort-time treatment effects ATT(g,t)
  - Aggregated dynamic and static effects with explicit weights
identification_assumptions:
  - Parallel trends for untreated outcomes across cohorts/time
  - No anticipation/interference unless modeled
  - Valid comparison groups (never-treated or not-yet-treated) for target contrasts
estimators:
  - Conventional TWFE/event-study (as benchmark/problematic under heterogeneity)
  - Manual averaging group-time estimators
  - Imputation-based estimators (BJS-style)
  - Local projection DiD / extended TWFE variants
inference_methods:
  - Cluster-robust inference adapted to group-time estimators
  - Estimator-specific pre-trend/falsification tests
diagnostics:
  - Treatment-timing plots
  - Raw cohort trend plots
  - Weight diagnostics and forbidden-comparison checks
  - Cross-estimator comparison of event-study paths
failure_modes:
  - Negative-weight distortions
  - Cross-horizon contamination
  - Spurious long-run effects
  - Misaligned estimator for chosen estimand
open_questions:
  - Which aggregate weighting scheme matches policy objective?
  - Are not-yet-treated controls credible throughout horizon?
  - How sensitive are conclusions across robust estimators?
```

## Extraction Gaps
- Some duplicated slide titles and minor character corruption in extraction.
- Plot-heavy slides provide limited numeric detail in text extraction.

## Retrieval Tags
- `staggered-adoption`
- `did`
- `twfe-bias`
- `negative-weights`
- `event-study`
- `imputation-estimators`
- `group-time-effects`
- `bjs`

## Appendix A: Slide-by-Slide Source Index

- p1: Part D: Panel Data Methods
- p2: D3 outline
- p3: Staggered adoption/rollout setting
- p4: An extra source of variation
- p5: Notation and assumptions
- p6: A note on modeling dynamics
- p7: Target estimands
- p8: More estimands of interest
- p9: More estimands of interest
- p10: More estimands of interest
- p11: Outline
- p12: Conventional practice
- p13: Static TWFE specification
- p14: Forbidden comparisons
- p15: Mechanics of negative weights
- p16: Characterizing negative weights
- p17: Under-identification of the fully-dynamic specification
- p18: Under-identification of the fully-dynamic specification
- p19: Spurious identification of very long-run effects
- p20: Spurious identification of very long-run effects
- p21: Spurious identification of very long-run effects
- p22: Cross-horizon contamination
- p23: Outline
- p24: Plot treatment timing
- p25: Plot raw outcome data by cohort
- p26: Estimation robust to heterogeneous effects
- p27: Manual averaging estimators
- p28: Manual averaging estimators (2)
- p29: Manual averaging estimators (3)
- p30: Manual averaging: Pre-trend tests
- p31: Manual averaging: Pre-trend tests
- p32: Imputation estimators
- p33: Eiciency of imputation
- p34: Comparison to manual averaging
- p35: BJS: Standard errors
- p36: BJS: Standard errors (2)
- p37: BJS: Pre-trend and other falsifications tests
- p38: Estimators equivalent to imputation
- p39: Event study graphs from two groups of methods
- p40: Liu et al. (2022) pre-trend test and graph
- p41: Extended TWFE regression
- p42: Extended TWFE regression
- p43: Local projection DiD
- p44: Does heterogeneity-robust estimation matter?
- p45: BJS results
- p46: Chiu, Lan, Liu, and Xu (2023) are less convinced
- p47: Software packages
- p48: References I
- p49: References II
- p50: References III

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p3: Staggered-adoption assignment:
  - `D_it = 1[t >= E_i]`.
- p5: Unit-time treatment effects:
  - `tau_it = E[Y_it(1)-Y_it(0)]`.
- p5: Untreated parallel-trends structure:
  - `E[Y_it(0)] = alpha_i + beta_t`.
- p6: No anticipation condition:
  - `Y_it(e) = Y_it(e') = Y_it(infinity)` for `e,e' > t`.
- p6: Simplified notation under no anticipation:
  - `Y_it(1) = Y_it(E_i) = Y_it`, `Y_it(0)=Y_it(infinity)`.
- p12-p13: Conventional TWFE event-study/static forms use
  - `Y_it = alpha_i + beta_t + ... + epsilon_it`, but estimands become weighted mixtures under heterogeneity.
- p15: Static TWFE estimand representation as weighted sum over unit-time effects with residualized-treatment weights.
- p17: BJS non-identification result (without never-treated units) for fully dynamic TWFE path.
- p32: Imputation logic under PTA/no anticipation:
  - `tau_it = Y_it - Y_it(0)` for treated cells.
- p32/p35: Aggregate target and inference skeleton:
  - `tau_w = sum_{it in Omega_1} w_it tau_it`
  - `hat tau_w = sum_{it} v_it Y_it`
  - `Var(hat tau_w) = Var(sum_{it} v_it epsilon_it)`.
- p43: Local-projection DiD equation:
  - `Y_{i,t+h} - Y_{i,t-1} = beta_{ht} + tau_h 1[t=E_i] + error`, estimated on clean-comparison subsamples.

Equation-fidelity note:
- Several decomposition matrices/weights are graphically displayed and partially truncated in extraction; intact identifying equations and estimator forms are retained above.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `E_i`: first treatment period (cohort timing).
- `D_it=1[t>=E_i]`: staggered adoption indicator.
- `tau_it`: unit-time treatment effect.
- `CATT_{e,t}` / group-time effects: cohort-time causal contrasts.
- `w_it`, `v_it`: target and estimator weights for aggregation/imputation.
- `tau_h`: event-time effect at horizon `h` in dynamic summaries.

Reconciled extraction artifacts:
- Fully dynamic TWFE terms with broken indices are normalized to event-time coefficient notation.
- Imputation estimator equations are standardized as weighted sums over treated and untreated cells.
- Variance expressions with nested sums are preserved in `Var(sum v_it epsilon_it)` form when matrix formatting degrades.

## Concept Links
- Prerequisites: [[D2_Canonical_DiD]], [[D1_Panels]]
- Core concepts: [[concepts/Staggered_adoption_DiD]], [[concepts/Difference_in_differences]], [[concepts/Event_study]], [[concepts/Parallel_trends]]
- Assumptions: [[concepts/Parallel_trends]], [[concepts/SUTVA]]
- Estimands: [[concepts/ATE_ATT_ATU]], [[concepts/Staggered_adoption_DiD]]
- Estimation and inference: [[concepts/Staggered_adoption_DiD]], [[concepts/Event_study]], [[concepts/Cluster_robust_inference]]
- Connected lectures: [[D4_DiD_extensions]], [[D5_Factor_models]]
- Global map: [[ECONOMETRICS_MAP]]
