# Phase 3 Dry Run 01: Failure and Ambiguity Log

## Observed Failure Modes
1. Missing implementation assets:
- No project-specific code or data files were available, so code-path diagnostics could not be executed.

2. Assignment details underspecified:
- The exact institutional assignment mechanism was not documented in this dry run, which blocks strong exogeneity claims.

3. Exclusion evidence gap:
- No direct placebo/mechanism test outputs were available, so exclusion remains unsupported.

## Mitigations Added in Phase 3
1. Output contracts now force explicit `open_questions` for missing critical details.
2. Method and assumption outputs now require testable diagnostics and local citations.
3. Assumption register now requires severity classification and failure signatures.

## Recommended Follow-Up
1. Add one empirical project with code/data paths to test full intake-to-audit flow.
2. Add a second dry run for staggered DiD to test routing disambiguation.
