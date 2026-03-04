---
name: design-mapper
description: Map a research brief to one or more causal/econometric design families and define required assumptions and diagnostics. Use after intake is complete and before running any code-level review.
---

# Design Mapper

## Workflow
1. Read `reports/research_brief.yaml`.
2. Apply routing rules in `references/design-family-routing.md`.
3. Use lookup table in `references/method-to-file-index.md` to gather method files.
4. Assign primary design family and any secondary fallback design.
5. For each family, list identification assumptions and required diagnostics.
6. Identify method-specific risks and practical failure modes.
7. Enforce `references/method-memo-contract.md`.
8. Write `reports/method_memo.md` using `templates/method_memo.md`.

## Supported Design Families
- RCT
- Selection on observables / reweighting
- IV / LATE
- Panel FE / canonical DiD
- Staggered adoption DiD
- RDD (sharp and fuzzy)
- Spillovers and exposure mappings
- Nonlinear multiplicative models (for count/intensity outcomes)

## Repository Pointers
- Global map: `AI_READABLE/ECONOMETRICS_MAP.md`
- Method docs: `AI_READABLE/*.md`
- Concept assumptions: `AI_READABLE/concepts/*.md`
- Routing rules: `references/design-family-routing.md`
- Method lookup: `references/method-to-file-index.md`
- Output contract: `references/method-memo-contract.md`
