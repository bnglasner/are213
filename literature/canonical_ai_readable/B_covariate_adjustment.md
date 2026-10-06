# Summary of Main Ideas Translation

## Source

- PDF: `literature/raw_pdf/B_covariate_adjustment.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/B_covariate_adjustment.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 31/31 pages, word recall 0.988, words not in the text layer 0.003.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part B: Covariate Adjustment. Selection on Observables
- p. 2: Outline
- p. 3: What if treatment is not randomly assigned?
- p. 4: Illustration: Returns to College Degree
- p. 5: Identification assumptions
- p. 6: Identification under CIA + overlap
- p. 7: Imputation representation
- p. 8: Matching / Imputation
- p. 9: Regression adjustment
- p. 10: Pscore reweighting (for ATE)
- p. 11: Continuous covariates
- p. 12: Outline
- p. 13: Regression adjustment
- p. 14: How to estimate $h_{0}(\cdot ), h_{1}(\cdot )$?
- p. 15: Uninteracted regression
- p. 16: Uninteracted regression with heterogeneous effects
- p. 17: Variance weighting: Proof
- p. 18: Outline
- p. 19: Propensity score theorems (Rosenbaum and Rubin, 1983)
- p. 20: P-score methods: Steps
- p. 21: P-score adjustment methods: Regression
- p. 22: P-score adjustment methods: Blocking/Matching
- p. 23: P-score adjustment methods: Reweighting (IPW)
- p. 24: P-score adjustment methods: Reweighting (2)
- p. 25: Outline
- p. 26: Idea of double robustness
- p. 27: Automatic double robustness
- p. 28: Augmented IPW (AIPW)
- p. 29: Augmented IPW (2)
- p. 30: Double robustness and Neyman orthogonality
- p. 31: References I

## Comprehensive Translation

### p. 1 — Part B: Covariate Adjustment. Selection on Observables

Summary of Main Ideas
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — Outline

1
The concept of control variables
2
Regression adjustment
3
Propensity score methods
Doubly-robust methods

### p. 3 — What if treatment is not randomly assigned?

One basic approach for causal inference with observational data is to control for
observables
Unconfoundedness:
Violation of unconfoundedness:

#### p. 3 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: both, directed, graph, nodes, point, points._

One basic approach for causal inference with observational data is to control for observables

[Figure: Unconfoundedness: A directed graph with nodes X, Z, and Y. X -> Z -> Y. Violation of unconfoundedness: A directed graph with nodes X, U, Z, and Y. X and U both point to Z, and Z points to Y.]

### p. 4 — Illustration: Returns to College Degree

$i$
$X_{i}$(urban)
$D_{i}$(college)
$Y$ (earnings)
$Y_{0}$
$Y_{1}$
1
1
1
51
?
51
2
1
1
50
?
50
3
1
1
49
?
49
4
1
0
40
40
?
5
0
1
15
?
15
6
0
0
11
11
?
7
0
0
9
9
?
Treated minus control (not causal!)
21.25

### p. 5 — Identification assumptions

Unconfoundedness = Ignorability = Conditional independence assumption (CIA) =
Selection on observables: $(Y_{i}(0), Y_{i}(1)) \perp \perp D_{i}\mid X_{i}$
- Sometimes viewed as defining that $X_{i}$ is a control variable
Overlap: $0 < P (D_{i}= 1 \mid X_{i}) < 1$ on the support of $X_{i}$
- $P (D_{i}= 1 \mid X_{i})$ is called the propensity score

### p. 6 — Identification under CIA + overlap

Conditional average treatment effect: CATE $(x) \equiv \mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid X_{i}= x]$
- Let $h_{1}(x) =\mathbb{E} [Y \mid D = 1, X = x]$ and $h_{0}(x) =\mathbb{E} [Y \mid D = 0, X = x]$
- CATE can be identified as CATE $(x) = h_{1}(x) -h_{0}(x)$ (prove this!)
ATE $=\mathbb{E} [$ CATE $(X_{i})] =\mathbb{E} [h_{1}(X_{i}) -h_{0}(X_{i})]$, with expectation taken across $X_{i}$(in
both treatment and control groups)
And ATT $=\mathbb{E} [$ CATE $(X_{i}) \mid D_{i}= 1]$, with expectation taken across $X_{i}$ in the
treated group

### p. 7 — Imputation representation

We also have
ATT $=\mathbb{E} [Y_{i} -h_{0}(X_{i}) \mid D_{i}= 1]$
- For treated $i$, we impute $\widehat{Y}_{i}(0) = h_{0}(X_{i})$ and
And
ATE $=\mathbb{E} [(Y_{i} -h_{0}(X_{i})) D_{i} + (h_{1}(X) -Y_{i})(1 -D_{i})]$
- For untreated $i$, also impute $\widehat{Y}_{i}(1) = h_{1}(X_{i})$

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- We also have
$$ ATT = \mathbb{E}[Y_i - h_0(X_i) | D_i = 1] $$
  - For treated $i$, we impute $\overline{Y_i(0)} = h_0(X_i)$ and
- And
$$ ATE = \mathbb{E}[(Y_i - h_0(X_i)) D_i + (h_1(X_i) - Y_i)(1 - D_i)] $$
  - For untreated $i$, also impute $\overline{Y_i(1)} = h_1(X_i)$

### p. 8 — Matching / Imputation

$i$
$X_{i}$(urban)
$D_{i}$(college)
$Y$ (earnings)
$\hat{Y}_{0}$
$\hat{Y}_{1}$
$\hat{Y}_{1} -\hat{Y}_{0}$
1
1
1
51
40
51
11
2
1
1
50
40
50
10
3
1
1
49
40
49
9
4
1
0
40
40
$51+50+49$
$3$
10
Urban averages $&$ CATE
$40$
$50$
$10$
5
0
1
15
$11+9$
$2$
15
5
6
0
0
11
11
15
4
7
0
0
9
9
15
6
Rural averages and CATE
$10$
$15$
$5$
Overall averages and ATE:
$27.1$
$35$
$7.9$

### p. 9 — Regression adjustment

Regress $Y_{i}$ on $X_{i}$ in the subsample $D_{i}= 1$; take fitted values as $bh_{1}(X_{i})$; repeat for $D_{i}= 0$
$i$
$X_{i}$(urban)
$D_{i}$(college)
$Y$ (earnings)
$\hat{Y}_{0}$
$\hat{Y}_{1}$
$\hat{Y}_{1} -\hat{Y}_{0}$
1
1
1
51
40
50
10
2
1
1
50
40
50
10
3
1
1
49
40
50
10
4
1
0
40
40
50
10
5
0
1
15
10
15
5
6
0
0
11
10
15
5
7
0
0
9
10
15
5
Overall averages and ATE:
27.1
$35$
$7.9$
Treatment group averages and ATT:
32.5
$41.3$
$8.8$

### p. 10 — Pscore reweighting (for ATE)

$i$
$X_{i}$(urban)
$D_{i}$(college)
$Y$ (earnings)
$\hat{Y}_{0}$
$\hat{Y}_{1}$
$\hat{Y}_{1} -\hat{Y}_{0}$
1
1
1
51
0
$51 \cdot$
$1$
$3/4$
$51 \cdot$
$1$
$3/4$
2
1
1
50
0
$50 \cdot$
$1$
$3/4$
$50 \cdot$
$1$
$3/4$
3
1
1
49
0
$49 \cdot$
$1$
$3/4$
$49 \cdot$
$1$
$3/4$
4
1
0
40
$$40 \cdot$$
$1$
$1/4$
0
$-40 \cdot$
$1$
$1/4$
5
0
1
15
0
$15 \cdot$
$1$
$1/3$
$15 \cdot$
$1$
$1/3$
6
0
0
11
$$11 \cdot$$
$1$
$2/3$
0
$-11 \cdot$
$1$
$2/3$
7
0
0
9
$$9 \cdot$$
$1$
$2/3$
0
$-9 \cdot$
$1$
$2/3$
Overall averages and ATE:
$27.1$
$35$
$7.9$

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

| $i$ | $X_i$ (urban) | $D_i$ (college) | $Y$ (earnings) | $\hat{Y}_0$ | $\hat{Y}_1$ | $\hat{Y}_1 - \hat{Y}_0$ |
|---|---|---|---|---|---|---|
| 1 | 1 | 1 | 51 | 0 | $51 \cdot \frac{1}{3}$ | $51 \cdot \frac{1}{3}$ |
| 2 | 1 | 1 | 50 | 0 | $50 \cdot \frac{1}{3}$ | $50 \cdot \frac{1}{3}$ |
| 3 | 1 | 1 | 49 | 0 | $49 \cdot \frac{3}{4}$ | $49 \cdot \frac{3}{4}$ |
| 4 | 1 | 0 | 40 | 0 | $40 \cdot \frac{1}{4}$ | $-40 \cdot \frac{1}{1/4}$ |
| 5 | 0 | 1 | 15 | 0 | $15 \cdot \frac{1}{1/3}$ | $15 \cdot \frac{1}{1/3}$ |
| 6 | 0 | 0 | 11 | $11 \cdot \frac{1}{2/3}$ | 0 | $-11 \cdot \frac{1}{2/3}$ |
| 7 | 0 | 0 | 9 | $9 \cdot \frac{1}{2/3}$ | 0 | $-9 \cdot \frac{1}{2/3}$ |

Overall averages and ATE: 27.1 35 7.9

[Figure: Pscore reweighting (for ATE)]

### p. 11 — Continuous covariates

With continuous or high-dimensional covariates, can’t do any of this
- Approximate matching (skipped)
- Regression adjustment
- Propensity score methods
- Doubly-robust methods; double machine learning
- Note: Different methods are no longer equivalent
Also, do simpler strategies, like regressing $Y_{i}$ on $D_{i}$ and $X_{i}$, recover anything useful?

### p. 12 — Outline

1
The concept of control variables
2
Regression adjustment
3
Propensity score methods
Doubly-robust methods

### p. 13 — Regression adjustment

Recall that, under CIA, we have for $d = 0, 1$
$$\mathbb{E} [Y(d) \mid X] =\mathbb{E} [Y(d) \mid D = d, X] =\mathbb{E} [Y \mid D = d, X] \equiv h_{d}(X)$$
$If$ we estimate $h_{0}(\cdot )$ and $h_{1}(\cdot )$, we get
$d$
ATE $= 1$
$N$
$X$
$i$
$\hat{h}_{1}(X_{i}) -\hat{h}_{0}(X_{i})$
$$,$$
$$d$$
ATT $= 1$
$N_{1}$
$X$
$i$
$\hat{h}_{1}(X_{i}) -\hat{h}_{0}(X_{i})$
$D_{i}$
or via imputation:
$d$
ATT $= 1$
$N_{1}$
$X$
$i$
$$Y_{i} -\hat{h}_{0}(X_{i})$$
$$D_{i}$$
$d$
ATE $= 1$
$N$
$X$
$i$
$n$
$$Y_{i} -\hat{h}_{0}(X_{i})$$
$$D_{i} +$$
$\hat{h}_{1}(X_{i}) -Y_{i}$
$(1 -D_{i})$
$o$

#### p. 13 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Recall that, under CIA, we have for $d = 0, 1$
  $$E[Y|d] = E[Y(d) | D = d, X] = h_d(X)$$
- If we estimate $h_0(\cdot)$ and $h_1(\cdot)$, we get
  $$\widehat{ATE} = \frac{1}{N} \sum_i (h_1(X_i) - h_0(X_i))$$
  $$\widehat{ATT} = \frac{1}{N} \sum_i (h_1(X_i) - h_0(X_i)) D_i$$
- or via imputation:
  $$\widehat{ATT} = \frac{1}{N} \sum_i (Y_i - h_0(X_i)) D_i$$
  $$\widehat{ATE} = \frac{1}{N} \sum_i \left\{ (Y_i - h_0(X_i)) D_i + (h_1(X_i) - Y_i) (1 - D_i) \right\}$$

11

### p. 14 — How to estimate $h_{0}(\cdot ), h_{1}(\cdot )$?

$h_{d}(\cdot )$ is the CEF of $Y_{i}$ given $X_{i}$ for $D_{i}= d$
Can use nonparametric regression, e.g. local linear regression
- For each $x$, estimate $h_{d}(x)$ by an intercept from a regression of $Y_{i}$ on $(X_{i} -x)$, keeping observations in the neighborhood of $x$ (and with $D_{i}= d$) only
If $\mathbb{E} [Y(d) \mid X] = \gamma '$
$_{d}X$ is linear in $X$ (e.g. $X$ is saturated): Oaxaca-Blinder estimator
- Run linear regressions of $Y$ on $X$ within treated/control groups separately
- Or a single fully-interacted regression (for $X_{i}$ including an intercept)
$Y_{i}= \gamma_{0} + \gamma '$
$_{1}X_{i}+ \beta D_{i}+ \tau 'X_{i}D_{i}+$ error $_{i},$
$d$
ATE $= \hat{\beta} + \hat{\tau} '\bar{X}$
- Or its convenient reformulation
$Y_{i}= \gamma_{0} + \gamma '$
$$_{1}X_{i}+ \beta D_{i}+ \tau '$$
$$X_{i} -\bar{X}$$
$D_{i} +$ error $_{i},$
$d$
ATE $= \hat{\beta}$
- Note: interactions are helpful even if you are not interested in effect heterogeneity

#### p. 14 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: error._

- $h_d(\cdot)$ is the CEF of $Y_i$ given $X_i = d$
- Can use nonparametric regression, e.g. local linear regression
  - For each $x$, estimate $h_d(x)$ by an intercept from a regression of $Y_i$ on $(X_i - x)$, keeping observations in the neighborhood of $x$ (and with $D_i = d$) only
- If $E[Y(d) | X] = \gamma'X$ is linear in $X$ (e.g. $X$ is saturated): Oaxaca-Blinder estimator
  - Run linear regressions of $Y$ on $X$ within treated/control groups separately
  - Or a single fully-interacted regression (for $X_i$ including an intercept)
    $$Y_i = \gamma_0 + \gamma_1 X_i + \beta D_i + \tau' X_i D_i + error_i$$
    $$ATE = \beta + \tau'X$$
  - Or its convenient reformulation
    $$Y_i = \gamma_0 + \gamma_1 X_i + \beta D_i + \tau' (X_i - X) D_i + error_i$$
    $$ATE = \beta$$
- Note: interactions are helpful even if you are not interested in effect heterogeneity
[Figure: 12]

### p. 15 — Uninteracted regression

What about regression of $Y_{i}$ on $D_{i}$ and $X_{i}$ without interactions?
Suppose causal effects are homogeneous, $Y_{i}= \beta D_{i} + Y_{i}(0)$
And $\mathbb{E} [Y(0) \mid X] = \gamma 'X$ is linear,
$$Y_{i}= \beta D_{i} + \gamma 'X_{i} + \epsilon_{i},$$
$\mathbb{E} [\epsilon_{i}\mid D_{i}, X_{i}] = 0$
where $h_{0}(X) = \gamma 'X$ and $h_{1}(X) = \beta + \gamma 'X$
$\Rightarrow$ Regression that linearly controls for $X_{i}$ identifies the causal effect
But Mostly Harmless Econometrics advocates for uninteracted regressions even
when the effects are heterogeneous. Why?

#### p. 15 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

What about regression of $Y_i$ on $D_i$ and $X_i$ without interactions?

- Suppose causal effects are homogeneous, $Y_i = \beta D_i + Y_i(0)$

- And $E[Y(0) | X] = \gamma X$ is linear.

$$Y_i = \beta D_i + \gamma X_i + \epsilon_i$$
$$E[\epsilon_i | D_i, X_i] = 0$$

where $h_0(X) = \gamma X$ and $h_1(X) = \beta + \gamma X$

$\Rightarrow$ Regression that linearly controls for $X_i$ identifies the causal effect

- But Mostly Harmless Econometrics advocates for uninteracted regressions even when the effects are heterogeneous. Why?

13

### p. 16 — Uninteracted regression with heterogeneous effects

Assume the propensity score $p(X_{i}) \equiv \mathbb{E} [D_{i}\mid X_{i}] = P (D_{i}= 1 \mid X_{i})$ is linear in $X_{i}$
- Angrist (1998) focused on saturated controls $X_{i}$=$\Rightarrow$ trivially satisfied
Then
$\beta_{OLS}= \mathbb{E} [$ CATE $(X^{i}) \cdot \omega (X^{i})]$
$\mathbb{E} [\omega (X_{i})]$
$$,$$
$\omega (X_{i}) =$ Var $[D_{i}\mid X_{i}] = p(X_{i}) (1 -p(X_{i}))$
- Groups with $p(X_{i}) \approx 1/2$ get the most weight (relative to their size)
- Groups where overlap is limited ($p(X_{i}) \approx 0$ or $p(X_{i}) \approx 1$) get little weight
- $\beta_{OLS}=$ ATE if CATE $(X_{i})$ is constant, $\omega (X_{i})$ is constant, or they are uncorrelated with each other
Note: linearity of $\mathbb{E} [Y_{i}(0) \mid X_{i}]$ is not needed

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Assume the propensity score $p(X_i) = \mathbb{E}[D_i | X_i] = P(D_i = 1 | X_i)$ is linear in $X_i$

- Angrist (1998) focused on saturated controls $X_i \implies$ trivially satisfied

- $$ \beta_{OLS} = \frac{\mathbb{E}[CATE(X_i) \cdot \omega(X_i)]}{\mathbb{E}[\omega(X_i)]} $$
  -  $$ \omega(X_i) = Var[D_i | X_i] \cdot p(X_i) \cdot (1 - p(X_i)) $$

- Groups with $p(X_i) \approx 1/2$ get the most weight (relative to their size)
- Groups where overlap is limited ($p(X_i) \approx 0$ or $p(X_i) \approx 1$) get little weight
- $$ \beta_{OLS} = ATE $$ if $CATE(X_i)$ is constant, $\omega(X_i)$ is constant, or they are uncorrelated with each other

- Note: linearity of $\mathbb{E}[Y_i(0) | X_i]$ is not needed
[Figure: 14]

### p. 17 — Variance weighting: Proof

By linearity of the pscore, partialling out $X_{i}$ from $D_{i}$ yields residuals
$\tilde{D}_{i}= D_{i} -\mathbb{E} [D_{i}\mid X_{i}]$
By Frisch-Waugh-Lovell, $\beta_{OLS}=\mathbb{E}$
$$h$$
$$\tilde{D}_{i}Y_{i}$$
$$i$$
$$/\mathbb{E}$$
$$h$$
$$\tilde{D}_{i}D_{i}$$
$i$
(where $\mathbb{E}$
$h$
$\tilde{D}_{i}D_{i}$
$i$
$=$ Var
$h$
$\tilde{D}_{i}$
$i$
)
Using CIA and $\mathbb{E}$
$h$
$\tilde{D}_{i}\mid X_{i}$
$i$
$= 0$,
$\mathbb{E}$
$h$
$\tilde{D}_{i}Y_{i}$
$i$
$=\mathbb{E}$
$h$
$\mathbb{E}$
$h$
$$\tilde{D}_{i} (Y_{i}(0) + (Y_{i}(1) -Y_{i}(0)) D_{i}) \mid X_{i}$$
$ii$
$=\mathbb{E}$
$h$
CATE $(X_{i}) \cdot \mathbb{E}$
$$h$$
$$\tilde{D}_{i}D_{i}\mid X_{i}$$
$$ii$$
$=\mathbb{E} [$ CATE $(X_{i}) \cdot$  Var $[D_{i}\mid X_{i}]]$
Analogously, $\mathbb{E}$
$h$
$\tilde{D}_{i}D_{i}$
$i$
$=\mathbb{E} [$ Var $[D_{i}\mid X_{i}]]$

#### p. 17 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: loveli._

- By linearity of the pscore, partialling out $X_i$ from $D_i$ yields residuals
  $$D_i^* = D_i - E[D_i | X_i]$$

- By Frisch-Waugh-LovelI, $\beta_{OLS} = \frac{E[D_i^* Y_i]}{E[D_i^* D_i^*]}$ (where $E[D_i^*] = Var[D_i^*]$)

- Using CIA and $E[D_i^* | X_i] = 0$,
  $$E[D_i^* Y_i] = E[E[D_i^* (Y_i(0) + (Y_i(1) - Y_i(0)) D_i) | X_i]]$$
  $$= E[CA TE(X_i) \cdot E[D_i^* | X_i]] = E[CA TE(X_i) \cdot Var[D_i^* | X_i]]$$

- Analogously, $E[D_i^* D_i^*] = E[Var[D_i^* | X_i]]$

### p. 18 — Outline

1
The concept of control variables
2
Regression adjustment
3
Propensity score methods
Doubly-robust methods

### p. 19 — Propensity score theorems (Rosenbaum and Rubin, 1983)

Consider binary $D$. Recall $p(X) \equiv P(D = 1 \mid X)$
Proposition 1: $D \perp \perp X \mid p(X)$
- i.e. propensity score balances $X$ between treated and control groups
- Proof: $P(D = 1 \mid X, p(X)) = P(D = 1 \mid X) = p(X)$
Proposition 2: $D \perp \perp (Y_{0}, Y_{1}) \mid X$ =$\Rightarrow D \perp \perp (Y_{0}, Y_{1}) \mid p(X)$
- i.e., under CIA, controlling for scalar $p(X)$ is enough
$^{\star}$ A stronger version of the OVB idea
- Proof: $P (D = 1 \mid p(X), Y_{0}, Y_{1}) =\mathbb{E} [\mathbb{E} [D \mid p(X), X, Y_{0}, Y_{1}] \mid p(X), Y_{0}, Y_{1}] = p(X)$, doesn’t depend on $(Y_{0}, Y_{1}$)

### p. 20 — P-score methods: Steps

1. Obtain/estimate $p(X)$
- Known in complex RCTs
- Parametric estimation, e.g. logit of $D$ on $X$
- Non-parametric regression of $D$ on $X$
2. Verify balance
- Within bins of $\hat{p}(X)$ compare $X$ among treated and controls
- If balance fails (with sufficiently many bins), make the p-score model richer
3. Assess overlap
- Compare p-score distributions in treated & control groups
4. Adjust for pscore differences between treated and control groups
- Regression, matching, blocking, reweighting

### p. 21 — P-score adjustment methods: Regression

With constant effects, enough to control linearly
$Y_{i}= \beta D_{i} + \gamma p(X_{i}) +$ error
- Exercise: Why?
- Exercise: if $p(X)$ is estimated from a linear probability model, both ways are numerically the same as linearly controlling for $X$
With heterogeneous effects, this yields the variance-weighted average of effects
(Exercise: Why?)

### p. 22 — P-score adjustment methods: Blocking/Matching

Blocking (stratifying) = exact matching on binned pscore
- Split data into bins of $p(X_{i})$
- Estimate difference-in-means within bins
- Average across bins weighting by # obs. (ATE) or # treated obs. (ATT)
Approximate matching: For each treated obs., compare the outcome with the
untreated one with the closest $p(X_{i})$; and the other way round
- Discard observations with the pscore outside the range for the other group, such that the nearest match is very far

### p. 23 — P-score adjustment methods: Reweighting (IPW)

In the bin with $p(X_{i}) = \pi$ we have fraction $\pi$ of observed $Y_{i}(1)$ (for treated) and
fraction $1 -\pi$ of comparable but missing $Y_{i}(1)$ (for controls)
Horvitz-Thompson (1952) “inverse probability weighting” (IPW): reweighting
by $1/\pi$ makes the sample of $Y_{i}(1)$ representative
$\mathbb{E}$
$YD$
$p(X)$
$=\mathbb{E}$
$$Y_{1}D$$
$$p(X)$$
$$=\mathbb{E}$$
$$\mathbb{E}$$
$$Y_{1}D$$
$p(X) \mid X$
$=\mathbb{E} [Y_{1}]$
Similarly for $Y_{0}$: $\mathbb{E}$
$h$
$Y(1-D)$
$1-p(X)$
$i$
$=\mathbb{E} [Y_{0}]$. Thus, under CIA+overlap:
ATE $=\mathbb{E}$
$D$
$p(X) -$
$$1 -D$$
$$1 -p(X)$$
$$Y$$
$$=\mathbb{E}$$
$D -p(X)$
$p(X)(1 -p(X)) \cdot Y$
Exercise: derive the reweighting expression for ATT

#### p. 23 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- In the bin with $p(X_i) = \pi$ we have fraction $\pi$ of observed $Y_i(1)$ (for treated) and fraction $1 - \pi$ of comparable but missing $Y_i(1)$ (for controls)
- Horvitz-Thompson (1952) “inverse probability weighting” (IPW): reweighting by $1/\pi$ makes the sample of $Y_i(1)$ representative
  - $$\mathbb{E}\left[\frac{Y_i^D}{p(X)}\right] = \mathbb{E}[Y_i^D | p(X)] = \mathbb{E}\left[\frac{Y_i^D}{p(X) | X}\right] = \mathbb{E}[Y_i]$$
- Similarly for $Y_i$: $$\mathbb{E}\left[\frac{Y_i^{1-p(X)}}{1-p(X)}\right] = \mathbb{E}[Y_i]$$. Thus, under CIA+overlap:
  - $$ATE = \mathbb{E}\left[\left(\frac{D}{p(X)} - \frac{1-D}{1-p(X)}\right)Y\right] = \mathbb{E}\left[\frac{D-p(X)}{p(X)(1-p(X))} \cdot Y\right]$$
- Exercise: derive the reweighting expression for ATT

### p. 24 — P-score adjustment methods: Reweighting (2)

Plug-in (Horvitz-Thompson) estimator: $d$
ATE $_{HT}=^{1}$
$N$
$P$
$i$
$D_{i}$
$\hat{p}(X_{i}) -$
$1-D_{i}$
$1-\hat{p}(X_{i})$
$Y_{i}$
Issue: weights on treated ( $^{1}$
$N$
$$1$$
$_{\hat{p}(Xi)}$) and control ( $1$
$$N$$
$1$
$_{1-\hat{p}(Xi)}$) do not exactly sum to 1
- So adding a constant to $Y_{i}$ changes the estimator
Normalizing the weights improves performance: the Hajek estimator
$d$
ATE $_{Hajek}=$
$$P$$
$$i$$
$$D_{i}Y_{i}$$
$$\hat{p}(X_{i})$$
$$P$$
$$i$$
$$D_{i}$$
$$\hat{p}(X_{i})$$
$$-$$
$$P$$
$i$
$(1-D_{i})Y_{i}$
$1-\hat{p}(X_{i})$
$$P$$
$i$
$1-D_{i}$
$1-\hat{p}(X_{i})$

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Plug-in (Horvitz-Thompson) estimator: $ATE_{HT} = \frac{1}{N} \sum_{i} \left( \frac{D_i}{\hat{p}(X_i)} - \frac{1-D_i}{1-\hat{p}(X_i)} \right) Y_i$

- Issue: weights on treated $\left( \frac{1}{N \hat{p}(X_i)} \right)$ and control $\left( \frac{1}{N(1-\hat{p}(X_i))} \right)$ do not exactly sum to 1

  - So adding a constant to $Y_i$ changes the estimator

- Normalizing the weights improves performance: the Hajek estimator

  $$ATE_{Hajek} = \frac{\sum_{i} \frac{D_i Y_i}{\hat{p}(X_i)}}{\sum_{i} \frac{D_i}{\hat{p}(X_i)}} - \frac{\sum_{i} \frac{(1-D_i) Y_i}{1-\hat{p}(X_i)}}{\sum_{i} \frac{1-D_i}{1-\hat{p}(X_i)}}$$

### p. 25 — Outline

1
The concept of control variables
2
Regression adjustment
3
Propensity score methods
Doubly-robust methods

### p. 26 — Idea of double robustness

Regression adjustment methods require estimates of $h_{0}(X), h_{1}(X)$
- No need for $p(X) =\mathbb{E} [D \mid X]$
Propensity score methods are the opposite
Doubly robust methods take estimates of both $h_{d}(X)$ and $p(X)$ as inputs
- But validity requires only one of those estimates to be correct

### p. 27 — Automatic double robustness

Some methods already possess some double robustness
Under constant effects, regression $Y_{i}= \beta D_{i} + \gamma 'X_{i} +$ error $_{i}$ is causal if:
- $h_{0}(X)$ is linear in $X$ or
$p(X)$ is linear in $X$
Kline (2011): the Oaxaca-Blinder estimator for ATT is consistent if:
- $h_{0}(X), h_{1}(X)$ are linear in $X$ or
$$p(X)$$
$1-p(X)$ is linear in $X$

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: error._

Some methods already possess some double robustness

- Under constant effects, regression $Y_i = \beta D_i + \gamma' X_i + error$, is causal if:
  - $h_0(X)$ is linear in $X$ or $p(X)$ is linear in $X$
- Kline (2011): the Oaxaca-Blinder estimator for ATT is consistent if:
  - $h_0(X)$, $h_1(X)$ are linear in $X$ or $\frac{p(X)}{1-p(X)}$ is linear in $X$

23

### p. 28 — Augmented IPW (AIPW)

But double-robustness can be achieved for arbitrary estimators of $h_{d}(\cdot )$ and $p(\cdot )$
Augmented IPW (AIPW) idea:
$\mathbb{E} [Y_{1i}] =\mathbb{E} [h_{1}(X_{i})] =\mathbb{E}$
$$D_{i}$$
$$p(X_{i})Y^{i}$$
$$=\mathbb{E}$$
$$h_{1}(X_{i}) +$$
$D_{i}$
$p(X_{i}) (Y^{i} -h^{1}(X^{i}))$
$=\mathbb{E}$
$\tilde{h}_{1}(X_{i}) +$
$$D_{i}$$
$$\tilde{p}(X_{i})$$
$$Y_{i} -\tilde{h}_{1}(X_{i})$$
if $p(\cdot ) = \tilde{p}(\cdot )$ or $h_{1}(\cdot ) = \tilde{h}_{1}(\cdot )$
- If the model of $h_{1}(\cdot )$ is correct, IPW adjustment doesn’t change the estimand
- If the model of $p(\cdot )$ is correct, the adjustment fixes mistakes in $h_{1}(\cdot )$

### p. 29 — Augmented IPW (2)

Combining with a similar expression for $Y_{0i}$,
ATE $=\mathbb{E}$
$h_{1}(X_{i}) +$
$D_{i}$
$$p(X_{i}) (Y^{i} -h^{1}(X^{i})) -h^{0}(X^{i}) -$$
$1 -D_{i}$
$1 -p(X_{i}) (Y^{i} -h^{0}(X^{i}))$
if $(h_{0}(\cdot ), h_{1}(\cdot ))$ or $p(\cdot )$ are correctly specified
- The sample analog based on preliminary estimates of $h_{0}, h_{1}, p$ yields the estimator

#### p. 29 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Combining with a similar expression for $Y_{0i}$:

$$ATE = E\left[h_1(X_i) + \frac{D_i}{p(X_i)} (Y_i - h_1(X_i)) - h_0(X_i) - \frac{1 - D_i}{1 - p(X_i)} (Y_i - h_0(X_i))\right]$$

if $(h_0(\cdot), h_1(\cdot))$ or $p(\cdot)$ are correctly specified

-  The sample analog based on preliminary estimates of $h_0$, $h_1$, $p$ yields the estimator

[Figure: 25]

### p. 30 — Double robustness and Neyman orthogonality

The usefulness of double robustness is not obvious
But a closely related concept is very helpful when $X_{i}$ are high-dimensional:
- Estimation of nuisance functions $h_{0}(\cdot ), h_{1}(\cdot ), p(\cdot )$, e.g. via machine learning methods, is inevitably imprecise
- So we want to use moments that have low sensitivity to such mistakes around the true values — Neyman-orthogonal moments
$^{\star}$ Optional exercise: verify that the “derivative” of the IAPW moment w.r.t. nuisance
functions is zero at the true values
- Covariate adjustment by Double Machine Learning (Chernozhukov et al., 2018) uses this idea

### p. 31 — References I

Angrist, J. (1998): “Estimating the labor market impact of voluntary military service using social
security data on military applicants,” Econometrica, 66, 249–288.
Chernozhukov, V., D. Chetverikov, M. Demirer, E. Duflo, C. Hansen, W. Newey,
and J. Robins (2018): “Double/debiased machine learning for treatment and structural
parameters,” Econometrics Journal, 21, C1–C68.
Horvitz, D. G. and D. J. Thompson (1952): “A generalization of sampling without replacement
from a finite universe,” Journal $of$ the American statistical Association, 47, 663–685.
Kline, P. (2011): “Oaxaca-Blinder as a reweighting estimator,” American Economic Review, 101,
532–537.
Rosenbaum, P. R. and D. B. Rubin (1983): “The Central Role of the Propensity Score in
Observational Studies for Causal Effects,” Biometrika, 70, 41–55.

## Extraction Gaps

- p. 3: figure or diagram present
- p. 10: display math with drawn rules
- p. 13: display math with drawn rules; large delimiter (matrix or cases)
- p. 14: display math with drawn rules; large delimiter (matrix or cases)
- p. 15: display math with drawn rules
- p. 16: display math with drawn rules
- p. 17: display math with drawn rules
- p. 23: display math with drawn rules; large delimiter (matrix or cases)
- p. 24: display math with drawn rules; large delimiter (matrix or cases)
- p. 27: display math with drawn rules
- p. 28: display math with drawn rules; large delimiter (matrix or cases); layout reconstruction withheld: it wrote math the page does not have
- p. 29: display math with drawn rules; large delimiter (matrix or cases)
