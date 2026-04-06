# MarkItDown Rebuild QA (2026-03-23)

## Scope
- Rebuilt lecture-note markdown from slide PDFs using `markitdown` CLI (repo source install).
- Output folder: `literature/derived/markitdown_raw`
- Files attempted: 16
- Successful conversions: 16
- Metrics CSV: `runs/qa/markitdown_rebuild_metrics_2026-03-23.csv`

## Summary
- Average heuristic quality score: **55.8/100**
- Severity distribution: HIGH=15, MEDIUM=0, LOW=1
- Primary failure mode: table over-detection (many slide lines rendered as markdown tables).
- Secondary failure mode: notation artifacts (`(cid:...)`) on some decks.

## Worst 5 Files
- `A2_causality.md` from `A2_causality.pdf`: score=18.0, severity=HIGH, cid_tokens=84, pipe_ratio=0.554
- `A1_regression.md` from `A1_regression.pdf`: score=25.4, severity=HIGH, cid_tokens=141, pipe_ratio=0.496
- `B_covariate_adjustment.md` from `B_covariate_adjustment.pdf`: score=41.0, severity=HIGH, cid_tokens=38, pipe_ratio=0.596
- `G_nonlinear.md` from `G_nonlinear.pdf`: score=53.0, severity=HIGH, cid_tokens=14, pipe_ratio=0.604
- `C2_LATE.md` from `C2_LATE.pdf`: score=59.0, severity=HIGH, cid_tokens=2, pipe_ratio=0.594

## Best 5 Files
- `00_syllabus.md` from `_Syllabus ARE213_2025.pdf`: score=90.0, severity=LOW, cid_tokens=0, pipe_ratio=0.0
- `D2_Canonical_DiD.md` from `D2_Canonical_DiD.pdf`: score=67.0, severity=HIGH, cid_tokens=6, pipe_ratio=0.545
- `C3_judge_IV.md` from `C3_judge_IV.pdf`: score=60.9, severity=HIGH, cid_tokens=0, pipe_ratio=0.491
- `C1_IV_basics.md` from `C1_IV_basics.pdf`: score=60.0, severity=HIGH, cid_tokens=0, pipe_ratio=0.516
- `E1_RDD_basics.md` from `E1_RDD_basics.pdf`: score=60.0, severity=HIGH, cid_tokens=0, pipe_ratio=0.516

## Per-File Metrics
| Output | PDF | Pages | Lines | CID Tokens | Pipe Ratio | Score | Severity |
| --- | --- | ---:| ---:| ---:| ---:| ---:| --- |
| `00_syllabus.md` | `_Syllabus ARE213_2025.pdf` | 5 | 255 | 0 | 0.0 | 90.0 | LOW |
| `A1_regression.md` | `A1_regression.pdf` | 64 | 1179 | 141 | 0.496 | 25.4 | HIGH |
| `A2_causality.md` | `A2_causality.pdf` | 47 | 884 | 84 | 0.554 | 18.0 | HIGH |
| `B_covariate_adjustment.md` | `B_covariate_adjustment.pdf` | 31 | 555 | 38 | 0.596 | 41.0 | HIGH |
| `C1_IV_basics.md` | `C1_IV_basics.pdf` | 65 | 1054 | 0 | 0.516 | 60.0 | HIGH |
| `C2_LATE.md` | `C2_LATE.pdf` | 41 | 719 | 2 | 0.594 | 59.0 | HIGH |
| `C3_judge_IV.md` | `C3_judge_IV.pdf` | 10 | 172 | 0 | 0.491 | 60.9 | HIGH |
| `D1_Panels.md` | `D1_Panels.pdf` | 39 | 641 | 0 | 0.567 | 60.0 | HIGH |
| `D2_Canonical_DiD.md` | `D2_Canonical_DiD.pdf` | 34 | 415 | 6 | 0.545 | 67.0 | HIGH |
| `D3_Staggered_adoption.md` | `D3_Staggered_adoption.pdf` | 50 | 873 | 0 | 0.535 | 60.0 | HIGH |
| `D4_DiD_extensions.md` | `D4_DiD_extensions.pdf` | 36 | 547 | 0 | 0.572 | 60.0 | HIGH |
| `D5_Factor_models.md` | `D5_Factor_models.pdf` | 31 | 515 | 2 | 0.511 | 59.0 | HIGH |
| `E1_RDD_basics.md` | `E1_RDD_basics.pdf` | 43 | 546 | 0 | 0.516 | 60.0 | HIGH |
| `E2_RDD_extensions.md` | `E2_RDD_extensions.pdf` | 36 | 612 | 0 | 0.577 | 60.0 | HIGH |
| `F_Spillovers_Formula_IV.md` | `F_Spillovers_Formula_IV.pdf` | 68 | 1163 | 0 | 0.573 | 60.0 | HIGH |
| `G_nonlinear.md` | `G_nonlinear.pdf` | 20 | 355 | 14 | 0.604 | 53.0 | HIGH |
