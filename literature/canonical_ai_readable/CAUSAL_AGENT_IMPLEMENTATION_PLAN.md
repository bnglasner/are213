---
title: "Causal Agent Implementation Plan"
doc_type: "project_plan"
project: "ARE213 agentic causal inference copilot"
status: "active"
owner: "research + codex"
last_updated: "2026-03-04"
---

# Causal Agent Implementation Plan

## Purpose
Build an agentic workflow that lets a researcher:
1. Onboard an agent to the research question, data, sample, and scope.
2. Receive a high-level methodological assessment.
3. Receive a detailed code-level econometric and causal design audit with prioritized improvements.

## Repository Context to Reuse
- Method corpus: `AI_READABLE/*.md` lecture translations.
- Concept anchors: `AI_READABLE/concepts/*.md`.
- Method graph/navigation: `AI_READABLE/ECONOMETRICS_MAP.md`.
- Existing translation quality standard: `AI_READABLE/TRANSLATION_AGENT_PLAN.md`.

## Target System Architecture

### Agents
1. `research-intake-agent`
- Produces a structured research brief from files, code, and user prompt.

2. `method-assessment-agent`
- Produces high-level causal/econometric design assessment.

3. `econometric-code-audit-agent`
- Produces implementation-level diagnostics and concrete code improvements.

4. `orchestrator-agent`
- Enforces stage order, required inputs/outputs, and escalation from high-level concerns to code checks.

### Skills
1. `causal-intake`
- Extract question, estimand, treatment, outcome, sample construction, data lineage, identification target.

2. `design-mapper`
- Map project to design families (RCT, selection on observables, IV, DiD, staggered DiD, RDD, spillovers, nonlinear).

3. `assumption-auditor`
- Enumerate assumptions, observables supporting each assumption, and required falsification checks.

4. `econ-code-review`
- Check whether implemented estimators and inference match the intended design and assumptions.

5. `improvement-planner`
- Produce prioritized action plan: `critical`, `major`, `minor`, `nice-to-have`.

## Global Rules (Must Hold Across All Agents)
1. Separate:
- `Observed evidence` (from code/data/docs) vs
- `Inference` (reasoned concerns).
2. Require explicit estimand before causal claims.
3. Require identification assumptions before design approval.
4. Require inference specification before statistical interpretation (SE type, clustering level, small-sample adjustments where relevant).
5. Every major recommendation must include:
- Why it matters.
- What file/code block it affects.
- What result would validate/falsify the concern.
6. Use local file citations for substantive claims.

## Standard Stage Outputs

### Stage 1 Output: `research_brief.yaml`
Required fields:
- `research_question`
- `primary_estimand`
- `target_population`
- `unit_of_observation`
- `treatment_definition`
- `outcome_definition`
- `sample_construction`
- `design_family_candidate`
- `known_threats`
- `code_and_data_scope`

### Stage 2 Output: `method_memo.md`
Required sections:
- Design summary
- Identification assumptions
- Threats to validity (internal/external)
- Required diagnostics and falsification tests
- Risk rating (`low`/`medium`/`high`)

### Stage 3 Output: `audit_report.md`
Required sections:
- Estimator-spec alignment checks
- Inference checks (SE/clustering/bootstrap/randomization inference where relevant)
- Robustness checks present/missing
- Prioritized fixes with effort estimate
- “What would change the conclusion”

## Phased Implementation Roadmap

### Phase 0: Plan Baseline
Goal:
- Finalize a living implementation plan document and tracking protocol.

Deliverables:
- This file created and versioned.

Status:
- `Completed` (2026-03-04)

### Phase 1: Scaffolding
Goal:
- Create folders/files for reusable agent and skill infrastructure.

Deliverables:
- `agents/` metadata and prompts
- `skills/` folders with `SKILL.md`
- `templates/` for stage outputs
- `reports/` for generated assessments

Status:
- `Completed` (2026-03-04)

### Phase 2: Knowledge Packaging
Goal:
- Create retrieval-ready method index from `AI_READABLE` and `concepts`.

Deliverables:
- Method-to-file index
- Assumption-to-diagnostic mapping table
- Design-family routing map

Status:
- `Completed` (2026-03-04)

### Phase 3: Core Skills (Intake + Method Assessment)
Goal:
- Implement `causal-intake`, `design-mapper`, `assumption-auditor`.

Deliverables:
- Three skill folders with validated `SKILL.md`
- Stage 1 and Stage 2 templates completed

Status:
- `Completed` (2026-03-04)

### Phase 4: Code Audit Skill
Goal:
- Implement `econ-code-review` and `improvement-planner`.

Deliverables:
- Code audit checklist library by method family
- Stage 3 output template and severity rubric

Status:
- `Completed` (2026-03-04)

### Phase 5: Agent Wiring
Goal:
- Implement orchestrated flow from intake to high-level memo to code audit.

Deliverables:
- Agent prompts wired to skills
- Stage gates and minimum required inputs enforced

Status:
- `Completed` (2026-03-04)

### Phase 6: Validation and Iteration
Goal:
- Run benchmark projects and refine false-positive/false-negative profile.

Deliverables:
- Evaluation log across at least 5 test cases
- Updated rules/checklists based on observed misses

Status:
- `Completed` (2026-03-04)

## Tracking Protocol (How This Document Will Be Updated)
After each meaningful step:
1. Update `last_updated` date in frontmatter.
2. Change relevant phase status.
3. Append one line to changelog with:
- Date
- What changed
- Why it changed
- Next action

## Changelog
- 2026-03-04: Created initial implementation plan with architecture, skills, rules, outputs, and phased roadmap. Next action: scaffold Phase 1 folders and templates.
- 2026-03-04: Completed Phase 1 scaffolding: added `agents/`, `skills/`, `templates/`, and `reports/` structures; created five skill scaffolds with `SKILL.md` and `agents/openai.yaml`; added output templates and agent specs. Next action: start Phase 2 knowledge packaging.
- 2026-03-04: Attempted automated skill validation via `quick_validate.py`; blocked because local Python environment lacks `yaml` package. Performed manual metadata checks and kept Phase 1 moving. Next action: begin Phase 2 knowledge packaging.
- 2026-03-04: Completed Phase 2 knowledge packaging: added method-to-file index, assumption-to-diagnostic mapping, and deterministic design-family routing references; wired `design-mapper` and `assumption-auditor` skills to use them. Next action: begin Phase 3 skill hardening and output quality checks.
- 2026-03-04: Completed Phase 3 core-skill hardening: added explicit output contracts and acceptance gates for `causal-intake`, `design-mapper`, and `assumption-auditor`; expanded templates; ran Dry Run 01 and logged ambiguity/failure modes (archived under `reports/archive/development_dry_runs/`). Next action: begin Phase 4 code-audit skill hardening.
- 2026-03-04: Completed Phase 4 code-audit hardening: added method-family code audit checklist library, severity rubric, and audit/improvement output contracts; wired `econ-code-review` and `improvement-planner` to contracts; expanded templates; ran pseudo-code Dry Run 01 for issue detection and prioritization behavior. Next action: begin Phase 5 agent wiring and stage-gate enforcement.
- 2026-03-04: Completed Phase 5 agent wiring: added executable stage-gate checks (`agents/stage_gate_checks.sh`), updated orchestrator and agent handoff protocols to enforce contracts, and ran end-to-end Dry Run 01 with all stage gates passing. Next action: begin Phase 6 benchmark validation and iteration.
- 2026-03-04: Completed Phase 6 validation and iteration: ran 5 benchmark cases (IV, canonical DiD, staggered DiD, RDD, spillovers) with full stage outputs and gate checks; produced scorecard with TP/FN/FP profile; updated audit contracts, severity rubric, checklists, and template based on repeated ambiguity/noise patterns. Next action: run post-calibration benchmark refresh and then transition to ongoing maintenance.
- 2026-03-04: Ran post-calibration benchmark refresh on `iv_01` and `spillovers_01`; both passed all stage gates and low-priority false positives declined in the rechecked subset. Next action: extend post-calibration rerun to remaining benchmark cases and then incorporate real project code benchmarks.
- 2026-03-04: Performed deployment cleanup for team use: removed local junk files, reorganized reports into `archive/`, `examples/`, and `qa/`, added deployment/runbook docs (`TEAM_DEPLOYMENT_GUIDE.md`, `reports/README.md`), added `.gitignore`, and updated stale internal path references. Next action: begin production team runs under `reports/runtime/`.

## Immediate Next Actions
1. Re-run selected benchmarks with updated rubric to confirm reduction in low-priority false positives.
2. Add at least one real project per design family to stress-test false negatives outside synthetic pseudo-code.
3. Establish a periodic validation cadence and append updates to `reports/qa/phase6_benchmarks/PHASE6_VALIDATION_LOG.md`.
