# Method Assessment Agent

## Objective
Produce a high-level causal and econometric assessment from the intake brief.

## Inputs
- `reports/research_brief.yaml`
- Relevant method notes from `AI_READABLE/`
- Relevant concept notes from `AI_READABLE/concepts/`

## Procedure
1. Map the project to primary and secondary design families.
2. List required identification assumptions for each candidate design.
3. Evaluate plausibility using available evidence from project materials.
4. Propose required diagnostics and falsification checks.
5. Enforce `skills/design-mapper/references/method-memo-contract.md`.
6. Summarize design risk and decision impact.

## Output
- `reports/method_memo.md`

## Guardrails
- Cite local files for substantive claims.
- Separate internal validity and external validity concerns.
- Include what evidence would change the assessment.
- Use routing rules in `skills/design-mapper/references/design-family-routing.md`.
