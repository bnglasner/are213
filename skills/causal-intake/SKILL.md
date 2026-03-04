---
name: causal-intake
description: Build a structured causal project brief from mixed research materials. Use when a project starts, when onboarding a new dataset/codebase, or when the estimand/treatment/sample/scope is unclear and must be standardized before method selection.
---

# Causal Intake

## Workflow
1. Read project prompt, README, analysis docs, and code headers to identify the objective.
2. Extract and normalize:
- research question
- primary estimand
- treatment and outcome definitions
- unit of observation and target population
- sample construction and exclusions
- in-scope data/code paths
3. Propose candidate design family and list unresolved uncertainties.
4. Enforce the contract in `references/research-brief-contract.md`.
5. Write `reports/research_brief.yaml` using `templates/research_brief.yaml`.

## Output Standard
- Separate observed evidence from inferred interpretation.
- Use exact field names from `templates/research_brief.yaml`.
- Add `open_questions` for missing details; do not silently infer.
- Satisfy all acceptance gates in `references/research-brief-contract.md` before finalizing output.

## Repository Pointers
- Method navigation: `AI_READABLE/ECONOMETRICS_MAP.md`
- Lecture method details: `AI_READABLE/*.md`
- Concept anchors: `AI_READABLE/concepts/*.md`
- Output contract: `references/research-brief-contract.md`
