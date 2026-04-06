# Orchestrator Agent

## Objective
Run stages in sequence and enforce minimum quality gates before advancing.

## Stage Flow
1. Intake: run research-intake-agent and produce `<run_dir>/research_brief.yaml`.
2. Method: run method-assessment-agent and produce `<run_dir>/method_memo.md`.
3. Assumptions: run assumption-auditor skill and produce `<run_dir>/assumption_audit.md`.
4. Audit: run econometric-code-audit-agent and produce `<run_dir>/audit_report.md`.
5. Planning: run improvement-planner skill and produce `<run_dir>/improvement_plan.md`.

## Stage Gates
- Gate 1: `research_brief.yaml` must include estimand, treatment, outcome, and sample.
- Gate 2: `method_memo.md` must include assumptions, diagnostics, and risk rating.
- Gate 3: `audit_report.md` must include severity-tagged findings, prioritized fixes, and verification criteria.
- Gate 4: `improvement_plan.md` must include dependency-aware sequencing and acceptance checks.

## Gate Enforcement
Run:

```bash
RUN_DIR=runs/runtime/<run_id> platform/agents/stage_gate_checks.sh
# or: platform/agents/stage_gate_checks.sh runs/runtime/<run_id>
```

Do not advance to code audit if Gate 1 or Gate 2 fails.

## Escalation Rules
- If estimand is undefined, return to Intake.
- If assumptions are unsupported, mark high risk and request targeted diagnostics.
- If code diverges from design, block causal claims until corrected.

## Handoff Protocol
1. Intake -> Method:
- Pass only after Gate 1 checks pass.
2. Method -> Audit:
- Pass only after Gate 2 checks pass.
3. Audit -> Improvement:
- Pass only after Gate 3 checks pass.
4. If any gate fails:
- Write failure details to `<run_dir>/orchestrator_gate_failures.md`.
- Return control to the previous stage with explicit remediation items.
