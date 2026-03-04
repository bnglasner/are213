---
title: "C2 LATE"
note_type: "lecture_translation"
course: "ARE213"
module: "C2"
source_pdf: "C2_LATE.pdf"
tags: [are213, econometrics, lecture, iv, late]
prerequisites: ["C1_IV_basics", "A2_causality"]
concept_notes: ["concepts/LATE", "concepts/Instrumental_variables", "concepts/Exclusion_restriction", "concepts/First_stage_relevance", "concepts/ATE_ATT_ATU", "concepts/Internal_vs_external_validity"]
related_lectures: ["C3_judge_IV", "E2_RDD_extensions", "F_Spillovers_Formula_IV"]
---
# C2: LATE and Heterogeneous IV Effects Translation

## Source
- PDF filename: `C2_LATE.pdf`
- Generated markdown filename: `AI_READABLE/C2_LATE.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline: p1-p3, p15, p22
- Heterogeneous-effects IV framework and principal strata: p4-p14
- Characterizing compliers and extrapolation: p16-p21
- Extensions (multi-valued/continuous instruments, multi-valued treatments, multiple IVs/treatments, controls): p23-p37
- References: p38-p41

## Comprehensive Translation

### Orientation and roadmap
Source pages: p1-p3, p15, p22

Core ideas
- C2 asks what IV identifies when treatment effects are heterogeneous.
- Focus is on LATE framework, compliance types, and external-validity limits.

Definitions and notation
- Instrument `Z`, treatment `D`, potential treatments `D(1), D(0)`, potential outcomes `Y(1), Y(0)`.

Key results/formulas
- None central on outline slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Move from "does IV identify something causal?" to "which subgroup-specific causal effect?".

### LATE framework and compliance types
Source pages: p4-p14

Core ideas
- Under heterogeneity, IV identifies a local effect for compliers, not necessarily ATE.
- Principal strata (always-takers, never-takers, compliers, defiers) organize interpretation.

Definitions and notation
- IV assumptions in this block:
  - Independence/exogeneity of `Z`.
  - Exclusion of direct `Z -> Y` effect.
  - Relevance (`P(D=1|Z=1) != P(D=1|Z=0)`).
  - Monotonicity: `D(1) >= D(0)` (no defiers).

Key results/formulas
- Wald/LATE ratio:
  - `LATE = [E(Y|Z=1)-E(Y|Z=0)] / [E(D|Z=1)-E(D|Z=0)]`
  - identifies `E[Y(1)-Y(0) | complier]` under assumptions.
- ITT relation:
  - reduced form identifies ITT on outcomes; dividing by first stage scales to complier effect.

Proof sketch / logic
- Independence + exclusion map reduced-form difference to treatment-effect average over strata affected by `Z`; monotonicity isolates compliers.

Examples or exercises
- True/false compliance-type understanding slide.
- Applied screening example (Angrist and Hull 2023) used to discuss practical interpretation.

Interpretation for applied work
- LATE can be policy-relevant even when noncompliers are present, but subgroup target must be explicit.

### Characterizing compliers and extrapolation
Source pages: p16-p21

Core ideas
- Beyond point identification of LATE, researchers often want to describe who compliers are.
- Extrapolation beyond compliers requires extra assumptions or reweighting strategies.

Definitions and notation
- Shares of principal strata can be counted under monotonicity and first-stage moments.

Key results/formulas
- Group-share identities from first-stage probabilities.
- Reweighting approaches can target different populations conditional on stronger assumptions.

Proof sketch / logic
- Use observed treatment rates by instrument state plus monotonicity restrictions to infer latent-group proportions.

Examples or exercises
- Dedicated characterizing-compliers sequence plus example slide.

Interpretation for applied work
- Always report both estimated LATE and evidence on complier composition for external-validity discussions.

### Extensions of heterogeneous IV
Source pages: p23-p37

Core ideas
- LATE logic generalizes to richer settings but weighting interpretation becomes more complex.
- Multi-valued/continuous instruments and treatments produce weighted averages of marginal effects.

Definitions and notation
- Linear heterogeneity setup.
- Multi-valued/continuous instrument extensions.
- Multiple instruments and multiple treatments environments.

Key results/formulas
- Continuous/multi-valued `Z`: IV identifies weighted averages of marginal treatment responses.
- Multi-valued treatment (Angrist-Imbens framework): ratio estimands become weighted averages of pairwise treatment contrasts.
- With multiple instruments, 2SLS combines instrument-specific local effects via first-stage-dependent weights.

Proof sketch / logic
- Moment conditions and decomposition arguments generalize binary Wald ratio into weighted mixtures over margins induced by instrument variation.

Examples or exercises
- Angrist-Krueger weight decomposition slide.
- Non-causal first-stage caution when required controls are omitted.

Interpretation for applied work
- In multi-instrument settings, interpret 2SLS as an average of local effects, not a universal parameter, unless homogeneity assumptions are justified.

### References block
Source pages: p38-p41

Core ideas
- References support LATE theory, extensions, and applications.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for formal derivations and external-validity debates.

## Diagnostics, Pitfalls, and Failure Modes
- Misreporting LATE as ATE without subgroup caveats.
- Monotonicity violations (defiers) undermining interpretation.
- Exclusion failures that contaminate reduced-form effect.
- Weak first stage making LATE unstable.
- Ignoring heterogeneity across instruments in multi-IV 2SLS.
- Extrapolating beyond compliers without defensible assumptions.

## Implementation Checklist
1. State principal-strata assumptions (exogeneity, exclusion, relevance, monotonicity).
2. Report reduced form, first stage, and Wald/2SLS estimate jointly.
3. Quantify first-stage strength and weak-IV robustness.
4. Estimate and report complier-share/composition moments when possible.
5. Clarify target population: compliers for which instrument margin.
6. For multi-valued/multi-instrument cases, document weighting interpretation.
7. Separate identified claims from extrapolative claims.

## Structured Extract (for agents)
```yaml
module: late
source_pdf: C2_LATE.pdf
source_pages: 41
estimands:
  - LATE = E[Y(1)-Y(0)|compliers]
  - ITT outcome and ITT treatment effects
  - Weighted local effects for multi-valued/continuous instruments
identification_assumptions:
  - Instrument exogeneity/independence
  - Exclusion restriction
  - Relevance
  - Monotonicity (no defiers)
estimators:
  - Wald ratio in binary IV case
  - 2SLS in linear settings with controls
  - Reweighting/extrapolation estimators under extra assumptions
inference_methods:
  - Robust/clustered asymptotic inference
  - Weak-IV robust inference when first stage is limited
diagnostics:
  - First-stage strength checks
  - Plausibility checks for exclusion/monotonicity
  - Complier characterization
  - Sensitivity of estimates across instrument definitions
failure_modes:
  - Confusing LATE with ATE
  - Monotonicity violations
  - Exclusion failure
  - Weak-IV distortions
open_questions:
  - Is complier population policy-relevant?
  - Which extrapolation assumptions are defensible?
  - How heterogeneous are local effects across margins/instruments?
```

## Extraction Gaps
- Some symbols and superscripts are degraded in extraction.
- Several slides emphasize conceptual diagrams/tables for strata; text extraction may omit visual formatting but preserves the core labels.

## Retrieval Tags
- `late`
- `compliers`
- `monotonicity`
- `principal-strata`
- `wald-ratio`
- `external-validity`
- `multi-valued-iv`
- `multi-treatment-iv`

## Appendix A: Slide-by-Slide Source Index

- p1: Part C: Instrumental Variables
- p2: Questions when effects are heterogeneous
- p3: C2 Outline
- p4: Recap of general IV assumptions
- p5: The four groups
- p6: Understanding the groups: True/False
- p7: Reduced-form
- p8: Monotonicity assumption
- p9: Is monotonicity plausible?
- p10: Is LATE more useful than ITT?
- p11: Example: Angrist and Hull (2023)
- p12: IV estimates of the effect of screening
- p13: External validity: Is LATE useful?
- p14: External validity: Is LATE useful? (2)
- p15: Outline
- p16: Counting the three groups
- p17: Characterizing compliers
- p18: Characterizing compliers (2)
- p19: Characterizing compliers (3)
- p20: Characterizing compliers: Example
- p21: Extrapolation via reweighting
- p22: Outline
- p23: Extensions
- p24: Linear heterogeneity
- p25: Proof
- p26: Single multi-valued instrument
- p27: Single multi-valued instrument (2)
- p28: Single continuous instrument
- p29: Single multi-valued treatment (Angrist and Imbens (1995))
- p30: Single multi-valued treatment (2)
- p31: Weights in Angrist and Krueger (1991)
- p32: Multiple instruments
- p33: Multiple instruments (2)
- p34: Multiple treatments
- p35: Multiple treatments (2)
- p36: Including necessary covariates
- p37: Non-causal first stage
- p38: References I
- p39: References II
- p40: References III
- p41: References IV

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p5: Principal strata from potential treatments `(D(0), D(1))`: never-takers, compliers, defiers, always-takers.
- p5: First-stage decomposition: `pi = E[D(1)-D(0)] = Pr(Complier) - Pr(Defier)`.
- p7: Reduced-form decomposition over strata implies IV ratio depends on complier/defier-weighted treatment effects.
- p8: LATE theorem under independence, exclusion, monotonicity:
  - `tau_IV = E[tau_i | Complier_i]`.
- p16: Strata shares from observed first-stage moments:
  - `n = Pr(NT) = Pr(D=0|Z=1)`
  - `a = Pr(AT) = Pr(D=1|Z=0)`
  - `pi = Pr(C) = Pr(D=1|Z=1) - Pr(D=1|Z=0)`.
- p18-p19: Complier potential-outcome means recovered via IV-style moments using `Y*D` and `Y*(1-D)` constructions.
- p24-p25: Linear heterogeneity representation yields
  - `tau_IV = E[tau_i * pi_i] / E[pi_i]`.
- p27: Multi-valued-instrument decomposition:
  - `tau_IV = sum_p omega_p tau_p`, with weights based on first-stage margins and instrument variation.
- p29-p30: Multi-valued-treatment IV identifies weighted averages of treatment-threshold contrasts.
- p32-p33: With multiple instruments/treatments, 2SLS is a weighted average of local effects and weights may be non-convex in general designs.

Equation-fidelity note:
- Some displayed fractions and summations on p27-p33 are broken across lines in extraction; equations above preserve the identifiable weighting structure.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `D(z)`: potential treatment under instrument value `z`.
- Principal strata: NT (never-taker), C (complier), Df (defier), AT (always-taker).
- `pi`: first-stage complier-share contrast.
- `tau_IV`: IV estimand; under monotonicity/exclusion/independence equals LATE.
- `tau_p`, `omega_p`: margin-specific local effects and weights for multi-valued instruments.

Reconciled extraction artifacts:
- Mixed strata equations are normalized to weighted reduced-form decomposition.
- Multi-valued-instrument summations with broken indices are represented as `tau_IV = sum_p omega_p tau_p`.
- Multi-treatment threshold contrasts are kept as pairwise local contrasts where fraction formatting was degraded.

## Concept Links
- Prerequisites: [[C1_IV_basics]], [[A2_causality]]
- Core concepts: [[concepts/LATE]], [[concepts/Instrumental_variables]], [[concepts/ATE_ATT_ATU]], [[concepts/Internal_vs_external_validity]]
- Assumptions: [[concepts/Exclusion_restriction]], [[concepts/First_stage_relevance]]
- Estimands: [[concepts/LATE]], [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/Two_stage_least_squares]], [[concepts/Weak_instruments]]
- Connected lectures: [[C3_judge_IV]], [[E2_RDD_extensions]], [[F_Spillovers_Formula_IV]]
- Global map: [[ECONOMETRICS_MAP]]
