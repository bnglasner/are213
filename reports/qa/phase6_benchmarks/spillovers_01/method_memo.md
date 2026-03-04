# Method Memo

## Design Summary
- Primary design family: Spillovers/Exposure
- Secondary/backup design family: Canonical DiD (if spillovers negligible)
- Target estimand: Direct treatment effect conditional on exposure mapping

## Routed Families
- Family: Spillovers/Exposure
  - Role: `primary`
  - Why selected: outcomes may depend on neighbors' treatments.
  - Assumptions required: valid exposure mapping, bounded interference, correct dependence handling.
  - Diagnostics required: alternative exposure mappings, placebo exposures, inference sensitivity.
  - Confidence: `medium`

## Identification Assumptions
1. Chosen exposure mapping captures relevant interference channels.
2. Residual interference outside mapping is limited.
3. Inference accounts for dependence induced by network structure.

## Threats to Validity
### Internal Validity
- Mis-specified exposure mapping.
- Correlated shocks with network structure.

### External Validity
- Spillover structure may differ in other settings.

## Required Diagnostics and Falsification Tests
1. Alternative exposure mapping sensitivity.
2. Placebo exposure definitions.
3. Dependence-robust inference checks.

## Evidence Review
- Observed evidence: spillover module stresses explicit exposure mappings and robustness checks.
- Inferred concern: current script omits exposure structure entirely.

## Risk Rating
- Overall: `high`
- What would change this rating: stable effects across exposure mappings and dependence-robust inference.

## Cited Local Sources
- `AI_READABLE/F_Spillovers_Formula_IV.md`
- `AI_READABLE/concepts/Interference_and_spillovers.md`
- `AI_READABLE/concepts/Cluster_robust_inference.md`
