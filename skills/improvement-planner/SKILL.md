---
name: improvement-planner
description: Convert method and code-audit findings into a prioritized implementation roadmap. Use when you need a practical execution sequence that improves causal credibility and econometric reliability under time constraints.
---

# Improvement Planner

## Workflow
1. Read `reports/method_memo.md` and `reports/audit_report.md`.
2. Consolidate findings into one backlog with severity and dependencies.
3. Sequence work into:
- immediate fixes
- medium-lift upgrades
- major redesign tasks
4. Define acceptance checks for each task.
5. Enforce `references/improvement-plan-contract.md`.
6. Produce `reports/improvement_plan.md` using `templates/improvement_plan.md`.

## Output Standard
- Preserve severity labels from upstream findings.
- Include explicit dependency ordering.
- Include a short "minimum viable credibility" path for tight timelines.
- Satisfy all acceptance gates in `references/improvement-plan-contract.md`.

## Repository Pointers
- Output contract: `references/improvement-plan-contract.md`
