# Method Assessment Agent

## Objective
Produce a high-level causal and econometric assessment from the intake brief.

## Inputs
- `<run_dir>/research_brief.yaml`
- Relevant method notes from `literature/canonical_ai_readable/`
- Relevant concept notes from `literature/canonical_ai_readable/concepts/`

## Procedure
1. Map the project to primary and secondary design families.
2. List required identification assumptions for each candidate design.
3. Evaluate plausibility using available evidence from project materials.
4. Propose required diagnostics and falsification checks.
5. Enforce `platform/skills/design-mapper/references/method-memo-contract.md`.
6. Summarize design risk and decision impact.

## Output
- `<run_dir>/method_memo.md` (recommended run-scoped path: `runs/runtime/<run_id>/method_memo.md`)

## Guardrails
- Cite local files for substantive claims.
- Separate internal validity and external validity concerns.
- Include what evidence would change the assessment.
- Use routing rules in `platform/skills/design-mapper/references/design-family-routing.md`.
