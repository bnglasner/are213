---
name: design-mapper
description: Map a research brief to one or more causal/econometric design families and define required assumptions and diagnostics. Use after intake is complete and before running any code-level review.
---

# Design Mapper

## Workflow
1. Read `<run_dir>/research_brief.yaml`.
2. Apply routing rules in `references/design-family-routing.md`.
3. Use lookup table in `references/method-to-file-index.md` to gather method files.
4. Apply external tool-node routing using `references/repo-tool-routing.md`.
5. Assign primary design family and any secondary fallback design.
6. For each family, list identification assumptions and required diagnostics.
7. Identify method-specific risks and practical failure modes.
8. Enforce `references/method-memo-contract.md`.
9. Write `<run_dir>/method_memo.md` using `platform/templates/method_memo.md`.

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
- Global map: `literature/canonical_ai_readable/ECONOMETRICS_MAP.md`
- Method docs: `literature/canonical_ai_readable/*.md`
- Concept assumptions: `literature/canonical_ai_readable/concepts/*.md`
- External repo catalog: `catalog/external_repo_catalog.yaml`
- External tool-node index: `literature/canonical_ai_readable/external/repo_tool_nodes.md`
- Routing rules: `references/design-family-routing.md`
- External routing rules: `references/repo-tool-routing.md`
- Method lookup: `references/method-to-file-index.md`
- Output contract: `references/method-memo-contract.md`
