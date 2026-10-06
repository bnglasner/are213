# C3: Judge IV Design Translation

## Source

- PDF: `literature/raw_pdf/C3_judge_IV.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/C3_judge_IV.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 10/10 pages, word recall 0.995, words not in the text layer 0.0.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part C: Instrumental Variables
- p. 2: C3 Outline
- p. 3: Setting
- p. 4: Idea
- p. 5: Estimated leniency?
- p. 6: Correct IV framework
- p. 7–8: Underlying assumptions
- p. 9: Tests for monotonicity and exclusion
- p. 10: References I

## Comprehensive Translation

### p. 1 — Part C: Instrumental Variables

C3: Judge IV Design
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — C3 Outline

Readings:
Scott Cunnigham’s “Mixtape” textbook, Ch. 7.8.2
Goldsmith-Pinkham, Hull, Kolesar (in progress)

### p. 3 — Setting

There are many situations where:
1. the treatment (usually binary) is decided by one of $K$ “judges” (examiners,
caseworkers, ...)
2. judge’s decision is discretionary
3. judges are assigned to cases randomly (perhaps within strata, e.g. location-period)
Examples of treatments:
- Incarceration (Kling $2006,$ Mueller-Smith $2015)$, bail (Arnold, Dobbie, Yang $2018)$
- Patent granting (Sampat and Williams $2019)$
- Credit ratings (Rieber and Schechinger $2019)$
- Psychotherapy treatment (Blæhr and Søgaard $2021)$
- Several types of job training programs for the unemployed (Humlum, Munch, Rasmussen $2024)$

### p. 4 — Idea

Judges typically vary by leniency
(Gaudet, Harris and John 1933, reproduced from Scott Cunningham’s “Mixtape”)
Can use this heterogeneity to instrument for treatment
- Leniency is unobserved =$\Rightarrow$ what should we do?
- Under which assumptions is the answer causal?

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- Judges typically vary by leniency

[Figure: Percentage of Each Kind of Sentence Given by Each Judge. The chart shows imprisonment percentages for Judge 1 (35.6%), Judge 2 (33.6%), Judge 3 (53.3%), Judge 4 (57.7%), Judge 5 (45.0%), and Judge 6 (50.0%).]

- Can use this heterogeneity to instrument for treatment
  - Leniency is unobserved → what should we do?
  - Under which assumptions is the answer causal?

### p. 5 — Estimated leniency?

Notation: judge assignment $Q_{i}= k \in \{1, \ldots , K\}$; $Z_{ki}= 1 [Q_{i}= k]$
Consider binary treatment. Popular naïve idea:
- Measure judge leniency as % of lenient decisions: $\hat{L}_{k}=$
$\sum$
$i Z^{ki}D^{i}$
$\sum$
$i Z^{ki}$
- Then instrument $D_{i}$ with $\hat{L}_{Qi}$
- If assignment is random only within strata, control for strata FE
Problem: $\hat{L}_{k}$ is noisy if there are many judges (and not so many cases per judge)
- $\hat{L}_{Qi}$ is influenced by $D_{i}$, which correlates with $\epsilon_{i}$=$\Rightarrow$ bias
- Conventional inference doesn’t take into account estimation noise

### p. 6 — Correct IV framework

Note that $\hat{L}_{k}$= OLS estimates of $L_{k}$ from a first-stage
$$D_{i}=$$
$$\sum$$
$$k$$
$$L_{k}Z_{ik} + u_{i}$$
$\Rightarrow$ Using fitted values $\hat{L}_{Qi}$ as IV $\Leftarrow \Rightarrow$ 2SLS with $Z_{1}, \ldots , Z_{K}$ instruments
Problem of noisy $\hat{L}_{k}$ is the standard many weak IV problem
- Without covariates, JIVE is natural: uses leave-out leniency $\hat{L}_{i}=$
$\sum$
$j\neq i 1[Q^{j}=Q^{i}]D^{j}$
$\sum$
$j\neq i 1[Q^{j}=Q^{i}]$
- With (many) covariates (e.g., strata FEs with few cases per strata), better to use UJIVE (“unbiased JIVE”; Kolesar (2013)): a version of JIVE that is consistent with many controls

#### p. 6 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Note that $\hat{L}_k = OLS$ estimates of $L_k$ from a first-stage

$$D_i = \sum_k L_k Z_{ik} + u_i$$

- Using fitted values $\hat{L}_Q_i$ as IV $\implies$ 2SLS with $Z_1, ..., Z_K$ instruments

- Problem of noisy $\hat{L}_k$ is the standard many weak IV problem

  - Without covariates, JIVE is natural: uses leave-out leniency $\hat{L}_i = \sum_{j \neq i} \frac{1[Q_i = Q_j] D_j}{\sum_{j \neq i} 1[Q_i = Q_j]}$

  - With (many) covariates (e.g., strata FEs with few cases per strata), better to use UJIVE (“unbiased JIVE”; Kolesar (2013)): a version of JIVE that is consistent with many controls

### p. 7 — Underlying assumptions

With judge assignment dummies $Z_{i1}, \ldots , Z_{iK}$ as IVs, what about:
Independence?
Exclusion?
Monotonicity?

### p. 8 — Underlying assumptions

With judge assignment dummies $Z_{i1}, \ldots , Z_{iK}$ as IVs, what about:
Independence?
- Guaranteed by random assignment, as long as strata FEs are controlled for
Exclusion?
- Does the judge directly make only one decision $D_{i}$?
- Can the judge indirectly affect others treatments, e.g. by affecting who will be making those decisions?
Joint monotonicity: very strong (as usual with multiple IVs)
- A judge who is more lenient on average should be weakly more lenient on everyone
- Violated if judges put different weights on different characteristics of the case

### p. 9 — Tests for monotonicity and exclusion

1. Reject joint monotonicity if the ranking of judges by leniency varies by subgroup of
cases based on observables (see Dobbie, Goldin, and Yang (2018))
2. Frandsen, Lefgren, and Leslie (2023):
- Under all LATE assumptions, comparing any two judges gives causal effects for some complier population
- Causal effects cannot be too large: e.g. bounded by the range of possible outcomes
- Reject exclusion or monotonicity if there is a pair of judges with similar $\mathbb{E} [D_{i}\mid Q_{i}]$ but very different $\mathbb{E} [Y_{i}\mid Q_{i}]$ (like Sarsons (2015) and Kitagawa (2015))
Should we panic if monotonicity doesn’t hold?
- Not with homogeneous effects (or in De Chaisemartin (2017) “Tolerating defiance”)
- Frandsen et al. (2023): 2SLS identifies a convex average of causal effects under “average monotonicity”: for all $i$, $D_{i}(k)$ is positively correlated with $L_{k}$ across $k$

### p. 10 — References I

De Chaisemartin, C. (2017): “Tolerating defiance? Local average treatment effects without
monotonicity: Tolerating defiance?” Quantitative Economics, 8, 367–396.
Dobbie, W., J. Goldin, and C. S. Yang (2018): “The Effects of Pre-Trial Detention on
Conviction, Future Crime, and Employment: Evidence from Randomly Assigned Judges,” American
Economic Review, 108, 201–240.
Frandsen, B., L. Lefgren, and E. Leslie (2023): “Judging Judge Fixed Effects,” American
Economic Review, 113, 253–277.
Kitagawa, T. (2015): “A Test for Instrument Validity,” Econometrica, 83, 2043–2063.
Kolesar, M. (2013): “Estimation in an Instrumental Variables Model With Treatment Effect
Heterogeneity,” 1–45.
Sarsons, H. (2015): “Rainfall and Conflict: A Cautionary Tale,” Journal $of$ Development Economics,
115, 62–72.

## Extraction Gaps

- p. 4: figure or diagram present
- p. 6: display math with drawn rules
