# Severity Rubric for Econometric Findings

## Purpose
Assign consistent severity labels across design, estimation, and inference issues.

## Classification Decision
1. Does this issue threaten identification?  
If yes, likely `critical` or `major`.
2. Does this issue primarily affect precision or robustness framing?  
If yes, likely `minor` or `nice-to-have`.
3. Could the issue reverse qualitative conclusions under plausible data?  
If yes, escalate one level.
4. Is the issue purely reproducibility/formatting while unresolved design risks remain?  
If yes, keep as aggregated `nice-to-have` note, not multiple findings.

## Rubric

### Critical
Use when any applies:
- Core identification assumption is contradicted or untested with clear adverse signals.
- Estimator does not correspond to stated estimand/design.
- Inference is invalid in a way that likely changes statistical conclusions (for example, severe clustering mis-specification with few clusters).

### Major
Use when any applies:
- Identification argument is plausible but key supporting checks are missing.
- Implemented specification is partially aligned but includes high-impact omissions.
- Inference or robustness checks are incomplete enough to materially reduce confidence.
- Inference sensitivity is likely to change significance direction or policy interpretation under plausible alternative dependence structures.

### Minor
Use when any applies:
- Main design is implemented correctly but robustness/diagnostic coverage is thin.
- Small specification or coding issues that probably do not reverse conclusions.
- Inference sensitivity is missing but expected to affect precision more than sign/conclusion.

### Nice-to-have
Use when any applies:
- Presentation, reproducibility, or organization improvements.
- Additional checks that increase confidence but are not currently risk-critical.

## Escalation Rule
If two or more independent `major` issues share the same bias direction risk, consider escalating at least one to `critical`.

## Consistency Rule
For repeated issue classes across benchmark runs, keep severity calibration stable unless case-specific evidence clearly supports escalation or downgrade.
