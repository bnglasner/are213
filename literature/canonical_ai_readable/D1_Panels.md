# D1: Linear Panel Data Methods Translation

## Source

- PDF: `literature/raw_pdf/D1_Panels.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/D1_Panels.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 39/39 pages, word recall 0.981, words not in the text layer 0.012.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part D: Panel Data Methods
- p. 2: Panel data methods: Outline
- p. 3: D1 outline
- p. 4: Motivation
- p. 5: Linear panel model
- p. 6: Asymptotic sequences
- p. 7: Notions of exogeneity
- p. 8: Random and fixed effects
- p. 9–10: Estimation by dummy variables (FE) regression
- p. 11: Estimation by first & long differencing
- p. 12: Choosing between FE and FD estimators
- p. 13: Choosing between FE and FD estimators (2)
- p. 14: (untitled)
- p. 15: Inference
- p. 16: Remarks
- p. 17: Outline
- p. 18: Extensions
- p. 19: Random effects estimation
- p. 20: Random effects estimation (2)
- p. 21: Two-way fixed effects (TWFE)
- p. 22: Models with random slopes
- p. 23: Modeling dynamic effects
- p. 24: Arellano-Bond estimator
- p. 25: Nonlinear panel data models
- p. 26: FEs beyond panel data
- p. 27: (untitled)
- p. 28: FEs beyond panel data (2)
- p. 29: FEs beyond panel data (3)
- p. 30: Outline
- p. 31: Application: Are there good firms?
- p. 32: AKM model
- p. 33: Identification
- p. 34: Testing exogenous mobility (Card, Heining, and Kline (2013))
- p. 35: Estimation issues
- p. 36: Kline et al. (2020) findings (for Veneto region in Italy)
- p. 37: Extensions
- p. 38: References I
- p. 39: References II

## Comprehensive Translation

### p. 1 — Part D: Panel Data Methods

D1: Linear Panel Data Methods
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — Panel data methods: Outline

1. Linear panel data methods with constant effects
2. Canonical DiD and event studies
3. DiD with staggered adoption
4. DiD extensions
5. Synthetic control methods and factor models

### p. 3 — D1 outline

1
Estimation, efficiency, inference
2
Extensions
3
Application: Mover designs and the AKM model
Readings: IW Lecture 3 (also CT Ch.21-22 and JW Ch. 10-11)

### p. 4 — Motivation

Selection on observables is rarely convincing in cross-sectional data
- Self-selection is complex, too many unknown confounders
And we don’t always have a convincing instrument
To allow for selection on (some) unobservables, leverage repeated observations for
the same unit over time — panel data
- How do outcomes change when treatment changes?
- This doesn’t resolve the fundamental problem of causal inference but helps control for unobserved confounders that are time-invariant
Panel data are also helpful to evaluate effect dynamics

### p. 5 — Linear panel model

For $i = 1, \ldots , I$ and $t = 1, \ldots , T$, consider a constant-effects model
$$Y_{it}= \beta 'X_{it} + \alpha_{i} + \epsilon_{it}$$
where $\beta$ is of interest; $\alpha_{i}$ is additive “unobserved heterogeneity”
Denote X $_{i}= (X_{i1}, \ldots , X_{iT})$, Y $_{i}= (Y_{i1}, \ldots , Y_{iT})$, $\epsilon_{i}= (\epsilon_{i1}, \ldots , \epsilon_{iT})$
Every $(i, t)$ is observed =$\Rightarrow$ balanced panel; with missing data: unbalanced panel

#### p. 5 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- For $i = 1, ..., I$ and $t = 1, ..., T$, consider a constant-effects model
  $$Y_{it} = \beta'X_{it} + \alpha_i + \epsilon_{it}$$
  where $\beta$ is of interest; $\alpha_i$ is additive "unobserved heterogeneity"

- Denote $X_i = (X_{i1}, ..., X_{iT})$, $Y_i = (Y_{i1}, ..., Y_{iT})$, $\epsilon_i = (\epsilon_{i1}, ..., \epsilon_{iT})$

- Every $(i, t)$ is observed $\Rightarrow$ balanced panel; with missing data: unbalanced panel

### p. 6 — Asymptotic sequences

Conventional asymptotic (our focus): short panel
- A growing sample of $I$ units for a fixed number of periods, $T$
- Appropriate when $I \gg T$
Alternative asymptotic: long panel
- The sample grows by increasing both $I$ and $T$ (at the same or different rates)
- More appropriate when $I \approx T$

### p. 7 — Notions of exogeneity

Contemporaneous exogeneity: $\mathbb{E} [\epsilon_{it}\mid X_{it}, \alpha_{i}] = 0$
- Interpretation: no time-varying confounders
- A natural assumption... but insufficient to identify $\beta$
(Main focus) Strict exogeneity: $\mathbb{E} [\epsilon_{it}\mid X_{i1}, \ldots , X_{iT}, \alpha_{i}] = 0$
- For $h > 0$, Cov $[\epsilon_{it}, X_{i,t-h}] = 0$: precludes unmodeled dynamic effects (but solved by including lags of RHS variables)
- Cov $[\epsilon_{it}, X_{i,t+h}] = 0$: precludes “feedback effects” from $Y_{it}$ to $X_{i,t+h}$
$^{\star}$ Also precludes $X_{it}\equiv Y_{i,t-1}$ as one of the RHS variables — “dynamic panel” models
(For later) Sequential exogeneity: $\mathbb{E} [\epsilon_{it}\mid X_{i1}, \ldots , X_{it}, \alpha_{i}] = 0$
- Allows feedback effects and dynamic panels models

### p. 8 — Random and fixed effects

If selection on $\alpha_{i}$ is allowed, $\mathbb{E} [\alpha_{i}\mid$  X $_{i}]\neq $ const, $\alpha_{i}$ is called fixed effect
- If $\mathbb{E} [\alpha_{i}\mid$  X $_{i}] =$ const (no selection on unobservables) =$\Rightarrow \alpha_{i}$ is a random effect
- These labels are not about whether $\alpha_{i}$ is stochastic (always think random sample of
$(\alpha_{i},$ X $_{i}, \epsilon_{i},$ Y $_{i})^{N}$
$_{i=1}$)
To estimate $\beta$ in the FE model, remove $\alpha_{i}$ in different ways:
- “FE regression”: Dummy variable regression = within transformation
- First differences
- Long differences
Note: random effects model allows for more estimation methods
- “Pooled OLS” regression of $Y_{it}$ on $X_{it}$ across $i, t$ identifies $\beta$
- “Random effects” Generalized Least Squares estimator

### p. 9 — Estimation by dummy variables (FE) regression

View $\{\alpha_{i}\}$ as a set of nuisance parameters multiplying dummies for each unit:
$Y_{it}= \beta 'X_{it} +$
$$I$$
$$\sum$$
$$j=1$$
$$\alpha_{j}W_{ji} + \epsilon_{it},$$
$W_{ji}\equiv 1 [i = j]$
($*$)
- Note: don’t write e.g. $Y_{it}= \beta 'X_{it} + \sum$
$$j \alpha^{j} + \epsilon^{it}$$

#### p. 9 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- View $\{a_i\}$ as a set of nuisance parameters multiplying dummies for each unit:

$$Y_{it} = \beta'X_{it} + \sum_{j=1}^I a_j W_{ij} + \epsilon_{it}, \quad W_{ij} \equiv 1[i=j]$$

(*)

- Note: don't write e.g. $Y_{it} = \beta'X_{it} + \sum_j a_j + \epsilon_{it}$

### p. 10 — Estimation by dummy variables (FE) regression

By FWL, OLS estimation of ($*$) = simple OLS after “within transformation”:
$\dot{Y}_{it}= \beta '\dot{X}_{it} + \dot{\epsilon}_{it},$
$$\dot{V}_{it}\equiv V_{it} -\bar{V}_{i}= V_{it} -1$$
$T$
$T$
$\sum$
$s=1$
$V_{is}$
- Exercise: prove this
- This is much faster than using $I$ dummies! Use reghdfe in Stata, fixest in R
For consistency of $\hat{\beta}$ , we need
$\mathbb{E}$
$[$
$\dot{X}_{it} \dot{\epsilon}_{it}$
$]$
$=\mathbb{E}$
$$[($$
$$X_{it} -1$$
$$T$$
$$T$$
$$\sum$$
$$s=1$$
$$X_{is}$$
$$) ($$
$\epsilon_{it} -1$
$T$
$T$
$\sum$
$s=1$
$\epsilon_{is}$
$)]$
$= 0$
- Holds under strict exogeneity but not contemporaneous/sequential exogeneity
- Question: why is strict exogeneity necessary for ($*$)?

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- By FWL, OLS estimation of $(*)$ = simple OLS after “within transformation”:

  $$Y_{it} = \beta'X_{it} + \epsilon_{it}$$

  $$V_{it} \equiv V_{it} - V_i = V_{it} - \frac{1}{T}\sum_{s=1}^{T} V_{is}$$

- Exercise: prove this
- This is much faster than using $I$ dummies! Use `reghdfe` in Stata, `fixest` in R
- For consistency of $\beta$, we need

  $$E[X_{it}\epsilon_{it}] = E\left[\left(X_{it} - \frac{1}{T}\sum_{s=1}^{T} X_{is}\right)\left(\epsilon_{it} - \frac{1}{T}\sum_{s=1}^{T} \epsilon_{is}\right)\right] = 0$$

- Holds under strict exogeneity but not contemporaneous/sequential exogeneity
- Question: why is strict exogeneity necessary for $(*)$?

### p. 11 — Estimation by first & long differencing

The FE model also implies the first-difference (FD) specification:
$\Delta Y_{it}= \beta '\Delta X_{it} + \Delta \epsilon_{it},$
$$\Delta V_{it}\equiv V_{it} -V_{i,t-1},$$
$t = 2, \ldots , T$
- $\mathbb{E} [\Delta X_{it} \cdot \Delta \epsilon_{it}] = 0$ under strict exogeneity (but not contemporaneous/sequential)
- Exercise: with $T = 2$, OLS estimators of FE and FD equations are identical (even in unbalanced panels) — but not otherwise
And a long-difference specification: for $h > 1$,
$$Y_{it} -Y_{i,t-h}= \beta '(X_{it} -X_{i,t-h}) + (\epsilon_{it} -\epsilon_{i,t-h}) ,$$
$t = h + 1, \ldots , T$
with $\mathbb{E} [(X_{it} -X_{i,t-h}) \cdot (\epsilon_{it} -\epsilon_{i,t-h})] = 0$ under strict exogeneity

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- The FE model also implies the first-difference (FD) specification:

  $$ \Delta Y_{it} = \beta \Delta X_{it} + \Delta \epsilon_{it}, $$

  $$ \Delta V_{it} \equiv V_{it} - V_{it,t-1}, \quad t = 2, ..., T $$

  -  $E[\Delta X_{it} \cdot \Delta \epsilon_{it}] = 0$ under strict exogeneity (but not contemporaneous/sequential)

  -  Exercise: with $T = 2$, OLS estimators of FE and FD equations are identical (even in unbalanced panels) — but not otherwise

- And a long-difference specification: for $h > 1$,

  $$ Y_{it} - Y_{it,t-h} = \beta' (X_{it} - X_{it,t-h}) + (\epsilon_{it} - \epsilon_{it,t-h}), \quad t = h+1, ..., T $$

  with $E[(X_{it} - X_{it,t-h}) \cdot (\epsilon_{it} - \epsilon_{it,t-h})] = 0$ under strict exogeneity

[Figure: 10]

### p. 12 — Choosing between FE and FD estimators

FE and FD estimate $\beta$ from the same model under the same assumption (strict
exogeneity). So how do we choose?
1. Efficiency:
- FE estimator is efficient when $\epsilon_{it}$ are serially uncorrelated
- FD estimator is efficient when $\epsilon_{it}$ follow a random walk (i.e., $\Delta \epsilon_{it}$ are serially uncorrelated)
- It’s not about persistence in the outcome (which could come from $\alpha_{i}$) but about differential persistence of observations close in time
- FD can lose a lot of data in unbalanced panels

### p. 13 — Choosing between FE and FD estimators (2)

2. Robustness to violations of assumptions:
- When contemporaneous or sequential exogeneity holds but strict exogeneity doesn’t, bias $(\hat{\beta}_{FE}) = O(1/T)$ while bias $(\hat{\beta}_{FD}) = O(1)$ (for weakly dependent data)
- Differencing can exacerbate measurement error in $X_{it}$
3. Fads: FE estimation is more popular; it appears that you’ve controlled for more
- False, plus FD & long-diffs are more transparent (especially in more complex situations)
- If you use a FE specification, always rewrite it in FD

### p. 14

https://x.com/KhoaVuUmn/status/1630576551325495296

#### p. 14 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

APPLIED ECONOMISTS
EVERY REGRESSION
[Figure: FIXED EFFECTS, APPLIED ECONOMISTS, EVERY REGRESSION]
https://x.com/KhoaVuUmn/status/1630576551325495296

### p. 15 — Inference

In short panels, always cluster SE by $i$
- See Bertrand, Duflo, and Mullainathan (2004) for an illustration
In FD regressions, non-clustered (heteroskedasticity-robust) SEs require
Cov $[\Delta X_{it}\Delta \epsilon_{it}, \Delta X_{is}\Delta \epsilon_{is}] = 0$
- Unless $X_{it}$ or $\epsilon_{it}$ is a random walk, $\Delta X_{it}$ and $\Delta \epsilon_{it}$ are serially correlated
In FE regressions, need Cov
$$[$$
$$\dot{X}_{it} \dot{\epsilon}_{it}, \dot{X}_{is} \dot{\epsilon}_{is}$$
$$]$$
$$= 0$$
- But $X_{it}$ and $\epsilon_{it}$ are often serially correlated
- And even if $\epsilon_{it}$ are uncorrelated, $\dot{\epsilon}_{it}$ are negatively serially correlated in short panels (although DoF correction by
$$IT$$
$IT-I-dim(X)$ can correct for that)

### p. 16 — Remarks

FE model cannot estimate the effects of time-invariant variables
- They get killed by both within transformation and differencing
There is no intercept in the FE model
- But can estimate $\hat{\alpha}_{i}=^{1}$
$T$
$$\sum$$
$$t$$
$$($$
$$Y_{it} -\hat{\beta} 'X_{it}$$
$$)$$
: unbiased for $\alpha_{i}$ but not consistent in
short panels
- And report $^{1}$
$I$
$\sum$
$i \hat{\alpha}^{i}$ that is consistent for $\mathbb{E} [\alpha^{i}]$
With FEs, $R^{2}$ is often very high and not very informative
- Instead, can use “within $R^{2}$”
- I.e., $R^{2}$ after within-transformation: % of Var
$$[$$
$$\dot{Y}_{i}$$
$]$
explained by Var
$[$
$\dot{X}_{i}$
$]$

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- FE model cannot estimate the effects of time-invariant variables
  - They get killed by both within transformation and differencing
- There is no intercept in the FE model
  - But can estimate $\hat{\alpha}_i = \frac{1}{T} \sum (\dot{Y}_{it} - \beta \dot{X}_{it})$ : unbiased for $\alpha_i$ but not consistent in short panels
  - And report $\frac{1}{T} \sum \hat{\alpha}_i$, that is consistent for $E[\alpha_i]$
- With FEs, $R^2$ is often very high and not very informative
  - Instead, can use "within $R^2$"
  - I.e., $R^2$ after within-transformation: % of Var $[Y_i]$ explained by Var $[X_i]$

### p. 17 — Outline

1
Estimation, efficiency, inference
2
Extensions
Application: Mover designs and the AKM model

### p. 18 — Extensions

1. Random effects estimation
2. Two-way fixed effects
3. Models with random slopes
4. Modeling dynamic effects
5. Nonlinear panel models
6. Fixed effects beyond panel data

### p. 19 — Random effects estimation

In addition to $\mathbb{E} [\epsilon_{it}\mid$  X $_{i}, \alpha_{i}] = 0$, assume $\mathbb{E} [\alpha_{i}\mid$  X $_{i}] = 0$
Then Pooled OLS estimator is consistent:
$Y_{it}= \beta 'X_{it} + v_{it},$
$$v_{it}= \alpha_{i} + \epsilon_{it},$$
Cov $[v_{it}, X_{it}] = 0$
- But inefficient: $v_{it}$ are correlated across all $t$
RE estimator: feasible GLS for Var $[\epsilon_{i}\mid$  X $_{i}, \alpha_{i}] = \sigma^{2}$
$_{\epsilon}\mathbb{I}_{T}$ and Var $[\alpha_{i}\mid$  X $_{i}] = \sigma^{2}$
$_{\alpha}$:
$\hat{\beta}_{RE}=$
$(\sum$
$i$
X $'$
$i \hat{\Omega}^{-1}$ X $^{i}$
$)-1 (\sum$
$$i$$
X $'$
$i \hat{\Omega}^{-1}$ Y $^{i}$
$$)$$
$$,$$
$$\hat{\Omega} =$$
$\hat{\sigma}^{2}$
$\alpha + \hat{\sigma}^{2}$
$\epsilon$
$\hat{\sigma}^{2}$
$\alpha$
$\ldots$
$\hat{\sigma}^{2}$
$\alpha$
$...$
$\hat{\sigma}^{2}$
$\alpha$
$\hat{\sigma}^{2}$
$\alpha$
$\ldots$
$\hat{\sigma}^{2}$
$\alpha + \hat{\sigma}^{2}$
$\epsilon$

#### p. 19 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: pmatrix._

- In addition to $E[ \epsilon_{it} | X_{i}, \alpha_{i}] = 0$, assume $E[ \alpha_{i} | X_{i}] = 0$
- Then Pooled OLS estimator is consistent:

  $Y_{it} = \beta'X_{it} + V_{it} + \alpha_{i} + \epsilon_{it}$, $V_{it} = \alpha_{i} + \epsilon_{it}$, $Cov[V_{it}, X_{it}] = 0$

- But $V_{it}$ are correlated across all $t$
- RE estimator: feasible GLS for $Var[ \epsilon_{it} | X_{i}, \alpha_{i}] = \sigma_1^2 I_T$ and $Var[ \alpha_{i} | X_{i}] = \sigma_2^2$:

  $$ \hat{\beta}_{RE} = \left( \sum_{i} X'_{i} \Omega^{-1} X_{i} \right)^{-1} \left( \sum_{i} X'_{i} \Omega^{-1} Y_{i} \right), \quad \Omega = \begin{pmatrix}
  \sigma_1^2 + \sigma_2^2 & \sigma_2^2 & ... & \sigma_2^2 \\
  \sigma_2^2 & \sigma_2^2 & ... & \sigma_2^2 \\
  ... & ... & ... & ... \\
  \sigma_2^2 & \sigma_2^2 & ... & \sigma_2^2 + \sigma_1^2
  \end{pmatrix} $$

### p. 20 — Random effects estimation (2)

Consistent even without homoskedastic and serially uncorrelated $\epsilon_{it}$
Allows for time-invariant $X_{it}$
Can be obtained via quasi-differencing: OLS for
$($
$Y_{it} -\hat{\lambda} \bar{Y}_{i}$
$$)$$
$$= \beta ' ($$
X $_{it} -\hat{\lambda} \bar{}$ X $_{i}$
$$)$$
$+$
$($
$v_{it} -\hat{\lambda} \bar{v}_{i}$
$)$
where $\hat{\lambda} = 1 -(1 + T\hat{\sigma}^{2}$
$_{\alpha}/\hat{\sigma}^{2}$
$$_{\epsilon})^{-1/2}$$
- $\hat{\lambda} \approx 1$, so $\hat{\beta}_{RE}\approx \hat{\beta}_{FE}$, when $T$ is large or Var $[\alpha_{i}] \gg$ Var $[\epsilon_{it}]$

#### p. 20 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Consistent even without homoskedastic and serially uncorrelated $ \epsilon_{it} $
- Allows for time-invariant $X_{it}$
- Can be obtained via quasi-differencing: OLS for
$$ (Y_{it} - \lambda Y_{i}) = \beta' (X_{it} - \lambda \bar{X}_i) + (V_{it} - \lambda V_i) $$
where $ \lambda = 1 - (1 + T \sigma_a^2 / \sigma_e^2)^{-1/2} $
- $ \lambda \approx 1 $, so $ \beta_{RE} \approx \beta_{FE} $, when $ T $ is large or $ Var[a_i] >> Var[ \epsilon_{it} ] $

18

### p. 21 — Two-way fixed effects (TWFE)

Besides $\alpha_{i}$, we may want to include (additive) period effects $\gamma_{t}$ to capture shocks
that affect all units:
$$Y_{it}= \beta 'X_{it} + \alpha_{i} + \gamma_{t} + \epsilon_{it}$$
(#)
Unlike $\alpha_{i}$, period FEs are non-stochastic parameters (on period dummies)
(#) requires an innocuous normalization on $\{\alpha_{i}\}$ or $\{\gamma_{t}\}$
FE estimator: in balanced panels, OLS from double-differenced specification:
$\ddot{Y}_{it}= \beta '\ddot{X}_{it} + \ddot{\epsilon}_{it},$
$$\ddot{V}_{it}\equiv$$
$$($$
$$V_{it} -\bar{V}_{i}$$
$)$
$-$
$(\bar{V}_{t} -\bar{V}$
$)$
- Follows from FWL, because unit and period dummies are in-sample orthogonal
FD estimator: OLS from $\Delta Y_{it}= \beta '\Delta X_{it} + \Delta \gamma_{t} + \Delta \epsilon_{it}$ where $\Delta \gamma_{t}$ are period FEs

#### p. 21 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Besides $\alpha_i$, we may want to include (additive) period effects $\gamma_t$ to capture shocks that affect all units:
  $$Y_{it} = \beta'X_{it} + \alpha_i + \gamma_t + \epsilon_{it}$$
  (#)
- Unlike $\alpha_i$, period FEs are non-stochastic parameters (on period dummies)
- (#) requires an innocuous normalization on $\{\alpha_i\}$ or $\{\gamma_t\}$
- FE estimator: in balanced panels, OLS from double-differenced specification:
  $$Y_{it} = \beta'X_{it} + \epsilon_{it}$$
  $$\overline{V}_{it} = (V_{it} - \overline{V}_i) - (\overline{V}_t - \overline{V})$$
  - Follows from FWL, because unit and period dummies are in-sample orthogonal
- FD estimator: OLS from $\Delta Y_{it} = \beta'\Delta X_{it} + \Delta \gamma_t + \Delta \epsilon_{it}$ where $\Delta \gamma_t$ are period FEs

19

### p. 22 — Models with random slopes

Consider $Y_{it}= \alpha_{i} + \beta 'X_{it} + \gamma '$
$$_{i}Z_{it}+ \epsilon_{it}$$
- E.g. unit-specific linear trends: $Y_{it}= \alpha_{i} + \beta 'X_{it} + \gamma '$
$_{i}t + \epsilon_{it}$
Dummy variable representation and estimation:
$Y_{it}=$
$I$
$\sum$
$j=1$
$$\alpha_{j}W_{ji} + \beta 'X_{it} +$$
$$I$$
$$\sum$$
$$j=1$$
$\gamma '$
$_{j}Z_{jt}W_{ji}+ \epsilon_{it}$
FWL: for each $i$ separately, residualize $Y_{it}, X_{it}$ on $(1, Z_{it})$ in the time series

#### p. 22 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: number, slide._

- Consider $Y_{it} = \alpha_i + \beta'X_{it} + \gamma'Z_{it} + \epsilon_{it}$

  -  E.g. unit-specific linear trends: $Y_{it} = \alpha_i + \beta'X_{it} + \gamma'_t + \epsilon_{it}$

- Dummy variable representation and estimation:
  $$Y_{it} = \sum_{j=1}^I \alpha_j W_{ij} + \beta'X_{it} + \sum_{j=1}^I \gamma_j Z_{ij} W_{ij} + \epsilon_{it}$$

- FWL: for each i separately, residualize $Y_{it}$, $X_{it}$ on (1, $Z_{it}$) in the time series

[Figure: Slide Number 20]

### p. 23 — Modeling dynamic effects

Distributed lags model can be accommodated with no change:
$Y_{it}= \beta '$
$$_{0}X_{it}+ \beta '$$
$$_{1}X_{i,t-1}+ \ldots \beta '$$
$_{L}X_{i,t-L}+ \alpha_{i}+ \epsilon_{it}$
Lagged dependent variable on the RHS: dynamic panel model
$$Y_{it}= \rho Y_{i,t-1} + \beta 'X_{it} + \alpha_{i} + \epsilon_{it}$$
- Violates strict exogeneity: $\epsilon_{it}$ can’t be mean-independent of $Y_{i,s-1}$ for $s = t + 1$
- At best, we can hope for sequential exogeneity of $Y_{i,t-1}$:
$\mathbb{E} [\epsilon_{it}\mid Y_{i1}, \ldots , Y_{i,t-1},$ X $_{i}, \alpha_{i}] = 0$
- FE estimator is not consistent in short panels: “Nickell bias” $\propto 1/T$
- FD estimator has bias $O(1)$. But FD specification can be estimated by IV...

#### p. 23 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Distributed lags model can be accommodated with no change:
  $$Y_{it} = \beta_0 X_{it} + \beta_1 X_{it,t-1} + ... + \beta_L X_{it,t-L} + \alpha_i + \epsilon_{it}$$

- Lagged dependent variable on the RHS: dynamic panel model
  $$Y_{it} = \rho Y_{it-1} + \beta' X_{it} + \alpha_i + \epsilon_{it}$$

- Violates strict exogeneity: $\epsilon_{it}$ can’t be mean-independent of $Y_{i,s-1}$ for $s = t+1$
- At best, we can hope for sequential exogeneity of $Y_{it-1}$:
  $$E[\epsilon_{it} | Y_{i,1}, ..., Y_{it-1}, X_{i,t}, \alpha_i] = 0$$

- FE estimator is not consistent in short panels: "Nickell bias" $\propto 1/T$
- FD estimator has bias $O(1)$. But FD specification can be estimated with IV...

[Figure: 21]

### p. 24 — Arellano-Bond estimator

FD specification: $\Delta Y_{it}= \rho \Delta Y_{i,t-1} + \beta '\Delta X_{it} + \Delta \epsilon_{i,t}$
OLS doesn’t work: Cov $[\Delta Y_{i,t-1}, \Delta \epsilon_{it}] =$ Cov $[Y_{i,t-1} -Y_{i,t-2}, \epsilon_{it} -\epsilon_{i,t-1}]\neq  0$
But can use $Y_{i1}, \ldots , Y_{i,t-2}$ as IVs for $\Delta Y_{i,t-1}\Rightarrow$ Arellano and Bond (1991)
estimator: GMM for moment conditions collected across $t$
$\mathbb{E}$
$[$
$$(\Delta Y_{it} -\rho \Delta Y_{i,t-1} -\beta '\Delta X_{it}) \cdot (Y_{i1}, \ldots Y_{i,t-2}, \Delta X'$$
$_{it})']$
$= 0,$
$t = 3, \ldots , T$
These IVs can be weak, especially when $\rho$ is close to 1
- Improvements are available, e.g. Blundell and Bond (1998)
Similar ideas can be applied with sequentially exogenous $X_{it}$ other than $Y_{i,t-1}$(with
feedback effects of $\epsilon_{i,t-1}$ on $X_{it}$)

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- FD specification: $\Delta Y_{it} = \rho \Delta Y_{it-1} + \beta' \Delta X_{it} + \Delta \epsilon_{it}$
- OLS doesn’t work: $Cov[\Delta Y_{it-1}, \Delta \epsilon_{it}] = Cov[Y_{it-1}, \epsilon_{it}] \neq 0$
- But can use $Y_{it-1},...,Y_{it-2}$ as IVs for $\Delta Y_{it} \rightarrow$ Arellano and Bond (1991) estimator: GMM for moment conditions collected across $t$
  - $$E[(\Delta Y_{it} - \rho \Delta Y_{it-1} - \beta' \Delta X_{it}) \cdot (Y_{it-1},...,Y_{it-2}, \Delta X_{it})] = 0, \quad t = 3,...,T$$
- These IVs can be weak, especially when $\rho$ is close to 1
  - Improvements are available, e.g. Blundell and Bond (1998)
- Similar ideas can be applied with sequentially exogenous $X_{it}$ other than $Y_{it-1}$ (with feedback effects of $\epsilon_{it-1}$ on $X_{it}$)

### p. 25 — Nonlinear panel data models

Nonlinear models with fixed effects are much more complicated. Consider binary choice
models:
$Pr (Y_{it}= 1 \mid X_{it}, \alpha_{i}) = F(\beta 'X_{it} + \alpha_{i}),$
$F =$ probit or logistic
Likelihood estimation of $\beta$ along with $\{\alpha_{i}\}$ results in the incidental parameter
problem: $\hat{\beta}$ is inconsistent in short panels
- The problem doesn’t arise with linear $F$ because the within transformation kills $\alpha_{i}$
For logistic regression (but not probit), “conditional logit” estimator eliminates $\alpha_{i}$
yielding consistent estimates for $\beta$ :
- But not for average partial effects which depend on $\alpha_{i}$
More progress with long panels; see Fernández-Val and Weidner (2018)

### p. 26 — FEs beyond panel data

There are other types of data with repeated observations:
1. Twin studies = repeated observations in the same family
- E.g. Ashenfelter and Rouse (1998) estimate returns to schooling for twins
$^{\star}X_{i}$= years of schooling
$^{\star}$ Family FEs control for genetic differences
- Warning: why does education vary between twins?
$^{\star}$ Need to explain why confounders are the same between the twins while $X_{it}$ is not
$^{\star}$ Bound and Solon (1999): first-borns have higher weight, IQ, schooling

### p. 27

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: effects, emotional, fixed, honor, khoa, khoavuumn, support, those, your._

Khoa Vu Ⓥ
@KhoaVuUmn

Your honor, those are my emotional support fixed effects.

### p. 28 — FEs beyond panel data (2)

2. County-level cross-section = repeated observations for the same state
- State FEs control for additive state-level unobservables
- E.g. state-level policies with constant effects
3. In a county-level panel, can include state-by-year FEs:
$$Y_{it}= \beta 'X_{it} + \alpha_{i} + \gamma_{s(i),t} + \epsilon_{it}$$
- Including $\gamma_{s(i),t}$ removes state-year-specific means from $Y_{it}$ and $X_{it}$
- Note: $\sum$
$_{s}'_{,t}' \gamma_{s}'_{t}'1 [s(i) = s'] \times 1 [t = t']$ is correct notation; $\gamma_{s(i)}\times \delta_{t}$ is wrong

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

2. County-level cross-section = repeated observations for the same state

- State FEs control for additive state-level unobservables
- E.g. state-level policies with constant effects

3. In a county-level panel, can include state-by-year FEs:

$$Y_{it} = \beta'X_{it} + \alpha_i + \gamma_{s(i),t} + \epsilon_{it}$$

- Including $\gamma_{s(i),t}$ removes state-year specific means from $Y_{it}$ and $X_{it}$
- Note: $\sum_{s',t} \gamma_{s'} 1 [s(i) = s'] \times 1 [t = t']$ is correct notation; $\gamma_{s(i)} \times \delta_t$ is wrong

26

### p. 29 — FEs beyond panel data (3)

4. Repeated cross-sections: in each year a new random sample from each state
- Can’t control for individual heterogeneity
- But state FEs control for additive state-level unobservables
- Cluster at the state-level if $X_{it}$ only varies by state
5. Dyadic data: e.g. how does distance $X_{ij}$ between exporting country $i$ and importing
country $j$ affect log trade flow $Y_{ij}$? (Gravity equation)
- Note: by construction, it’s like a long panel, $I \times I$
- Exercise: Which FE would you include? How would you cluster SE?

### p. 30 — Outline

1
Estimation, efficiency, inference
2
Extensions
Application: Mover designs and the AKM model

### p. 31 — Application: Are there good firms?

Abowd, Kramarz, and Margolis (1999): Are there good firms that pay higher
wages to the same workers?
- How much variation in wages is explained by worker characteristics? By firm characteristics?
- Do “better” workers tend to work for “better” firms?
Use 10 years of employer-employee matched data for France
- A panel of workers $i$: observe employer ID j $(it)$, experience, wages

### p. 32 — AKM model

Model of log-wages $Y_{it}$:
$$Y_{it}= \beta 'X_{it} + \alpha_{i} + \gamma_{j(it)} + \epsilon_{it}$$
$X_{it}$ are time-varying observables, e.g. experience — not of interest
$\{\alpha_{i}\}$ are worker FEs; $\{\gamma_{j}\}$ are firm FEs
$\epsilon_{it}$ captures match-specific wage premium

#### p. 32 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Model of log-wages $Y_{it}$:

$$Y_{it} = \beta' X_{it} + \alpha_i + \gamma_j(it) + \epsilon_{it}$$

- $X_{it}$ are time-varying observables, e.g. experience — not of interest

-  $\{ \alpha_i \}$ are worker FEs; $\{ \gamma_j(it) \}$ are firm FEs

- $\epsilon_{it}$ captures match-specific wage premium

[Figure: 29]

### p. 33 — Identification

Relative firm FEs are identified by movers:
$$\Delta Y_{it}= \beta '\Delta X_{it} +$$
$$($$
$$\gamma_{j(it)} -\gamma_{j(i,t-1)}$$
$)$
$+ \Delta \epsilon_{it}$
- (actual estimation via dummy variable regression, not in first-differences)
- Identification only within a connected component of the worker-firm graph
Requires strict exogeneity: $\mathbb{E} [\epsilon_{it}\mid X_{i1}, \ldots , X_{iT}, \alpha_{i},$ j $(i1), \ldots ,$ j $(iT)] = 0$
- Matching of firms and workers can depend on FEs but not on match quality $\epsilon_{it}$ (“exogenous mobility”)

### p. 34 — Testing exogenous mobility (Card, Heining, and Kline (2013))

Do movers from high-$\gamma$ to low-$\gamma$ firms lose less than movers from low-$\gamma$ to high-$\gamma$ gain?
(use quartiles of average wages paid to other workers; German employer-employee data)

#### p. 34 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Do movers from high-$\gamma$ to low-$\gamma$ firms lose less than movers from low-$\gamma$ to high-$\gamma$ gain?

[Figure: B 5.2 Mean Log Wage of Movers Time (0 = first year on new job) 4 to 4 4 to 3 4 to 2 4 to 1 1 to 4 1 to 3 1 to 2 1 to 1 FIGURE V (use quartiles of average wages paid to other workers; German employer-employee data)]

### p. 35 — Estimation issues

Card et al. (2013) compute:
- Variances of $\hat{\alpha}_{i}$ and $\hat{\gamma}_{j(it)}$ as worker and firm contributions to wage inequality
- Covariance of $\hat{\alpha}_{i}$ and $\hat{\gamma}_{j(it)}$ as a measure of sorting
But FEs are not estimated consistently!
- For all workers, at most 8 wage observations $\Rightarrow$ Var $[\hat{\alpha}_{i}]$ biased $\uparrow$
- For many firms, there are only a few movers $\Rightarrow$ Var
$[$
$\hat{\gamma}_{j(it)}$
$]$
biased $\uparrow$ and
Cov
$[$
$\hat{\alpha}_{i}, \hat{\gamma}_{j(it)}$
$]$
biased $\downarrow$
Kline, Saggio, and Solvsten (2020) provide a bias correction
- Consistent estimates of Var $[\alpha_{i}] ,$ Var
$$[$$
$$\gamma_{j(it)}$$
$$]$$
$,$ Cov
$[$
$\alpha_{i}, \gamma_{j(it)}$
$]$
without consistent
estimates of the FEs

#### p. 35 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Card et al. (2013) compute:
  - Variances of $\hat{\alpha}_i$ and $\hat{\gamma}_{f(it)}$ as worker and firm contributions to wage inequality
  - Covariance of $\hat{\alpha}_i$ and $\hat{\gamma}_{f(it)}$ as a measure of sorting
- But FEs are not estimated consistently!
  - For all workers, at most 8 wage observations $\Rightarrow$ Var $[\hat{\alpha}_i]$ biased $\uparrow$
  - For many firms, there are only a few movers $\Rightarrow$ Var $[\hat{\gamma}_{f(it)}]$ biased $\uparrow$ and Cov $[\hat{\alpha}_i, \hat{\gamma}_{f(it)}]$ biased $\downarrow$
- Kline, Saggio, and Solvsten (2020) provide a bias correction
  - Consistent estimates of Var $[\hat{\alpha}_i]$, Var $[\hat{\gamma}_{f(it)}]$, Cov $[\hat{\alpha}_i, \hat{\gamma}_{f(it)}]$ without consistent estimates of the FEs

32

### p. 36 — Kline et al. (2020) findings (for Veneto region in Italy)

#### p. 36 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

TABLE II
VARIANCE DECOMPOSITION<sup>a</sup>

Variance of Firm Effects
 Plug in (PI) 0.0358 0.0368 0.0415
 Homoscedasticity Only (HO) 0.0295 0.0270 0.0350
 Leave Out (KSS) 0.0240 0.0218 0.0204

Variance of Person Effects
 Plug in (PI) 0.1321 0.0843 0.2180
 Homoscedasticity Only (HO) 0.1173 0.0647 0.2046
 Leave Out (KSS) 0.1119 0.0596 0.1910

Covariance of Firm, Person Effects
 Plug in (PI) 0.0039 -0.0058 -0.0032
 Homoscedasticity Only (HO) 0.0097 0.0030 0.0040
 Leave Out (KSS) 0.0147 0.0075 0.0171

Correlation of Firm, Person Effects
 Plug in (PI) 0.0565 -0.1040 -0.0334
 Homoscedasticity Only (HO) 0.1649 0.0726 0.0475
 Leave Out (KSS) 0.2830 0.2092 0.2744

Coefficient of Determination ($R^2$)
 Plug in (PI) 0.9546 0.9183 0.9774
 Homoscedasticity Only (HO) 0.9029 0.8184 0.9524
 Leave Out (KSS) 0.8976 0.8091 0.9489

[Figure: TABLE II VARIANCE DECOMPOSITION<sup>a</sup> Pooled Younger Workers Older Workers]

33

### p. 37 — Extensions

See Kline (2024) for a modern treatment
Hull (2018) interprets mover designs under heterogeneous effects
Versions of the AKM model have been applied in other settings:
- Wages depend on worker FE and city FE (Glaeser and Mare (2001))
- Log healthcare utilization depends on person FE (“demand”) and location FE (“supply”) (Finkelstein, Gentzkow, and Williams (2016))
- Changes in credit depends on client firm FE (demand) and bank FE (supply) (Amiti and Weinstein (2018), in a cross-section)

### p. 38 — References I

Abowd, J. M., F. Kramarz, and D. N. Margolis (1999): “High wage workers and high wage
firms,” Econometrica, 67, 251–333.
Amiti, M. and D. E. Weinstein (2018): “How Much Do Idiosyncratic Bank Shocks Affect
Investment? Evidence from Matched Bank-Firm Loan Data,” Journal $of$ Political Economy, 126,
525–587.
Arellano, M. and S. Bond (1991): “Some Tests of Specification for Panel Data: Monte Carlo
Evidence and an Application to Employment Equations,” The Review $of$ Economic Studies, 58, 277.
Ashenfelter, O. and C. Rouse (1998): “Income, Schoolig, and Ability: Evidence from a New
Sample of Identical Twins,” Quarterly Journal $of$ Economics, 113, 253–284.
Bertrand, M., E. Duflo, and S. Mullainathan (2004): “How Much Should We Trust
Differences-in-Differences Estimates?” The Quarterly Journal $of$ Economics, 119, 249–275.
Blundell, R. and S. Bond (1998): “Initial conditions and moment restrictions in dynamic panel
data models,” Journal $of$ Econometrics, 87, 115–143.
Bound, J. and G. Solon (1999): “Double trouble: on the value of twins-based estimation of the
return to schooling,” Economics $of$ Education Review, 18, 169–182.

### p. 39 — References II

Card, D., J. Heining, and P. Kline (2013): “Workplace Heterogeneity and the Rise of West
German Wage Inequality,” Quarterly Journal $of$ Economics, 128, 967–1015.
Fernández-Val, I. and M. Weidner (2018): “Fixed Effects Estimation of Large- $T$ Panel Data
Models,” Annual Review $of$ Economics, 10, 109–138.
Finkelstein, A., M. Gentzkow, and H. Williams (2016): “Sources of Geographic Variation in
Health Care: Evidence From Patient Migration,” The Quarterly Journal $of$ Economics, 131,
1681–1726.
Glaeser, E. L. and D. C. Mare (2001): “Cities and Skills,” Journal $of$ Labor Economics, 19,
316–342.
Hull, P. (2018): “Estimating Treatment Effects in Mover Designs,” Working Paper.
Kline, P. (2024): “Firm wage effects,” in Handbook $of$ Labor Economics, Elsevier, vol. 5, 115–181.
Kline, P., R. Saggio, and M. Solvsten (2020): “Leave-Out Estimation of Variance
Components,” Econometrica, 88, 1859–1898.

## Extraction Gaps

- p. 5: display math with drawn rules
- p. 9: display math with drawn rules
- p. 10: display math with drawn rules
- p. 11: display math with drawn rules
- p. 14: figure or diagram present
- p. 15: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 16: display math with drawn rules
- p. 19: display math with drawn rules; large delimiter (matrix or cases)
- p. 20: display math with drawn rules
- p. 21: display math with drawn rules
- p. 22: display math with drawn rules
- p. 23: display math with drawn rules
- p. 24: display math with drawn rules
- p. 27: figure or diagram present
- p. 28: display math with drawn rules
- p. 32: display math with drawn rules
- p. 33: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 34: figure or diagram present
- p. 35: display math with drawn rules
- p. 36: figure or diagram present
