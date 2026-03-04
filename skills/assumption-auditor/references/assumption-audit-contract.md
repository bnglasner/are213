# Assumption Audit Output Contract

## Output Path
- `reports/assumption_audit.md`

## Required Sections
1. `Scope`
2. `Assumption Register`
3. `Diagnostic Sequence`
4. `Priority Findings`
5. `Evidence vs Inference`
6. `Cited Local Sources`

## Assumption Register Format
Use a table with columns:
- `Assumption`
- `Design Component`
- `Evidence Status` (`credible|uncertain|unsupported`)
- `Diagnostics`
- `Failure Signature`
- `Severity` (`critical|major|minor|nice-to-have`)

## Evidence Requirements
1. Every `critical` and `major` row must cite at least one local file.
2. Every diagnostic must state expected pass/fail pattern.

## Acceptance Gates
1. Register includes all design-core assumptions from routed family.
2. At least one prioritized diagnostic sequence is provided for limited-time execution.
3. `Evidence vs Inference` clearly separates observed facts from judgment calls.
