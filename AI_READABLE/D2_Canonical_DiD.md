---
title: "D2 Canonical DiD"
note_type: "lecture_translation"
course: "ARE213"
module: "D2"
source_pdf: "D2_Canonical_DiD.pdf"
tags: [are213, econometrics, lecture, did]
prerequisites: ["A2_causality", "D1_Panels"]
concept_notes: ["concepts/Difference_in_differences", "concepts/Parallel_trends", "concepts/Event_study", "concepts/Fixed_effects"]
related_lectures: ["D3_Staggered_adoption", "D4_DiD_extensions", "E1_RDD_basics"]
---
# D2: Canonical Difference-in-Differences Translation

## Source
- PDF filename: `D2_Canonical_DiD.pdf`
- Generated markdown filename: `AI_READABLE/D2_Canonical_DiD.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro and outline: p1-p3, p13, p19
- 2x2 DiD setup and assumptions: p4-p12
- Multi-period/multi-unit TWFE/event-study framework: p14-p18
- Pre-trends and parallel-trends diagnostics/critique: p20-p32
- References: p33-p34

## Comprehensive Translation

### Orientation
Source pages: p1-p3

Core ideas
- D2 introduces canonical DiD and the central parallel-trends requirement.
- It then shows where common empirical practices can mislead.

Definitions and notation
- Treated vs control groups, pre vs post periods.

Key results/formulas
- Not central on intro slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- BART/ubiquity slide motivates broad usage.

Interpretation for applied work
- DiD validity hinges on design assumptions, not on use of a specific regression command.

### 2x2 DiD and parallel trends
Source pages: p4-p12

Core ideas
- DiD compares changes over time between treated and control groups.
- Parallel trends in untreated potential outcomes is the key identifying assumption.

Definitions and notation
- Potential outcome decomposition with untreated trend and treatment effect.
- PTA:
  - `E[Y_t(0)-Y_{t-1}(0) | treated] = E[Y_t(0)-Y_{t-1}(0) | control]`.

Key results/formulas
- 2x2 DiD estimand:
  - `(E[Y|T=1,Post=1]-E[Y|T=1,Post=0]) - (E[Y|T=0,Post=1]-E[Y|T=0,Post=0])`.
- Under PTA, this equals ATT for treated units in post period.

Proof sketch / logic
- Difference over time removes time-invariant group differences; second difference removes common aggregate shocks.

Examples or exercises
- Card-Krueger minimum-wage example anchors intuition.
- Slides discuss common 2x2 design problems.

Interpretation for applied work
- Always articulate why untreated trends are comparable before treatment.

### Multi-period DiD and event studies
Source pages: p14-p18

Core ideas
- With multiple periods, TWFE/event-study regressions are common implementations.
- Identification still relies on untreated-trend assumptions, now over multiple horizons.

Definitions and notation
- Static TWFE:
  - `Y_it = alpha_i + lambda_t + beta D_it + u_it`.
- Dynamic event-study specification with leads/lags of treatment timing.

Key results/formulas
- Pre-treatment lead coefficients are often used as informal diagnostics.
- Dynamic coefficients aim to trace treatment path over event time.

Proof sketch / logic
- TWFE/event-study are linear projections that require homogeneous-effect/weighting assumptions for direct causal interpretation.

Examples or exercises
- Event-study plot illustration.

Interpretation for applied work
- Separate estimation mechanics from identification assumptions and estimand definition.

### Pitfalls of pre-trend testing and PTA justification
Source pages: p20-p32

Core ideas
- Pre-trend tests are informative but limited; non-rejection is not proof of PTA.
- Conceptual and statistical issues can distort interpretations of event-study/pre-test workflows.

Definitions and notation
- Pre-test logic examines coefficients on pre-treatment leads.

Key results/formulas
- Key critique themes in slides:
  - pre-tests can be underpowered,
  - can induce selection distortions when conditioning on passing,
  - conflate testing and estimation in dynamic plots,
  - may be conceptually uninformative in some contexts.

Proof sketch / logic
- Low power and conditional inference distortions imply "no significant pre-trend" is weak evidence for identifying assumptions.

Examples or exercises
- Yagan (2015) example and raw-data plotting discussion.
- "Straight line test" shown as alternative diagnostic perspective.

Interpretation for applied work
- Build ex-ante economic justification for PTA and complement with transparent diagnostics.

### References block
Source pages: p33-p34

Core ideas
- References focus on DiD identification, pre-trend interpretation, and empirical best practice.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for pre-testing corrections and robust DiD design guidance.

## Diagnostics, Pitfalls, and Failure Modes
- Relying on pre-trend non-rejection as sole evidence for PTA.
- Inappropriate functional form (levels/logs) for trend comparability.
- Event-study specification interpreted causally despite weighting/composition issues.
- Anticipation/spillovers violating canonical assumptions.
- Ignoring differential shocks between groups.

## Implementation Checklist
1. Define treated/control groups and treatment timing clearly.
2. State target ATT estimand and potential-outcomes assumptions.
3. Justify PTA substantively before showing regression output.
4. Estimate 2x2 or multi-period DiD with transparent coding and fixed effects.
5. Plot raw outcomes by group/time alongside model-based event-study coefficients.
6. Conduct pre-trend and placebo checks, but interpret them as suggestive.
7. Report robustness to functional form and alternative control groups.

## Structured Extract (for agents)
```yaml
module: canonical_did
source_pdf: D2_Canonical_DiD.pdf
source_pages: 34
estimands:
  - 2x2 ATT under parallel trends
  - Dynamic treatment effects in event-time frameworks
identification_assumptions:
  - Parallel trends in untreated outcomes
  - No confounding shocks differentially aligned with treatment timing
  - Consistency/no interference for canonical setup
estimators:
  - 2x2 difference-in-differences
  - TWFE static regression
  - Event-study regressions with leads/lags
inference_methods:
  - Cluster-robust inference (typically at treatment-assignment unit)
  - Joint tests for pre-trend coefficients (with caveats)
diagnostics:
  - Raw trend plots by treatment status
  - Pre-trend/placebo checks
  - Functional-form sensitivity (levels vs logs)
  - Alternative control-group robustness
failure_modes:
  - Overconfidence from weak pre-trend tests
  - Event-study misinterpretation under heterogeneous effects
  - Unjustified PTA
open_questions:
  - Is PTA plausible in the policy context?
  - Are diagnostics sufficiently powered to detect meaningful violations?
  - Does specification choice alter substantive conclusions?
```

## Extraction Gaps
- Some slide numbers/titles include duplicated or slightly corrupted text in extraction.
- Figure annotations on event-study plots are partially missing in plain-text output.

## Retrieval Tags
- `difference-in-differences`
- `parallel-trends`
- `twfe`
- `event-study`
- `pretrend-tests`
- `att`
- `policy-evaluation`

## Appendix A: Slide-by-Slide Source Index

- p1: Part D: Panel Data Methods
- p2: Its everywhere
- p3: D2 outline
- p4: Difference-in-differences: Idea
- p5: Card and Krueger (1994)
- p6: Is this causal?
- p7: Parallel trends (PTA)
- p8: PTA = TWFE for Y(0)
- p9: 2x2 DiD estimator
- p10: Problems with 2x2 designs (1)
- p11: Problems with 2x2 designs (2)
- p12: Problems with 2x2 designs (2)
- p13: Outline
- p14: Causal structure with multiple periods
- p15: PTA with multiple units and periods
- p16: Static TWFE specification
- p17: Dynamic event study specification
- p18: Example event study plot
- p19: Outline
- p20: #1: Pre-trend tests are at best suggestive
- p21: #2: Justifying PTA ex ante
- p22: PTA in levels vs. logs
- p23: Justifying PTA is important
- p24: Example: Yagan (2015)
- p25: Yagan (2015): Plotting raw data
- p26: #3: Pre-testing problems (Roth, 2022)
- p27: #4: Event studies conflate estimation and testing
- p28: #5: Pre-trend tests are not always conceptually informative
- p29: #6: Pre-trend tests are not always powerful (Roth, 2022)
- p30: #6: Pre-trend tests are now always powerful (Roth, 2022)
- p31: #6: Pre-trend tests are now always powerful (Roth, 2022)
- p32: The Straight line test
- p33: References I
- p34: References II

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p6: Potential outcomes setup: `Y_it = Y_it(D_it)`, `tau_it = Y_it(1)-Y_it(0)`.
- p6-p7: 2x2 target estimand: `ATT = tau_{NJ,2}` in canonical example.
- p7: Parallel trends (PTA):
  - `E[Y_{NJ,2}(0)-Y_{NJ,1}(0)] = E[Y_{PA,2}(0)-Y_{PA,1}(0)]`.
- p8: PTA equivalence to additive untreated model in 2x2:
  - `E[Y_it(0)] = alpha_i + beta_t`.
- p9: 2x2 DiD estimator:
  - `(Y_{NJ,2}-Y_{NJ,1}) - (Y_{PA,2}-Y_{PA,1})`.
- p15: Multi-period untreated PTA in additive form:
  - `E[Y_it(0)] = alpha_i + beta_t`.
- p16: Static TWFE DiD:
  - `Y_it = alpha_i + beta_t + tau D_it + epsilon_it`, with `D_it = G_i * Post_t`.
- p17: Event-study form:
  - `Y_it = alpha_i + beta_t + sum_h tau_h 1[t-E=h]*G_i + epsilon_it`, normalized with `tau_{-1}=0`.
- p14: Dynamic-treatment caution includes potential outcomes with lags, e.g. `Y_i6 = Y_i6(D_i5, D_i6)`.

Equation-fidelity note:
- Several displayed TWFE/event-study coefficient formulas are line-broken in extraction; normalized equations above retain their full intended forms.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `Y_it(d)`: potential outcomes under treatment state `d`.
- `D_it`: treatment indicator; `G_i`: treated-group indicator; `Post_t`: post indicator.
- `ATT`: average treatment effect on treated in target period/group.
- `alpha_i`, `beta_t`: unit/time fixed effects in TWFE untreated model.
- `tau_h`: event-time coefficient at horizon `h`.

Reconciled extraction artifacts:
- 2x2 contrasts are normalized to standard difference-in-differences formula.
- Event-study leads/lags are written as `1[t-E=h]*G_i` with normalization `tau_{-1}=0`.
- Broken equalities around PTA/TWFE equivalence are represented with additive untreated-outcome model notation.

## Concept Links
- Prerequisites: [[A2_causality]], [[D1_Panels]]
- Core concepts: [[concepts/Difference_in_differences]], [[concepts/Parallel_trends]], [[concepts/Event_study]], [[concepts/Fixed_effects]]
- Assumptions: [[concepts/Parallel_trends]], [[concepts/SUTVA]]
- Estimands: [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/Event_study]], [[concepts/Cluster_robust_inference]]
- Connected lectures: [[D3_Staggered_adoption]], [[D4_DiD_extensions]], [[E1_RDD_basics]]
- Global map: [[ECONOMETRICS_MAP]]
