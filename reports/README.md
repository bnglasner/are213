# Reports Directory

## Structure
- `reports/examples/end_to_end/`
  - Reference end-to-end run artifacts for onboarding.
- `reports/qa/phase6_benchmarks/`
  - Benchmark validation suite and scorecards.
- `reports/archive/development_dry_runs/`
  - Historical build-phase dry runs kept for traceability.
- `reports/runtime/`
  - Recommended location for active team runs.

## Runtime Convention
Create one subfolder per run:
```bash
mkdir -p reports/runtime/<run_id>
```
Store all stage outputs in that folder and validate with `agents/stage_gate_checks.sh`.
