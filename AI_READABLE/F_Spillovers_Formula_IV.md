---
title: "F Spillovers and Formula IV"
note_type: "lecture_translation"
course: "ARE213"
module: "F"
source_pdf: "F_Spillovers_Formula_IV.pdf"
tags: [are213, econometrics, lecture, spillovers, shift-share, iv]
prerequisites: ["A2_causality", "C1_IV_basics", "D2_Canonical_DiD", "E2_RDD_extensions"]
concept_notes: ["concepts/Interference_and_spillovers", "concepts/Formula_instruments_and_recentering", "concepts/Shift_share_IV", "concepts/Instrumental_variables", "concepts/Neyman_orthogonality"]
related_lectures: ["C1_IV_basics", "C2_LATE", "D4_DiD_extensions", "E2_RDD_extensions"]
---
# F: Spillovers, Formula Treatments, and Shift-Share IV Translation

## Source
- PDF filename: `F_Spillovers_Formula_IV.pdf`
- Generated markdown filename: `AI_READABLE/F_Spillovers_Formula_IV.md`
- Extraction date: `2026-03-04`

## Coverage Map
- Intro/outline and interference recap: p1-p3, p11, p19, p23, p34, p39, p45, p58
- Spillover/interference examples and design responses: p4-p10
- Constructed/formula treatments and instruments: p12-p18
- Non-random exposure to exogenous shocks and recentering framework: p20-p33
- Simulated instruments applications: p35-p38
- Shift-share IV foundations, identification, inference, and applications: p40-p57
- Exogenous-shares approach and Rotemberg weights: p59-p64
- References and conclusion: p65-p68

## Comprehensive Translation

### Orientation and interference recap
Source pages: p1-p3

Core ideas
- Module addresses settings where treatment effects spill across units and where exposures are constructed from shocks and shares.
- Emphasis: design valid estimands and inference when exposure is non-random even if shocks are exogenous.

Definitions and notation
- Interference potential outcomes depend on others' treatments/exposures.

Key results/formulas
- Not central on intro slides.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Avoid naive unit-level treatment framing when network/equilibrium channels are active.

### Spillovers and interference design strategies
Source pages: p4-p10

Core ideas
- Interference often has bipartite/network structure.
- Researchers can target direct effects, indirect effects, or exposure-mapped effects.

Definitions and notation
- Exposure mapping replaces full assignment vector with lower-dimensional exposure summaries.

Key results/formulas
- Direct/spillover effects require potential-outcome indexing by own treatment and peers' treatment.

Proof sketch / logic
- Identification requires assumptions on exposure mapping sufficiency and exogeneity of mapped exposure variation.

Examples or exercises
- Munro example.
- Spatial DiD and spatial RD examples for local spillovers/direct effects.

Interpretation for applied work
- Estimand definition (direct vs spillover) should be explicit before model fitting.

### Constructed (formula) treatments and instruments
Source pages: p12-p18

Core ideas
- Treatment/instrument can be a deterministic function of observed primitives (e.g., treatment environment intensity).
- Nonlinearity and imperfect take-up complicate interpretation.

Definitions and notation
- Formula exposure constructed from underlying assignment/features.

Key results/formulas
- Slides discuss variations:
  - nonlinear spillovers,
  - incomplete take-up,
  - resulting interpretation changes for causal parameters.

Proof sketch / logic
- Constructed variables inherit identifying variation from underlying exogenous components only under correct exposure specification.

Examples or exercises
- Miguel and Kremer sequence and answer-key slides.

Interpretation for applied work
- Formula choice is part of causal model; misspecification can produce OVB even with exogenous primitives.

### Non-random exposure to exogenous shocks and recentering
Source pages: p20-p33

Core ideas
- Even if shocks are exogenous, realized exposure can correlate with confounders due to endogenous shares/networks.
- Recentering adjusts realized exposure by subtracting expected exposure under counterfactual/random benchmark.

Definitions and notation
- Exposure mapping `D_i = sum_s w_{is} g_s` style structure (conceptual in slides).
- Recentered exposure uses expected shift component conditional on share structure.

Key results/formulas
- OVB from correlation between share structure and confounders.
- Recentered exposure:
  - `D_i^R = D_i - E[D_i | shares/counterfactual structure]` (conceptual form).
- Randomization inference can leverage exogenous-shock randomness.

Proof sketch / logic
- Decompose realized exposure into predictable share-driven component plus orthogonal shock-driven component; use orthogonal part for identification.

Examples or exercises
- Railway-upgrade application sequence with counterfactual growth, recentering, and inference.

Interpretation for applied work
- Shock exogeneity is insufficient without exposure-design diagnostics; recentering/testing counterfactual specification is essential.

### Simulated instruments
Source pages: p35-p38

Core ideas
- Simulated instruments use model-based/algorithmic generation of exogenous variation.
- Validity depends on simulation preserving true exogenous structure and not encoding endogenous outcomes.

Definitions and notation
- Simulated shock pathways/instrument values from random draws or calibrated models.

Key results/formulas
- No single formula emphasized; workflow and assumptions are primary.

Proof sketch / logic
- If simulation mechanism is independent of structural errors and relevant for endogenous regressor, IV logic applies.

Examples or exercises
- Obamacare application and additional examples.

Interpretation for applied work
- Transparency on simulation design and validation checks is required for credibility.

### Shift-share IV: foundations and diagnostics
Source pages: p40-p57

Core ideas
- Shift-share instrument combines unit shares with exogenous shifts.
- Identification comes from many quasi-exogenous shifts under assumptions on shocks and shares.
- Inference should match shift-level dependence structure.

Definitions and notation
- Canonical shift-share instrument:
  - `Z_i = sum_s w_{is} g_s`.
- Shares `w_{is}` (possibly incomplete) and shocks `g_s`.

Key results/formulas
- Exogeneity challenge: shares may be endogenous; shifts must be as-good-as-random conditional on controls.
- Consistency from many exogenous shifts under weak cross-shift dependence conditions.
- Exposure-robust/shift-level SEs aggregate at shift dimension rather than only unit dimension.

Proof sketch / logic
- Re-express identifying variation at shift level; IV moment conditions rely on shift exogeneity and sufficient dispersion.

Examples or exercises
- China-shock example and BHJ reanalysis sequence.
- Shift-share meets RD slide.

Interpretation for applied work
- Always report share exogeneity arguments, shift-level controls, and shift-level inference, not only unit-clustered SE.

### Exogenous-shares approach and Rotemberg weights
Source pages: p59-p64

Core ideas
- Alternative identification uses exogenous shares with potentially endogenous shifts.
- Rotemberg weights quantify influence of each shift-level IV component in just-identified decomposition.

Definitions and notation
- Rotemberg weights measure contribution of each instrument component to overall 2SLS estimate.

Key results/formulas
- Decomposition clarifies which shocks drive estimates and where exogeneity concerns concentrate.

Proof sketch / logic
- 2SLS with many instruments can be represented as weighted average of just-identified estimators.

Examples or exercises
- Mariel Boatlift motivating example; pooled DiD perspective; summary of approaches.

Interpretation for applied work
- Influence diagnostics (Rotemberg) are central for transparency in high-dimensional IV constructions.

### References and conclusion
Source pages: p65-p68

Core ideas
- References cover interference, formula IV, recentering, shift-share identification/inference, and applications.

Definitions and notation
- Not applicable.

Key results/formulas
- Not applicable.

Proof sketch / logic
- Not applicable.

Examples or exercises
- Not applicable.

Interpretation for applied work
- Use references for formal proofs and software implementations for exposure-robust inference.

## Diagnostics, Pitfalls, and Failure Modes
- Unmodeled interference/spillovers causing estimand mismatch.
- Exposure-mapping misspecification in formula treatments.
- Endogenous shares contaminating shift-share instruments.
- Ignoring recentering/counterfactual exposure checks.
- Unit-level inference only (without shift-level robustness) understating uncertainty.
- Dominance by a small set of shifts (high Rotemberg concentration).

## Implementation Checklist
1. Define interference structure and target direct/spillover estimands.
2. Construct and justify exposure mapping/formula treatment.
3. Diagnose whether realized exposure is non-random due to shares/network placement.
4. Apply recentering or related corrections when required.
5. For shift-share designs, document exogeneity assumptions on shifts and/or shares.
6. Estimate with appropriate controls and perform shift-level/exposure-robust inference.
7. Report Rotemberg/influence diagnostics and sensitivity to dominant shifts.
8. Use randomization/permutation strategies when shock-randomness structure allows.

## Structured Extract (for agents)
```yaml
module: spillovers_formula_shiftshare
source_pdf: F_Spillovers_Formula_IV.pdf
source_pages: 68
estimands:
  - Direct and spillover effects under exposure mappings
  - Causal effects identified by formula instruments/exposures
  - Shift-share IV local effects
identification_assumptions:
  - Correctly specified exposure mapping for interference context
  - Exogeneity of shocks and/or shares per chosen framework
  - Exclusion and relevance for IV components
  - Appropriate overlap/support in exposure variation
estimators:
  - Exposure-mapped DiD/RD-style estimators
  - Recentered exposure estimators
  - Shift-share 2SLS
  - Simulated-instrument IV estimators
inference_methods:
  - Cluster-robust and randomization inference where applicable
  - Shift-level/exposure-robust standard errors
  - Sensitivity diagnostics via Rotemberg weights
diagnostics:
  - Exposure-mapping validation
  - Counterfactual exposure specification tests
  - Shift-level influence diagnostics
  - Sensitivity to controls and share definitions
failure_modes:
  - Interference mis-modeling
  - Endogenous shares and omitted channels
  - Mis-specified recentering benchmark
  - Underestimated uncertainty from wrong clustering level
open_questions:
  - Which exogeneity path (shifts vs shares) is most credible in application?
  - How concentrated is identifying variation across shifts?
  - Are conclusions robust to alternative exposure mappings?
```

## Extraction Gaps
- Many slides are equation/figure dense; some annotations and notation details are partially lost in plain-text extraction.
- Superscripts/subscripts and special characters are occasionally degraded.

## Retrieval Tags
- `spillovers`
- `interference`
- `formula-instruments`
- `exposure-mapping`
- `recentering`
- `shift-share-iv`
- `rotemberg-weights`
- `exposure-robust-se`
- `simulated-instruments`

## Appendix A: Slide-by-Slide Source Index

- p1: Part F: Spillovers Effects.
- p2: F Outline
- p3: Recap of interference
- p4: Example: Munro (2025)
- p5: Bipartite interference
- p6: What can we do?
- p7: Example: Estimating local geographic spillovers with DiD
- p8: Example 2: Estimating direct effects in spatial RD
- p9: What can we do? (2)
- p10: What can we do? (3)
- p11: Outline
- p12: Constructed (Formula) treatments and instruments
- p13: Example: Miguel and Kremer (2004)
- p14: Variation 1: Nonlinear spillovers
- p15: Variation 2: Imperfect takeup
- p16: Answer key: Miguel and Kremer
- p17: Answer key: Nonlinear spillovers
- p18: Answer key: Incomplete takeup
- p19: Outline
- p20: Non-random exposure to exogenous shocks
- p21: Formal results
- p22: Formal results (2)
- p23: Outline
- p24: Application: Effects of railway upgrades
- p25: First task: Specifying exposure mapping(s) Di
- p26: Realized 2016 network and MA growth
- p27: OVB problems & recentering solution
- p28: Actual vs. counterfactual MA growth
- p29: Expected and recentered MA growth
- p30: Testing the specification of counterfactuals
- p31: Employment effects of HSR
- p32: Inference
- p33: Randomization inference leveraging shock randomness
- p34: Outline
- p35: Example: Simulated instruments
- p36: Simulated instruments
- p37: Application to Obamacare
- p38: More examples
- p39: Outline
- p40: Shift-share IV
- p41: Example 0: Linear spillovers
- p42: Example 1: Labor supply
- p43: Example 2: Enclave instrument for migration
- p44: The SSIV exogeneity challenge
- p45: Outline
- p46: Identification from many exogenous shifts
- p47: Consistency
- p48: Incomplete shares case
- p49: Shift-level controls
- p50: Shift-level (exposure-robust) standard errors
- p51: Shift-level (exposure-robust) standard errors (2)
- p52: Application: China shock (Autor et al. (2013), ADH)
- p53: ADHs shift-share approach
- p54: BHJ revisit ADH
- p55: BHJ revisit ADH
- p56: BHJ revisit ADH
- p57: Shift-share meets RD
- p58: Outline
- p59: Motivating example: Mariel Boatlift (following Card (1990))
- p60: Exogenous shares approach: Pooling diff-in-diffs
- p61: Rotemberg weights
- p62: Summary of two approaches to shift-share IV
- p63: More shift-share IV examples (Borusyak et al. (2025b))
- p64: Conclusion: Formula and shift-share IV
- p65: References I
- p66: References II
- p67: References III
- p68: References IV

## Appendix B: Equation Fidelity Pass

Normalized key equations captured from the source deck:

- p13: Formula treatment (linear exposure mapping):
  - `D_i = sum_k w_{ik} g_k`.
- p14/p17: Nonlinear formula variation example:
  - `D_i = max_k w_{ik} g_k`.
- p20: Baseline linear causal setup for formula-IV analysis:
  - `Y_i = tau D_i + epsilon_i`.
- p20: Candidate instrument from shocks/shares:
  - `Z_i = f_i(g; w)`.
- p21: Expected instrument:
  - `mu_i = E[f_i(g; w) | w]`.
- p21: Recentered instrument:
  - `tilde Z_i = Z_i - mu_i`, with orthogonality goal `E[tilde Z_i epsilon_i]=0`.
- p22: `mu_i` computed as integral over shock distribution:
  - `mu_i = int f_i(g;w) dG(g|w)`.
- p25: Example estimating equation:
  - `Delta Y_i = tau Delta log MA_i + epsilon_i`.
- p40/p42: Shift-share instrument form:
  - `Z_i = sum_k S_{ik} g_k`.
- p42: Labor-supply equation example:
  - `Delta w_i = tau Delta L_i + epsilon_i`.
- p44: SSIV exogeneity target `E[Z_i epsilon_i]=0`.
- p46: Shock-exogeneity condition:
  - `E[g_k | errors, shares] = alpha`.
- p46: Expected SSIV under shift exogeneity:
  - `mu_i = E[sum_k S_{ik} g_k | S_i] = alpha sum_k S_{ik}`.
- p47: Effective number of shifts diagnostic:
  - `N_eff = 1 / sum_k s_k^2`.

Equation-fidelity note:
- Some large-sample shift-level derivations and Rotemberg decomposition lines are truncated in extraction; key defining equations are preserved above.

## Appendix C: Symbol-Level Reconciliation

Canonical symbol map:
- `w_ik`: exposure shares/links; `g_k`: shocks/treatments at source nodes.
- `D_i = sum_k w_ik g_k`: linear formula treatment.
- `Z_i = f_i(g;w)`: formula instrument; `mu_i = E[f_i(g;w)|w]` expected instrument.
- `tilde Z_i = Z_i - mu_i`: recentered instrument.
- Shift-share notation: `Z_i = sum_k S_ik g_k`, shift weights `s_k`, effective shift count `N_eff`.

Reconciled extraction artifacts:
- Nonlinear exposure maps (e.g., max operators) are standardized when extraction truncates symbols.
- Recentered orthogonality conditions are written as `E[tilde Z_i epsilon_i]=0`.
- Shift-level derivation lines with broken summation bounds are represented in normalized shift-share form.

## Concept Links
- Prerequisites: [[A2_causality]], [[C1_IV_basics]], [[D2_Canonical_DiD]], [[E2_RDD_extensions]]
- Core concepts: [[concepts/Interference_and_spillovers]], [[concepts/Formula_instruments_and_recentering]], [[concepts/Shift_share_IV]], [[concepts/Instrumental_variables]]
- Assumptions: [[concepts/Exclusion_restriction]], [[concepts/First_stage_relevance]], [[concepts/SUTVA]]
- Estimands: [[concepts/ATE_ATT_ATU]], [[concepts/LATE]]
- Estimation and inference: [[concepts/Shift_share_IV]], [[concepts/Formula_instruments_and_recentering]], [[concepts/Cluster_robust_inference]]
- Connected lectures: [[C1_IV_basics]], [[C2_LATE]], [[D4_DiD_extensions]], [[E2_RDD_extensions]]
- Global map: [[ECONOMETRICS_MAP]]
