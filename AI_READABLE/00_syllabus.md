# Course Syllabus Translation

## Source
- PDF: `_Syllabus ARE213_2025.pdf`
- Companion markdown: `00_syllabus.md`

## Translation Status
- This note is a structured translation for AI-agent use.
- In this environment, reliable text extraction from the original PDF was not available due to font encoding; content below is built from the course outline/topic and standard formulations.
- Source PDF remains the authoritative reference for notation/details.

## Purpose
Convert course logistics and topic sequencing into machine-readable structure for downstream retrieval and planning.

## Course Spine
1. `A1_regression.pdf`: linear regression fundamentals.
2. `A2_causality.pdf`: potential outcomes and randomization.
3. `B_covariate_adjustment.pdf`: selection on observables.
4. `C1_IV_basics.pdf`: IV mechanics and weak-IV logic.
5. `C2_LATE.pdf`: heterogeneous effects and complier estimands.
6. `C3_judge_IV.pdf`: examiner/judge designs.
7. `D1_Panels.pdf`: panel estimators and fixed effects.
8. `D2_Canonical_DiD.pdf`: canonical DiD and event studies.
9. `D3_Staggered_adoption.pdf`: staggered treatment timing.
10. `D4_DiD_extensions.pdf`: modern DiD variants.
11. `D5_Factor_models.pdf`: synthetic controls and factor models.
12. `E1_RDD_basics.pdf`: sharp RD.
13. `E2_RDD_extensions.pdf`: fuzzy/spatial/extrapolation RD.
14. `F_Spillovers_Formula_IV.pdf`: interference, shift-share, formula IV.
15. `G_nonlinear.pdf`: multiplicative effects and Poisson models.

## AI-Agent Study Plan
1. Start with A1/A2 before any design-based methods.
2. Learn one identification family at a time (IV, DiD, RD).
3. Pair each estimator with a design-specific diagnostics checklist.
4. Keep a shared dictionary of estimands, assumptions, and threats.

## Global Cross-Cutting Checklist
- What is the causal estimand?
- What identifying assumptions are required?
- Which violations are plausible in this context?
- Which falsification or sensitivity checks are feasible?
- How do standard errors account for dependence/cluster structure?

## Structured Extract (for agents)
```yaml
module: syllabus
source_markdown: 00_syllabus.md
primary_estimands:
  - curriculum
  - sequencing
  - overview
identification_assumptions:
  - course progression
key_diagnostics:
  - scope checks
```

## Retrieval Tags
- `curriculum`
- `overview`
- `sequencing`
- `syllabus`
