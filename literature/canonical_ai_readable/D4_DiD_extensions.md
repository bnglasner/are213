# D4: Difference-in-Differences: Extensions Translation

## Source

- PDF: `literature/raw_pdf/D4_DiD_extensions.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/D4_DiD_extensions.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 36/36 pages, word recall 0.987, words not in the text layer 0.003.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part D: Panel Data Methods
- p. 2: Extensions
- p. 3: D4 outline
- p. 4: DiD with covariates (1)
- p. 5: DiD with covariates (2)
- p. 6: DiD with covariates: What NOT to do
- p. 7: Results without and with state-specific trends
- p. 8: Example of California
- p. 9: Example of California (2)
- p. 10: Partial identification approach
- p. 11: Simplified case: $N = \infty$
- p. 12: With sampling noise
- p. 13: Partial identification approach (cont’d)
- p. 14: Outline
- p. 15: Restrictions on treatment effects
- p. 16: Restrictions on treatment effects (2)
- p. 17: Outline
- p. 18: Anticipation effects
- p. 19: Spillovers (1)
- p. 20: Spillovers (2)
- p. 21: Outline
- p. 22: Continuous treatment intensity (1)
- p. 23: Continuous treatment intensity (2)
- p. 24: Continuous treatment intensity (3)
- p. 25: Continuous treatment intensity (4)
- p. 26: Treatment reversals
- p. 27: Outline
- p. 28: Repeated cross-sections
- p. 29: Two-dimensional cross-sections
- p. 30: Triple-differences (1)
- p. 31: Triple-differences (2)
- p. 32: Triple-differences (3)
- p. 33: Triple-diff $\neq $ effect heterogeneity
- p. 34: References I
- p. 35: References II
- p. 36: References III

## Comprehensive Translation

### p. 1 — Part D: Panel Data Methods

D4: Difference-in-Differences: Extensions
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — Extensions

Feature
Baseline
Extensions
Model of $Y(0)$:
TWFE (PTA)
Including covariates
Partial identification approach
Multiplicative models
Factor models
Model of $\tau_{it}$:
Arbitrary heterogeneity
Ex ante restrictions
Maintained
No anticipation effects
Some anticipation effects
assumptions:
No spillovers
Some spillovers
Treatment:
Binary
Discrete or continuous
Absorbing
Treatment reversals
Data structure:
Panel
Repeated cross-sections
Two-dimensional cross-sections
Triple-difference designs

### p. 3 — D4 outline

1
Richer models of $Y(0)$: covariates and partial identification
2
Restrictions on treatment effects
3
Anticipation and spillover effects
4
Treatments beyond binary absorbing
Beyond panel data

### p. 4 — DiD with covariates (1)

Two ways of thinking about covariates:
1. Borusyak, Jaravel, and Spiess (2024): make the model of $Y_{it}(0)$ richer,
$$\mathbb{E} [Y_{it}(0)] = \alpha_{i} + \beta_{t} + \gamma 'X_{it}$$
- Continuous covariates (avoid bad controls!)
- Unit-specific linear trends $\gamma_{i} \cdot t$
- Time-interacted baseline characteristics $\gamma '$
$_{t}X_{i}$,
e.g. state-year FE in a county-level panel
- Exercise: What do these mean in first-differences?
$\Rightarrow$ Estimate $\gamma$ from untreated observations only (along with $\alpha_{i}, \beta_{i}$), then imputation

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Two ways of thinking about covariates:

1. Borusyak, Jaravel, and Spiess (2024): make the model of $Y_{it}(0)$ richer,

$$E[Y_{it}(0)] = \alpha_i + \beta_t + \gamma' X_{it}$$

-  Continuous covariates (avoid bad controls!)
-  Unit-specific linear trends $\gamma_i \cdot t$
-  Time-interacted baseline characteristics $\gamma_i^0 X_i$
    - e.g. state-year FE in a county-level panel
-  Exercise: What do these mean in first-differences?
-  $\Rightarrow$ Estimate $\gamma$ from untreated observations only (along with $\alpha_i$, $\beta_t$), then imputation

### p. 5 — DiD with covariates (2)

2. Impose PTA conditional on baseline characteristics
Abadie (2005) and Sant’Anna and Zhao (2020) for non-staggered DiD:
$$\mathbb{E} [\Delta Y_{it}(0) \mid G_{i}= 1, X_{i}] =\mathbb{E} [\Delta Y_{it}(0) \mid G_{i}= 0, X_{i}]$$
- A standard problem of selection on observables for $\Delta Y_{it}$(for ATT)
$\Rightarrow$ Propose to use inverse probability weighting (Abadie (2005)), augmented IPW, or
other covariate adjustment (Sant’Anna and Zhao (2020))
Callaway and Sant’Anna (2021) extend this approach to manual averaging under
staggered adoption
- Impose $\mathbb{E} [\Delta Y_{it}(0) \mid X_{i}, E_{i}= e] =\mathbb{E} [\Delta Y_{it}(0) \mid X_{i}, E_{i}> s]$ for all $s \geq t \geq e$
- Involves estimating a separate pscore for each $e, t$

### p. 6 — DiD with covariates: What NOT to do

With heterogeneous effects, do not just add covariates to TWFE and event study
regressions even in non-staggered settings, e.g. avoid
$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} + \tau D_{it} + \gamma 'X_{it} +$ error
- $\hat{\gamma}$ will use treated observations too, misattributing some treatment effects
Example: Wolfers (2006) studies the effect of unilateral divorce laws on divorce
rates
- Reanalyzes Friedberg (1998) who found a positive effect when including state-specific linear trends

### p. 7 — Results without and with state-specific trends

Which results should we trust: with extra controls or without?

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Results without and with state-specific trends]

Panel A. Friedberg (1998)

|                 | (1) Basic specification | (2) State-specific trends linear |
|-----------------|-------------------------|-----------------------------------|
| Unilateral      | 0.004                  | 0.447                             |
|                 | (0.056)                | (0.050)                           |
| Year effects    | $F = 89.0$             | $F = 95.3$                        |
| State effects   | $F = 217.3$            | $F = 196.2$                       |
| State trend, linear | No                     | $F = 24.7$                        |
| State trend, quadratic | No                     | No                                |
| Adjusted $R^2$ | 0.946                  | 0.976                             |

Which results should we trust: with extra controls or without?

### p. 8 — Example of California

#### p. 8 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Divorce rate relative to state and year fixed effects

[Figure: Divorce rate relative to the US Deviation from California's long run average, Divorcees’ state and year effects, Friedberg’s short sample, Friedberg’s fitted trend, Actual preexisting trend, Unilateral divorce law adopted, 1950, 1960, 1970, 1980, 1990, 7]

### p. 9 — Example of California (2)

With appropriate estimators, state-specific trends don’t change estimates
(de Chaisemartin and D’Haultfœuille (2023))

#### p. 9 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Divorce rate relative to fitted trend
(and state and year fixed effects)

[Figure: Divorce rate relative to the US Deviation from California’s fitted trend, Divorce relative to Friedberg’s fitted trend, Divorce relative to preexisting trend, Unilateral divorce law adopted, 1950, 1960, 1970, 1980, 1990]

- With appropriate estimators, state-specific trends don’t change estimates
  (de Chaise martin and D’Haultefeuille (2023))

### p. 10 — Partial identification approach

Rambachan and Roth (2023) for non-staggered DiD: checking robustness to PTA
violations
Let $\delta_{t}=\mathbb{E} [Y_{it}(0) -Y_{i,t-1}(0) \mid G_{i}= 1] -\mathbb{E} [Y_{it}(0) -Y_{i,t-1}(0) \mid G_{i}= 0]$
PTA requires $\delta_{t}= 0$; Estimable for $t < E$ but not $t \geq E$
Weaker assumptions for $t \geq E$ as robustness checks:
0. (Not $in$ the paper) Exercise: what would $\delta_{t}=$ const mean?
1. Differential trends are not too large: $\mid \delta_{t}\mid \leq M \cdot$  max $_{s<E} \mid \delta_{s}\mid$

### p. 11 — Simplified case: $N = \infty$

Imagine a stylized event study plot [not a plot of $\delta_{t}$]:

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Imagine a stylized event study [not a plot of $\delta_i$]:
[Figure: E-3, E-2, E-1, E, E+1, vertical lines with error bars, horizontal line]

### p. 12 — With sampling noise

#### p. 12 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: E-3, E-2, E-1, E, E+1, energy, intensity]

11

### p. 13 — Partial identification approach (cont’d)

Rambachan and Roth (2023) weaker assumptions for $t \geq E$:
1. Differential trends are not too large: $\mid \delta_{t}\mid \leq M \cdot$  max $_{s<E} \mid \delta_{s}\mid$
2. Differential trends are smooth: $\mid \delta_{t} -\delta_{t-1}\mid \leq M$
- Note: for $M = 0$ this is not PTA but a linear differential trend
When pre-trends are noisily estimated, conf.interval will be wider
Need to pick $M$ or compute the largest $M$ that doesn’t kill your findings
See Liu (2025) for extensions to staggered adoption via manual averaging and
imputation

### p. 14 — Outline

1
Richer models of $Y(0)$: covariates and partial identification
2
Restrictions on treatment effects
3
Anticipation and spillover effects
4
Treatments beyond binary absorbing
Beyond panel data

### p. 15 — Restrictions on treatment effects

So far we have considered estimators robust to arbitrary effect heterogeneity
This is a strong demand on the estimator =$\Rightarrow$ can’t get all estimands; others can
be noisy
Model is very asymmetric: strong assumptions on $Y_{it}(0)$ and none on $Y_{it}(1)$
With so much heterogeneity possible, are ATTs informative about future policy?
$“Anyone$ who makes $a$ living out $of$ data analysis probably believes that het-
erogeneity $is$ limited enough that the well-understood past can $be$ informative
about the $future”$ (Angrist and Pischke, $2010)$

### p. 16 — Restrictions on treatment effects (2)

Can we identify more estimands (e.g. long-run effects) or get more power for the same
estimands using extra restrictions on $\tau_{it}$ and $Y_{it}(1)$?
Impose some simple model of treatment effects, $\tau_{it}= \Gamma '$
$_{it}\theta$ : e.g.
- $\tau_{it}= \bar{\tau}$ is homogeneous across $i$ and $t$ =$\Rightarrow$ static TWFE specification
- $\tau_{it}\equiv \tau_{t-Ei}$ is homogeneous across $i$ for any given horizon =$\Rightarrow$ semi-dynamic
- $\tau_{it}= 0$ when $t > E_{i} + K$ for some $K$
- $\tau_{it+1}= \tau_{it}$ when $t > E_{i} + K$
Proposition (BJS): Under PTA, spherical errors, and model of $\tau_{it}$, the efficient
unbiased estimator of $\tau_{w}$ is:
1. Run OLS on the full sample for the “true” model: $Y_{it}= \alpha_{i} + \beta_{t} + D_{it}\Gamma '$
$_{it}\theta + \epsilon_{it}$
2. Compute $\hat{\tau}_{it}= \Gamma '$
$_{it}\hat{\theta}$ and $\hat{\tau}_{w}= \sum$
$$^{it\in\Omega}1 w^{it}\hat{\tau}^{it}$$

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: bullet, equations, points, slide, title._

Can we identify more estimands (e.g. long-run effects) or get more power for the same estimands using extra restrictions on $T_{it}$ and $Y_{it}(1)$?

- Impose some simple model of treatment effects, $T_{it} = \Gamma_{it}^0 \theta$: e.g.

  - $T_{it} = \overline{r}$ is homogeneous across $i$ and $t$ $\Rightarrow$ static TWFE specification
  - $T_{it} = T_{t-E_i}$ is homogeneous across $i$ for any given horizon $\Rightarrow$ semi-dynamic
  - $T_{it} = 0$ when $t > E_i + K$ for some $K$
  - $T_{it+1} = T_{it}$ when $t > E_i + K$

- Proposition (BJS): Under PTA, spherical errors, and model of $T_{it}$, the efficient unbiased estimator of $\tau_w$ is:

  1. Run OLS on the full sample for the "true" model: $Y_{it} = \alpha_i + \beta_t + D_{it} \Gamma_{it}^0 + \epsilon_{it}$
  2. Compute $\hat{r}_{it} = \Gamma_{it}^0 \theta$ and $\hat{r}_w = \sum_{i \in \Omega_i} w_i \hat{r}_{it}$

[Figure: Slide title, bullet points, equations, proposition]

### p. 17 — Outline

1
Richer models of $Y(0)$: covariates and partial identification
2
Restrictions on treatment effects
3
Anticipation and spillover effects
4
Treatments beyond binary absorbing
Beyond panel data

### p. 18 — Anticipation effects

If anticipation effects of at most $L$ periods are possible, redefine the treatment to $L$
periods earlier
- Interpret the estimates accordingly
- Can separately estimate anticipation effects vs. post-treatment effects
Same if there is a gap between announcement and implementation (that can vary
by $i$)

### p. 19 — Spillovers (1)

Consider a 2-period DiD with spillovers: $Y_{i2}= Y_{i2}($ D $_{2}) \equiv Y_{i2}(0) + \tau_{i2}($ D $_{2})$
- $\tau_{i2}($ d $_{2})$ is the effect of a vector of treatments d $_{2}$ on person $i$’s outcome relative to the counterfactual where nobody is treated
Impose PTA on untreated outcomes:
$$\mathbb{E} [Y_{i2}(0) -Y_{i1}(0) \mid D_{i2}= 1] =\mathbb{E} [Y_{i2}(0) -Y_{i1}(0) \mid D_{i2}= 0]$$
Then DiD yields relative effect $\mathbb{E} [\tau_{i2}($ D $_{2}) \mid D_{i2}= 1] -\mathbb{E} [\tau_{i2}($ D $_{2}) \mid D_{i2}= 0]$
Identifies the aggregate ATT if and only if $\mathbb{E} [\tau_{i2}($ D $_{2}) \mid D_{i2}= 0] = 0$
- Still cannot separate direct and indirect effects

#### p. 19 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Consider a 2-period DiD with spillovers: $Y_{i2} = Y_{i2}(D_2) \equiv Y_{i2}(0) + \tau_{i2}(D_2)$

- $\tau_{i2}(d_2)$ is the effect of a vector of treatments $d_2$ on person $i$'s outcome relative to the counterfactual where nobody is treated

- Impose PTA on untreated outcomes:
  $$E[Y_{i2}(0) - Y_{i1}(0) | D_{i2} = 1] = E[Y_{i2}(0) - Y_{i1}(0) | D_{i2} = 0]$$

- Then DiD yields relative effect $E[\tau_{i2}(D_2) | D_{i2} = 1] - E[\tau_{i2}(D_2) | D_{i2} = 0]$

- Identifies the aggregate ATT if and only if $E[\tau_{i2}(D_2) | D_{i2} = 0] = 0$

- Still cannot separate direct and indirect effects

[Figure: 16]

### p. 20 — Spillovers (2)

What to do if control group can be affected?
Specify which untreated observations can experience spillover effects (e.g., because
within a short geographic distance from a treated)
View them as a separate treated group
If there are enough observations that are not treated directly or indirectly, use them
as controls
Identify both causal effects on the treated and spillover effects on the untreated as
two estimands

### p. 21 — Outline

1
Richer models of $Y(0)$: covariates and partial identification
2
Restrictions on treatment effects
3
Anticipation and spillover effects
4
Treatments beyond binary absorbing
Beyond panel data

### p. 22 — Continuous treatment intensity (1)

When the treatment is not binary, there are multiple scenarios
Are there untreated units in every period and untreated periods for every unit?
Yes: e.g. in the BJS application, the tax rebate amount is a continuous treatment
but that’s no problem
- PTA on $Y_{it}(0)$ still identifies counterfactual trends
- Can binarize the treatment (without loss) and impute $\tau_{it}= Y_{it}(D_{i}) -Y_{it}(0)$
- Then identify e.g. (1) average MPC as % of household-specific rebate or (2) the total increase in spending as % of total rebates:
$\tau^{(1)}$
$w$
$=$
$1$
$\mid \Omega_{1,h}\mid$
$$\sum$$
$$t-E_{i}=h$$
$$\tau_{it}$$
Rebate $_{i}$
or
$\tau^{(2)}$
$w$
$=$
$\sum$
$t-E_{i}=h \tau^{it}$
$\sum$
$t-E_{i}=h$ Rebate $^{i}$

#### p. 22 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

When the treatment is not binary, there are multiple scenarios

- Are there untreated units in every period and untreated periods for every unit?
- Yes: e.g. in the BJS application, the tax rebate amount is a continuous treatment but that’s no problem
  - PTA on $Y_{it}(0)$ still identifies counterfactual trends
  - Can binarize the treatment (without loss) and impute $\tau_{it} = Y_{it}(D_i) - Y_{it}(0)$
  - Then identify e.g. (1) average MPC as % of household-specific rebate or (2) the total increase in spending as % of total rebates:

$$
\tau_W^{(1)} = \frac{1}{\Omega_{1,h}} \sum_{t-E_i=h}^{\infty} \frac{T_{it}}{Rebate_i}
$$
or
$$
\tau_W^{(2)} = \sum_{t-E_i=h}^{\infty} \frac{T_{it}}{Rebate_i}
$$

18

### p. 23 — Continuous treatment intensity (2)

Are there untreated units in every period, untreated periods for every unit?
No: Then PTA on $Y_{it}(0)$ is unhelpful
Can make progress by randomization, restrictions on heterogeneous effects, or
other/stronger PTAs
de Chaisemartin and D’Haultfœuille (2025) develop a “random coefficients
distributed-lag linear [causal] model”:
$$Y_{it}= \alpha_{i} + \beta_{t} +$$
$$H$$
$$\sum$$
$$h=0$$
$\tau_{ih}D_{i,t-h} + \epsilon_{it}$
- where effects $\tau_{ih}$ vary across $i$ and can be correlated with treatments;
- but don’t depend on $t$ (only on $h$); only appear up to a known lag $H$; are linear in dosage
Expect more work on imputation with other restrictions on heterogeneity

#### p. 23 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: chaise, haultefoeuille, martin._

- Are there untreated units in every period, untreated periods for every unit?
- No: Then PTA on $Y_{it}(0)$ is unhelpful
- Can make progress by randomization, restrictions on heterogeneous effects, or other/stronger PTAs
- de Chaise martin and D’Haultefoeuille (2025) develop a “random coefficients distributed-lag linear [causal] model”:
  $$Y_{it} = \alpha_i + \beta_t + \sum_{h=0}^{H} \tau_{ih}D_{it,t-h} + \epsilon_{it}$$
- where effects $\tau_{ih}$ vary across $i$ and can be correlated with treatments;
- but don’t depend on $t$ (only on $h$); only appear up to a known lag $H$; are linear in dosage
- Expect more work on imputation with other restrictions on heterogeneity

19

### p. 24 — Continuous treatment intensity (3)

Making progress with no untreated units via other/stronger PTAs
Appendix of de Chaisemartin and D’Haultfoeuille (2020) considers settings where
$D_{it}$ is discrete and there are many “stayers” ($D_{it}= D_{i,t-1}$)
- Decide to compare stayers and switchers with the same initial treatment
$\Rightarrow$ Impose $\mathbb{E} [\Delta Y_{i2}(d) \mid D_{i1}= d, D_{i2}] =\mathbb{E} [\Delta Y_{i2}(d) \mid D_{i1}= d]$
- Can identify e.g. $\mathbb{E} [Y_{i2}(D_{i2}) -Y_{i2}(D_{i1}) \mid D_{i2}> D_{i1}]$

### p. 25 — Continuous treatment intensity (4)

Making progress with no untreated units via other/stronger PTAs
de Chaisemartin, d’Haultfoeuille, Pasquier, Sow, and Vazquez‐Bare (2025) extend
this to continuous treatments:
- E.g. $D_{it}$= state-level minimum wage; changes only when there is a local reform
- For switchers, they can’t find stayers with exact same $D_{i1}$=$\Rightarrow$ estimate
$\mathbb{E} [\Delta Y_{i2}(d) \mid D_{i1}= D_{i2}= d]$ nonparametrically for stayers
See Callaway, Goodman-Bacon, and Sant’Anna (2021) for another version of PTA

### p. 26 — Treatment reversals

What if treatment is not an absorbing state?
E.g. Adda (2016): Economic effects of epidemics (e.g., flu); $D_{it}$= dummy for
school holidays
Key assumption: no carryover effects
- If lagged treatment can have effects far into the future, there is no control group
Imputation approach extends immediately
- Estimate $\alpha_{i}, \beta_{t}$ from untreated observations both before and after treatment
de Chaisemartin and D’Haultfoeuille (2020) use groups with $D_{i,t-1}= D_{it}= 1$ as
controls for “leavers” who switch from $D_{i,t-1}= 1$, $D_{it}= 0$
- Requires assuming PTA on $Y_{it}(1)$ for them. Parameter is no longer ATT
The no-carryover effects assumption should be tested

### p. 27 — Outline

1
Richer models of $Y(0)$: covariates and partial identification
2
Restrictions on treatment effects
3
Anticipation and spillover effects
4
Treatments beyond binary absorbing
Beyond panel data

### p. 28 — Repeated cross-sections

Instead of a state-year panel, observe a new random sample of individuals $i$ in each
state $s$ and year $t$
- Can’t include individual FE but don’t need to
- Model $\mathbb{E} [Y_{i}(0)] = \alpha_{s(i)} + \beta_{t(i)}$

### p. 29 — Two-dimensional cross-sections

Suppose we have data by region $i$ and age group $g$ in a single period
$D_{ig}= 1 [g < E_{i}]$, e.g. a policy applies to exactly 18 year-olds but was rolled out in
a staggered way across regions
- Older age cohorts in the same region experienced it, younger didn’t
- Some age cohorts are treated in states that adopted early but not others
- Impose $\mathbb{E} [Y_{ig}(0)] = \alpha_{i} + \beta_{g}$; use older groups and late-adopting regions as controls
Both manual averaging and imputation extend by redefining variables
- E.g. $D_{ib}= 1 [b \geq B_{i}]$ where $b$ is birth year and $B_{i}$ is the earliest birth year eligible

### p. 30 — Triple-differences (1)

Suppose for each state $i = NJ, PA$ and period $t = 1, 2$ we observe groups $g = L, H$:
low- and high-wage occupations
Min.wage should affect group $L$ only: $D_{igt}= 1 [i = NJ] \times 1 [g = L] \times 1 [t = 2]$
Strategy 1 (not triple-differences):
- Use DiD on data from group $L$ to learn the ATT for them
- Also run placebo DiD for group H: test $\tau_{H}= 0$ in
$$Y_{iHt}= \alpha_{iH} + \beta_{Ht} + \tau_{H}1 [i = NJ] \times 1 [t = 2] + \epsilon_{iHt}$$

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Suppose for each state $i = NJ, PA$ and period $t = 1, 2$ we observe groups $g = L, H$: low- and high-wage occupations

- Min. wage should affect group $L$ only: $D_{igt} = 1 [i = NJ] \times 1 [g = L] \times 1 [t = 2]$

- Strategy 1 (not triple-differences):
  - - Use DiD on data from group $L$ to learn the ATT for them
  - - Also run placebo DiD for group $H$: test $\tau_H = 0$ in
    $$Y_{iHt} = \alpha_{iH} + \beta_H t + \tau_H 1[i = NJ] \times 1[t = 2] + \epsilon_{iHt}$$

### p. 31 — Triple-differences (2)

Strategy 2 (triple-differences):
- Allow non-parallel trends between NJ and PA: placebo would fail
- But assume violations of PTA are the same for $g = L, H$:
$$\mathbb{E} [\Delta Y_{NJ,L}(0) -\Delta Y_{PA,L}(0)] =\mathbb{E} [\Delta Y_{NJ,H}(0) -\Delta Y_{PA,H}(0)] \equiv \alpha$$
- Equivalent to $\mathbb{E} [\Delta Y_{ig}(0)] = \alpha_{i} + \beta_{g}$ and $\mathbb{E} [Y_{igt}(0)] = \alpha_{it} + \beta_{gt} + \gamma_{ig}$
- Can estimate ATT $= \tau_{NJ,L,2}$ from 2
$Y_{igt}= \tilde{\alpha}_{it} + \tilde{\beta}_{gt} + \tilde{\gamma}_{ig} + \tau D_{igt} +$ error $_{igt}$

#### p. 31 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: error._

- Strategy 2 (triple-differences):
  - Allow non-parallel trends between NJ and PA: placebo would fail
  - But assume violations of PTA are the same for $g = L, H$:
  $$E[ \Delta Y_{NJ,L}(0) - \Delta Y_{PA,L}(0)] = E[ \Delta Y_{NJ,H}(0) - \Delta Y_{PA,H}(0)] = \alpha$$
  - Equivalent to $E[\Delta Y_{ig}(0)] = \alpha_i + \beta_g$ and $E[Y_{igt}(0)] = \alpha_{it} + \beta_g t + \gamma_{ig}$
  - Can estimate $ATT = TNJ,L,2$ from 2
  $$Y_{igt} = \alpha_{it} + \beta_g t + \gamma_{ig} + \tau_{Digt} + error_{igt}$$

26

### p. 32 — Triple-differences (3)

With multiple groups and periods:
Manual averaging can be manually extended
Imputation extends immediately: estimate
$Y_{igt}(0) = \alpha_{it} + \beta_{gt} + \gamma_{ig} +$ error
on all untreated observations

### p. 33 — Triple-diff $\neq $ effect heterogeneity

Do not confuse triple-differences with estimating effect heterogeneity: in triple-diff,
Group H is untreated in NJ at $t = 2$
Differential trends for group H between NJ and PA are not a consequence of the
treatment, but unexplained
The estimand is the causal effect on group L in NJ at $t = 2$, not some difference in
effects
The regression may look the same, but the underlying assumptions and the
estimand are different

### p. 34 — References I

Abadie, A. (2005): “Semiparametric Difference-in-Difference Estimators,” Review $of$ Economic
Studies, 72, 1–19, iSBN: 0034-6527.
Adda, J. (2016): “Economic Activity and the Spread of Viral Diseases: Evidence from High Frequency
Data,” Quarterly Journal $of$ Economics, 131, 891–941, arXiv: 1011.1669v3 ISBN: 9788578110796.
Angrist, J. D. and J.-S. Pischke (2010): “The Credibility Revolution in Empirical Economics:
How Better Research Design is Taking the Con out of Econometrics,” Journal $of$ Economic
Perspectives, 24, 3–30.
Borusyak, K., X. Jaravel, and J. Spiess (2024): “Revisiting Event Study Designs: Robust and
Efficient Estimation,” Review $of$ Economic Studies, 91, 3253–3285.
Callaway, B., A. Goodman-Bacon, and P. H. Sant’Anna (2021): “Difference-in-Differences
with a Continuous Treatment,” Working paper, arXiv: 2107.02637.
Callaway, B. and P. H. Sant’Anna (2021): “Difference-in-Differences with Multiple Time
Periods,” Journal $of$ Econometrics.
de Chaisemartin, C. and X. D’Haultfoeuille (2020): “Two-way fixed effects estimators with
heterogeneous treatment effects,” American Economic Review, 110, 2964–2996.

### p. 35 — References II

de Chaisemartin, C., X. d’Haultfoeuille, F. Pasquier, D. Sow, and G. Vazquez‐Bare
(2025): “Difference-in-Differences Estimators for Treatments Continuously Distributed at Every
Period,” Working Paper.
de Chaisemartin, C. and X. D’Haultfœuille (2025): “Treatment-Effect Estimation in
Complex Designs under a Parallel-trends Assumption,” Technical Report.
de Chaisemartin, C. and X. D’Haultfœuille (2023): “Two-way fixed effects and
differences-in-differences with heterogeneous treatment effects: a survey,” The Econometrics
Journal, 26, C1–C30.
Friedberg, L. (1998): “Did Unilateral Divorce Raise Divorce Rates? Evidence from Panel Data,”
NBER Working Paper.
Liu, Z. (2025): “Cohort-Anchored Robust Inference for Event-Study with Staggered Adoption,” arXiv
preprint.
Rambachan, A. and J. Roth (2023): “An More Credible Approach to Parallel Trends,” Review $of$
Economic Studies, 90, 2555–2591.

### p. 36 — References III

Sant’Anna, P. H. and J. Zhao (2020): “Doubly robust difference-in-differences estimators,”
Journal $of$ Econometrics, 219, 101–122, arXiv: 1812.01723 Publisher: Elsevier B.V.
Wolfers, J. (2006): “Did Unilateral Divorce Laws Raise Divorce Rates? A Reconciliation and New
Results,” American Economic Review, 1802–1820.

## Extraction Gaps

- p. 4: display math with drawn rules
- p. 5: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 7: figure or diagram present
- p. 8: figure or diagram present
- p. 9: figure or diagram present
- p. 11: figure or diagram present
- p. 12: figure or diagram present
- p. 16: display math with drawn rules
- p. 19: display math with drawn rules
- p. 22: display math with drawn rules
- p. 23: display math with drawn rules
- p. 30: display math with drawn rules
- p. 31: display math with drawn rules
- p. 32: figure or diagram present; layout reconstruction withheld: it wrote math the page does not have
