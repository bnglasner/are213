# Assumption-to-Diagnostic Map

## Purpose
Provide a standard mapping from identification/inference assumptions to concrete diagnostics and failure signatures.

## How to Use
1. Start from routed design family in `reports/method_memo.md`.
2. Select relevant assumptions below.
3. For each assumption, report:
- evidence present
- required diagnostics
- observed result pattern
- residual risk

## Mapping Table

| Assumption | Design Families | Core Diagnostic Checks | Failure Signatures | Key References |
|---|---|---|---|---|
| Random assignment exogeneity | RCT | Baseline covariate balance by assignment; assignment algorithm audit; differential attrition by arm | Systematic baseline imbalance unexplained by chance; attrition correlated with treatment | `AI_READABLE/A2_causality.md`, `AI_READABLE/concepts/RCT_design.md` |
| Stable treatment definition (well-defined intervention) | RCT, DiD, IV, RDD | Treatment coding audit; protocol/documentation consistency; alternative treatment codings | Results hinge on coding ambiguity; multiple inconsistent treatment definitions | `AI_READABLE/A2_causality.md`, `AI_READABLE/concepts/SUTVA.md` |
| No unmodeled interference (or valid exposure mapping) | RCT, DiD, Spillovers | Compare alternative exposure definitions; placebo network exposure tests; spatial spillover sensitivity | Large effect instability across exposure maps; residual cross-unit dependence unexplained | `AI_READABLE/F_Spillovers_Formula_IV.md`, `AI_READABLE/concepts/Interference_and_spillovers.md` |
| Conditional independence (CIA) | Selection on observables | Covariate balance after weighting/matching; specification perturbations; covariate support diagnostics | Persistent imbalance after adjustment; strong model dependence of effect sizes | `AI_READABLE/B_covariate_adjustment.md`, `AI_READABLE/concepts/Conditional_independence_assumption.md` |
| Overlap / common support | Selection on observables | Propensity score overlap plots; tail trimming sensitivity; effective sample size checks | Near-zero or near-one propensity mass; unstable weights; small effective sample | `AI_READABLE/B_covariate_adjustment.md`, `AI_READABLE/concepts/Overlap_common_support.md` |
| Instrument relevance | IV/LATE, Fuzzy RD | First-stage coefficient and F-stat diagnostics; reduced-form consistency | Weak first stage; wide/unstable IV estimates; inflated SEs | `AI_READABLE/C1_IV_basics.md`, `AI_READABLE/concepts/First_stage_relevance.md` |
| Exclusion restriction | IV/LATE, Fuzzy RD | Overidentification-style checks where available; placebo outcomes/channels; mechanism falsification probes | Instrument predicts outcomes through non-treatment channels; inconsistent sign/magnitude patterns | `AI_READABLE/C1_IV_basics.md`, `AI_READABLE/concepts/Exclusion_restriction.md` |
| Monotonicity (for LATE interpretation) | IV/LATE, Fuzzy RD, Judge IV | Institutional argument for no defiers; subgroup first-stage sign checks | Subgroup evidence of sign reversals in first stage; implausible complier interpretation | `AI_READABLE/C2_LATE.md`, `AI_READABLE/concepts/LATE.md` |
| Parallel trends | Canonical DiD, Staggered DiD | Pre-treatment event-study diagnostics; placebo leads; matched-trend robustness | Significant differential pre-trends; strong sensitivity to trend controls | `AI_READABLE/D2_Canonical_DiD.md`, `AI_READABLE/concepts/Parallel_trends.md` |
| No anticipation | DiD, Staggered DiD | Lead coefficients near zero; event-window shifts; policy information-timing checks | Significant pre-treatment lead effects near adoption | `AI_READABLE/D4_DiD_extensions.md`, `AI_READABLE/concepts/Event_study.md` |
| Staggered estimator validity under heterogeneity | Staggered DiD | Compare heterogeneity-robust estimators; inspect weighting/pathology diagnostics | Divergent estimates across estimators due to weighting artifacts | `AI_READABLE/D3_Staggered_adoption.md`, `AI_READABLE/concepts/Staggered_adoption_DiD.md` |
| Continuity at cutoff | RDD | Covariate smoothness at cutoff; density/manipulation tests; donut-hole sensitivity | Discontinuities in predetermined covariates; sorting/manipulation at threshold | `AI_READABLE/E1_RDD_basics.md`, `AI_READABLE/concepts/Regression_discontinuity.md` |
| Local functional-form adequacy / bandwidth robustness | RDD | Local polynomial order sensitivity; bandwidth sweep; bias-corrected intervals | Strong sign/magnitude swings across bandwidth/specification choices | `AI_READABLE/E1_RDD_basics.md`, `AI_READABLE/E2_RDD_extensions.md` |
| Dependence structure for inference | Panels, DiD, RDD, Spillovers | Cluster-level choice audit; multiway/spatial HAC alternatives; few-cluster adjustments | Inference flips under plausible dependence corrections | `AI_READABLE/A1_regression.md`, `AI_READABLE/concepts/Cluster_robust_inference.md` |
| Outcome model suitability in nonlinear settings | Nonlinear/PPML | Compare PPML vs log-linear alternatives; influence checks; zero-outcome handling audit | Strong sensitivity to estimator choice and zero handling | `AI_READABLE/G_nonlinear.md`, `AI_READABLE/concepts/PPML.md` |

## Priority Defaults for Auditor
1. Flag as `critical` when a core identification assumption has no supporting evidence.
2. Flag as `major` when evidence exists but diagnostics fail or are incomplete.
3. Flag as `minor` when diagnostics pass but robustness coverage is thin.
4. Flag as `nice-to-have` for precision and communication improvements only.
