# Phase 6 Validation Log

## Scope
Benchmark validation across 5 design families:
- `iv_01`
- `canonical_did_01`
- `staggered_did_01`
- `rdd_01`
- `spillovers_01`

## Gate Check Command
```bash
./agents/stage_gate_checks.sh <research_brief> <method_memo> <audit_report> <improvement_plan>
```

Result:
- All stage gates passed for all 5 cases.

## Detection Scorecard
Evaluation target for TP/FN/FP is high-severity findings (`critical` + `major`) listed in each case's `expected_findings.md`.

| Case | Design | Expected High-Severity | Detected High-Severity | TP | FN | FP (High) | FP (Low: minor+nice) | Gate Status |
|---|---|---:|---:|---:|---:|---:|---:|---|
| `iv_01` | IV/LATE | 2 | 2 | 2 | 0 | 0 | 2 | Pass |
| `canonical_did_01` | Canonical DiD | 2 | 2 | 2 | 0 | 0 | 2 | Pass |
| `staggered_did_01` | Staggered DiD | 3 | 3 | 3 | 0 | 0 | 2 | Pass |
| `rdd_01` | RDD | 3 | 3 | 3 | 0 | 0 | 2 | Pass |
| `spillovers_01` | Spillovers/Exposure | 3 | 3 | 3 | 0 | 0 | 2 | Pass |
| **Total** | - | **13** | **13** | **13** | **0** | **0** | **10** | **5/5 Pass** |

## Ambiguity and Error Profile
1. Repeated low-priority noise:
- Reproducibility-only findings appeared in all 5 cases even when unresolved major risks remained.

2. Severity calibration drift:
- Inference-sensitivity gaps were graded `minor` in some cases and `major` in others without explicit calibration criteria.

3. No high-severity misses in this benchmark:
- All expected high-severity issues were detected.

## Rule/Checklist Updates Applied
1. `skills/econ-code-review/references/audit-report-contract.md`
- Added `Issue type` requirement.
- Added gate limiting reproducibility-only findings to one aggregated note when major risks remain.

2. `skills/econ-code-review/references/severity-rubric.md`
- Added explicit calibration for inference-sensitivity severity.
- Added consistency rule across benchmark runs.

3. `skills/econ-code-review/references/method-family-checklists.md`
- Added `Mandatory` vs `Secondary` labels for each check item.

4. `templates/audit_report.md`
- Added `Issue type` field for all severity buckets.

## Next Iteration Recommendations
1. Re-run at least one benchmark case after rule changes to verify reduction in low-priority noise.
2. Add one real-code benchmark per major design family to stress-test false negatives in non-synthetic settings.

## Post-Calibration Recheck (2026-03-04)
Re-ran two representative cases after rule updates:
- `iv_01`
- `spillovers_01`

Both recheck runs passed all four stage gates:
- `iv_01/gate_log_postcal.md`
- `spillovers_01/gate_log_postcal.md`

### Before vs After (Recheck Cases)
| Case | High-Severity TP/FN/FP (Before) | High-Severity TP/FN/FP (After) | Low FP (Before) | Low FP (After) |
|---|---|---|---:|---:|
| `iv_01` | 2/0/0 | 2/0/0 | 2 | 1 |
| `spillovers_01` | 3/0/0 | 3/0/0 | 2 | 1 |
| **Total** | **5/0/0** | **5/0/0** | **4** | **2** |

Interpretation:
- High-severity detection quality was unchanged (no new misses).
- Low-priority noise fell by 50% in the rechecked subset.
