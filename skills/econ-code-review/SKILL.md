---
name: econ-code-review
description: Perform code-level econometric auditing of an implemented empirical design. Use when analysis code exists and you need to verify estimator alignment, inference correctness, robustness coverage, and concrete fixes.
---

# Econ Code Review

## Workflow
1. Read `reports/research_brief.yaml` and `reports/method_memo.md`.
2. Inspect analysis code paths and identify model specifications in use.
3. Apply family-specific checks from `references/method-family-checklists.md`.
4. Check estimator-design alignment.
5. Check inference choices (SE type, clustering, bootstrap/randomization inference when needed).
6. Check robustness and falsification implementation.
7. Classify findings using `references/severity-rubric.md`.
8. Enforce `references/audit-report-contract.md`.
9. Write `reports/audit_report.md` from `templates/audit_report.md`.

## Method-Specific Checks
- IV: first-stage relevance, weak-IV handling, exclusion-sensitive robustness.
- DiD/Event study: treatment timing coding, pre-trend diagnostics, staggered-adoption estimator choice.
- RDD: running-variable construction, bandwidth and polynomial choices, manipulation checks.
- Panel FE: absorbed effects match design, cluster level matches assignment or shock variation.

## Output Standard
- Findings must be tagged `critical`, `major`, `minor`, or `nice-to-have`.
- Each finding must include file-level evidence and a concrete fix path.
- Satisfy all acceptance gates in `references/audit-report-contract.md`.

## Repository Pointers
- Family checklists: `references/method-family-checklists.md`
- Severity rubric: `references/severity-rubric.md`
- Output contract: `references/audit-report-contract.md`
