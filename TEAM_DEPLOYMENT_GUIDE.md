# Team Deployment Guide

## Purpose
This repository now includes an AI-agent workflow for causal inference and econometric QA.

## Operational Surface
- Agents: `agents/`
- Skills: `skills/`
- Output templates: `templates/`
- Output location for active runs: `reports/runtime/` (recommended)
- End-to-end example run: `reports/examples/end_to_end/`
- Benchmark QA suite: `reports/qa/phase6_benchmarks/`

## Recommended Team Workflow
1. Create run folder:
```bash
mkdir -p reports/runtime/<run_id>
```
2. Produce stage outputs in this order:
- `research_brief.yaml`
- `method_memo.md`
- `assumption_audit.md`
- `audit_report.md`
- `improvement_plan.md`
3. Run stage gates:
```bash
./agents/stage_gate_checks.sh \
  reports/runtime/<run_id>/research_brief.yaml \
  reports/runtime/<run_id>/method_memo.md \
  reports/runtime/<run_id>/audit_report.md \
  reports/runtime/<run_id>/improvement_plan.md
```
4. If any gate fails, remediate upstream stage before proceeding.

## Key Files
- Orchestration spec: `agents/orchestrator-agent.md`
- Stage-gate checker: `agents/stage_gate_checks.sh`
- Planning/status tracker: `AI_READABLE/CAUSAL_AGENT_IMPLEMENTATION_PLAN.md`

## Notes
- Development dry runs are archived under `reports/archive/development_dry_runs/`.
- Validation scorecards and benchmark cases are under `reports/qa/phase6_benchmarks/`.
