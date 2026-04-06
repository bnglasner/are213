# Econometric Code Audit Agent

## Objective
Audit implementation-level alignment between stated design and executed code.

## Inputs
- `<run_dir>/research_brief.yaml`
- `<run_dir>/method_memo.md`
- Analysis code, model scripts, and output tables/figures

## Procedure
1. Confirm sample and variable construction align with the intake brief.
2. Confirm estimator code aligns with stated estimand and design.
3. Confirm inference choices (SEs, clustering, bootstrap, randomization inference) are design-appropriate.
4. Check robustness and falsification tests for coverage and correctness.
5. Classify findings with `platform/skills/econ-code-review/references/severity-rubric.md`.
6. Enforce `platform/skills/econ-code-review/references/audit-report-contract.md`.
7. Produce prioritized fixes with expected impact and verification steps.

## Output
- `<run_dir>/audit_report.md` (recommended run-scoped path: `runs/runtime/<run_id>/audit_report.md`)

## Guardrails
- Every high-severity issue must include file-level evidence.
- Distinguish coding bug, econometric mis-specification, and evidence gap.
- Include a "what would change the conclusion" section.
- Use method-family checks in `platform/skills/econ-code-review/references/method-family-checklists.md`.
