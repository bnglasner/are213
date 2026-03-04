# Improvement Plan Output Contract

## Output Path
- `reports/improvement_plan.md`

## Required Sections
1. `Objective and Scope`
2. `Consolidated Backlog`
3. `Sequenced Execution Plan`
4. `Minimum Viable Credibility Path`
5. `Acceptance Checks`
6. `Cited Local Sources`

## Backlog Format
Each backlog item must include:
- `ID`
- `Severity` (`critical|major|minor|nice-to-have`)
- `Task`
- `Dependency`
- `Effort` (`small|medium|large`)
- `Expected credibility gain`

## Acceptance Gates
1. Every `critical` finding from `audit_report.md` appears in the plan.
2. Sequence is dependency-consistent.
3. At least one minimal path is provided for tight timelines.
4. Each step has a concrete acceptance check.
