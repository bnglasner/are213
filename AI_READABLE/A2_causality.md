---
title: "A2 Causality"
note_type: "lecture_translation"
course: "ARE213"
module: "A2"
source_pdf: "A2_causality.pdf"
tags: [are213, econometrics, lecture, foundations, causality]
prerequisites: ["A1_regression"]
concept_notes: ["concepts/Potential_outcomes", "concepts/ATE_ATT_ATU", "concepts/SUTVA", "concepts/Internal_vs_external_validity", "concepts/RCT_design", "concepts/Randomization_inference"]
related_lectures: ["B_covariate_adjustment", "C1_IV_basics", "D2_Canonical_DiD", "E1_RDD_basics", "F_Spillovers_Formula_IV"]
---
# A2: Potential Outcomes and RCTs Translation

## Source
- PDF filename: `A2_causality.pdf`
- Generated markdown filename: `AI_READABLE/A2_causality.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Title and repeated outlines: p1, p3, p15, p19, p32, p44
- Section 1. Basics: potential outcomes, causal estimands, and RCT identification: p4-p14
- Section 2. Other estimands beyond mean effects: p16-p18
- Section 3. Conceptual issues and alternative frameworks: p20-p31
- Section 4. Complex RCTs and design/inference with non-simple assignment: p33-p40
- References: p41-p43
- Section 5 (marked "Skipped" in outline but included in deck): causality vs prediction: p45-p47

## Comprehensive Translation

### Orientation and lecture structure
Source pages: p1, p3, p15, p19, p32, p44

Core ideas
- The lecture is organized around five blocks: basic potential-outcome setup, other estimands, conceptual issues and alternatives, complex RCTs, and causality-vs-prediction.
- Outline slides reappear as transitions between modules.

Definitions and notation
- Treatment variable: `D_i in D` (binary in core exposition, generalized later).
- Potential outcomes notation is the organizing language for all later sections.

Key results/formulas
- No new formulas; these pages are structural signposts.

Proof sketch / logic
- Not applicable on outline/title slides.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use the five-part structure as a checklist when translating empirical designs: estimand, identification, conceptual validity, design complexity, decision objective.

### 1) Basics: potential outcomes, average effects, and RCTs
Source pages: p4-p14

Core ideas
- Causality is defined via counterfactual outcomes under alternative treatments.
- Unit-level causal effects are generally unobserved; averages can still be identified under design assumptions.
- RCTs solve internal-validity selection problems by design, not by regression control alone.

Definitions and notation
- Potential outcomes: `{Y_i(d): d in D}`; binary case `(Y_i(0), Y_i(1))`.
- Observed outcome restriction:
  - `Y_i = Y_i(0)` if `D_i=0`, `Y_i = Y_i(1)` if `D_i=1`.
  - Equivalent: `Y_i = Y_i(0) + (Y_i(1)-Y_i(0)) D_i = Y_i(0) + tau_i D_i`.
- Fundamental problem: cannot observe both `Y_i(0)` and `Y_i(1)` for same `i`.
- Average structural function: `d -> E[Y_i(d)]`.
- Weakly causal estimands: `E[omega_i (Y_i(1)-Y_i(0))] / E[omega_i]` with nonnegative weights.
- Main binary estimands:
  - `ATE = E[Y(1)-Y(0)] = E[Y(1)]-E[Y(0)]`
  - `ATT = E[Y(1)-Y(0) | D=1]`
  - `ATU = E[Y(1)-Y(0) | D=0]`

Key results/formulas
- Difference in means decomposition:
  - `beta_OLS = E[Y|D=1]-E[Y|D=0]`
  - `= ATT + (E[Y(0)|D=1]-E[Y(0)|D=0])`
  - second term is selection bias.
- `beta_OLS = ATT` iff mean independence of untreated potential outcomes: `E[Y(0)|D=1]=E[Y(0)|D=0]`.
- `ATE = ATT` iff mean independence of treatment effects across treatment status.
- In an RCT: `(Y(0), Y(1)) independent D`, so internal selection bias is removed.
- Link to linear model:
  - with homogeneous effects `tau_i = beta_1`, `Y_i = beta_0 + beta_1 D_i + epsilon_i` is causal.
  - with heterogeneous effects, OLS in randomized assignment identifies a weighted average that collapses to `E[tau_i]=ATE` under independence conditions.
- Multi-valued/continuous treatment RCT:
  - `D independent {Y(d)}_d` implies `E[Y|D=d]=E[Y(d)]`.
  - Saturated/nonparametric regressions recover `E[Y(d)]`.
  - Linear regression on `D` yields a convexly weighted average slope of the dose-response function.

Proof sketch / logic
- Identification logic is missing-data imputation: treated reveal `E[Y(1)|D=1]`, controls reveal `E[Y(0)|D=0]`; random assignment makes cross-group counterfactual means equal.
- OLS causal interpretation requires assignment assumptions; regression alone does not create causality.

Examples or exercises
- DAG contrast: RCT (`Y=y(D,xi_Y)` with `xi_Y` independent of `D`) vs observational data with confounders `U`.
- External-vs-internal validity example: trial in selected subgroup identifies `E[Y(1)-Y(0)|P]`, not necessarily population ATE.

Interpretation for applied work
- Always separate: (i) estimand of interest, (ii) what randomization identifies, and (iii) whether target population differs from experimental sample.
- For dosage/continuous treatment experiments, avoid overinterpreting a single linear slope unless that weighted-slope estimand is policy-relevant.

### 2) Other estimands beyond average effects
Source pages: p16-p18

Core ideas
- Mean effects (ATE/ATT/ATU) may be insufficient for policy; distributional effects can matter.
- Even with randomization, many distributional causal objects are not identified without additional assumptions.

Definitions and notation
- Distributional targets discussed:
  - `P(Y_1 > Y_0)` (share of beneficiaries)
  - `Med(Y_1-Y_0)` (median gain)
  - `E[Y_1-Y_0 | Y_0 = y_bar]` (gain profile by untreated baseline)
  - `P(Y_1 > y_bar)-P(Y_0 > y_bar)` (threshold-crossing change)

Key results/formulas
- Non-identification example: same treated/control marginals can correspond to very different joint `(Y_0,Y_1)` couplings, yielding different median gains.
- Exception highlighted in slides: threshold-crossing difference is identified from separate marginal distributions.
- Individual-level potential outcomes/effects can be identified only under strong homogeneity restrictions (e.g., `tau_i` constant or modeled as `tau(X_i)`).

Proof sketch / logic
- RCT identifies marginal distributions of `Y_0` and `Y_1`, but not their unit-level pairing absent structure; distributional functionals of joint dependence remain underidentified.

Examples or exercises
- Discrete outcome support `{0,1,2}` example produces equal treated/control distributions under both zero-effect and positive-median-gain data-generating processes.
- IO/trade examples and Berry-Haile quote emphasize that random assignment can identify averages while leaving structural objects (e.g., elasticities) unidentified.

Interpretation for applied work
- When policy depends on tails, winners/losers, or risk distribution, pre-specify estimands beyond means and verify they are identified under your design plus assumptions.

### 3) Conceptual issues with potential outcomes and alternatives
Source pages: p20-p31

Core ideas
- Not every variable can be meaningfully treated as a manipulable cause.
- Treatment definition quality and interference are central modeling assumptions (SUTVA components).
- Alternative frameworks (structural Roy models, DAGs) provide different strengths/limitations.

Definitions and notation
- Manipulability principle ("no causation without manipulation"): attributes like race/gender are generally not direct treatments in strict PO sense.
- SUTVA component 1: treatment must be well-defined and outcome-relevant details encoded in `D`.
- SUTVA component 2 (no unmodeled interference): others' treatment statuses should not affect own outcome unless modeled.
- General interference model: `Y_i(d_1,...,d_N)`.
- Exposure mapping approximation: `Y_i(vec d_i)`, e.g. own treatment and peer-treatment summary.
- Roy framework:
  - original: selection by potential outcomes (`D = arg max_d Y_i(d)` possibly with costs)
  - generalized: selection by utility `R_i(d)=Y_i(d)-C_i(d)`.

Key results/formulas
- No-interference exclusion restriction:
  - `Y_i(d_i, d_-i) = Y_i(d_i, d'_-i) equiv Y_i(d_i)` for all feasible assignments.
- Conceptual critique from Heckman-Vytlacil:
  - limited external validity and mechanism transfer
  - policy relevance of mean-treatment estimands can be limited for marginal reforms.
- Roy identification result cited: without strong restrictions/general-skill distributions, classic Roy model is not identified from one cross section.
- DAG section introduces do-calculus identification logic and then lists limitations for economics practice (randomization emphasis, inference focus, interference/simultaneity handling).

Proof sketch / logic
- Potential outcomes enforce explicit counterfactual definition; weakly defined interventions make counterfactuals ambiguous.
- Interference expands the state space from own `D_i` to network/population assignment vectors, greatly complicating identification.
- Structural models trade nonparametric transparency for potentially stronger extrapolation under stronger assumptions.

Examples or exercises
- Gender-blind auditions and resume studies as manipulable-treatment examples.
- "Attending college increases earnings by X" used to show treatment-definition ambiguity.
- Optional exercise: assess Heckman-Vytlacil Section 4.4 claims.

Interpretation for applied work
- Before estimation, force a precise intervention definition and interference model.
- If extrapolation/mechanism analysis is the objective, assess whether reduced-form PO estimands are sufficient or whether a structural layer is required.

### 4) Complex RCTs and randomization/inference design
Source pages: p33-p40

Core ideas
- Simple Bernoulli RCT assumptions are stronger than necessary for unbiased causal estimation.
- Complex assignment mechanisms can still identify causal effects if assignment probabilities are known/estimable.
- Finite-sample and design-based inference tools matter when asymptotics are weak.

Definitions and notation
- Canonical simple RCT ingredients listed: protocol, randomization, equal assignment probabilities, independent assignment across units.
- Complex centralized assignment example (school offers): individual propensity `p_i = P(D_i=1 | assignment inputs for all families)`.
- Horvitz-Thompson logic for unequal propensities.

Key results/formulas
- In complex RCT with known `p_i` and `0 < p_i < 1`, adjustment/reweighting by `p_i` identifies ATE and related estimands.
- Assignment interdependence can affect efficiency/SE but not identification bias when assignment mechanism is known.
- `N=1` thought experiment:
  - unbiased estimator for `Y_i(1)`: `Y_i/p` if treated, `0` otherwise.
  - unbiased estimator for `Y_i(0)`: `0` if treated, `Y_i/(1-p)` otherwise.
  - difference gives unbiased but noisy estimator of `tau_i`.
- Randomization inference in small samples:
  - exact test for sharp null (e.g., `tau_i=0` or constant `tau_i=c`) via permutation distribution of dependence statistic (e.g., covariance).
  - inversion yields confidence set for constant effect.
- Design efficiency ranking in slides:
  - complete randomization improves over Bernoulli on precision
  - stratified randomization improves balance further
  - for continuous covariates, deterministic balancing designs may dominate pure randomization in efficiency terms (Kasy 2016 discussion).

Proof sketch / logic
- Unbiasedness follows from known assignment probabilities and inverse-probability weighting.
- Exact randomization tests condition on assignment mechanism and avoid large-sample approximations.

Examples or exercises
- Charter-school centralized assignment (Abdulkadiroglu et al. 2017) where naive difference in means is not causal due to induced imbalance.

Interpretation for applied work
- Always recover or reconstruct the assignment algorithm before analysis in non-simple experiments.
- Treat design choice (Bernoulli/complete/stratified/restricted) as an efficiency and inference decision, not just implementation detail.

### 5) Causality vs prediction (lecture labels this block as skipped, but slides include it)
Source pages: p45-p47

Core ideas
- Decision problems may require causal estimation or prediction depending on payoff structure.
- "Need causality" is not universal; it depends on whether action changes outcome or just conditions payoff on state.

Definitions and notation
- Scenario 1 (causal): action `D` changes outcome `Y`; payoff `pi(d)=aY(d)-bd`.
- Scenario 2 (prediction): `Y` unaffected by `D`; payoff slope depends on `Y`, e.g. `pi(d)=aY*d-bd`.

Key results/formulas
- Scenario 1:
  - `E[pi(1)-pi(0)] = a E[Y(1)-Y(0)] - b`
  - optimal rule `D = 1[ E[Y(1)-Y(0)] >= b/a ]`.
- Scenario 2:
  - `E[pi(1)-pi(0)] = a E[Y] - b`
  - optimal rule `D = 1[ E[Y] >= b/a ]`.
- Slide note: scenario 2 can be reframed causally with transformed outcome `tilde Y(D)=Y(1-D)`, but operationally prediction is the core task.

Proof sketch / logic
- Optimize expected utility directly; the needed object is whichever expectation enters payoff differences.

Examples or exercises
- Umbrella example (prediction task).
- Clinical surgery triage, college admissions, and bail decisions as policy-relevant prediction settings.

Interpretation for applied work
- Start from decision objective and utility, then choose between causal design investment and predictive modeling investment.

### References slide block
Source pages: p41-p43

Core ideas
- References support debates on internal/external validity, RCT design, structural alternatives, DAG frameworks, and prediction-vs-causality.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use cited papers as follow-up for each framework choice: design-based RCTs, Roy/structural modeling, DAG identification, and decision-centric prediction.

## Diagnostics, Pitfalls, and Failure Modes
- Selection bias in observational comparisons: `E[Y(0)|D=1]-E[Y(0)|D=0] != 0`.
- External validity gap: experimental subgroup effect `E[Y(1)-Y(0)|P]` may not transport to target population.
- Ill-defined treatment variable (violating treatment-version consistency / SUTVA component).
- Interference/spillovers ignored by single-unit treatment model.
- Overreliance on mean effects when policy objective depends on distributional impacts.
- Misinterpreting OLS coefficient as causal without design-based assumptions.
- In complex RCTs, ignoring assignment algorithm and unit-specific propensities `p_i`.
- Small-sample reliance on asymptotic inference when randomization inference is feasible.
- Conflating causal and predictive objectives in decision problems.

## Implementation Checklist
1. Define intervention precisely (manipulable, policy-relevant, and well-scoped treatment versions).
2. Declare estimand(s): ATE/ATT/ATU and any distributional estimands required for policy.
3. Write the assignment mechanism explicitly (simple randomization, stratified, centralized algorithm, etc.).
4. Verify identification assumptions implied by design: independence, overlap (`0 < p_i < 1`), and interference assumptions.
5. For complex RCTs, compute or estimate unit-level propensity scores from the assignment protocol and adjust via regression/reweighting.
6. Match inference to sample/design: asymptotic robust SEs for large samples; randomization inference for small samples/sharp-null testing.
7. Audit internal validity threats (attrition, noncompliance, spillovers) and external-validity scope.
8. For decision applications, derive payoff-based decision rule and confirm whether causal or predictive object is needed.
9. Document unresolved ambiguities as extraction/modeling gaps before final claims.

## Structured Extract (for agents)
```yaml
module: causality
source_pdf: A2_causality.pdf
source_pages: 47
estimands:
  - ATE = E[Y(1)-Y(0)]
  - ATT = E[Y(1)-Y(0) | D=1]
  - ATU = E[Y(1)-Y(0) | D=0]
  - Weighted weakly causal effects E[omega*(Y(1)-Y(0))]/E[omega], omega>=0
  - Distributional targets: P(Y1>Y0), Med(Y1-Y0), threshold-crossing effects
identification_assumptions:
  - Consistency/realization: Y = Y(D)
  - RCT independence: (Y(0), Y(1)) independent D
  - Overlap for propensity-based adjustment in complex RCTs: 0 < p_i < 1
  - SUTVA: well-defined treatment versions and no unmodeled interference
estimators:
  - Difference in means under simple randomization
  - Saturated/nonparametric regression for multi-valued or continuous treatment RCTs
  - Propensity-adjusted regression/reweighting (Horvitz-Thompson logic) for complex RCTs
  - Randomization-inference test statistics via permutation for sharp nulls
inference_methods:
  - Design-based asymptotic inference with robust/appropriate SEs
  - Exact randomization inference in small samples
diagnostics:
  - Balance checks conditional on assignment design
  - Assignment-protocol validation and propensity-score recovery
  - Attrition/noncompliance monitoring
  - Interference/spillover plausibility checks
  - External-validity target-population audit
failure_modes:
  - Selection bias from nonrandom treatment assignment
  - Ambiguous or non-manipulable treatment definitions
  - Ignoring interference in connected populations
  - Misalignment of estimand (means) with policy objective (distribution/margins)
  - Treating prediction problems as if they require causal experiments (or vice versa)
open_questions:
  - Which distributional effect is policy-relevant in a given application?
  - How much structural restriction is acceptable for extrapolation?
  - What exposure mapping best approximates real interference patterns?
  - When should deterministic balancing designs replace full randomization?
```

## Extraction Gaps
- p2 is effectively blank in extraction.
- p22 has a truncated line ending ("would be better") in extracted text; meaning inferred from context as treatment-definition clarification.
- Mathematical symbols are occasionally degraded by extraction (e.g., some superscripts/subscripts and integral formatting on p14, p38); formulas above follow slide intent where legible.
- Figures/graphical DAG details on p30 are text-described but not fully reconstructable from `page.string` output.

## Retrieval Tags
- `potential-outcomes`
- `rct`
- `ate-att-atu`
- `selection-bias`
- `sutva`
- `interference`
- `distributional-effects`
- `randomization-inference`
- `horvitz-thompson`
- `complex-assignment`
- `external-validity`
- `causality-vs-prediction`

## Appendix A: Slide-by-Slide Source Index

- p1: Part A: Regression and causality
- p2: [NO_TEXT]
- p3: Outline
- p4: (Neyman-)Rubin causal model
- p5: Rubin causal model (2)
- p6: Fundamental problem of causal inference
- p7: Good news
- p8: Weakly causal estimands
- p9: Most common causal estimands
- p10: When is correlation causal?
- p11: What an RCT does
- p12: External vs. internal validity
- p13: Connecting to linear models
- p14: RCT with ordered or continuous treatments
- p15: Outline
- p16: Distribution of gains
- p17: Identification
- p18: Other Parameters: Individual causal effects
- p19: Outline
- p20: What can be a cause/treatment?
- p21: Attributes as treatments
- p22: Poorly defined treatments
- p23: SUTVA (1): Poorly defined treatments
- p24: SUTVA (2): Interference
- p25: Effects of causes vs. causes of effects
- p26: Criticisms by Heckman and Vytlacil (2007)
- p27: Criticisms by Heckman and Vytlacil (2007) (cont.)
- p28: Roy model
- p29: Roy model: Identification
- p30: Another alternative: Directed acyclic graphs (DAGs)
- p31: Some limitations of DAGs
- p32: Outline
- p33: Whats special about RCTs
- p34: Complex RCTs
- p35: Identifying causal effects in complex RCTs
- p36: Whats special about RCTs
- p37: RCT with one subject
- p38: RCT with one subject (2)
- p39: RCT in a small sample: Randomization inference
- p40: RCT without randomization?
- p41: References I
- p42: References II
- p43: References III
- p44: Outline
- p45: Causality vs. prediction
- p46: Causality vs. prediction (2)
- p47: Policy-relevant prediction problems: Examples

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p5: consistency/realization and decomposition:
  - `Y_i = Y_i(D_i)`.
  - binary case: `Y_i = Y_i(0) + (Y_i(1)-Y_i(0)) D_i = Y_i(0) + tau_i D_i`.
- p8: weakly causal weighted estimand:
  - `E[omega_i*(Y_i(1)-Y_i(0))] / E[omega_i]`.
- p9: canonical estimands:
  - `ATE = E[Y(1)-Y(0)] = E[Y(1)]-E[Y(0)]`.
  - `ATT = E[Y(1)-Y(0)|D=1]`.
  - `ATU = E[Y(1)-Y(0)|D=0]`.
- p10: selection-bias decomposition:
  - `beta_OLS = E[Y|D=1]-E[Y|D=0]`
  - `= ATT + (E[Y(0)|D=1]-E[Y(0)|D=0])`.
- p10: `beta_OLS=ATT` iff `E[Y(0)|D=1]=E[Y(0)|D=0]`.
- p11: RCT independence condition:
  - `(Y(0),Y(1)) independent D`.
- p13: linear representation under heterogeneity:
  - `Y_i = beta_0 + tau_i D_i + epsilon_i`.
- p14: multi-valued-treatment RCT identification:
  - `D independent {Y(d)}_d` implies `E[Y|D=d]=E[Y(d)]`.
  - linear regression on `D` yields weighted average slope of `E[Y(d)]`.
- p16-p17: distributional estimands include `P(Y_1>Y_0)`, `Med(Y_1-Y_0)`, and threshold effects.
- p24: no-interference exclusion restriction form:
  - `Y_i(d_i,d_-i)=Y_i(d_i,d'_-i)=Y_i(d_i)`.
- p35: complex-RCT propensity notation:
  - `p_i = P(D_i=1 | assignment inputs)` with overlap `0<p_i<1`.
- p37-p38: `N=1` Horvitz-Thompson logic:
  - unbiased estimators for `Y_i(1)` and `Y_i(0)` via inverse assignment probabilities.
- p39: randomization inference uses permutation distribution of dependence statistic (e.g., covariance) under sharp null.
- p45-p46: decision-theoretic payoff equations:
  - causal setting: `E[pi(1)-pi(0)] = aE[Y(1)-Y(0)] - b`.
  - prediction setting: `E[pi(1)-pi(0)] = aE[Y] - b`.

Equation-fidelity note:
- Some integral/weighting notation and superscripts are partially degraded by extraction; normalized equations above preserve the intended expressions.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `Y_i(d)`: potential outcome under treatment state `d`.
- `D_i`: realized treatment; `Y_i=Y_i(D_i)` consistency notation.
- `tau_i = Y_i(1)-Y_i(0)`: individual causal effect.
- `ATE`, `ATT`, `ATU`: average causal estimands.
- `beta_OLS`: difference-in-means/projection contrast.
- `p_i`: assignment propensity in complex RCT settings.

Reconciled extraction artifacts:
- `Y0`, `Y1` in extraction are normalized to `Y(0)`, `Y(1)`.
- Broken superscripts/subscripts in weighting integrals are represented with ASCII weighted-average notation.
- Randomization-inference symbols (`D_i*`, permutation draws) are retained conceptually where glyphs were degraded.

## Concept Links
- Prerequisites: [[A1_regression]]
- Core concepts: [[concepts/Potential_outcomes]], [[concepts/Fundamental_problem_of_causal_inference]], [[concepts/ATE_ATT_ATU]], [[concepts/SUTVA]], [[concepts/Internal_vs_external_validity]]
- Assumptions: [[concepts/SUTVA]], [[concepts/RCT_design]], [[concepts/Interference_and_spillovers]]
- Estimands: [[concepts/ATE_ATT_ATU]]
- Estimation and inference: [[concepts/RCT_design]], [[concepts/Randomization_inference]]
- Connected lectures: [[B_covariate_adjustment]], [[C1_IV_basics]], [[D2_Canonical_DiD]], [[E1_RDD_basics]], [[F_Spillovers_Formula_IV]]
- Global map: [[ECONOMETRICS_MAP]]
