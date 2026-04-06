# AI-Readable ARE213 Companions

This folder contains one machine-friendly markdown companion per lecture PDF plus an Obsidian-style concept graph.

## Obsidian Graph Structure
- Global hub: `ECONOMETRICS_MAP.md`
- Concept library: `concepts/*.md`
- Lecture notes: `A1` through `G` companion files

Each lecture file now includes:
- YAML frontmatter (`module`, `source_pdf`, `prerequisites`, `concept_notes`, `related_lectures`)
- Comprehensive translation sections (page-cited)
- `Appendix A`: slide-by-slide source index
- `Appendix B`: equation fidelity pass
- `Appendix C`: symbol-level reconciliation
- `Concept Links`: wiki links to assumptions, estimands, methods, and related lectures

## Recommended Navigation
1. Start at `ECONOMETRICS_MAP.md`.
2. Follow `Lecture Dependency Path` for sequence.
3. Open concept notes from `concepts/` when you need notation harmonization across modules.
4. Use each lecture's `Concept Links` section for local graph traversal.

## Files
- `00_syllabus.md` (source: `_Syllabus ARE213_2025.pdf`)
- `A1_regression.md` (source: `A1_regression.pdf`)
- `A2_causality.md` (source: `A2_causality.pdf`)
- `B_covariate_adjustment.md` (source: `B_covariate_adjustment.pdf`)
- `C1_IV_basics.md` (source: `C1_IV_basics.pdf`)
- `C2_LATE.md` (source: `C2_LATE.pdf`)
- `C3_judge_IV.md` (source: `C3_judge_IV.pdf`)
- `D1_Panels.md` (source: `D1_Panels.pdf`)
- `D2_Canonical_DiD.md` (source: `D2_Canonical_DiD.pdf`)
- `D3_Staggered_adoption.md` (source: `D3_Staggered_adoption.pdf`)
- `D4_DiD_extensions.md` (source: `D4_DiD_extensions.pdf`)
- `D5_Factor_models.md` (source: `D5_Factor_models.pdf`)
- `E1_RDD_basics.md` (source: `E1_RDD_basics.pdf`)
- `E2_RDD_extensions.md` (source: `E2_RDD_extensions.pdf`)
- `F_Spillovers_Formula_IV.md` (source: `F_Spillovers_Formula_IV.pdf`)
- `G_nonlinear.md` (source: `G_nonlinear.pdf`)
- `ECONOMETRICS_MAP.md` (Obsidian hub)
- `concepts/` (cross-lecture concept notes)
