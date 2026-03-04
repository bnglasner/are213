# Method-Family Code Audit Checklists

## Purpose
Provide deterministic audit checks by design family for `econ-code-review`.

## Priority Labels
- `Mandatory`: omission should usually be `critical` or `major`.
- `Secondary`: omission should usually be `minor` unless it clearly changes conclusions.

## IV / LATE Checklist
1. [Mandatory] Verify instrument construction is deterministic and reproducible in code.
2. [Mandatory] Verify first-stage model is explicitly estimated and reported.
3. [Mandatory] Verify weak-IV diagnostics are computed and interpreted.
4. [Mandatory] Verify exclusion-sensitive checks are implemented (placebos, alternative channels).
5. [Secondary] Verify monotonicity interpretation caveats are documented for LATE claims.
6. [Secondary] Verify clustering/SE choices match instrument variation level.

## Canonical DiD Checklist
1. [Mandatory] Verify treatment timing is correctly coded relative to event time.
2. [Mandatory] Verify pre-treatment windows and pre-trend tests are implemented.
3. [Mandatory] Verify no-anticipation checks or leads are present.
4. [Mandatory] Verify fixed effects structure matches design narrative.
5. [Secondary] Verify clustering at appropriate shock/treatment variation level.
6. [Secondary] Verify placebo timing or placebo outcome checks are included.

## Staggered Adoption DiD Checklist
1. [Mandatory] Verify estimator is robust to treatment-effect heterogeneity (not naive TWFE only).
2. [Mandatory] Verify event-time support and cohort composition are diagnosed.
3. [Mandatory] Verify weighting/pathology diagnostics are inspected.
4. [Mandatory] Verify never-treated/not-yet-treated comparison logic is explicit.
5. [Secondary] Verify dynamic treatment effect interpretation is cohort-aware.
6. [Secondary] Verify inference strategy is robust to serial correlation and clustering choices.

## RDD Checklist
1. [Mandatory] Verify running variable and cutoff are constructed exactly as documented.
2. [Mandatory] Verify manipulation/density checks around cutoff are implemented.
3. [Mandatory] Verify local polynomial/bandwidth sensitivity analysis is implemented.
4. [Secondary] Verify covariate continuity checks near cutoff are run.
5. [Mandatory] Verify fuzzy RD uses local Wald logic and first-stage discontinuity checks.
6. [Secondary] Verify inference method matches local sample and dependence structure.

## Spillovers / Exposure Checklist
1. [Mandatory] Verify exposure mapping function is explicit and reproducible.
2. [Mandatory] Verify alternative exposure definitions are tested.
3. [Secondary] Verify interference assumptions are explicit in code comments/docs.
4. [Mandatory] Verify dependence-robust inference adjustments are considered.

## Nonlinear / PPML Checklist
1. [Mandatory] Verify estimator choice aligns with outcome support and interpretation target.
2. [Mandatory] Verify zero outcomes and separation behavior are addressed.
3. [Secondary] Verify sensitivity relative to alternative nonlinear specifications.
4. [Secondary] Verify cluster-robust or dependence-robust inference is implemented.

## Cross-Cutting Checklist
1. [Mandatory] Verify sample construction in code matches `research_brief.yaml`.
2. [Mandatory] Verify variable definitions match intake and method memo.
3. [Secondary] Verify all tables/figures are traceable to script outputs.
4. [Secondary] Verify seeds, versions, and deterministic execution details are captured.
