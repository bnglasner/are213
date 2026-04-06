---
name: assumption-auditor
description: Audit identification assumptions and construct falsification and robustness checks for a proposed empirical design. Use when method choice is known but assumption credibility and test strategy need a rigorous pass.
---

# Assumption Auditor

## Workflow
1. Read `<run_dir>/research_brief.yaml` and `<run_dir>/method_memo.md`.
2. Use `references/assumption-diagnostic-map.md` as the baseline checklist.
3. Build an assumption register with:
- assumption name
- design component
- supporting evidence
- risk if violated
- feasible test or sensitivity check
4. Classify each assumption as `credible`, `uncertain`, or `unsupported`.
5. Propose a minimal diagnostic sequence ranked by expected information gain.
6. Enforce `references/assumption-audit-contract.md`.
7. Write `<run_dir>/assumption_audit.md` using `platform/templates/assumption_audit.md`.

## Output Standard
- Always separate observed evidence from inference.
- Link diagnostics to the exact threat they address.
- State what result pattern would raise or lower concern.
- Satisfy all acceptance gates in `references/assumption-audit-contract.md`.

## Repository Pointers
- Core concepts and assumptions: `literature/canonical_ai_readable/concepts/*.md`
- Design details: `literature/canonical_ai_readable/*.md`
- Diagnostic map: `references/assumption-diagnostic-map.md`
- Output contract: `references/assumption-audit-contract.md`
