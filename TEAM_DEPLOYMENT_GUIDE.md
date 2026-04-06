# Team Deployment Guide

## Purpose
This repository includes an AI-agent workflow for causal inference and econometric QA, with run-scoped outputs for reproducibility.

## Operational Surface
- Agents: `platform/agents/`
- Skills: `platform/skills/`
- Output templates: `platform/templates/`
- Output location for active runs: `runs/runtime/` (recommended)
- End-to-end example run: `runs/examples/end_to_end/`
- Benchmark QA suite: `runs/qa/phase6_benchmarks/`

## Recommended Team Workflow
1. Create run folder:
```bash
RUN_DIR="runs/runtime/<run_id>"
mkdir -p "$RUN_DIR"
```
2. Produce stage outputs in this order:
- `research_brief.yaml`
- `method_memo.md`
- `assumption_audit.md`
- `audit_report.md`
- `improvement_plan.md`
3. Run stage gates:
```bash
./platform/agents/stage_gate_checks.sh "$RUN_DIR"
```
4. If any gate fails, remediate upstream stage before proceeding.

## Compatibility Modes
`platform/agents/stage_gate_checks.sh` supports three invocation styles:
1. Run-dir mode: `./platform/agents/stage_gate_checks.sh runs/runtime/<run_id>`
2. Environment mode: `RUN_DIR=runs/runtime/<run_id> ./platform/agents/stage_gate_checks.sh`
3. Legacy explicit files:
```bash
./platform/agents/stage_gate_checks.sh \
  reports/research_brief.yaml \
  reports/method_memo.md \
  reports/audit_report.md \
  reports/improvement_plan.md
```

## Key Files
- Orchestration spec: `platform/agents/orchestrator-agent.md`
- Stage-gate checker: `platform/agents/stage_gate_checks.sh`
- Planning/status tracker: `literature/canonical_ai_readable/CAUSAL_AGENT_IMPLEMENTATION_PLAN.md`

## Notes
- Legacy path compatibility is preserved through symlinks (`reports/` -> `runs/`, `agents` -> `platform/agents/`, etc.).
- Development dry runs are archived under `runs/archive/development_dry_runs/`.
- Validation scorecards and benchmark cases are under `runs/qa/phase6_benchmarks/`.
