# Research Brief Output Contract

## Output Path
- `reports/research_brief.yaml`

## Required Schema
Use exact keys from `templates/research_brief.yaml`.

### Required Non-Empty Fields
- `research_question`
- `primary_estimand`
- `target_population`
- `unit_of_observation`
- `treatment_definition`
- `outcome_definition`
- `sample_construction`
- `design_family_candidate`

### Allowed Values
- `design_family_candidate` must be one of:
  - `RCT`
  - `Selection on observables`
  - `IV/LATE`
  - `Canonical DiD`
  - `Staggered DiD`
  - `RDD`
  - `Spillovers/Exposure`
  - `Nonlinear/PPML`
  - `Mixed/Unclear`

## Evidence Requirements
1. Add at least three entries under `observed_evidence`.
2. Each entry must include:
   - `claim`
   - `source_file`
   - `confidence` (`high|medium|low`)
3. Source files must be local repo paths (no web links).

## Acceptance Gates
1. No required non-empty field is blank.
2. `open_questions` includes unresolved design-critical ambiguities.
3. `known_threats` has at least one item if design is not randomized.
4. `code_and_data_scope` lists at least one path in any subfield, or explicitly states unavailable via `documentation_paths`.
