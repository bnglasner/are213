# Kirill Borusyak Translation

## Source

- PDF: `literature/raw_pdf/G_nonlinear.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/G_nonlinear.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 20/20 pages, word recall 0.982, words not in the text layer 0.015.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part G: Models with Multiplicative Effects
- p. 2: G Outline
- p. 3: Multiplicative effects
- p. 4: Issue of zeros
- p. 5: Modeling multiplicative effects
- p. 6: Estimating the exponential model
- p. 7: Nonlinear least squares (NLLS)
- p. 8: PPML
- p. 9: PPML with fixed effects
- p. 10: (untitled)
- p. 11: Application
- p. 12: Outline
- p. 13: A causal interpretation and heterogeneous effects
- p. 14: Case without zeros
- p. 15: Case with zeros
- p. 16: Case with zeros (2)
- p. 17: PPML diff-in-diff
- p. 18: Thanks!
- p. 19: References I
- p. 20: References II

## Comprehensive Translation

### p. 1 — Part G: Models with Multiplicative Effects

Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — G Outline

1
Modeling multiplicative effects
2
Multiplicative effects and potential outcomes
Reading: Chen and Roth (2024)

### p. 3 — Multiplicative effects

With non-negative outcomes, it’s often more natural to think that the effects are
multiplicative, rather than additive
- E.g. $X_{i}$= regional trade agreement between countries, $Y_{i}$= import value
- E.g. $X_{i}$= log price, $Y_{i}$= demand
How should we deal with this case? Models? Estimands? Estimators?
- Start with homogeneous effects; then add heterogeneity
Common practice: use log $Y_{i}$ as outcome, log $Y_{i}= \beta 'X_{i} + \epsilon_{i}$
- Assuming $\mathbb{E} [\epsilon_{i}\mid X_{i}] = 0$ (i.e., $\mathbb{E} [$ log $Y_{i}\mid X_{i}] = \beta 'X_{i}$), OLS in logs is consistent for (constant effect) $\beta$

### p. 4 — Issue of zeros

If there are zeros ($Pr(Y_{i}= 0) > 0$), log $Y_{i}$ is not well-defined
Common to use log-like transformations: log $(1 + Y_{i})$ or inverse hyperbolic sine
arcsinh $(Y_{i}) \equiv$ log
$Y_{i} +$
$p$
$$1 + Y^{2}$$
$$i$$
(well-defined for $Y_{i}< 0$ and symmetric)
-2
-1
0
1
2
3
0
2
4
6
8
10
log(x)
log(1+x)
asinh(x)
With and without zeros, are these good ideas? Are there other options?

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- If there are zeros ($Pr(Y_i = 0) > 0$), $log Y_i$ is not well-defined.
- Common to use log-like transformations: $log(1 + Y_i)$ or inverse hyperbolic sine
  $$arcsinh(Y_i) = log(Y_i + \sqrt{1 + Y_i^2})$$ (well-defined for $Y_i < 0$ and symmetric)

[Figure: y_i, log(1+x), log(x), asinh(x)]

- With and without zeros, are these good ideas? Are there other options?

### p. 5 — Modeling multiplicative effects

Compare three models:
1. log $Y_{i}= \beta 'X_{i} + \epsilon_{i}$,
$$\mathbb{E} [\epsilon_{i}\mid X_{i}] = 0$$
2. $Y_{i}=$ exp $(\beta 'X_{i})U_{i}$,
$$\mathbb{E} [U_{i}\mid X_{i}] = 1$$
3. $Y_{i}=$ exp $(\beta 'X_{i}) + \epsilon_{i}$,
$$\mathbb{E} [\epsilon_{i}\mid X_{i}] = 0$$
Are #1 and #2 equivalent? No! (Santos Silva and Tenreyro $(2006))$
Are #2 and #3 equivalent? Yes! Define $\epsilon_{i}=$ exp $(\beta 'X_{i}) (U_{i} -1)$
- Both models impose $\mathbb{E} [Y_{i}\mid X_{i}] =$ exp $(\beta 'X_{i})$ (or equivalently log $\mathbb{E} [Y_{i}\mid X_{i}] = \beta 'X_{i}$ instead of $\mathbb{E} [$ log $Y_{i}\mid X_{i}] = \beta 'X_{i}$ in #1)

#### p. 5 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Compare three models:
  - 1. $log Y_{it} = \beta'X_i + \epsilon_i$, $E[\epsilon_i | X_i] = 0$
  - 2. $Y_{it} = exp(\beta'X_i)U_{it}$, $E[U_{it} | X_i] = 1$
  - 3. $Y_{it} = exp(\beta'X_i) + \epsilon_i$, $E[\epsilon_i | X_i] = 0$

- Are #1 and #2 equivalent? No! (Santos Silva and Tenreyro (2006))
- Are #2 and #3 equivalent? Yes! Define $\epsilon_i = exp(\beta'X_i) (U_{it} - 1)$
  - Both models impose $E[Y_i | X_i] = exp(\beta'X_i)$ (or equivalently $log E[Y_i | X_i] = \beta'X_i$ instead of $E[log Y_i | X_i] = \beta'X_i$ in #1)
[Figure: 4]

### p. 6 — Estimating the exponential model

How would we estimate the model $\mathbb{E} [Y_{i}\mid X_{i}] =$ exp $(\beta 'X_{i}) \equiv \mu (X_{i}, \beta )$?
Could use moment conditions $\mathbb{E} [g(X_{i}) \cdot (Y_{i} -$ exp $(\beta 'X_{i}))] = 0$ for any vector $g(\cdot )$
- Most efficient $g(X_{i}) \propto^{\partial \mu(Xi,\beta)}$
$$\partial \beta '$$
$/$ Var $[Y_{i}\mid X_{i}] =^{exp(\beta'Xi)}$
$_{Var[Yi\midXi]}X_{i}$
Nonlinear least squares (NLLS): $g(X_{i}) =$ exp $(\beta 'X_{i}) \cdot X_{i}$
- Efficient when Var $[Y_{i}\mid X_{i}] =$ const (usually very wrong in practice)
Poisson Pseudo Maximum Likelihood (PPML): $g(X_{i}) = X_{i}$
- Efficient when Var $[Y_{i}\mid X_{i}] \propto \mu (X_{i}, \beta )$
Gamma-PML: $g(X_{i}) =$
$1$
$$_{exp(\beta'Xi)}X_{i}$$
- Efficient when Var $[Y_{i}\mid X_{i}] \propto \mu (X_{i}, \beta )^{2}$

#### p. 6 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

How would we estimate the model $E[Y_i | X_i] = exp(\beta'x_i) = \mu(X_i, \beta)$?

- Could use moment conditions $E[g(X_i) \cdot (Y_i - exp(\beta'X_i))] = 0$ for any vector $g(\cdot)$
  -  Most efficient $g(X_i) \propto \frac{\partial \mu(X_i, \beta)}{\partial \beta} / Var[Y_i | X_i] = \frac{exp(\beta'X_i)}{Var[Y_i | X_i]}$
- Nonlinear least squares (NLLS): $g(X_i) = exp(\beta'X_i) \cdot X_i$
  - Efficient when $Var[Y_i | X_i] = const$ (usually very wrong in practice)
- Poisson Pseudo Maximum Likelihood (PPML): $g(X_i) = X_i$
  - Efficient when $Var[Y_i | X_i] \propto \mu(X_i, \beta)$
- Gamma-PML: $g(X_i) = \frac{1}{exp(\beta'X_i)} X_i$
  - Efficient when $Var[Y_i | X_i] \propto \mu(X_i, \beta)^2$

[Figure: 5]

### p. 7 — Nonlinear least squares (NLLS)

$\hat{\beta}_{NLLS}=$ arg min
$$b$$
$$X$$
$$i$$
$(Y_{i} -$ exp $(b'X_{i}))^{2}$
FOC:
$0 =$
$X$
$i$
$Y_{i} -$ exp
$$\hat{\beta} '$$
$$_{NLLS}X_{i}$$
$\cdot$  exp
$\hat{\beta} '$
$_{NLLS}X_{i}$
$X_{i}$
$\mid$
$\{z$
$\}$
$\hat{g}(X_{i})$
This is MLE under $Y_{i}\mid X_{i}\sim N($ exp $(\beta 'X_{i}) , \sigma^{2})$
- But consistent under $\mathbb{E} [Y_{i}\mid X_{i}] =$ exp $(\beta 'X_{i})$ without normality and homoskedasticity
- And efficient if additionally Var $[Y_{i}\mid X_{i}] =$ const, without normality

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

$$\hat{\beta}_{NLLS} = \arg \min_{b} \sum_{i} (Y_{i} - \exp(b'X_{i}))^2$$

$$FOC: \ 0 = \sum_{i} (Y_{i} - \exp(\hat{\beta}_{NLLS}'X_{i})) \cdot \frac{\exp(\hat{\beta}_{NLLS}'X_{i})}{g(X_{i})}$$

- This is MLE under $Y_{i} \sim N(\exp(\hat{\beta}'X_{i}), \sigma^2)$
  - But consistent under $E[Y_{i} | X_{i}] = \exp(\hat{\beta}'X_{i})$ without normality and homoskedasticity
  - And efficient if additionally $Var[Y_{i} | X_{i}] = const$, without normality

### p. 8 — PPML

Originates as MLE for count data, $Y_{i}\in \{0, 1, 2, \ldots \}$:
$Y_{i}\mid X_{i}\sim$ Poisson $(\mu (X_{i}, \beta )),$
i.e. $Pr(Y_{i}= k \mid X_{i}) = \mu (X^{i}, \beta )^{k}$ exp $(-\mu (X^{i}, \beta ))$
$k!$
- Log-likelihood: $L = P$
$i (Y^{i} \cdot \beta 'X^{i} -$ exp $(\beta 'X^{i})) +$ const
- FOC: $P$
$i$
$Y_{i} -$ exp
$\hat{\beta} X_{i}$
$$X_{i}= 0$$
But this $\hat{\beta}_{PPML}$ is well-defined for any data $Y_{i}\geq 0$ — Poisson pseudo-maximum
likelihood (PPML) estimator
- Consistency only requires $\mathbb{E} [Y_{i}\mid X_{i}] =$ exp $(\beta 'X_{i})$
- Efficient if Var $[Y_{i}\mid X_{i}] = \sigma^{2}\mathbb{E} [Y_{i}\mid X_{i}]$ (not limited to “equi-dispersion,” $\sigma^{2}= 1$, as under actual Poisson model)

#### p. 8 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Originates as MLE for count data, $Y_i \in \{0, 1, 2, ...\}$:
  - $Y_i | X_i \sim Poisson(\mu(X_i, \beta))$, i.e. $Pr(Y_i = k | X_i) = \frac{\mu(X_i, \beta)^k exp(-\mu(X_i, \beta))}{k!}$
- Log-likelihood: $\mathcal{L} = \sum_i (Y_i \cdot \beta^T X_i - exp(\beta^T X_i)) + const$
- FOC: $\sum_i (Y_i - exp(\beta^T X_i)) X_i = 0$
- But this $\beta_{PPML}$ is well-defined for any data $Y_i \geq 0$ — Poisson pseudo-maximum likelihood estimator (PPML)
- Consistency only requires $E[Y_i | X_i] = exp(\beta^T X_i)$
- Efficient if $Var[Y_i | X_i] = \sigma^2 E[Y_i | X_i]$ (not limited to "equi-dispersion," $\sigma^2 = 1$, as under actual Poisson model)

[Figure: PPML]

### p. 9 — PPML with fixed effects

We mentioned in part D1 that most estimators for nonlinear models with FE suffer
from an incidental parameters problem
- PPML is quite special
Wooldridge (1999) considers a short panel with $\mathbb{E} [Y_{it}\mid$  X $_{i}, \alpha_{i}] =$ exp $(\alpha_{i} + \beta 'X_{it})$
with strictly exogenous $X_{it}$
- PPML is consistent for $\beta$
Fernandez-Val and Weidner (2016) consider a long panel ($N, T \to \infty$ ) with
two-way fixed effects: $\mathbb{E} [Y_{it}\mid$  X $_{i}, \alpha_{i}] =$ exp $(\alpha_{i} + \gamma_{t} + \beta 'X_{it})$
- An equivalent setting: gravity model for $Y_{ij}$
- Various estimators are consistent (because many observations per FE) but PPML doesn’t suffer from bias of order $O(1/N + 1/T)$
Correia et al. (2020): fast implementation (in Stata) with multi-dimensional FEs

### p. 10

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Jeffrey Wooldridge
@jmwooldridge
Poisson regression can get one so far with so little trouble, why do so many still resist? Especially with panel data. It’s too bad we can’t give it another name to reflect the fact that its a fully robust estimator of conditional mean parameters.

Jeffrey Wooldridge
@jmwooldridge
Saying "I can’t use Poisson regression because of overdispersion" is tantamount to saying "I can’t use OLS because of heteroskedasticity." In other words, nonsense.

Jeffrey Wooldridge
@jmwooldridge
“Here Lies Jeffrey Wooldridge. He Defended Poisson Regression Until the End.”

### p. 11 — Application

Santos Silva and Tenreyro (2006) estimate the gravity equation of international trade
across country pairs, assuming:
$\mathbb{E} [$ Exports $_{ij}\mid X_{ij}, \alpha_{i}, \gamma_{j}] =$ exp $(\beta 'X_{ij} + \alpha_{i} + \gamma_{j})$
(Santos Silva and Tenreyro (2006), Table 5)

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Santos Silva and Tenreyro (2006) estimate the gravity equation of international trade across country pairs, assuming:

$$
\mathbb{E}[Exports|i,j, a, b] = exp(\beta'X_{ij} + \alpha_i + \gamma_j)
$$

[Figure: Estimator, Dependent variable, Log distance, Contiguity dummy, Common-language dummy, Colonial-tie dummy, Free-trade agreement dummy, Fixed effects, Observations, RESET test p-values]
(Santos Silva and Tenreyro (2006), Table 5)

### p. 12 — Outline

1
Modeling multiplicative effects
Multiplicative effects and potential outcomes

### p. 13 — A causal interpretation and heterogeneous effects

We now have several models + estimators:
- $\mathbb{E} [$ log $Y_{i}\mid X_{i}] = \beta 'X_{i}$ or
$\mathbb{E} [$ log $(1 + Y_{i}) \mid X_{i}] = \beta 'X_{i}$
+ OLS
- $\mathbb{E} [Y_{i}\mid X_{i}] =$ exp $(\beta 'X_{i})$ + NLLS, PPML, Gamma-PML
But for causal questions all of this is a wrong starting point
- Potential outcomes is our model!
- We’d like to use randomization of $D_{i}$ or parallel trends, etc.
- What are the estimands of different estimators? And what do we want?
- Assume for now random assignment of binary treatment $D_{i}$

### p. 14 — Case without zeros

OLS of log $Y_{i}$ on $D_{i}$: $\tau_{OLS}=\mathbb{E} [$ log $Y_{i}(1) -$ log $Y_{i}(0)]$
PPML of $Y_{i}$ on $D_{i}$: FOC $\mathbb{E} [(Y_{i} -$ exp $(\beta_{0} + \tau D_{i})) \cdot (1, D_{i})'] = 0$
- $\mathbb{E} [Y_{i}(0)] =$ exp $(\beta_{0})$, $\mathbb{E} [Y_{i}(1)] =$ exp $(\beta_{0} + \tau )$ =$\Rightarrow$
$\tau_{PPML}=$ log $\mathbb{E} [Y_{i}(1)] -$ log $\mathbb{E} [Y_{i}(0)] ;$
exp $(\tau_{PPML}) -1 = \mathbb{E} [Y^{i}(1) -Y^{i}(0)]$
$\mathbb{E} [Y_{i}(0)]$
What are the differences? (Cf. Chen and Roth (2024))
Poisson identifies the ATE in levels, rescaled by the control mean
- The effect may be dominated by the right tail of $Y_{i}(0)$
- That may be what the policymaker cares about

### p. 15 — Case with zeros

Additional issue with zero: there are two types of responses
- Extensive margin: $Pr(Y_{i}(1) = 0) -Pr(Y_{i}(0) = 0)$
- Intensive margin: $\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid Y_{i}(0) > 0, Y_{i}(1) > 0]$
Log-like transformations are very dependent on measurement units of $Y_{i}$(Chen and
Roth $(2024))$:
- If extensive margin $\neq  0$, by rescaling $Y_{i}$ any real number can become the estimand!
Pros and cons of other methods depend on the goal
Case 1: you don’t care about separating extensive and intensive margins
- E.g. $Y_{i}$= # of publications in a year: 0 has no special meaning
- PPML still yields $\mathbb{E} [Y_{i}(1) -Y_{i}(0)] /\mathbb{E} [Y_{i}(0)]$, a mix of the two margins

### p. 16 — Case with zeros (2)

Case 2: you want to isolate the two margins
- E.g. $Y_{i}$= # of hours worked per week; extensive margin = non-employment
- For extensive margin, can regress $1 [Y_{i}> 0]$ on $D_{i}$
- Intensive margin is not point identified because of selection: can’t just drop zeros
$^{\star}$ But “Lee bounds” are available (Lee $(2009),$ Semenova $(2025))$
Case 3: you can take a stand on how to combine the two margins: e.g.
$$U(Y_{i}) =$$
$$($$
log $Y_{i},$
$Y_{i}> 0$
$$-c,$$
$Y_{i}= 0$
- Then give up on scale invariance and regress $U(Y_{i})$ on $D_{i}$

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: cases._

- Case 2: you want to isolate the two margins
  - E.g. $Y_i$ = # of hours worked per week; extensive margin = non-employment
  - For extensive margin, can regress 1[$Y_i$ > 0] on $D_i$
  - Intensive margin is not point identified because of selection: can’t just drop zeros
    - But "Lee bounds" are available (Lee (2009), Semenova (2025))
- Case 3: you can take a stand on how to combine the two margins: e.g.
  - $$U(Y_i) = \begin{cases}
    \log Y_i, & Y_i > 0 \\
    -c, & Y_i = 0
  \end{cases}$$
  - Then give up on scale invariance and regress $U(Y_i)$ on $D_i$
[Figure: Case with zeros (2), Case 2, Case 3, U(Yi)]

### p. 17 — PPML diff-in-diff

Wooldridge (2023) extends DiD imputation and its regression implementation to
the multiplicative model with staggered adoption
Assume multiplicative parallel trends at the cohort level:
$\mathbb{E} [Y_{it}(0) \mid E_{i}= e] =$ exp $(\alpha_{e} + \beta_{t})$
Use untreated data to estimate $\alpha_{t}$ and $\beta_{e}$ by TWFE PPML, then estimate CATT
(in levels)
CATT $_{et}= \bar{Y}_{t\midEi=e} -$ exp
$\hat{\alpha}_{e} + \hat{\beta}_{t}$
As in Wooldridge (2025), can implement in a single step: PPML regression on
TWFE and dummies for each treated cohort-period
- Coefficients are interpreted as log $\mathbb{E} [Y_{it}(1) \mid E_{i}= e] -$ log $\mathbb{E} [Y_{it}(0) \mid E_{i}= e]$
- Can convert ATT as % of untreated mean or ATT in levels

#### p. 17 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Wooldridge (2023) extends DiD imputation and its regression implementation to the multiplicative model with staggered adoption.
- Assume multiplicative parallel trends at the cohort level:
  $$ \mathbb{E}[Y_{it}(0) | E_i = e] = \exp(\alpha_e + \beta_t) $$
- Use untreated data to estimate $\alpha_e$ and $\beta_e$ by TWFE PPML, then estimate CATT (in levels)
  $$ CATT_{et} = Y_{te} = e - \exp(\alpha_e + \beta_t) $$
- As in Wooldridge (2025), can implement in a single step: PPML regression on TWFE and dummies for each treated cohort-period
  - Coefficients are interpreted as log $\mathbb{E}[Y_{it}(1) | E_i = e] - \log \mathbb{E}[Y_{it}(0) | E_i = e]$
  - Can convert ATT as % of untreated mean or ATT in levels
[Figure: 15]

### p. 18 — Thanks!

Please fill in the evaluations NOW!
If you suspect a typo or mistake, send me an email

### p. 19 — References I

Chen, J. and J. Roth (2024): “Logs with Zeros? Some Problems and Solutions,” Quarterly
Journal $of$ Economics, 139, 891–936.
Correia, S., P. Guimarães, and T. Z. Zylkin (2020): “Fast Poisson estimation with
high-dimensional fixed effects,” Stata Journal, 20, 95–115.
Fernandez-Val, I. and M. Weidner (2016): “Individual and time effects in nonlinear panel
models with large N, T,” Journal $of$ Econometrics, 192, 291–312, arXiv: 1311.7065 Publisher:
Elsevier B.V.
Lee, D. S. (2009): “Training, wages, and sample selection: Estimating sharp bounds on treatment
effects,” Review $of$ Economic Studies, 76, 1071–1102.
Santos Silva, J. and S. Tenreyro (2006): “The log of gravity,” Review $of$ Economics and
Statistics, 88, 641–658.
Semenova, V. (2025): “Generalized Lee Bounds,” Journal $of$ Econometrics, arXiv: 2008.12720.
Wooldridge, J. M. (1999): “Distribution-free estimation of some nonlinear panel data models,”
Journal $of$ Econometrics, 90, 77–97.

### p. 20 — References II

——— (2023): “Simple Approaches to Nonlinear Difference-in-Differences with Panel Data,”
Econometrics Journal.
——— (2025): “Two-Way Fixed Effects, the Two-Way Mundlak Regression, and
Difference-in-Differences Estimators,” Empirical Economics.

## Extraction Gaps

- p. 4: display math with drawn rules; figure or diagram present; large delimiter (matrix or cases)
- p. 5: display math with drawn rules
- p. 6: display math with drawn rules
- p. 7: display math with drawn rules; large delimiter (matrix or cases)
- p. 8: display math with drawn rules; large delimiter (matrix or cases)
- p. 10: figure or diagram present
- p. 11: figure or diagram present
- p. 16: display math with drawn rules
- p. 17: large delimiter (matrix or cases)
