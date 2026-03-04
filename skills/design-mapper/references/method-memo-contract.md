# Method Memo Output Contract

## Output Path
- `reports/method_memo.md`

## Required Sections
1. `Design Summary`
2. `Routed Families`
3. `Identification Assumptions`
4. `Threats to Validity`
5. `Required Diagnostics and Falsification Tests`
6. `Evidence Review`
7. `Risk Rating`
8. `Cited Local Sources`

## Routed Families Format
Provide one block per family containing:
- `family`
- `role` (`primary` or `overlay`)
- `why_selected`
- `assumptions_required`
- `diagnostics_required`
- `confidence` (`high|medium|low`)

## Evidence Requirements
1. Include at least four local citations in `Cited Local Sources`.
2. Each major assumption must be tied to at least one cited source.

## Acceptance Gates
1. Primary family is unique and explicit.
2. Diagnostics are specific and testable (not generic).
3. `Risk Rating` includes both level and conditions that would change the rating.
4. If confidence is `low`, memo must include disambiguation tests and intake feedback items.
