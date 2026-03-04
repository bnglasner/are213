# Phase 4 Dry Run 01: Failure and Ambiguity Log

## Observed Failure Modes
1. Estimator mismatch:
- Pseudo-code used naive TWFE only for staggered adoption design.

2. Missing diagnostics:
- No pre-trend, placebo, or event-support diagnostics were present.

3. Inference fragility:
- Only one clustering dimension was used with no sensitivity analysis.

4. Sample-definition risk:
- Never-treated units were dropped with no explicit rationale.

## Phase 4 Controls Added
1. Method-family checklist now flags staggered DiD estimator pathologies by default.
2. Severity rubric now separates design-invalidating issues from minor improvements.
3. Audit contract now requires evidence, fix path, and verification step per finding.
4. Improvement-plan contract now forces dependency-aware sequencing and acceptance checks.

## Recommended Follow-Up
1. Run a second dry run for IV/LATE pseudo-code to test weak-IV and exclusion checks.
2. Introduce one realistic project code file to measure false-positive and false-negative rates.
