# E1: RDD Basics Translation

## Source

- PDF: `literature/raw_pdf/E1_RDD_basics.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/E1_RDD_basics.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 43/43 pages, word recall 0.992, words not in the text layer 0.001.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part E: Regression Discontinuity
- p. 2: E1 Outline
- p. 3: Setting
- p. 4: Identification
- p. 5: Examples
- p. 6: Examples (2)
- p. 7: Is RDD a special case of something?
- p. 8: Answer key
- p. 9: Checklist for sharp RD
- p. 10: Outline
- p. 11: RD plot
- p. 12: RD plot: Details
- p. 13: Binscatter vs. scatterplot
- p. 14: Estimation
- p. 15: Estimation (2)
- p. 16: Local linear regression
- p. 17: Local linear regression (2)
- p. 18: Local linear regression (3)
- p. 19: Bandwidth choice
- p. 20: Optimal bandwidth choice
- p. 21: Estimating optimal bandwidth
- p. 22: Estimating optimal bandwidth (2)
- p. 23: Intermediate summary
- p. 24: Bias-corrected inference
- p. 25: rdrobust with default options
- p. 26: If you insist to report bias-corrected estimate
- p. 27: Robustness to bandwidth choice
- p. 28: Outline
- p. 29: Falsification tests
- p. 30: Placebo RD plots and estimates
- p. 31: Discontinuity of density (“bunching”) test
- p. 32: Discontinuity of density in practice
- p. 33: Convenient implementation
- p. 34: Outline
- p. 35: A cautionary tale
- p. 36–37: Gilraine (2025): Effect of air filters on student achievement
- p. 38: Barfort, Klemmensen, and Larsen (2021)
- p. 39–40: Lessons from Barfort et al. (2021)?
- p. 41: References I
- p. 42: References II
- p. 43: References III

## Comprehensive Translation

### p. 1 — Part E: Regression Discontinuity

E1: RDD Basics
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — E1 Outline

1
RDD idea and identification
2
Visualization, estimation, and inference
3
Falsification tests
4
A cautionary tale
Reading: Cattaneo, Idrobo, and Titiunik (2019)
For code in Stata, R, and Python, see https://rdpackages.github.io/

### p. 3 — Setting

Sharp regression discontinuity design involves:
Scalar continuous score (a.k.a. running variable, forcing variable) $X_{i}$
Scalar cutoff $c$ (with non-zero density of $X_{i}$ on both sides)
Binary treatment $D_{i}= 1 [X_{i}\geq c]$
- Fully determined by the score, no discretion
- Rule is discontinuous in $X_{i}$ at $c$
Continuity of (expected) potential outcomes $\mathbb{E} [Y_{i}(0) \mid X_{i}] ,\mathbb{E} [Y_{i}(1) \mid X_{i}]$ at
$X_{i}= c$
1. No other determinant of $Y_{i}$ jumps at $X_{i}= c$
2. Score cannot be precisely (and endogenously) manipulated

### p. 4 — Identification

Then lim $_{x\downarrowc}\mathbb{E} [Y_{i}\mid X_{i}= x] -$ lim $_{x\uparrowc}\mathbb{E} [Y_{i}\mid X_{i}= x] =\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid X_{i}= c]$
Discontinuity of regression $\mathbb{E} [Y_{i}\mid X_{i}]$ at $c$ identifies a local causal parameter
(Calonico et al. (2019), Figure 2)

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Then $\lim_{x \to c^+} \mathbb{E}[Y_i | X_i = x] - \lim_{x \to c^-} \mathbb{E}[Y_i | X_i = x] = \mathbb{E}[Y_{(1)} - Y_{(0)} | X_i = c]$
- Discontinuity of regression $\mathbb{E}[Y_i | X_i]$ at $c$ identifies a local causal parameter

[Figure: E[Y(1)|X], E[Y(0)|X], τ<sub>SRO</sub>, Cutoff, Score (X), (Calonico et al. (2019), Figure 2)]

### p. 5 — Examples

Effects of financial aid on college enrollment (Van Der Klaauw, $2002)$
- Score $X_{i}=$ GPA $_{i} +$ SAT $_{i}$
Effects of class size on educational achievement (Angrist and Lavy, $1999)$
- $X_{i}$= number of students in a school cohort
- “Maimonides rule”: max class size in Israel = 40; with $X_{i}= 41$ classes are small

### p. 6 — Examples (2)

Incumbency advantage in a two-party system (Lee, $2008)$
- $X_{i}$= vote share of Democratic candidate to U.S. House in district $i$;
$c = 0.5$
- $D_{i}$= Democrat is incumbent in next election
- $Y_{i}$= Democratic candidate wins next election;
$\mathbb{E} [Y_{i}(1) -Y_{i}(0)]$: incumbency
advantage
Effect of displayed Yelp rating on restaurant sales (Anderson and Magruder, $2012)$
- $X_{i}$= actual restaurant rating, e.g. 3.24 or 3.26
- $D_{i}$= displayed rating which is rounded to the nearest 0.5

### p. 7 — Is RDD a special case of something?

Is RDD like selection on observables, with $X_{i}$ as a control variable?
Is RDD like IV, with $X_{i}$ as instrument?
Is RDD like a RCT in the neighborhood of $X_{i}= c$?

### p. 8 — Answer key

Is RDD like selection on observables, with $X_{i}$ as a control?
No. By construction, there is no overlap: no value of $X_{i}$ where both $D_{i}= 0$ and $D_{i}= 1$
are observed
Is RDD like IV, with $X_{i}$ as instrument?
No. Exogeneity of $X_{i}$ is not assumed, e.g. higher vote share in election $t -1$ correlates
with higher vote share in $t$
Is RDD like a RCT in the neighborhood of $X_{i}= c$?
Yes. Continuity of potential outcomes implies their balance around $X_{i}= c$
No. This only holds in an infinitesimal neighborhood. So we need to be careful with
estimation

### p. 9 — Checklist for sharp RD

Visualization: “RD plot”
Estimation and inference
Falsification tests
- Balance tests: RD plots and estimates for covariates and placebo outcomes
- McCrary test for continuous density of $X_{i}$ around the cutoff

### p. 10 — Outline

1
RDD idea and identification
2
Visualization, estimation, and inference
3
Falsification tests
A cautionary tale

### p. 11 — RD plot

(Cattaneo et al. (2019), Figure 11,
(Lee (2008), Figure 2a)
Meyersson (2014) data)

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

(Cattaneo et al. (2019), Figure 11, Meyersson (2014) data)
[Figure: RD plot with Outcome on the y-axis and Score on the x-axis. The plot shows a scatterplot of data points, a kernel density estimate, and a local average treatment effect. The x-axis ranges from -100 to 100. The y-axis ranges from 0 to 25.]

(Lee (2008), Figure 2a)
[Figure: RD plot with Probability of Winning, Election +1 on the y-axis and Democratic Vote Share Margin of Victory, Election t on the x-axis. The plot shows a scatterplot of data points and a logit fit. The x-axis ranges from -0.25 to 0.25. The y-axis ranges from 0.00 to 1.00.]

### p. 12 — RD plot: Details

Shows discontinuity in regression $\mathbb{E} [Y_{i}\mid X_{i}]$ in two ways:
Parametric fit: shows the global shape and nonlinearity of the regression
- Separately on the left and right of $c$, fitted values from
$Y_{i}= \alpha_{0} + \alpha_{1}(X_{i} -c) + \cdot \cdot \cdot + \alpha_{p}(X_{i} -c)^{p}+$ error
e.g. with quartic polynomial ($p = 4$)
Binscatter: a local/nonparametric estimator of the regression
- Separately on each side, for some bins of $X_{i}$: average $Y_{i}$ against bin’s midpoint
- Bins with similar numbers of observations (splitting by quantile) are more informative. But equal width is also common
- Calonico, Cattaneo, and Titiunik (2015) propose data-driven optimal number of bins...

### p. 13 — Binscatter vs. scatterplot

Few bins =$\Rightarrow$ doesn’t trace $\mathbb{E} [Y_{i}\mid X_{i}]$ (bias); many bins (e.g. scatterplot) =$\Rightarrow$ noisy
(Figure 8, integrated MSE-optimal number of bins)
(Figure 5: Scatterplot)

#### p. 13 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Few bins ⇒ doesn’t trace $E[Y_i | X_i]$ (bias); many bins (e.g. scatterplot) ⇒ noisy

[Figure: Figure 8, integrated MSE-optimal number of bins]

[Figure: Figure 5: Scatterplot]

11

### p. 14 — Estimation

RD plots yield two estimates of the causal effect $\tau =\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid X_{i}= c]$:
(Figure 8 again)

#### p. 14 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

RD plots yield two estimates of the causal effect $\tau = E[Y_{(1)} - Y_{(0)} | X_i = c_i]$:

[Figure: Outcome vs. Score (Figure 8 again)]

12

### p. 15 — Estimation (2)

Are these estimators good?
Global extrapolation using higher-order polynomials has bad properties at the
border (Gelman and Imbens, $2019)$:
- Noisy and highly sensitive to the order of the polynomial
Difference in outcome means between the nearest bin on the right vs. on the left?
- This “local constant regression” is too biased
- Instead, use local polynomial regression, e.g. local linear ($p = 1$)

### p. 16 — Local linear regression

(Figure 15. Note more narrow range of scores)

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Outcome vs. Score, with three lines showing local linear regression fits. Note more narrow range of scores]

14

### p. 17 — Local linear regression (2)

Estimate lim $_{x\downarrowc}\mathbb{E} [Y_{i}\mid X_{i}= x]$ by $\hat{\alpha}_{+}$ from
$(\hat{\alpha}_{+}, \hat{\beta}_{+}) =$ arg min
$\alpha_{+},\beta_{+}$
$$\sum$$
$$i: c\leq X_{i}\leq c+h_{+}$$
$(Y_{i} -\alpha_{+} -\beta_{+}(X_{i} -c))^{2}\kappa$
$(X_{i} -c$
$h_{+}$
$)$
where $h_{+}> 0$ is some bandwidth and $\kappa (\cdot )$ is a kernel function, e.g.
- Uniform kernel: $\kappa (x) = 1 [\mid x\mid \leq 1]$ (uses all obs. in the neighborhood)
- Triangular kernel: $\kappa (x) =$ max $\{1 -\mid x\mid , 0\}$ (weights obs. closer to $c$ more)

#### p. 17 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Estimate $lim_{c \to 0} E[Y_i | X_i = x]$ by $\hat{a}_+$.

$$(\hat{a}_+, \hat{\beta}_+) = arg \ min_{\alpha_+, \beta_+} \sum_i c < X_i < c + h_+ (Y_i - \alpha_+ - \beta_+ (X_i - c))^2 \kappa \left( \frac{X_i - c}{h_+} \right)$$

where $h_+ > 0$ is some bandwidth and $\kappa(\cdot)$ is a kernel function, e.g.

- Uniform kernel: $\kappa(x) = 1 \; \forall |x| \le 1$ (uses all obs. in the neighborhood)

- Triangular kernel: $\kappa(x) = max \{1 - |x|, 0\}$ (weights obs. closer to c more)

15

### p. 18 — Local linear regression (3)

Estimate lim $_{x\uparrowc}\mathbb{E} [Y_{i}\mid X_{i}= x]$ by $\hat{\alpha}_{-}$ from
$(\hat{\alpha}_{-}, \hat{\beta}_{-}) =$ arg min
$\alpha_{-},\beta_{-}$
$$\sum$$
$$i: c-h_{-}\leq X_{i}<c$$
$(Y_{i} -\alpha_{-}-\beta_{-}(X_{i} -c))^{2}\kappa$
$(X_{i} -c$
$h_{-}$
$)$
(with $h_{-}= h_{+}$ or $h_{-}\neq  h_{+}$)
Estimate $\tau$ by $\hat{\tau} = \hat{\alpha}_{+} -\hat{\alpha}_{-}$
- Can implement by a single regression (on $X_{i}\in [c -h_{-}, c + h_{+}]$ and with kernel weights):
$Y_{i}= \tau D_{i} + \gamma_{0} + \gamma_{1}(X_{i} -c) + \gamma_{2}(X_{i} -c)D_{i} +$ error
(but don’t treat it like a true model, and be careful with SE!)

#### p. 18 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Estimate $lim_{h_c \to 0} E[Y_i | X_i = x]$ by $\hat{\alpha}_{-}$ from

$$(\hat{\alpha}_{-}, \hat{\beta}_{-}) = arg \min_{\alpha_{-}, \beta_{-}} \sum_{i: c-h_{-} \le X_i < c} (Y_i - \alpha_{-} - \beta_{-} (X_i - c))^2 K_i \left( \frac{X_i - c}{h_{-}} \right)$$

(with $h_{-} = h_{+} or h_{-} \neq h_{+}$ )

- Estimate $\tau$ by $\hat{\tau} = \hat{\alpha}_{+} - \hat{\alpha}_{-}$

  - Can implement by a single regression (on $X_i \in [c - h_{-}, c + h_{+}]$ and with kernel weights):

  $Y_i = \tau D_i + \gamma_0 + \gamma_1 (X_i - c) + \gamma_2 (X_i - c) D_i + error$

  (but don’t treat it like a true model, and be careful with SE!)

16

### p. 19 — Bandwidth choice

Bandwidth choice (given kernel) is much more important the choice of kernel:
(Figure 14)

#### p. 19 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Bandwidth choice (given kernel) is much more important the choice of kernel:

- Local linear approximation (p=1)

[Figure: Figure 14]

E[Y(1)|X] , E[Y(0)|X]

- c - h₂
- c - h₁
- c
- c + h₁
- c + h₂

Score (X)

### p. 20 — Optimal bandwidth choice

For local polynomial of order $p$,
bias $(\hat{\tau} ) \approx B \cdot h^{p+1},$
Var $[\hat{\tau} ] \approx V$
$Nh$
- $B$ is determined by the curvatures $d^{p+1}\mathbb{E} [Y \mid X = x] /dx^{p+1}\mid_{x=c}$ on each side
- $V$ is determined by the variance of $Y_{i}\mid X_{i}= c$ and density of $X_{i}$
Thus, MSE $\approx (Bh^{p+1})^{2}+^{V}$
$Nh$ is minimized at $h^{*}=$
$($
$2(p+1)B^{2}$
$V$
$N$
$)-1/(2p+3)$
- E.g. $\propto N^{-1/5}$ when $p = 1$
- $h^{*}\uparrow$ when bias is smaller: $\mid B\mid \downarrow$ , $p \uparrow$
- $h^{*}\downarrow$ when variance is smaller: $V \downarrow$ , $N \uparrow$

### p. 21 — Estimating optimal bandwidth

If we can estimate $B$ and $V$, we can compute $h^{*}$
Calonico, Cattaneo, and Titiunik (2014): to estimate $B$, run local polynomial
estimation with order $q \geq p + 1$ (with a larger “pilot” bandwidth)
- Yields estimates for $(p + 1)$’st derivatives of $\mathbb{E} [Y \mid X]$ on each side of $X = c$
- Default pilot bandwidth based on a global polynomial regression of order $> q$

### p. 22 — Estimating optimal bandwidth (2)

For Var $[\hat{\tau} ] \propto$ Var $[Y \mid X = c]$, can we use errors from local linear regression?
$Y_{i}= \tau D_{i} + \gamma_{0} + \gamma_{1}(X_{i} -c) + \gamma_{2}(X_{i} -c)D_{i} +$ error
The error includes nonlinearity of $\mathbb{E} [Y(d) \mid X]$ ($d = 0, 1$) =$\Rightarrow$ upward bias for $V$
One solution: nearest neighbor approach
- Estimate errors $\epsilon_{i}= Y_{i} -\mathbb{E} [Y_{i}\mid X_{i}]$ from variation of $Y$ among $J$ neighbors, nearest in terms of the score and on the same side:
$$\hat{\epsilon}_{i}=$$
$$\sqrt$$
$$J$$
$$J + 1$$
$$($$
$$Y_{i} -\bar{Y}_{neighbors(i)}$$
$)$

### p. 23 — Intermediate summary

Local linear regression estimator $\hat{\tau}$ has asymptotic bias $B \cdot h^{p+1}$
- Estimate $B$ by local quadratic regression
Asymptotic Variance of $\hat{\tau}$ is
$$V$$
$$Nh$$
- Estimate $V$ by the nearest neighbor approach
Pick MSE-optimal bandwidth $h^{*}=$
$$($$
$$2(p+1)B^{2}$$
$$V$$
$$N$$
$)-1/(2p+3)$
Run local linear regression to obtain $\hat{\tau}$
What about the confidence interval? Can we use $\hat{\tau} \pm 1.96$
$\sqrt$
$\hat{V}$
$_{Nh}$?

#### p. 23 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Local linear regression estimator $\hat{\hat{\tau}}$ has asymptotic bias $B \cdot h^{p+1}$
  - Estimate $B$ by local quadratic regression
- Asymptotic Variance of $\hat{\hat{\tau}}$ is $\frac{V}{N_h}$
  - Estimate $V$ by the nearest neighbor approach
- Pick MSE-optimal bandwidth $h^* = \left(\frac{2(p+1)B^2}{V}\right)^{-1/(2p+3)}$
- Run local linear regression to obtain $\hat{\hat{\tau}}$
- What about the confidence interval? Can we use $\hat{\hat{\tau}} \pm 1.96 \sqrt{\frac{V}{N_h}}$

### p. 24 — Bias-corrected inference

Problem: $h^{*}$ minimizes MSE by trading off bias $^{2}$ and variance
- At $h^{*}$, bias and SE of the same order =$\Rightarrow$ conventional CI has incorrect coverage!
$\sqrt$
$$Nh^{*}(\hat{\tau} -\tau )^{d}\to N (B^{*}, V^{*}) ,$$
$B^{*}\neq  0$
One solution: “undersmoothing”
- Use bandwidth $h$ much smaller than $h^{*}$. Then inference is fine (bias $\ll$ SE)
- But unclear how to choose $h$, and would yield a higher-MSE estimator
Another solution: “robust bias correction” (Calonico $et al. (2014),$ rdrobust $)$
- We already estimated the bias =$\Rightarrow$ center CI at $\hat{\tau} -\hat{B}^{*}$
- Adjust SE for noise in bias estimation =$\Rightarrow$ “Robust bias-corrected CI”
- Why not debias $\hat{\tau}$ , too? Higher MSE because of bias estimation

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: rrobust._

- Problem: $h^*$ minimizes MSE by trading off bias$^2$ and variance

  - At $h^*$, bias and SE of the same order ⇒ conventional CI has incorrect coverage!
  - $$ \sqrt{Nh^*} (\hat{\tau} - \tau) \overset{d}{\sim} N(B^*, V^*) $$ , $B^* \neq 0$

- One solution: "undersmoothing"

  - Use bandwidth $h$ much smaller than $h^*$. Then inference is fine (bias << SE)
  - But unclear how to choose $h$, and would yield a higher-MSE estimator

- Another solution: "robust bias correction" (Calonico et al. (2014), rrobust)

  - We already estimated the bias ⇒ center CI at $\hat{\tau} - B^*$
  - Adjust SE for noise in bias estimation ⇒ “Robust bias-corrected CI”
  - Why not debias $\hat{\tau}$, too? Higher MSE because of bias estimation

22

### p. 25 — rdrobust with default options

(Cattaneo et al. (2019), Code snippet 21)

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Call: rdrobust

Number of Obs. 2629
BW type mserd
Kernel Triangular
VCE method NN

Number of Obs. 2314 315
Eff. Number of Obs. 529 266
Order est. (p) 1 1
Order bias (p) 2 2
BW est. (h) 17.239 17.239
BW bias (h) 28.575 28.575
rho (h/b) 0.603 0.603

| Method | Coef. | Std. Err. | z | P>|z| [ 95% C.I. ] |
|---|---|---|---|---|---|
| Conventional | 3.020 | 1.427 | 2.116 | 0.034 | [0.223 , 5.817] |
| Robust | - | - | 1.776 | 0.076 | [-0.309 , 6.276] |

(Cattaneo et al. (2019), Code snippet 21)
[Figure: Number of Obs., BW type, Kernel, VCE method, Number of Obs., Eff. Number of Obs., Order est. (p), Order bias (p), BW est. (h), BW bias (h), rho (h/b), Method, Coef., Std. Err., z, P>|z|, [ 95% C.I. ] ]
23

### p. 26 — If you insist to report bias-corrected estimate

(Cattaneo et al. (2019), Code snippet 22)

#### p. 26 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Call: rdrobust

Number of Obs. 2629
BW type mserd
Kernel Triangular
VCE method NN

Number of Obs. 2314 315
Eff. Number of Obs. 529 266
Order est. (p) 1 1
Order bias (p) 2 2
BW est. (h) 17.239 17.239
BW bias (h) 28.575 28.575
rho (h/b) 0.603 0.603

| Method | Coef. | Std. Err. | z | P>|z| | [95% C.I. ] |
|:---:|:---:|:---:|:---:|:---:|:---:|
| Conventional | 3.020 | 1.427 | 2.116 | 0.034 | [0.223 , 5.817] |
| Bias-Corrected | 2.983 | 1.427 | 2.090 | 0.037 | [0.186 , 5.780] |
| Robust | 2.983 | 1.680 | 1.776 | 0.076 | [-0.309 , 6.276] |

(Cattaneo et al. (2019), Code snippet 22)
[Figure: Number of Obs., Eff. Number of Obs., Order est., Order bias, BW est., BW bias, rho, Method, Coef., Std. Err., z, P>|z|, [95% C.I.]]

### p. 27 — Robustness to bandwidth choice

While we know the optimal bandwidth, checking sensitivity to this choice is also useful:
(Imbens and Kalyanaraman (2012), Figure 3)

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

While we know the optimal bandwidth, checking sensitivity to this choice is also useful:

[Figure: Increase in democratic vote share vs. difference in vote share last election. Bandwidth indicated by a red arrow. (Imbens and Kalyanaraman (2012), Figure 3)]

25

### p. 28 — Outline

1
RDD idea and identification
2
Visualization, estimation, and inference
3
Falsification tests
A cautionary tale

### p. 29 — Falsification tests

The assumption of continuity of potential outcomes is not testable
But a slightly stronger assumption — “that $X_{i}$ is influenced partially by random
chance” (Lee $(2008))$ — has two testable implications:
1. Balance: distribution of predetermined variables $W_{i}$(lagged covariates or outcomes)
should be continuous at the cutoff
2. Density of $X_{i}$ should be continuous at the cutoff
Note: contextual knowledge, e.g. on how easy it is to manipulate $X_{i}$, is still
indispensable

### p. 30 — Placebo RD plots and estimates

(Lee (2008), Figure 5b and Table 2)

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Probability of Victory, Election $t$ vs. Democratic Vote Share Margin of Victory, Election $t$. Local Average and Logit fit are labeled.]

Dependent variable (1) (2) (3) (4) (5) (6) (7) (8)
Victory, election $t$ $0.077$ $0.078$ $0.077$ $0.077$ $0.078$ $0.081$ $0.079$ $-0.002$
$(0.011)$ $(0.011)$ $(0.011)$ $(0.011)$ $(0.011)$ $(0.014)$ $(0.013)$ $(0.011)$

Vote share $t+1$
Vote share $t+1$
Vote share $t+1$
Vote share $t+1$
Vote share $t+1$
Res. vote share $t+1$
1st. vote share $t+1$
Vote share $t-1$

(Lee (2008), Figure 5b and Table 2)
27

### p. 31 — Discontinuity of density (“bunching”) test

McCrary $(2008)$: Discontinuity of density of $X_{i}$ around $X_{i}= c$ suggests manipulation
(Illustration from Calonico et al. (2019), Fig. 18)

#### p. 31 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

McCrary (2008): Discontinuity of $X_i$ around $X_i = c$ suggests manipulation

[Figure: (a) No Sorting, (b) Sorting]

(a) No Sorting

(b) Sorting

(Illustration from Calonico et al. (2019), Fig. 18)

28

### p. 32 — Discontinuity of density in practice

A real issue in the literature on the effect of unionization, using close elections RDD:
(Frandsen (2021), Fig. 1)

#### p. 32 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

A real issue in the literature on the effect of unionization, using close elections RDD:

[Figure: At least 20 votes t-statistic = 9.997, At least 100 votes t-statistic = 1.742]

(Frandsen (2021), Fig. 1)

29

### p. 33 — Convenient implementation

Cattaneo, Jansson, and $Ma (2020)$, rddensity package:
Density is the slope of CDF, which is easy to estimate =$\Rightarrow$ estimate from a local
polynomial approximation to the CDF
(Cattaneo et al. (2019), Fig. 19)

#### p. 33 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Cattaneo, Jansson, and Ma (2020), rddensity package:
- Density is the slope of CDF, which is easy to estimate ⇒ estimate from a local polynomial approximation to the CDF

[Figure: (a) Histogram, (b) Estimated Density (Cattaneo et al. (2019), Fig. 19)]

### p. 34 — Outline

1
RDD idea and identification
2
Visualization, estimation, and inference
3
Falsification tests
A cautionary tale

### p. 35 — A cautionary tale

We have discussed an algorithm for estimating causal effects in RDDs
- Plots, estimators, inference methods, tests
But blindly following the algorithm is not enough to get to the truth
- Illustration following Andrew Gelman’s blog posts in 2019 and 2020 in the RDD context but the lesson is broader

### p. 36 — Gilraine (2025): Effect of air filters on student achievement

Filters installed in all schools within 5 miles of a big gas leak in Los Angeles
$“Once$ the distance $to$ the gas leak exceeds five miles, $we$ see $a$ substantial drop $in$
test score growth $in$ both math and English. This provides clear and convincing
evidence that air filters substantially raised test $scores.”$

### p. 37 — Gilraine (2025): Effect of air filters on student achievement

(Gilraine (2025), Figure 3a)
It’d be easy to draw the lines differently — try removing the lines and drawing them
yourself

#### p. 37 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Panel A: Mathematics Score Growth

[Figure: Math Score Growth (y-axis) vs. Distance from Gas Leak (Miles) (x-axis). Data points are scattered. Three lines are drawn: a straight line, a curved line, and a vertical line. The vertical line is red and appears to be a reference line. The curved line is dotted.]

(Gilraine (2025), Figure 3a)

It’d be easy to draw the lines differently — try removing the lines and drawing them yourself

### p. 38 — Barfort, Klemmensen, and Larsen (2021)

Study the effects of a candidate winning gubernatiorial election on life expectancy
Significant local linear regression estimates $\hat{\tau} \approx$ 2000–3000 days
- Report placebo outcomes, robustness to bandwidth and polynomial order, etc.

#### p. 38 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- Study the effects of a candidate winning gubernatorial election on life expectancy
- Significant local linear regression estimates $\hat{\tau} \approx 2000–3000$ days
  - Report placebo outcomes, robustness to bandwidth and polynomial order, etc.
[Figure: (Cutoff) Margin (pct), Life Expectancy (days), x-axis labels -10, -7.5, -5, -2.5, 0, 2.5, 5, 7.5, 10; y-axis labels 5000, 10000, 15000; data points scattered around the graph; a black line representing the regression line]
34

### p. 39 — Lessons from Barfort et al. (2021)?

Gelman tries to replicate it from scratch and finds it difficult
- Many choices during data cleaning not be captured by robustness checks
- $“The$ garden $of$ forking $paths”$
The effect magnitude is entirely implausible
- But how should we use our priors?
Raw data is noisy
- Different models can fit them in different ways $. “No$ smoking $gun”$ (see next slide)
- But should we just give up?

### p. 40 — Lessons from Barfort et al. (2021)?

(Gelman’s reanalysis of the raw data)

#### p. 40 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Lessons from Barfort et al. (2021)?

[Figure: Raw data with separate loess fits (Gelman’s reanalysis of the raw data). X-axis: Percentage vote margin. Y-axis: Vote share election. Loess fits are shown as red lines.]

36

### p. 41 — References I

Anderson, M. and J. Magruder (2012): “Learning from the Crowd: Regression Discontinuity
Estimates of the Effects of an Online Review Database,” The Economic Journal, 122, 957–989.
Angrist, J. D. and V. Lavy (1999): “Using Maimonides’ Rule to Estimate the Effect of Class Size
on Scholastic Achievement,” The Quarterly Journal $of$ Economics, 114, 533–575.
Barfort, S., R. Klemmensen, and E. G. Larsen (2021): “Longevity returns to political
office,” Political Science Research and Methods, 9, 658–664.
Calonico, S., M. D. Cattaneo, M. H. Farrell, and R. Titiunik (2019): “Regression
Discontinuity Designs Using Covariates,” The Review $of$ Economics and Statistics, 101, 442–451.
Calonico, S., M. D. Cattaneo, and R. Titiunik (2014): “Robust Nonparametric Confidence
Intervals for Regression-Discontinuity Designs: Robust Nonparametric Confidence Intervals,”
Econometrica, 82, 2295–2326.
——— (2015): “Optimal Data-Driven Regression Discontinuity Plots,” Journal $of$ the American
Statistical Association, 110, 1753–1769.
Cattaneo, M. D., N. Idrobo, and R. Titiunik (2019): $A$ Practical Introduction $to$ Regression
Discontinuity Designs: Foundations, arXiv:1911.09511 [econ, stat].

### p. 42 — References II

Cattaneo, M. D., M. Jansson, and X. Ma (2020): “Simple Local Polynomial Density
Estimators,” Journal $of$ the American Statistical Association, 115, 1449–1455.
Frandsen, B. R. (2021): “The Surprising Impacts of Unionization: Evidence from Matched
Employer-Employee Data,” Journal $of$ Labor Economics, 39, 861–894.
Gelman, A. and G. Imbens (2019): “Why High-Order Polynomials Should Not Be Used in
Regression Discontinuity Designs,” Journal $of$ Business $&$ Economic Statistics, 37, 447–456.
Gilraine, M. (2025): “Air Filters, Pollution, and Student Achievement,” Journal $of$ Human
Resources, 60, 1469–1506.
Imbens, G. W. and K. Kalyanaraman (2012): “Optimal Bandwidth Choice for the Regression
Discontinuity Estimator,” Review $of$ Economic Studies, 79, 933–959.
Lee, D. S. (2008): “Randomized experiments from non-random selection in U.S. House elections,”
Journal $of$ Econometrics, 142, 675–697, iSBN: 03044076.
McCrary, J. (2008): “Manipulation of the running variable in the regression discontinuity design: A
density test,” Journal $of$ Econometrics, 142, 698–714.

### p. 43 — References III

Meyersson, E. (2014): “Islamic Rule and the Empowerment of the Poor and Pious,” Econometrica,
82, 229–269.
Van Der Klaauw, W. (2002): “Estimating the Effect of Financial Aid Offers on College Enrollment:
A Regression–Discontinuity Approach*,” International Economic Review, 43, 1249–1287.

## Extraction Gaps

- p. 4: figure or diagram present
- p. 11: figure or diagram present
- p. 13: figure or diagram present
- p. 14: figure or diagram present
- p. 16: figure or diagram present
- p. 17: display math with drawn rules
- p. 18: display math with drawn rules
- p. 19: figure or diagram present
- p. 22: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 23: display math with drawn rules
- p. 24: display math with drawn rules
- p. 25: figure or diagram present
- p. 26: figure or diagram present
- p. 27: figure or diagram present
- p. 30: figure or diagram present
- p. 31: figure or diagram present
- p. 32: figure or diagram present
- p. 33: figure or diagram present
- p. 37: figure or diagram present
- p. 38: figure or diagram present
- p. 40: figure or diagram present
