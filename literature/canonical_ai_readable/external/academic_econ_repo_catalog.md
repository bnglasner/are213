# External Academic Econometrics Repository Catalog

- Source report: `deep-research-report.md`
- Catalog mirror: `catalog/external_repo_catalog.yaml`
- Metadata backlog: `catalog/external_repo_metadata_backlog.yaml`
- Tool-node index: `literature/canonical_ai_readable/external/repo_tool_nodes.md`
- Updated on: 2026-03-23

## Executive Summary

The source report identifies a practical external "core stack" for AI-agent econometrics workflows: modern DiD/event-study tools, synthetic-control variants, RD infrastructure, generalized random forests, and Python/Julia toolkits for panel, IV, and time-series settings. It emphasizes repositories with package-style installability, documentation/vignettes, and recent maintenance signals when available.

The report also warns that metadata coverage is uneven. Many fields that are time-varying or API-dependent are explicitly marked `unspecified` (especially watchers, commits-in-last-year, and some last-commit details). This companion intentionally preserves those gaps rather than inferring values.

## Methodology, Inclusion, and Exclusion

### Search strategy used in the report

- Method-first discovery (DiD, RD, synthetic control, fixed effects, ARCH/GARCH, panel IV).
- Author-first confirmation (linkage to academic economists/econometricians).
- Repo-first verification (README/docs purpose, package shape, installability signals).

### Inclusion criteria

- Public repository.
- Substantive econometrics content (methods software, implementation code, pedagogical code, or replication assets).
- Credible linkage to an established academic economist/econometrician or academic method group.
- Non-trivial documentation footprint.

### Exclusion criteria

- Generic econometrics lists without credible academic owner linkage.
- Read-only mirrors instead of active development repositories.
- Repositories with unverified maintainership linkage.

## Subfield and Recency Analytics

### Subfield taxonomy used by the report

- General econometrics toolkits.
- Fixed effects and high-dimensional estimation.
- DiD and event study methods.
- Synthetic control and synthetic DiD.
- Regression discontinuity.
- ML econometrics for heterogeneous effects.
- Bayesian macroeconometrics.

### Reported subfield counts

| Subfield | Reported count |
|---|---:|
| DiD and event study methods | 8 |
| Fixed effects and high-dimensional estimation | 5 |
| Synthetic control and synthetic DiD | 2 |
| Regression discontinuity | 2 |
| General econometrics toolkit | 2 |
| ML econometrics (causal forests) | 1 |
| Bayesian macroeconometrics | 1 |

### Last-update recency buckets (reference date: 2026-03-23)

- `<= 30 days`: `grf-labs/grf`, `bashtage/arch`, `bashtage/linearmodels`.
- `31-180 days`: `bcallaway11/did` (via release timing signal).
- `181-365 days`: no repos explicitly placed (insufficient consistent signals).
- `> 365 days`: `synth-inference/synthdid` (commit history signal around Jan 2024).
- `unspecified`: all remaining listed repos.

### Internal inconsistencies explicitly carried forward

- The report states `n = 20` for the shortlist, but the summary table contains 16 repos.
- Reported bar-chart counts sum to 21, not 20.
- Detailed section contains 15 dedicated repo headings (no dedicated section for `bsvars/bsvarSIGNs`).
- The declared taxonomy omits some scopes shown in the table (for example, time-series and structural IO labels appear in repo scopes).

## Per-Repo Entries

### `bcallaway11/did`

- Priority: `high`
- Scope/language: DiD (multi-period, staggered adoption), R
- Last update signal: release `did v2.3` (Dec 2025), last commit date unspecified
- Metrics: stars `383`, forks `123`, watchers `8`
- Key artifacts: `DESCRIPTION`, `NAMESPACE`, `README.Rmd`, `README.md`, `NEWS.md`, `vignettes/`, `tests/`
- Installation status: installable from CRAN and GitHub (`devtools::install_github("bcallaway11/did")`)
- AI-agent use: estimand routing, `att_gt()`/`aggte()` templates, pretrend/event-study diagnostics
- Data gaps: absolute last commit date, dependency enumeration detail, repo size

### `synth-inference/synthdid`

- Priority: `high`
- Scope/language: synthetic DiD, R
- Last update signal: commit-history activity through Jan 2024
- Metrics: stars `300`, forks `114-115`, watchers `unspecified`
- License: `BSD-3-Clause`
- Key artifacts: `DESCRIPTION`, `vignettes/synthdid.Rmd`
- Installation status: R package structure; install patterns consistent with GitHub R packages
- AI-agent use: SDID suitability checks, minimal examples, SDID/SC/DiD estimand crosswalk
- Data gaps: commits-in-last-year, watchers, size

### `grf-labs/grf`

- Priority: `high`
- Scope/language: generalized random forests for heterogeneous effects, C++ with R interface
- Last update signal: updated Mar 4, 2026
- Metrics: stars `1.1k`, forks `274`, watchers `unspecified`
- License: `GPL-3.0`
- Key artifacts: `vignettes/`, `R/`, package documentation pages
- Installation status: available on CRAN as `grf`
- AI-agent use: forest-family routing, safe train/predict/diagnose pipelines, CATE/IV interpretation
- Data gaps: watchers and size

### `bashtage/arch`

- Priority: `high`
- Scope/language: time-series and financial econometrics, Python
- Last update signal: pushed within days/weeks in third-party listing (absolute date unspecified)
- Metrics: stars `1,449`, forks `270`, watchers `unspecified`
- License: reported as `Other` in a metadata mirror (confirmation required)
- Key artifacts: public docs for volatility models, unit-root/cointegration routines, and bootstrap tools
- Installation status: Python package with index/documentation signals
- AI-agent use: volatility model recommendation, unit-root/cointegration test routing, diagnostics
- Data gaps: GitHub-side absolute commit date, watchers, definitive license status

### `bashtage/linearmodels`

- Priority: `high`
- Scope/language: general econometrics toolkit (panel/IV), Python
- Last update signal: pushed about 10 days ago in listing context (absolute date unspecified)
- Metrics: stars `1,006`, forks `185`, watchers `unspecified`
- License: `unspecified`
- Key artifacts: `unspecified`
- Installation status: `unspecified`
- AI-agent use: panel/IV/clustered SE routing into a coherent Python API
- Data gaps: key files, dependencies, installation confirmation, license

### `xuyiqing/gsynth`

- Priority: `medium_high`
- Scope/language: generalized synthetic control, R
- Last update signal: `unspecified`
- Metrics: stars/forks/watchers all `unspecified`
- License: `unspecified`
- Key artifacts: `unspecified`
- Installation status: `unspecified`
- AI-agent use: assumptions-based recommendation versus DiD/SDID and scaffolded R scripts
- Data gaps: broad metadata coverage gap; follow-up pass required

### `rdpackages/rdrobust`

- Priority: `high`
- Scope/language: regression discontinuity, language `unspecified`
- Last update signal: `unspecified`
- Metrics: stars/forks/watchers all `unspecified`
- License: `unspecified`
- Key artifacts: `unspecified`
- Installation status: `unspecified`
- AI-agent use: RD design object construction, robust inference flow, diagnostic checklist generation
- Data gaps: nearly all platform metadata not extracted in this run

### `pedrohcgs/DRDID`

- Priority: `high`
- Scope/language: doubly robust DiD, R
- Last update signal: `unspecified`
- Metrics/license/key files/installation: `unspecified`
- AI-agent use: estimator selection under covariate-adjustment and misspecification concerns
- Data gaps: operational metadata sparse beyond existence/scope

### `chaisemartinPackages/did_multiplegt`

- Priority: `high`
- Scope/language: multi-group multi-period DiD robustness, Stata
- Last update signal: `unspecified`
- Metrics/license/key files/installation: `unspecified`
- AI-agent use: TWFE pathology diagnosis and robustness-oriented rerouting
- Data gaps: operational metadata sparse beyond existence/scope

### `borusyak/did_imputation`

- Priority: `high`
- Scope/language: imputation-based DiD/event-study, Stata
- Last update signal: `unspecified`
- Metrics/license/key files/installation: `unspecified`
- AI-agent use: modern DiD/event-study implementation path beyond TWFE
- Data gaps: operational metadata sparse beyond existence/scope

### `lsun20/eventstudyinteract`

- Priority: `high`
- Scope/language: staggered-adoption event study (Sun-Abraham implementation), Stata
- Last update signal: `unspecified`
- Metrics/license/key files/installation: `unspecified`
- AI-agent use: credible staggered event-study implementation path
- Data gaps: operational metadata sparse beyond existence/scope

### `FixedEffects/FixedEffectModels.jl`

- Priority: `high`
- Scope/language: high-dimensional FE + IV estimation, Julia
- Last update signal: pushed about 2 months ago in listing context
- Metrics: stars `235`, forks `46`, watchers `unspecified`
- License: `unspecified`
- Key artifacts: `README`; license presence indicated but not extracted
- Installation status: Julia add-pattern signal from related ecosystem example; direct command unspecified here
- AI-agent use: high-performance Julia backend routing for large FE/IV workloads
- Data gaps: direct install and license confirmation details

### `jeffgortmaker/pyblp`

- Priority: `high`
- Scope/language: structural IO econometrics (BLP), Python
- Last update signal: `unspecified`
- Metrics/license/key files/installation: `unspecified`
- AI-agent use: structural demand estimation routing for advanced IO workflows
- Data gaps: maintenance and package-surface metadata unspecified

### `scunning1975/mixtape`

- Priority: `medium_high`
- Scope/language: causal-inference pedagogy, language `unspecified`
- Last update signal: `unspecified`
- Metrics/license/key files/installation: `unspecified`
- AI-agent use: concept explanation and pedagogical cross-referencing
- Data gaps: package-like operational metadata mostly unspecified

### `bsvars/bsvars`

- Priority: `medium`
- Scope/language: Bayesian SVAR macroeconometrics, R
- Last update signal: CRAN entry indicates package scope
- Metrics: stars `59`, forks `13`, watchers `unspecified`
- License/size/activity detail: `unspecified`
- Key artifacts: package-style repo; CRAN package scope confirmation
- Installation status: CRAN distribution exists
- AI-agent use: Bayesian macro SVAR workflow support
- Data gaps: license/size/recent-activity detail missing

### `bsvars/bsvarSIGNs`

- Priority: `medium`
- Scope/language: Bayesian SVAR with sign/zero/narrative restrictions, C++ (R package)
- Last update signal: repo docs mention award and issues active through late 2025
- Metrics: stars `29`, forks `4`, watchers `unspecified`
- License/key files/installation: `unspecified`
- AI-agent use: specialized identification routing for Bayesian macro workflows
- Data gaps: summary-table-only coverage in source report (no dedicated detailed section)

## Tool Node Pages

Machine-readable entries are also materialized into one page per repo for deterministic retrieval and routing:

- Index: `literature/canonical_ai_readable/external/repo_tool_nodes.md`
- Node directory: `literature/canonical_ai_readable/external/repos/`

## Design Guidance: Tool Node and Method Graph Routing

Treat each repository as a tool node in a method graph. Route by:

- Estimand type: ATE/ATT/CATE, dynamic effects, structural parameters.
- Identification assumptions: parallel trends, RD continuity, factor-model assumptions, unconfoundedness/overlap, instrument validity.
- Data structure: panel vs repeated cross-section, staggered adoption, single cutoff, many fixed effects, high-dimensional covariates.

Operational guidance from the report:

- Include a "when to use" section grounded in repo documentation.
- Add a minimal runnable example and an agent-safe variant with input checks.
- Document failure modes (for example, pretrend fragility in DiD and bandwidth sensitivity in RD).
- Link dependency manifests (`DESCRIPTION`, `pyproject.toml`, etc.).
- Keep a short API map with core functions/commands.

## Limitations and Maintenance Cadence

### Limitations carried from the source report

- Metadata completeness is uneven across repos.
- Some metric fields are inherently time-varying and API-dependent.
- Third-party metadata was used selectively where GitHub HTML coverage was incomplete.

### Quarterly refresh guidance

- Re-check last-update signals and dependency manifests.
- Re-label maintenance status when inactivity exceeds 24 months.
- Re-assess inclusion based on method relevance and adoption signals.
- Re-verify owner prominence metrics when scholar pages are accessible.

## Known Data Gaps

- `commits_in_last_year`: mostly unavailable.
- `watchers`: mostly unavailable.
- `repo_size`: partial.
- `license`: partial/inconsistent for some repos.
- `installation_status`: explicit confirmation missing for several repos.
- `key_files_artifacts`: sparse outside package-first repos.

## Follow-Up Metadata Pass

Recommended pass order:

1. Complete missing platform metrics for all `high` priority repos with currently sparse metadata (`rdrobust`, `DRDID`, `did_multiplegt`, `did_imputation`, `eventstudyinteract`, `pyblp`).
2. Confirm license and installation commands for repos with conflicting/partial signals (`arch`, `linearmodels`, `FixedEffectModels.jl`).
3. Backfill a dedicated detailed profile for `bsvars/bsvarSIGNs` to align summary and detailed sections.
4. Reconcile reported shortlist counts (`20`, `21`, and `16`) and persist a corrected analytic baseline.
