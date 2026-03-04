---
title: "C3 Judge IV"
note_type: "lecture_translation"
course: "ARE213"
module: "C3"
source_pdf: "C3_judge_IV.pdf"
tags: [are213, econometrics, lecture, iv, judge-design]
prerequisites: ["C1_IV_basics", "C2_LATE"]
concept_notes: ["concepts/Judge_leniency_designs", "concepts/Instrumental_variables", "concepts/LATE", "concepts/Exclusion_restriction", "concepts/First_stage_relevance"]
related_lectures: ["C1_IV_basics", "C2_LATE", "D1_Panels"]
---
# C3: Judge IV Designs Translation

## Source
- PDF filename: `C3_judge_IV.pdf`
- Generated markdown filename: `AI_READABLE/C3_judge_IV.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline: p1-p2
- Setting, intuition, and measured leniency: p3-p5
- Correct IV framework and assumptions: p6-p8
- Monotonicity/exclusion tests and references: p9-p10

## Comprehensive Translation

### Orientation and setting
Source pages: p1-p3

Core ideas
- Judge IV uses quasi-random assignment of cases to judges with different propensities (leniency/harshness).
- Judge tendency serves as an instrument for case-level treatment intensity (e.g., detention, incarceration).

Definitions and notation
- Unit: case/defendant.
- Instrument: judge leniency measure.
- Endogenous treatment: judicial decision affecting downstream outcomes.

Key results/formulas
- Not formula-heavy in extracted text; design logic is central.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Judge IV is an institutional design exploiting assignment rules, not random sampling of judges.

### Idea and leniency measurement
Source pages: p4-p5

Core ideas
- Construct judge-specific propensity measures from leave-out assignment patterns.
- Variation in leniency predicts treatment assignment across otherwise similar cases.

Definitions and notation
- Leave-one-out judge propensity often used to reduce mechanical correlation.

Key results/formulas
- First-stage relevance requires leniency variation that shifts treatment materially.

Proof sketch / logic
- If judge assignment is as-good-as-random conditional on court-time controls, leniency provides exogenous treatment variation.

Examples or exercises
- Leniency estimation slide emphasizes measurement choices.

Interpretation for applied work
- Proper leniency construction and assignment-window controls are first-order design decisions.

### Correct IV framework and assumptions
Source pages: p6-p8

Core ideas
- Judge IV is valid only if assignment is conditionally random and exclusion holds.
- Monotonicity interpretation must be tied to judge ordering (no "reverse" responders).

Definitions and notation
- Core assumptions:
  - Conditional random assignment to judges.
  - Exclusion: judge affects outcome only via treatment channel of interest.
  - Monotonicity in judge propensity ordering.

Key results/formulas
- IV/LATE interpretation analogous to standard binary-IV framework with instrument-induced margin.

Proof sketch / logic
- Under assumptions, leniency shifts treatment for complier-like cases; IV identifies local effect for marginal cases moved by judge assignment.

Examples or exercises
- Underlying assumptions slides emphasize threats and design checks.

Interpretation for applied work
- Institutional detail is critical: docket assignment rules, judge specialization, and timing controls directly affect validity.

### Testing assumptions and references
Source pages: p9-p10

Core ideas
- Diagnostics target monotonicity and exclusion plausibility.
- Balance checks across judge assignment and placebo outcomes are central.

Definitions and notation
- Notation mostly conceptual in extracted text.

Key results/formulas
- No new derivation shown; emphasis on empirical tests/diagnostics.

Proof sketch / logic
- Assumption tests are indirect/suggestive rather than definitive.

Examples or exercises
- Dedicated slide on tests for monotonicity/exclusion.

Interpretation for applied work
- Report design diagnostics alongside IV estimates; avoid purely mechanical implementation.

## Diagnostics, Pitfalls, and Failure Modes
- Non-random case assignment to judges.
- Judge effects on outcomes through channels other than focal treatment (exclusion failure).
- Measurement error in leniency proxies.
- Weak judge-level first-stage variation.
- Violations of monotonicity due to heterogeneous judge behavior by case type.

## Implementation Checklist
1. Document assignment mechanism and conditioning set that makes assignment plausibly random.
2. Build leave-out leniency measures and verify first-stage strength.
3. Run balance checks for predetermined covariates across instrument variation.
4. Test robustness to alternative leniency definitions and sample windows.
5. Probe exclusion threats using placebo outcomes/channels.
6. Report IV estimate as local effect for judge-shifted margin.

## Structured Extract (for agents)
```yaml
module: judge_iv
source_pdf: C3_judge_IV.pdf
source_pages: 10
estimands:
  - Local IV effect for cases whose treatment is shifted by judge leniency
identification_assumptions:
  - Conditional random assignment to judges
  - Exclusion of direct judge effects on outcome
  - Relevance of leniency instrument
  - Monotonicity with respect to judge tendency
estimators:
  - 2SLS/Wald with judge-leniency instrument
  - Leave-one-out leniency constructions
inference_methods:
  - Robust/clustered inference at appropriate assignment level
diagnostics:
  - Covariate balance by judge instrument
  - First-stage diagnostics
  - Placebo/exclusion checks
  - Sensitivity to leniency measurement
failure_modes:
  - Assignment non-randomness
  - Exclusion violations
  - Weak first stage
  - Monotonicity failure
open_questions:
  - Which assignment controls best recover quasi-random judge variation?
  - How stable is leniency ranking across case types and time?
```

## Extraction Gaps
- Short deck with minimal algebraic detail in extraction; most content is conceptual and institutional.
- Some assumption-test details may be embedded in visual elements not fully captured by text extraction.

## Retrieval Tags
- `judge-iv`
- `leniency-instrument`
- `quasi-random-assignment`
- `exclusion-restriction`
- `monotonicity`
- `local-effects`

## Appendix A: Slide-by-Slide Source Index

- p1: Part C: Instrumental Variables
- p2: C3 Outline
- p3: Setting
- p4: Idea
- p5: Estimated leniency?
- p6: Correct IV framework
- p7: Underlying assumptions
- p8: Underlying assumptions
- p9: Tests for monotonicity and exclusion
- p10: References I

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p5: Judge assignment indicators: `Z_{ki} = 1[Q_i = k]`.
- p5-p6: Judge-level leniency objects are functions of assigned-case treatment rates (with leave-out adjustments to avoid mechanical endogeneity).
- p6: First-stage style representation with judge dummies:
  - `D_i = sum_k pi_k Z_{ki} + u_i` (conceptual linear IV form).
- p6: Leave-one-out leniency construction (as extracted):
  - `L_i^{-i} = [sum_{j != i} 1(Q_j = Q_i) D_j] / [sum_{j != i} 1(Q_j = Q_i)]`.
- p6: Using leniency IV is equivalent to 2SLS with judge-assignment indicators under linear projection equivalence.
- p9: Assumption diagnostics compare `E[D_i|Q_i]` and `E[Y_i|Q_i]` patterns for judge pairs to probe exclusion/monotonicity failures.

Equation-fidelity note:
- This deck is mostly design-conceptual; equations are sparse and some summation lines are abbreviated in extraction.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `Q_i`: judge assignment index.
- `Z_{ki}=1[Q_i=k]`: judge-indicator instrument components.
- `L_k`: judge leniency parameter; `L_i^{-i}`: leave-one-out leniency for case `i`.
- `D_i`: treatment decision affected by judge leniency.

Reconciled extraction artifacts:
- Leave-one-out fractions are normalized to numerator/denominator sums over `j != i` with same judge.
- Equivalence of leniency-IV to 2SLS on judge indicators is kept in standard linear-IV notation.

## Concept Links
- Prerequisites: [[C1_IV_basics]], [[C2_LATE]]
- Core concepts: [[concepts/Judge_leniency_designs]], [[concepts/Instrumental_variables]], [[concepts/LATE]]
- Assumptions: [[concepts/Exclusion_restriction]], [[concepts/First_stage_relevance]]
- Estimands: [[concepts/LATE]]
- Estimation and inference: [[concepts/Two_stage_least_squares]], [[concepts/Judge_leniency_designs]]
- Connected lectures: [[C1_IV_basics]], [[C2_LATE]], [[D1_Panels]]
- Global map: [[ECONOMETRICS_MAP]]
