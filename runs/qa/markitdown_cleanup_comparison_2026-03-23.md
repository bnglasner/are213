# MarkItDown Cleanup Comparison (2026-03-23)

## Scope
- Base input: `literature/derived/markitdown_raw/*.md`
- Cleaned output: `literature/derived/markitdown_clean/*.md`
- Cleanup script: `platform/scripts/cleanup_markitdown.py`
- Files evaluated: 16

## Aggregate Delta
- Avg score: **55.8 -> 91.9** (delta 36.1)
- Severity before: HIGH=15, MEDIUM=0, LOW=1
- Severity after: HIGH=0, MEDIUM=0, LOW=16
- Primary gains: near-elimination of pipe-table noise and full removal of `(cid:...)` tokens.

## Largest Improvements
- `A1_regression.md`: score 25.4 -> 100.0 (delta 74.6), pipe 0.496 -> 0.0, cid 141 -> 0
- `A2_causality.md`: score 18.0 -> 90.0 (delta 72.0), pipe 0.554 -> 0.0, cid 84 -> 0
- `B_covariate_adjustment.md`: score 41.0 -> 90.0 (delta 49.0), pipe 0.596 -> 0.0, cid 38 -> 0
- `E2_RDD_extensions.md`: score 60.0 -> 100.0 (delta 40.0), pipe 0.577 -> 0.0, cid 0 -> 0
- `G_nonlinear.md`: score 53.0 -> 90.0 (delta 37.0), pipe 0.604 -> 0.004, cid 14 -> 0

## Lowest Post-Cleanup Scores
- `00_syllabus.md`: score=90.0, severity=LOW, lines=240
- `A2_causality.md`: score=90.0, severity=LOW, lines=679
- `B_covariate_adjustment.md`: score=90.0, severity=LOW, lines=451
- `C1_IV_basics.md`: score=90.0, severity=LOW, lines=818
- `C2_LATE.md`: score=90.0, severity=LOW, lines=555

## Per-File Delta Table
| File | Score (old->new) | Pipe Ratio (old->new) | CID (old->new) | Severity (old->new) |
| --- | ---: | ---: | ---: | --- |
| `00_syllabus.md` | 90.0 -> 90.0 | 0.0 -> 0.0 | 0 -> 0 | LOW -> LOW |
| `A1_regression.md` | 25.4 -> 100.0 | 0.496 -> 0.0 | 141 -> 0 | HIGH -> LOW |
| `A2_causality.md` | 18.0 -> 90.0 | 0.554 -> 0.0 | 84 -> 0 | HIGH -> LOW |
| `B_covariate_adjustment.md` | 41.0 -> 90.0 | 0.596 -> 0.0 | 38 -> 0 | HIGH -> LOW |
| `C1_IV_basics.md` | 60.0 -> 90.0 | 0.516 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `C2_LATE.md` | 59.0 -> 90.0 | 0.594 -> 0.0 | 2 -> 0 | HIGH -> LOW |
| `C3_judge_IV.md` | 60.9 -> 90.0 | 0.491 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `D1_Panels.md` | 60.0 -> 90.0 | 0.567 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `D2_Canonical_DiD.md` | 67.0 -> 100.0 | 0.545 -> 0.0 | 6 -> 0 | HIGH -> LOW |
| `D3_Staggered_adoption.md` | 60.0 -> 90.0 | 0.535 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `D4_DiD_extensions.md` | 60.0 -> 90.0 | 0.572 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `D5_Factor_models.md` | 59.0 -> 90.0 | 0.511 -> 0.0 | 2 -> 0 | HIGH -> LOW |
| `E1_RDD_basics.md` | 60.0 -> 90.0 | 0.516 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `E2_RDD_extensions.md` | 60.0 -> 100.0 | 0.577 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `F_Spillovers_Formula_IV.md` | 60.0 -> 90.0 | 0.573 -> 0.0 | 0 -> 0 | HIGH -> LOW |
| `G_nonlinear.md` | 53.0 -> 90.0 | 0.604 -> 0.004 | 14 -> 0 | HIGH -> LOW |
