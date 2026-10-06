# A1: Key facts about regression. Statistical inference Translation

## Source

- PDF: `literature/raw_pdf/A1_regression.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/A1_regression.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 64/64 pages, word recall 0.983, words not in the text layer 0.003.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part A: Regression and causality
- p. 2: Outline
- p. 3: Acknowledgments
- p. 4: What is this course about (1)
- p. 5: What is this course about (2)
- p. 6: What is this course about (3)
- p. 7: You should be able to
- p. 8: Course outline (1)
- p. 9: Course outline (2)
- p. 10: The course in brief
- p. 11: Readings
- p. 12: Check your background: True/False
- p. 13: Outline
- p. 14: Econometric vocabulary: Model
- p. 15: Econometric vocabulary: Estimands and Identification
- p. 16: Econometric vocabulary: Estimators
- p. 17: Examples: OLS estimand in different models
- p. 18: Outline
- p. 19: Regression and its uses
- p. 20: Regression as optimal prediction
- p. 21: Proposition proof
- p. 22: Regression as optimal prediction: Exercise
- p. 23: Outline
- p. 24: Definition
- p. 25: Five reasons for linear regression
- p. 26: Five reasons for linear regression (cont.)
- p. 27: What does #4 mean?
- p. 28: Proof of #4: Discrete $X$
- p. 29: Proof of #4: Continuous $X$
- p. 30: Five reasons for linear regression (cont.)
- p. 31: Outline
- p. 32: (Linear) regression mechanics: Key results
- p. 33: #1: Linear transformations of RHS variables
- p. 34: #2: Regressing $Y = X_{k}$ on $X_{1}, \ldots , X_{K}$
- p. 35: #3: OLS is a linear estimator
- p. 36: #3: Proof
- p. 37: A note on weights
- p. 38: #4: Linear transformations of the LHS variable
- p. 39: #5: Partialling out: Frisch-Waugh-Lovell (FWL) theorem
- p. 40: #5: Proof
- p. 41: Implications of FWL
- p. 42: #6: Omitted variable “bias”
- p. 43: Outline
- p. 44: As seen on the BART...
- p. 45: Asymptotic distribution of the OLS estimator
- p. 46: Heteroskedasticity-robust standard errors
- p. 47: FWL for standard errors
- p. 48: Beyond random samples
- p. 49: Statistical inference beyond random samples
- p. 50: Cluster-robust inference
- p. 51: Derivation #1
- p. 52: Derivation #2
- p. 53: More on clustering
- p. 54: At what level to cluster?
- p. 55: At what level to cluster? (2)
- p. 56: Exercises
- p. 57: Regressions with pair fixed effects: It’s complicated
- p. 58: Multi-way clustering
- p. 59: Multi-way clustering (2)
- p. 60: Multi-way clustering (3)
- p. 61: Spatially-clustered standard errors
- p. 62: Spatially-clustered standard errors: Notes
- p. 63: References I
- p. 64: References II

## Comprehensive Translation

### p. 1 — Part A: Regression and causality

A1: Key facts about regression. Statistical inference
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — Outline

1
Course intro
2
Some econometric vocabulary
3
What is regression and why do we use it?
4
Why linear regression?
5
Linear regression mechanics
Statistical inference

### p. 3 — Acknowledgments

These lecture slides draw on the materials by Michael Anderson, Peter Hull, Paul
Goldsmith-Pinkham, and Michal Kolesar
All errors are mine — please let me know if you spot them!

### p. 4 — What is this course about (1)

Goal: help researchers in economics and related fields do rigorous empirical work
- Requires understanding the underlying econometrics and how it links to economic theory and applied questions
- Attention to intuition, not regularity conditions
- But we will go much beyond a black-box toolkit, study key proofs
Bonus: students interested in methodological work may get some inspiration: lots
of open problems!

### p. 5 — What is this course about (2)

Focus on causal inference / program evaluation / treatment effects
What $is$ shared $by$ [the causal] literature $is [...] an$ explicit emphasis $on$ credibly
estimating causal effects, $a$ recognition $of$ the heterogeneity $in$ these effects, clarity $in$ the
identifying assumptions, and $a$ concern about endogeneity $of$ choices and the role study
design plays. (Imbens, 2010)

### p. 6 — What is this course about (3)

Focus on most common research designs / identification strategies
The econometrics literature has developed $a$ small number $of$ canonical settings where
researchers view the specific causal models and associated statistical methods $as$ well
established and understood. [They are] referred $to as$ identification strategies. [These]
include unconfoundedness, $IV,$ DiD, RDD, and synthetic control methods and are
familiar $to$ most empirical researchers $in$ economics. The [associated] methods associated
are commonly used $in$ empirical work and are constantly being refined, and new
identification strategies are occasionally added $to$ the canon. Empirical strategies not
currently $in$ this canon, rightly $or$ wrongly, are viewed with much more suspicion until
they reach the critical momentum $to be$ added. (Imbens, 2020)

### p. 7 — You should be able to

Pick the empirical strategy that best suits your application
Understand its assumptions/limitations
Identify problems in the papers you read

### p. 8 — Course outline (1)

A. Recap of regression and causality
- Key facts about regression; statistical inference; potential outcomes and RCTs
B. Unconfoundedness (a.k.a. Selection on observables)
C. Instrumental variables (IVs)
- Linear IV; IV with treatment effect heterogeneity; Examiner designs (“judge IV”)
D. Panel data methods
- Linear panel data methods; Dynamic panels
- Diff-in-diffs and event studies; synthetic controls and factor models

### p. 9 — Course outline (2)

E. Regression discontinuity (RD) designs
- Sharp and fuzzy RD designs and various extensions
F. Spillovers and equilibrium effects
- Peer effects
- Formula instruments and recentering; Shift-share IV designs
G. Miscellaneous topics: some of...
- Uncovering causal mechanisms
- Nonlinear methods: Poisson regression, multinomial choice, quantile regression
- Machine learning and causality
- Topics of your interest (email me in advance!)

### p. 10 — The course in brief

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Khoa Vu
@KhoaVuUmn
[Figure: MEAN - MEAN (MEAN - MEAN) (MEAN - MEAN) (MEAN - MEAN) (MEAN = MEAN)]

### p. 11 — Readings

See link in syllabus for up-to-date readings for each topic. Useful textbooks:
MHE Angrist and Pischke (2009) “Mostly Harmless Econometrics”
JW Wooldridge (2002/2010) “Econometric Analysis of Cross Section and Panel Data”
IW Imbens and Wooldridge (2009) “New developments in econometrics: Lecture
notes”
CT Cameron and Trivedi (2005) “Microeconometrics: Methods and Applications”
SW Wager (2024) “Causal Inference: A Statistical Learning Approach”
PD Ding (2024) “Linear Models and Extensions”
SC Cunningham (2021) “Causal Inference: The Mixtape”

### p. 12 — Check your background: True/False

Let $X, Y$ be some random variables
1. Cov $[Y, X] =\mathbb{E} [Y \cdot (X -\mathbb{E} [X])]$
2. If $Y$ is continuous and $X$ is discrete, $\mathbb{E} [Y \mid X]$ is a continuous random variable
3. If $X \in \{0, 1\}$ is binary, $\mathbb{E} [\mathbb{E} [Y \mid X = 1] \mid X = 0]$ is a well-defined constant

### p. 13 — Outline

1
Course intro
2
Some econometric vocabulary
3
What is regression and why do we use it?
4
Why linear regression?
5
Linear regression mechanics
Statistical inference

### p. 14 — Econometric vocabulary: Model

An economic or statistical model:
- Defines the relevant observed and unobserved variables
- Imposes restrictions on their joint distribution (e.g., relationships between vars), sometimes via parameters
Example 1: $Y = \beta_{0} + \beta_{1}X + \epsilon$
- Not useful without restrictions. Useful when adding $\mathbb{E} [\epsilon \mid X] = 0$
Example 2: $Y = \beta_{0} + \beta_{1}X + \beta_{2}X^{2}+ \epsilon$ ,
$\mathbb{E} [\epsilon \mid X] = 0$
Example 3 (RCT w/ heterogeneous effects): $Y_{i}= \tau_{i}X_{i} + \epsilon_{i},$
$X_{i}\perp \perp (\tau_{i}, \epsilon_{i})$
Example 4 (demand and supply):
$Q = -\beta_{d}P + \epsilon_{d},$
$$Q = \beta_{s}P + \epsilon_{s},$$
Cov $[\epsilon_{d}, \epsilon_{s}] = 0$

#### p. 14 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- An economic or statistical model:
  - Defines the relevant observed and unobserved variables
  - Imposes restrictions on their joint distribution (e.g., relationships between vars), sometimes via parameters
- Example 1: $Y = \beta_0 + \beta_1 X + \epsilon$
  - Not useful without restrictions. Useful when adding $E[\epsilon | X] = 0$
- Example 2: $Y = \beta_0 + \beta_1 X + \beta_2 X^2 + \epsilon$, $E[\epsilon | X] = 0$
- Example 3 (RCT w/ heterogeneous effects): $Y_i = \tau_i X_i + \epsilon_i$, $X_i \perp ( \tau_i, \epsilon_i)$
- Example 4 (demand and supply):
  - $Q = -\beta_d P + \epsilon_d$, $Q = \beta_s P + \epsilon_s$, $Cov[\epsilon_d, \epsilon_s] = 0$

12

### p. 15 — Econometric vocabulary: Estimands and Identification

Estimand is a non-stochastic population object within a model, property of the
joint distribution of observed and unobserved variables and parameters
- Example 1: in the model $Y = \beta_{0} + \beta_{1}X + \epsilon$ , besides individual parameters, we may be interested in $\beta_{0} + 2\beta_{1}$: prediction of $Y$ at $X = 2$
- Example 2: in the heterogeneous effects model $Y_{i}= \tau_{i}X_{i} + \epsilon_{i},$
$X_{i}\perp \perp (\tau_{i}, \epsilon_{i})$,
we may be interested in $\mathbb{E} [\tau_{i}]$
A model parameter or estimand is (point-)identified if it is uniquely determined by
the joint distribution of observed variables
- (Partially identified if a strict subset of values is consistent with data)
- Example 1 (cont.): $\beta_{1}$ is not identified without extra restrictions
$^{\star}$ But under $\mathbb{E} [\epsilon \mid X] = 0$,
$\beta_{1}=$ Cov $[Y, X] /$ Var $[X]$
- Example 2 (cont.): $\mathbb{E} [\tau_{i}] =$ Cov $[Y, X] /$ Var $[X]$ (prove this!)

### p. 16 — Econometric vocabulary: Estimators

Estimator is a function of observed variables in the sample ($\Rightarrow$ a random variable)
- OLS estimator: $\hat{\beta} =$ X $'$ X
$_{-1}$ X $_{'}$ Y $\equiv$
$$1$$
$$N$$
$$PN$$
$$i=1 X^{i}X'$$
$i$
$-1$
$1$
$N$
$PN$
$i=1 X^{i}Y^{i}$
$\hat{\beta}$ corresponds to a linear specification $Y_{i}= \beta 'X_{i} +$ error
- Just notational convention for reg Y X, not [necessarily] a model
Assuming a random sample, as $N \to \infty$ , most reasonable estimators converge to
some population object
- This is the estimand corresponding to the estimator
E.g. OLS estimand: $\beta_{OLS}=\mathbb{E} [XX']^{-1}\mathbb{E} [XY] \equiv \mathbb{E} [X_{i}X'$
$_{i}]^{-1}\mathbb{E} [X_{i}Y_{i}]$
- I.e., $\hat{\beta}$
$^{p}\to \beta_{OLS}$ in a random sample under weak regularity conditions
- This does not require imposing a model $Y = \beta '$
$_{OLS}X + \epsilon$ or assuming $\mathbb{E} [\epsilon \mid X] = 0$
- But OLS estimand can be interpreted under any given model...

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Estimator is a function of observed variables in the sample ($ \Rightarrow $ a random variable)
  - OLS estimator: $\hat{\beta} = (X^TX)^{-1} X^T Y = \left( \frac{1}{N} \sum_{i=1}^N x_i x_i^T \right)^{-1} \left( \frac{1}{N} \sum_{i=1}^N x_i Y_i \right)$
- $\hat{\beta}$ corresponds to a linear specification $Y_i = \beta^T X_i + error$
  - Just notational convention for reg Y X, not [necessarily] a model
- Assuming a random sample, as $N \rightarrow \infty$, most reasonable estimators converge to some population object
  - This is the estimand corresponding to the estimator
- E.g. OLS estimand: $\beta_{OLS} = E[X] E[Y] = E[X^T X]^{-1} E[X^T Y]$
  - I.e., $\hat{\beta} \stackrel{p}{\rightarrow} \beta_{OLS}$ in a random sample under weak regularity conditions
  - This does not require imposing a model $Y = \beta^T_{OLS} X + \epsilon$ or assuming $E[\epsilon | X] = 0$
  - But OLS estimand can be interpreted under any given model...

### p. 17 — Examples: OLS estimand in different models

1. Model $Y = \beta 'X + \epsilon$ , $\mathbb{E} [\epsilon \mid X] = 0$
=$\Rightarrow$
$$\beta_{OLS}= \beta$$
2. Heterogeneous effects: Regressing $Y_{i}$ on $X_{i}$ and a constant yields $\beta_{OLS}=\mathbb{E} [\tau_{i}]$
3. Demand and supply: Regressing $Q_{i}$ on $P_{i}$(and a constant) yields (prove this!)
$\beta_{OLS}=$
Var $[\epsilon_{s}]$
Var $[\epsilon_{d}] +$ Var $[\epsilon_{s}] \cdot (-\beta^{d}) +$
Var $[\epsilon_{d}]$
Var $[\epsilon_{d}] +$ Var $[\epsilon_{s}] \cdot \beta^{s}$
We will analyze the estimands of simple estimators (e.g. OLS, IV) under different
assumptions, usually in the potential outcomes model
Search for other estimators when simple ones do not yield what we want

#### p. 17 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

1. Model $Y = \beta'X + \epsilon$, $E[\epsilon | X] = 0 \implies \beta_{OLS} = \beta$

2. Heterogeneous effects: Regressing $Y_i$ on $X_i$ and a constant yields $\beta_{OLS} = E[\tau_i]$

3. Demand and supply: Regressing $Q_i$ on $P_i$ (and a constant) yields (prove this!)
$$ \beta_{OLS} = \frac{Var[\epsilon_d] + Var[\epsilon_s]}{Var[\epsilon_d] + Var[\epsilon_s]} (-\beta_d) + \frac{Var[\epsilon_d] + Var[\epsilon_s]}{Var[\epsilon_d] + Var[\epsilon_s]} \beta_s $$

We will analyze the estimands of simple estimators (e.g. OLS, IV) under different assumptions, usually in the potential outcomes model

- Search for other estimators when simple ones do not yield what we want

[Figure: 15]

### p. 18 — Outline

1
Course intro
2
Some econometric vocabulary
3
What is regression and why do we use it?
4
Why linear regression?
5
Linear regression mechanics
Statistical inference

### p. 19 — Regression and its uses

Regression of $Y$ on $X \equiv$ conditional expectation function (CEF):
$$h(\cdot ): x 7\to h(x) \equiv \mathbb{E} [Y_{i}\mid X_{i}= x]$$
$\mathbb{E} [Y_{i}\mid X_{i}] = h(X_{i})$ is a random variable because a function of $X_{i}$
Uses of regression:
Descriptive: how $Y$ on average covaries with $X — by$ definition
Prediction: if we know $X_{i}$, our best guess for $Y_{i}$ is $h(X_{i}) —$ prove next
Causal inference: what happens to $Y_{i}$ if we manipulate $X_{i}—$ sometimes

#### p. 19 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Regression of Y on X ≡ conditional expectation function (CEF):

$$
h(.) : x \mapsto h(x) \equiv E[Y_i | X_i = x]
$$

-  $E[Y_i | X_i] = h(X_i)$ is a random variable because a function of $X_i$

Uses of regression:

-  Descriptive: how Y on average covaries with X — by definition
-  Prediction: if we know $X_i$, our best guess for $Y_i$ is $h(X_i)$ — prove next
-  Causal inference: what happens to $Y_i$ if we manipulate $X_i$ — sometimes

16

### p. 20 — Regression as optimal prediction

What is the best guess depends on the loss function
Proposition: CEF is the best predictor with quadratic loss:
$h(\cdot ) =$ arg min
$$g(\cdot ) \mathbb{E}$$
$(Y_{i} -g(X_{i}))^{2}$
Lemma: the CEF residual $Y_{i} -\mathbb{E} [Y_{i}\mid X_{i}]$ is mean-zero and uncorrelated with any
$g(X_{i})$.
- Proof by the law of iterated expectations (LIE)
- $\mathbb{E} [Y_{i} -\mathbb{E} [Y_{i}\mid X_{i}]] =\mathbb{E} [\mathbb{E} [Y_{i} -\mathbb{E} [Y_{i}\mid X_{i}] \mid X_{i}]] = 0$
- $\mathbb{E} [(Y_{i} -h(X_{i})) g(X_{i})] =\mathbb{E} [\mathbb{E} [(Y_{i} -h(X_{i})) g(X_{i}) \mid X_{i}]] =$
$\mathbb{E} [\mathbb{E} [Y_{i} -h(X_{i}) \mid X_{i}] \cdot g(X_{i})] = 0$

#### p. 20 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- What is the best guess depends on the loss function
- Proposition: CEF is the best predictor with quadratic loss:
  $$h(\cdot) = \arg \min_{g(\cdot)} E[(Y_i - g(X_i))^2]$$
- Lemma: the CEF residual $Y_i - E[Y_i | X_i]$ is mean-zero and uncorrelated with any $g(X_i)$.
  - Proof by the law of iterated expectations (LIE)
  - $$E[Y_i - E[Y_i | X_i]] = E[E[Y_i - E[Y_i | X_i] | X_i]] = 0$$
  - $$E[(Y_i - h(X_i)) g(X_i)] = E[E[(Y_i - h(X_i)) g(X_i) | X_i]] = E[E[Y_i - h(X_i) | X_i] g(X_i)] = 0$$
  - $$E[E[Y_i - h(X_i) | X_i] g(X_i)] = 0$$
[Figure: 17]

### p. 21 — Proposition proof

Proposition: CEF is the best predictor with quadratic loss:
$h(\cdot ) =$ arg min
$$g(\cdot ) \mathbb{E}$$
$(Y_{i} -g(X_{i}))^{2}$
Proof:
$\mathbb{E}$
$h$
$(Y_{i} -g(X_{i}))^{2}i$
$=\mathbb{E}$
$h$
$$\{(Y_{i} -h(X_{i})) + (h(X_{i}) -g(X_{i}))\}^{2}i$$
$=\mathbb{E}$
$h$
$(Y_{i} -h(X_{i}))^{2}i$
$$+ 2\mathbb{E} [(Y_{i} -h(X_{i})) (h(X_{i}) -g(X_{i}))] +\mathbb{E}$$
$h$
$(h(X_{i}) -g(X_{i}))^{2}i$
$=\mathbb{E}$
$h$
$$(Y_{i} -h(X_{i}))^{2}i$$
$$+\mathbb{E}$$
$$h$$
$(h(X_{i}) -g(X_{i}))^{2}i$
$\geq \mathbb{E}$
$h$
$(Y_{i} -h(X_{i}))^{2}i$

#### p. 21 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Proposition: CEF is the best predictor with quadratic loss:

  $$h(.) = \arg \min_{g(.)} E[(Y_i - g(X_i))^2]$$

- Proof:

  $$E[(Y_i - g(X_i))^2] = E[(Y_i - h(X_i) + (h(X_i) - g(X_i)))^2]$$
  $$= E[(Y_i - h(X_i))^2] + 2E[(Y_i - h(X_i))(h(X_i) - g(X_i))] + E[(h(X_i) - g(X_i))^2]$$
  $$= E[(Y_i - h(X_i))^2] + E[h(X_i) - g(X_i)]^2 \geq E[(Y_i - h(X_i))^2]$$

18

### p. 22 — Regression as optimal prediction: Exercise

Show that conditional median is the best predictor with loss $\mid Y_{i} -g(X_{i})\mid$ , i.e.
median $(Y_{i}\mid X_{i}) =$ arg min
$g(\cdot ) \mathbb{E} [\mid Y^{i} -g(X^{i})\mid ]$
- Hint: solve it first assuming $X_{i}$ takes only one value
What about the “check” loss function (slope $q \in (0, 1)$ on the right, $q -1$ on the
left)?

#### p. 22 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: error._

- Show that conditional median is the best predictor with loss $|Y_i - g(X_i)|$, i.e.
  $$median(Y_i | X_i) = arg\ min_g \mathbb{E} ||Y_i - g(X_i)||$$

-  Hint: solve it first assuming $X_i$ takes only one value

-  What about the "check" loss function (slope $q \in (0, 1)$ on the right, $q - 1$ on the left)?
  [Figure: Prediction error, Loss]

### p. 23 — Outline

1
Course intro
2
Some econometric vocabulary
3
What is regression and why do we use it?
4
Why linear regression?
5
Linear regression mechanics
Statistical inference

### p. 24 — Definition

In the population,
$\beta_{OLS}=$ arg min
$$b \mathbb{E}$$
$(Y -X'b)^{2}$
- Interpretation: $X'\beta_{OLS}$ is the best linear predictor of $Y$ with quadratic loss
FOC: $\mathbb{E} [X(Y -X'\beta_{OLS})] = 0$
- Interpretation: residuals are mean-zero (when $X$ includes an intercept) and uncorrelated with $X (a$ property $of$ OLS, not $an$ assumption)
- Sample analog also holds
Solution: $\beta_{OLS}=\mathbb{E} [XX']^{-1}\mathbb{E} [XY]$

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- In the population,
  $$ \beta_{OLS} = \arg \min_b E[(Y - Xb)^2] $$
  - Interpretation: $X\beta_{OLS}$ is the best linear predictor of $Y$ with quadratic loss
- FOC: $E[X(Y - X\beta_{OLS})] = 0$
  - Interpretation: residuals are mean-zero (when $X$ includes an intercept) and uncorrelated with $X$ (a property of OLS, not an assumption)
  - Sample analog also holds
- Solution:
  $$ \beta_{OLS} = E[X^TX]^{-1}E[XY] $$

### p. 25 — Five reasons for linear regression

How is linear regression (OLS) related to regression (CEF)? Why do we often prefer
OLS?
1. Curse of dimensionality: $\mathbb{E} [Y \mid X]$ is hard to estimate when $X$ is high-dimensional
2. OLS and CEF solve similar problems: $X'\beta_{OLS}$ is the best linear predictor of $Y$
3. OLS is also the best linear approximation to the CEF:
$\beta_{OLS}=$ arg min
$$b \mathbb{E}$$
$$h$$
$(\mathbb{E} [Y \mid X] -X'b)^{2}i$
- Proof: by FOC, $\mathbb{E} [X (\mathbb{E} [Y \mid X] -X'b)] = 0$ =$\Rightarrow$
$$b =\mathbb{E} [XX']^{-1}\mathbb{E} [X\mathbb{E} [Y \mid X]] =\mathbb{E} [XX']^{-1}\mathbb{E} [XY] = \beta_{OLS}$$

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

How is linear regression (OLS) related to regression (CEF)? Why do we often prefer OLS?

1. Curse of dimensionality: $E[Y | X]$ is hard to estimate when $X$ is high-dimensional.

2. OLS and CEF solve similar problems: $X^{\beta_{OLS}}$ is the best linear predictor of $Y$.

3. OLS is also the best linear approximation to the CEF:

$$
\beta_{OLS} = \arg \min E[ (E[Y | X] - X'b)^2 ]
$$

- Proof: by FOC, $E[X(E[Y | X] - X'b)] = 0 \Rightarrow$
  $b = E[X'X]^{-1}E[X(E[Y | X])] = E[X'X]^{-1}E[XY] = \beta_{OLS}$

[Figure: 21]

### p. 26 — Five reasons for linear regression (cont.)

1. Curse of dimensionality: $\mathbb{E} [Y \mid X]$ is hard to estimate when $X$ is high-dimensional
2. OLS and CEF solve similar problems: $X'\beta_{OLS}$ is the best linear predictor of $Y$
3. OLS is also the best linear approximation to the CEF
4. With scalar $X$ (in addition to an intercept), $\beta_{OLS}$ is a convexly-weighted average of
d $\mathbb{E} [Y \mid X = x] /$ d $x$ (or its discrete analog)

### p. 27 — What does #4 mean?

Consider discrete $X$ taking values $x_{0}< \cdot \cdot \cdot < x_{K}$
We have scalar $(X, Y)$, with no assumptions imposed on them (no linear model!)
By definition,
$$Y = h(X) + \epsilon ,$$
$\mathbb{E} [\epsilon \mid X] = 0$
We want to show that population regression of $Y$ on $X$ yields
$$\beta_{OLS}=$$
$$K$$
$$X$$
$$k=1$$
$$\omega_{k}$$
$$h(x_{k}) -h(x_{k-1})$$
$$x_{k} -x_{k-1}$$
for some $\omega_{1}, \ldots , \omega_{K}\geq 0$ that do not depend on $h(\cdot )$, with $\omega_{1} + \cdot \cdot \cdot + \omega_{K}= 1$
Gives interpretation of OLS as an average slope even when CEF is nonlinear

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Consider discrete $X$ taking values $x_0 < \cdots < x_K$
- We have scalar $(X, Y)$, with no assumptions imposed on them (no linear model!)
- By definition,
  $$Y = h(X) + \epsilon, \quad E[\epsilon | X] = 0$$
- We want to show that population regression of $Y$ on $X$ yields
  $$\beta_{OLS} = \sum_{k=1}^K \omega_k \frac{h(x_k) - h(x_{k-1})}{x_k - x_{k-1}}$$
  for some $\omega_1, \dots, \omega_K \ge 0$ that do not depend on $h(-)$, with $\omega_1 + \cdots + \omega_K = 1$
- Gives interpretation of OLS as an average slope even when CEF is nonlinear

### p. 28 — Proof of #4: Discrete $X$

Rewrite $h(X) = h(x_{0}) + P^{K}$
$$k=1 (h(x^{k}) -h(x^{k-1})) 1 [X \geq x^{k}]$$
Thus Cov $[Y, X] =$ Cov $[h(X), X] = P^{K}$
$k=1 (h(x^{k}) -h(x^{k-1}))$ Cov $[1 [X \geq x^{k}] , X]$ and
$\beta_{OLS}=$ Cov $[Y, X]$
Var $[X]$
$=$
$K$
$X$
$k=1$
$\omega_{k}$
$$h(x_{k}) -h(x_{k-1})$$
$$x_{k} -x_{k-1}$$
$$,$$
$\omega_{k}= (x^{k} -x^{k-1})$ Cov $[1 [X \geq x^{k}] , X]$
Var $[X]$
Here $\omega_{k}\geq 0$ because $1 [X \geq x_{k}]$ is monotone. Specifically (prove $it!)$:
Cov $[1 [X \geq x_{k}] , X] = (\mathbb{E} [X \mid X \geq x_{k}] -\mathbb{E} [X \mid X < x_{k}]) P (X \geq x_{k}) P (X < x_{k})$
And $P^{K}$
$k=1 \omega^{k}= 1$ because $X = x^{0} + P^{K}$
$k=1 (x^{k} -x^{k-1}) 1 [X \geq x^{k}]$

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Rewrite $h(X) = h(x_0) + \sum_{k=1}^K (h(x_k) - h(x_{k-1})) [X \ge x_k]$
- Thus $Cov[Y, X] = Cov[h(X), X] = \sum_{k=1}^K (h(x_k) - h(x_{k-1})) Cov[1[X \ge x_k], X]$ and
$$ \beta_{OLS} = \frac{Cov[Y, X]}{\text{Var}[X]} = \frac{\sum_{k=1}^K \omega_k \frac{h(x_k) - h(x_{k-1})}{x_k - x_{k-1}}, \quad \omega_k = \frac{(x_k - x_{k-1}) Cov[1[X \ge x_k], X]}{\text{Var}[X]} $$
- Here $\omega_k \ge 0$ because $1[X \ge x_k]$ is monotone. Specifically (prove it!):
$$ Cov[1[X \ge x_k], X] = (E[X | X \ge x_k] - E[X | X < x_k]) P(X \ge x_k) P(X < x_k) $$
- And $\sum_{k=1}^K \omega_k = 1$ because $X = x_0 + \sum_{k=1}^K (x_k - x_{k-1}) 1[X \ge x_k]$

### p. 29 — Proof of #4: Continuous $X$

Similarly for continuous scalar $X$:
$\beta_{OLS}=$
$Z \infty$
$-\infty$
$$\omega (x)h'(x)dx,$$
$\omega (x) =$ Cov $[1 [X \geq x] , X]$
Var $[X]$
with $\omega (x) \geq 0$ and
$R \infty$
$_{-\infty}\omega (x) = 1$
Exercise: if $X$ is Gaussian, $\beta_{OLS}=\mathbb{E} [h'(X)]$ (prove $it!)$
- Hint: use $\mathbb{E} [Z \mid Z \geq a] =$
$$\phi (a)$$
$1-\Phi (a)$ for $Z \sim N(0, 1)$

#### p. 29 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Similarly for continuous scalar X:
  $$ \beta_{OLS} = \int_{-\infty}^{\infty} \omega(x) h(x) dx $$
  $$ \omega(x) = \frac{Cov[1[X \geq x], X]}{\text{Var}[X]} $$
  with $\omega(x) \geq 0$ and $\int_{-\infty}^{\infty} \omega(x) = 1$

- Exercise: if X is Gaussian, $\beta_{OLS} = E[h'(X)]$ (prove it!)

- Hint: use $E[Z | Z \geq a] = \frac{\varphi(a)}{1-\Phi(a)}$ for $Z \sim N(0, 1)$

### p. 30 — Five reasons for linear regression (cont.)

1. Curse of dimensionality: $\mathbb{E} [Y \mid X]$ is hard to estimate when $X$ is high-dimensional
2. OLS and CEF solve similar problems: $X'\beta_{OLS}$ is the best linear predictor of $Y$
3. OLS is also the best linear approximation to the CEF
4. With scalar $X$, $\beta_{OLS}$ is a convexly-weighted average of d $\mathbb{E} [Y \mid X = x] /$ d $x$
5. If $\mathbb{E} [Y \mid X]$ happens to be linear, $\mathbb{E} [Y \mid X] = X'\beta_{OLS}$
- Linearity is guaranteed when $(X, Y)$ are jointly normally distributed
- or when $X$ is “saturated”: dummies for all values of a discrete variable. E.g. for binary $D$ and $X = (1, D)$,
$\mathbb{E} [Y \mid X] =\mathbb{E} [Y \mid D] =\mathbb{E} [Y \mid D = 0]$
$$\mid$$
$$\{z$$
$$\}$$
intercept
$\cdot 1 + (\mathbb{E} [Y \mid D = 1] -\mathbb{E} [Y \mid D = 0])$
$$\mid$$
$\{z$
$\}$
slope
$\cdot D$

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

1. Curse of dimensionality: $\mathbb{E}[Y | X]$ is hard to estimate when $X$ is high-dimensional
2. OLS and CEF solve similar problems: $X \beta_{OLS}$ is the best linear predictor of $Y$
3. OLS is also the best linear approximation to the CEF
4. With scalar $X$, $\beta_{OLS}$ is a convexly-weighted average of $d\mathbb{E}[Y | X = x]/dx$
5. If $\mathbb{E}[Y | X]$ happens to be linear, $\mathbb{E}[Y | X] = X \beta_{OLS}$

-  Linearity is guaranteed when $(X, Y)$ are jointly normally distributed
-  or when $X$ is "saturated": dummies for all values of a discrete variable. E.g. for binary $D$ and $X = (1, D)$,

$$
\mathbb{E}[Y | X] = \mathbb{E}[Y | D] = \mathbb{E}[Y | D = 0] + (\mathbb{E}[Y | D = 1] - \mathbb{E}[Y | D = 0]) \cdot D
$$

intercept slope

### p. 31 — Outline

1
Course intro
2
Some econometric vocabulary
3
What is regression and why do we use it?
4
Why linear regression?
5
Linear regression mechanics
Statistical inference

### p. 32 — (Linear) regression mechanics: Key results

1. What happens under linear transformations of RHS variables
2. Regressing $Y = X_{k}$ on $X_{1}, \ldots , X_{K}$ produces coefficients $(0, \ldots , 0, 1, 0, \ldots 0)$
3. $\hat{\beta}$ is a linear estimator
4. What happens under linear transformations of the LHS variable
5. Frisch-Waugh-Lovell (FWL) theorem
6. Omitted variable bias (OVB) formula

### p. 33 — #1: Linear transformations of RHS variables

Consider OLS estimation of two specifications:
$Y = \beta_{1}X_{1} + \beta_{2}X_{2} +$ error $;$
$Y = \gamma_{1}X_{1} + \gamma_{2}(X_{1} + X_{2}) +$ error $.$
Then $\gamma_{1} + \gamma_{2}= \beta_{1}$, $\gamma_{2}= \beta_{2}$; fitted values/residuals are the same (prove $it!)$
- Application: for binary $X$, it doesn’t matter whether to run
$Y = \beta_{0} + \beta_{1}X +$ error
vs $.$
$Y = \gamma_{0}(1 -X) + \gamma_{1}X +$ error

### p. 34 — #2: Regressing $Y = X_{k}$ on $X_{1}, \ldots , X_{K}$

Regressing $Y = X_{k}$ on $X_{1}, \ldots , X_{K}$ produces coefficients $(0, \ldots , 0, 1, 0, \ldots 0)$
- Prove $it$ using one $of$ key OLS properties (min squared loss among linear predictors; residuals uncorrelated with $X; \beta_{OLS}$ formula)

### p. 35 — #3: OLS is a linear estimator

Given regressors X, each $\hat{\beta}_{k}$ is linear in the outcomes, i.e.
$$\hat{\beta}_{k}=$$
$$X$$
$$i$$
$$\omega_{ki}Y_{i}$$
for some weights $\omega_{ki}\equiv \omega_{ki}($ X $)$ that do not depend on Y (prove $it!)$
Moreover, weights $\omega_{ki}$ add up to zero (for $X_{k}\neq $ intercept)
- I.e., adding 1 to the outcome doesn’t change $\hat{\beta}_{k}$
- $\hat{\beta}_{k}$ is a contrast between outcomes of different groups of observations
Weights are orthogonal to non-$X_{k}$ regressors ($P$
$i \omega^{ki}X^{\elli}= 0$, $\ell \neq  k$)
- I.e., adding $X_{\ell}$ to the outcome doesn’t change $\hat{\beta}_{k}$
And $P$
$i \omega^{ki}X^{ki}= 1$: adding $X^{k}$ to the outcome adds 1 to $\hat{\beta}^{k}$

#### p. 35 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Given regressors $\mathbf{X}$, each $\beta_k$ is linear in the outcomes $Y_i$, i.e.
  $$ \beta_k = \sum_i \omega_{ki} Y_i $$
  for some weights $\omega_{ki} \equiv \omega_{ki}(\mathbf{X})$ that do not depend on $Y$ (prove it!)
- Moreover, weights $\omega_{ki}$ add up to zero (for $X_k \neq$ intercept)
  -  i.e., adding 1 to the outcome doesn’t change $\beta_k$
  -  $\beta_k$ is a contrast between outcomes of different groups of observations
- Weights are orthogonal to non-$X_k$ regressors ($\sum_i \omega_{ki}X_{ki} = 0$, $l \neq k$)
  -  i.e., adding $X_l$ to the outcome doesn’t change $\beta_k$
- And $\sum_i \omega_{ki}X_{ki} = 1$: adding $X_k$ to the outcome adds 1 to $\beta_k$

[Figure: #3: OLS is a linear estimator, 30]

### p. 36 — #3: Proof

$\hat{\beta} = \Omega$ Y for an $K \times N$ matrix $\Omega = ($ X $'$ X $)$
$-1$ X $_{'}$
- Thus $\hat{\beta}_{k}= \Omega_{k}$ Y $\equiv P$
$i \omega^{ki}Y^{i}$ for $\Omega^{k}$ being $k$ th row of $\Omega$
The weights don’t depend on Y so let’s consider $Y_{i}\equiv 1$. Regression yields $\hat{\beta}_{k}= 0$
for $X_{k}\neq $ intercept
- But $0 = \hat{\beta}_{k}= P$
$i \omega^{ki}Y^{i}= P$
$$i \omega^{ki}$$
Now let’s consider $Y_{i}\equiv X_{i\ell}$ for $\ell \neq  k$. Again, we get $\hat{\beta}_{k}= 0$
- So $0 = P$
$i \omega^{ki}Y^{i}= P$
$i \omega^{ki}X^{\elli}$: weights for $X^{k}$ are orthogonal to other regressions
Finally consider $Y_{i}= X_{ik}$, which implies $\hat{\beta}_{k}= 1$
- So $1 = P$
$i \omega^{ki}Y^{i}= P$
$$i \omega^{ki}X^{ki}$$

#### p. 36 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- $\hat{\beta} = \Omega Y$ for an $K \times N$ matrix $\Omega = (X^T X)^{-1} X^T$
  - Thus $\beta_{k} = \Omega_{k} Y$ = $\sum_{i} \omega_{ki} Y_{i}$, for $\Omega_{k}$ being kth row of $\Omega$
- The weights don't depend on $\bf{Y}$ so let's consider $Y_{i} \equiv 1$. Regression yields $\hat{\beta}_{k} = 0$ for $X_{k} \neq$ intercept
  - But $0 = \beta_{k} = \sum_{i} \omega_{ki} Y_{i} = \sum_{i} \omega_{ki}$
- Now let's consider $Y_{i} \equiv X_{il}$ for $\ell \neq k$. Again, we get $\hat{\beta}_{k} = 0$
  - So $0 = \sum_{i} \omega_{ki} Y_{i} = \sum_{i} \omega_{ki} X_{il}$ : weights for $X_{k}$ are orthogonal to other regressions
- Finally consider $Y_{i} \equiv X_{ik}$, which implies $\hat{\beta}_{k} = 1$
  - So $1 = \sum_{i} \omega_{ki} Y_{i} = \sum_{i} \omega_{ki} X_{ik}$

[Figure: #3: Proof]

### p. 37 — A note on weights

We now have two weight representations of OLS:
- Average $d\mathbb{E} [Y \mid X = x] /dx$ with non-negative weights adding up to 1
- $\mathbb{E} [\omega (X) \cdot Y]$ for $\mathbb{E} [\omega (X)] = 0$ (some positive and some negative weights)
Both of these reflect that OLS makes outcome contrasts and aggregates them
Later we will have more weighting results linking OLS to averages of causal effects

### p. 38 — #4: Linear transformations of the LHS variable

If $Y_{i}= Y_{1i} + \cdot \cdot \cdot + Y_{Pi}$, regressing each $Y_{pi}$ on $X_{i}$ and adding up the coefficient
estimates is numerically the same as regressing $Y_{i}$ on $X_{i}$(prove $it!)$
This yields a popular decomposition of regression coefficients
- E.g. regress total deaths on PM2.5 pollution, then decompose into different causes (cf. Deryugina et al. (2019, Table A2))

### p. 39 — #5: Partialling out: Frisch-Waugh-Lovell (FWL) theorem

Theorem: Let $\tilde{X}_{k}$ be the residual from regressing $X_{k}$ on all other regressors $X_{-k}$; and $\tilde{Y}$
be the residual from regressing $Y$ on $X_{-k}$. Then $k$’th element of $\beta_{OLS}$ can be obtained in
two ways:
$\beta_{k}=$
Cov
$$h$$
$$\tilde{X}_{k}, Y$$
$$i$$
Var
$$h$$
$$\tilde{X}_{k}$$
$$i$$
$$=$$
Cov
$$h$$
$\tilde{X}_{k}, \tilde{Y}$
$i$
Var
$$h$$
$\tilde{X}_{k}$
$i$
Importance: characterizes the estimand of each coef in multiple regression without
matrix algebra
Proof idea: Define $\epsilon = Y -\beta '$
$_{OLS}X$. Plug in $Y = \beta '$
$_{OLS}X + \epsilon$ to Cov
$h$
$\tilde{X}_{k}, Y$
$i$
or
Cov
$h$
$\tilde{X}_{k}, \tilde{Y}$
$i$
; verify you get $\beta_{k}$ Var
$$h$$
$$\tilde{X}_{k}$$
$$i$$

#### p. 39 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Theorem: Let $\tilde{X}_k$ be the residual from regressing $X_k$ on all other regressors $X_{-k}$; and $\tilde{Y}$ be the residual from regressing $Y$ on $X_{-k}$. Then $k^{th}$ element of $\beta_{OLS}$ can be obtained in two ways:

$$
\beta_k = \frac{Cov[X_k, Y]}{Var[\tilde{X}_k]} = \frac{Cov[\tilde{X}_k, \tilde{Y}]}{Var[\tilde{X}_k]}
$$

Importance: characterizes the estimand of each coef in multiple regression without matrix algebra

Proof idea: Define $\epsilon = Y - \beta_{OLS}X$. Plug in $Y = \beta_{OLS}X + \epsilon$ to $Cov[X_k, Y]$ or $Cov[\tilde{X}_k, \tilde{Y}]$; verify you get $\beta_k Var[\tilde{X}_k]$

[Figure: 34]

### p. 40 — #5: Proof

We have by definition: $Y = \beta '$
$_{OLS}X + \epsilon$ with $\mathbb{E} [X\epsilon ] = 0$
- And $X_{k}= \gamma 'X_{-k} + \tilde{X}_{k}$ with $\mathbb{E}$
$$h$$
$$X_{-k}\tilde{X}_{k}$$
$$i$$
$$= 0$$
- And $Y = \delta 'X_{-k} + \tilde{Y}$ with $\mathbb{E}$
$$h$$
$$X_{-k}\tilde{Y}$$
$$i$$
$$= 0$$
Then
Cov
$h$
$\tilde{X}_{k}, Y$
$i$
$=$ Cov
$h$
$\tilde{X}_{k}, \beta '$
$$_{-k}X_{-k}+ \beta_{k}X_{k}+ \epsilon$$
$$i$$
$=$ Cov
$h$
$\tilde{X}_{k}, \beta '$
$$_{-k}X_{-k}$$
$$i$$
$+ \beta_{k}$ Cov
$$h$$
$\tilde{X}_{k}, \gamma 'X_{-k} + \tilde{X}_{k}$
$i$
$+$ Cov $[X_{k} -\gamma 'X_{-k}, \epsilon ]$
$= 0 + \beta_{k}$ Var
$h$
$$\tilde{X}_{k}$$
$$i$$
$$+ 0$$
Moreover,
Cov
$h$
$\tilde{X}_{k}, \tilde{Y}$
$i$
$=$ Cov
$$h$$
$$\tilde{X}_{k}, Y -\delta 'X_{-k}$$
$i$
$=$ Cov
$h$
$\tilde{X}_{k}, Y$
$i$

#### p. 40 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- We have by definition: $Y = \beta^{OLS}X + \epsilon$ with $E[X\epsilon] = 0$
  - And $X_k = \gamma'X_k + \tilde{X}_k$ with $E[X_k\tilde{X}_k] = 0$
  - And $Y = \delta'X_k + \tilde{Y}$ with $E[X_k\tilde{Y}] = 0$
- Then
  $$Cov[X_k, Y] = Cov[X_k, \beta^{OLS}X_k + \beta_kX_k + \epsilon]$$
  $$= Cov[X_k, \beta^{OLS}X_k] + \beta_kCov[X_k, X_k] + Cov[X_k, \epsilon]$$
  $$= 0 + \beta_kVar[X_k] + 0$$
- Moreover,
  $$Cov[X_k, \tilde{Y}] = Cov[X_k, Y - \delta'X_k] = Cov[X_k, Y]$$

### p. 41 — Implications of FWL

1. If Cov $[X_{1}, X_{2}] = 0$ (e.g. $X_{1}$= randomized treatment, $X_{2}$= predetermined
covariate), the “long” and “short” specifications have the same estimand $\beta_{1}= \delta_{1}$:
$Y = \beta_{0} + \beta '$
$_{1}X_{1}+ \beta '$
$_{2}X_{2}+$ error $;$
$Y = \delta_{0} + \delta '$
$_{1}X_{1}+$ error
2. Explicit characterization of the weights $\omega_{ki}$ in any regression:
$\hat{\beta}_{k}=$
$P$
$i \tilde{X}^{ki}Y^{i}$
$P$
$i \tilde{X}^{2}$
$$ki$$
$$=$$
$$X$$
$$i$$
$$\omega_{ki}Y_{i}$$
for $\omega_{ki}=$
$\tilde{X}_{ki}$
$PN$
$j=1 \tilde{X}^{2}$
$kj$
$.$
- Exercise: which observations are weighted positively by a regression on scalar $X_{i}$ and an intercept?

#### p. 41 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

1. If Cov $[X_{1}, X_{2}] = 0$ (e.g. $X_{1}$ = randomized treatment, $X_{2}$ = predetermined covariate), the "long" and "short" specifications have the same estimand $\beta_{1} = \delta_{1}$:

$$Y = \beta_{0} + \beta_{1}X_{1} + \beta_{2}X_{2} + error; \qquad Y = \delta_{0} + \delta_{1}X_{1} + error$$

2. Explicit characterization of the weights $\omega_{ki}$ in any regression:

$$\beta_{k} = \frac{\sum_{i} \tilde{X}_{ki}Y_{i}}{\sum_{i} X_{ki}^{2}} = \sum_{i} \omega_{ki}Y_{i} \quad for \quad \omega_{ki} = \frac{\tilde{X}_{ki}}{\sum_{j=1}^{N} X_{kj}}$$

- Exercise: which observations are weighted positively by a regression by a scalar $X_{i}$ and an intercept?

### p. 42 — #6: Omitted variable “bias”

OVB formula is a mechanical relationship between $\beta_{1}$ from a “long” specification and $\delta_{1}$
from a short specification:
$Y = \beta_{0} + \beta_{1}X_{1} + \beta_{2}X_{2} +$ error $,$
$Y = \delta_{0} + \delta_{1}X_{1} +$ error
Claim: $\delta_{1}= \beta_{1} + \beta_{2}\rho$ , where $\rho =$ Cov $[X_{1}, X_{2}] /$ Var $[X_{1}]$ is the auxiliary regression slope
of $X_{2}$(“omitted”) on $X_{1}$(“included”)
Proof: $\delta_{1}=^{Cov[X1,Y]}$
$$Var[X_{1}] =^{Cov[X1,\beta0+\beta1X1+\beta2X2+\epsilon]}$$
Var $[X_{1}]$
$= \beta_{1} + \beta_{2}$
Cov $[X_{1},X_{2}]$
$Var[X_{1}]$ .
Generalizes to multiple omitted variables (with OVB $= \beta '$
$_{2}\rho$ )
- Gelbach (2016) uses it to measure contributions of each extra group of variables to
$\hat{\beta}_{1} -\hat{\delta}_{1}$, i.e. how much the coef changes from including them
Applies with extra controls $X_{3}$ included in long, short, and auxiliary regression

#### p. 42 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

OVB formula is a mechanical relationship between $\beta_1$ from a "long" specification and $\delta_1$ from a short specification:

$$Y = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + error$$  $$Y = \delta_0 + \delta_1 X_1 + error$$

Claim: $\delta_1 = \beta_1 + \beta_2 p$, where $p = \frac{Cov[X_1, X_2]}{Var[X_1]}$ is the auxiliary regression slope of $X_2$ ("omitted") on $X_1$ ("included")

- Proof: $\delta_1 = \frac{Cov[X_1, Y]}{Var[X_1]} = \frac{Cov[X_1, \beta_0 + \beta_1 X_1 + \beta_2 X_2 + e]}{Var[X_1]} = \beta_1 + \beta_2 \frac{Cov[X_1, X_2]}{Var[X_1]}$.

- Generalizes to multiple omitted variables (with OVB = $\beta_2 p$)

  - Gelbach (2016) uses it to measure contributions of each extra group of variables to $\beta_1 - \delta_1$, i.e. how much the coef changes from including them

- Applies with extra controls $X_3$ included in long, short, and auxiliary regression

[Figure: 37]

### p. 43 — Outline

1
Course intro
2
Some econometric vocabulary
3
What is regression and why do we use it?
4
Why linear regression?
5
Linear regression mechanics
Statistical inference

### p. 44 — As seen on the BART...

(From Karthik Tadepalli’s Twitter)

#### p. 44 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Inference
is more than
just vibes
baseten

[Figure: Two signs, one reading "Inference is more than just vibes" and the other reading "Inference isn't optional", both with the baseten logo.]

Inference
isn’t
optional
baseten

(From Karthik Tadepalli’s Twitter)

38

### p. 45 — Asymptotic distribution of the OLS estimator

$\hat{\beta} =$
$1$
$N$
$X$
$i$
$X_{i}X'$
$i$
$!-1$
$1$
$N$
$$X$$
$$i$$
$$X_{i}Y_{i}$$
$$!$$
$$= \beta_{OLS} +$$
$$1$$
$$N$$
$X$
$i$
$X_{i}X'$
$i$
$!-1$
$1$
$N$
$X$
$i$
$X_{i}\epsilon_{i}$
$!$
where by definition $\epsilon_{i}= Y_{i} -X'$
$_{i}\beta_{OLS}$ with $\mathbb{E} [X_{i}\epsilon_{i}] = 0$. Thus,
$\sqrt$
$N$
$\hat{\beta} -\beta_{OLS}$
$$=$$
$$1$$
$$N$$
$$X$$
$$i$$
$$X_{i}X'$$
$$i$$
$$!-1$$
$1$
$\sqrt$
$N$
$X$
$i$
$X_{i}\epsilon_{i}$
$!$
By LLN, $^{1}$
$N$
$P$
$i X^{i}X'$
$i$
$^{p}\to \mathbb{E} [XX']$ (assumed non-singular)
In a random sample, by CLT (using $\mathbb{E} [X\epsilon ] = 0$),
$1$
$$\sqrt$$
$N$
$P$
$i X^{i}\epsilon^{i}$
$^{D}\to N (0,$ Var $[X\epsilon ])$
By the continuous mapping theorem,
$\sqrt$
$N$
$\hat{\beta} -\beta_{OLS}$
$$^{D}\to N (0, V) ,$$
$V =\mathbb{E} [XX']^{-1}$ Var $[X\epsilon ]\mathbb{E} [XX']^{-1}$

#### p. 45 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

$$\hat{\beta} = \left(\frac{1}{N} \sum_{i} X_i X_i'\right)^{-1} \left(\frac{1}{N} \sum_{i} X_i Y_i\right) = \beta_{OLS} + \left(\frac{1}{N} \sum_{i} X_i X_i'\right)^{-1} \left(\frac{1}{N} \sum_{i} X_i \epsilon_i\right)$$

where by definition $\epsilon_i = Y_i - X_i \beta_{OLS}$ with $E[X_i \epsilon_i] = 0$. Thus,

$$\sqrt{N} (\hat{\beta} - \beta_{OLS}) = \left(\frac{1}{N} \sum_{i} X_i X_i'\right)^{-1} \left(\frac{1}{\sqrt{N}} \sum_{i} X_i \epsilon_i\right)$$

- By LLN, $\frac{1}{N} \sum_{i} X_i X_i' \stackrel{p}{\to} E[X_i X_i']$ (assumed non-singular)
- In a random sample, by CLT (using $E[\epsilon_i] = 0$), $\frac{1}{\sqrt{N}} \sum_{i} X_i \epsilon_i \stackrel{d}{\to} N(0, \text{Var}[\epsilon_i])$
- By the continuous mapping theorem,

$$\sqrt{N} (\hat{\beta} - \beta_{OLS}) \stackrel{d}{\to} N(0, V)$$

$V = E[X_i X_i']^{-1} \text{Var}[\epsilon_i] E[X_i X_i']^{-1}$

39

### p. 46 — Heteroskedasticity-robust standard errors

We estimate $V$ by its sample analog (“sandwich formula”) :
$\hat{V} =$
$N$
$N -$ dim $(X)$
$1$
$N$
$$X$$
$$i$$
$$X_{i}X'$$
$$i$$
$$!-1$$
$$\cdot$$
$$1$$
$$N$$
$$X$$
$$i$$
$X_{i}X'$
$_{i}\hat{\epsilon}^{2}$
$i$
$!$
$\cdot$
$1$
$N$
$X$
$i$
$X_{i}X'$
$i$
$!-1$
where
$N$
$N-dim(X)$ = degree-of-freedom correction for small-sample downward bias
Heteroskedasticity-robust (Eicker-Huber-White, “robust”) standard error is
$$SE$$
$$\hat{\beta}_{k}$$
$$=$$
$$q$$
$$\hat{V}_{kk}/N$$
Never use homoskedastic standard errors in practice!
Note: this only works when dim $(X) \ll N$
- We’ll discuss this issue for panel regressions with fixed effects

#### p. 46 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- We estimate $V$ by its sample analog ("sandwich formula") :
$$
\hat{V} = \frac{N}{N - \dim(X)} \left( \frac{1}{N} \sum_i X_i X_i^T \right)^{-1} \left( \frac{1}{N} \sum_i X_i \epsilon_i^2 \right) \left( \frac{1}{N} \sum_i X_i X_i^T \right)^{-1}
$$
where $\frac{N}{N - \dim(X)} =$ degree-of-freedom correction for small-sample downward bias
- Heteroskedasticity-robust (Eicker-Huber-White, "robust") standard error is
$$
SE(\hat{\beta}_k) = \sqrt{\frac{V_{kk}}{N}}
$$
- Never use homoskedastic standard errors in practice!
- Note: this only works when $\dim(X) \ll N$
  - We'll discuss this issue for panel regressions with fixed effects

### p. 47 — FWL for standard errors

Theorem: robust standard errors for a subset of coefficients $\hat{\beta}_{1}$ from specification
$$Y = \beta '$$
$$_{1}X_{1}+ \beta '$$
$_{2}X_{2}+$ error
are numerically the same as from the FWL version (residualized on $X_{2}$):
$$\tilde{Y} = \beta '$$
$_{1}\tilde{X}_{1}+$ error $.$
- Note: LHS has to be residualized, too
- Same holds for homoskedastic standard errors

#### p. 47 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Theorem: robust standard errors for a subset of coefficients $\beta_1$ from specification
  $Y = \beta_1 X_1 + \beta_2 X_2 + error$
  are numerically the same as from the FWL version (residualized on $X_2$):
  $\hat{Y} = \beta_1 X_1 + error$.

-  Note: LHS has to be residualized, too

-  Same holds for homoskedastic standard errors
[Figure: 41]

### p. 48 — Beyond random samples

We assumed $(X_{i}, \epsilon_{i}, Y_{i})$ are independent and identically distributed (iid) across
$i = 1, \ldots , N$ — not always the case
E.g. you sampled villages, then surveyed all adults in selected villages
(“clustered sampling”)
=$\Rightarrow$
$\epsilon_{i}$ likely correlated within village
Or you sampled people but randomly assigned treatment by state
(“clustered assignment”)
=$\Rightarrow$
$X_{i}$ is perfectly correlated within state
Or dataset consists of all counties in a country
=$\Rightarrow$
$\epsilon_{i}$ likely correlated in nearby counties

### p. 49 — Statistical inference beyond random samples

Recall
$\sqrt$
$N$
$\hat{\beta} -\beta_{OLS}$
$=$
$1$
$$N$$
$$P$$
$$i X^{i}X'$$
$$i$$
$$-1$$
$$1$$
$$\sqrt$$
$$N$$
$$P$$
$i X^{i}\epsilon^{i}$
LLN $^{1}$
$N$
$P$
$i X^{i}X'$
$i$
$^{p}\to \mathbb{E}$
$1$
$N$
$P$
$$i X^{i}X'$$
$$i$$
applies much beyond random samples
But CLT for “sandwich meat” relies on Cov $[X_{i}\epsilon_{i}, X_{j}\epsilon_{j}] = 0$ for $i\neq  j$:
Var
$"$
$1$
$\sqrt$
$N$
$X$
$i$
$X_{i}\epsilon_{i}$
$#$
$= 1$
$N$
$X$
$i$
Var $[X_{i}\epsilon_{i}] + 1$
$$N$$
$$X$$
$$i\neq j$$
Cov $[X_{i}\epsilon_{i}, X_{j}\epsilon_{j}] = 1$
$N$
$X$
$i$
Var $[X_{i}\epsilon_{i}]$
- Let’s consider three relaxations: clustering, multi-way clustering, and spatial clustering

#### p. 49 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Recall $\sqrt{N} (\hat{\beta} - \beta_{OLS}) = \left(\frac{1}{N} \sum_{i} X_i X_i'\right)^{-1} \left(\frac{1}{N} \sum_{i} X_i \epsilon_i\right)$

- LLN $\frac{1}{N} \sum_{i} X_i X_i' \rightarrow \mathbb{E} \left[\frac{1}{N} \sum_{i} X_i X_i'\right]$ applies much beyond random samples

- But CLT for "sandwich meat" relies on Cov $[X_{i\epsilon}, X_{j\epsilon}] = 0$ for $i \neq j$:

$$Var \left[\sqrt{N} \left(\frac{1}{N} \sum_{i} X_{i\epsilon}\right)\right] = \frac{1}{N} \sum_{i} Var[X_{i\epsilon}] + \frac{1}{N} \sum_{i \neq j} Cov[X_{i\epsilon}, X_{j\epsilon}] = \frac{1}{N} \sum_{i} Var[X_{i\epsilon}]$$

- Let's consider three relaxations: clustering, multi-way clustering, and spatial clustering

### p. 50 — Cluster-robust inference

Suppose units belong to clusters $g(i) \in \{1, \ldots , G\}$ , and we believe
Cov $[X_{i}\epsilon_{i}, X_{j}\epsilon_{j}] = 0$ if $g(i)\neq  g(j)$
- While arbitrary correlations are allowed within clusters
Then we can use cluster-robust (“clustered”) inference (cf. MacKinnon et al.
(2023))
- Two equivalent derivations...

### p. 51 — Derivation #1

Rewrite the estimator as
$\hat{\beta} -\beta_{OLS}=$
$X$
$i$
$X_{i}X'$
$i$
$!-1 X$
$$i$$
$$X_{i}\epsilon_{i}$$
$$!$$
$$=$$
$$G$$
$$X$$
$$g=1$$
$$X$$
$$i\in g$$
$X_{i}X'$
$i$
$!!-1 G$
$X$
$g=1$
$X$
$i\in g$
$X_{i}\epsilon_{i}$
$!!$
Denoting $R_{g}= P$
$i\in g X^{i}\epsilon^{i}$, apply CLT at the cluster level:
$1$
$\sqrt$
$G$
$G$
$X$
$g=1$
$R_{g}$
$$^{D}\to N (0, V) ,$$
$V \equiv$ Var $[R_{g}]$
Plug in sample analogs, provided $G$ is large (not enough to have large $N$!):
$\hat{V} =$
$1$
$G$
$X$
$i$
$X_{i}X'$
$i$
$!-1$
$\cdot$
$1$
$G$
$$X$$
$$g$$
$$X$$
$$i\in g$$
$$X_{i}\hat{\epsilon}_{i}$$
$$! X$$
$$i\in g$$
$X_{i}\hat{\epsilon}_{i}$
$!'!$
$\cdot$
$1$
$G$
$X$
$i$
$X_{i}X'$
$i$
$!-1$
and set $SE(\hat{\beta}_{k}) =$
$q$
$\hat{V}_{kk}/G$

#### p. 51 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Rewrite the estimator as

$$\hat{\beta} - \beta_{OLS} = \left(\sum_{i} X_i' X_i\right)^{-1} \left(\sum_{i} X_i \epsilon_i\right) = \left(\sum_{g=1}^G \left(\sum_{i \in g} X_i\right)\right)^{-1} \left(\sum_{g=1}^G \sum_{i \in g} X_i \epsilon_i\right)$$

Denoting $R_g = \sum_{i \in g} X_i \epsilon_i$, apply CLT at the cluster level:

$$\frac{1}{\sqrt{G}} \sum_{g=1}^G R_g \overset{d}{\rightarrow} N(0, V), \quad V \equiv Var[R_g]$$

Plug in sample analogs, provided $G$ is large (not enough to have large $N$!) :

$$\hat{V} = \left(\frac{1}{G} \sum_{i} X_i' X_i\right)^{-1} \cdot \left(\sum_{g=1}^G \left(\sum_{i \in g} X_i\right) \left(\sum_{i \in g} X_i'\right)\right) \cdot \left(\frac{1}{G} \sum_{i} X_i' X_i\right)^{-1}$$

and set $SE(\hat{\beta}) = \sqrt{V_{kk}/G}$

### p. 52 — Derivation #2

Sandwich meat satisfies
Var
$"X$
$i$
$X_{i}\epsilon_{i}$
$#$
$=$
$$X$$
$$i,j$$
Cov $[X_{i}\epsilon_{i}, X_{j}\epsilon_{j}] =$
$X$
$$i,j:$$
$g(i)=g(j)$
Cov $[X_{i}\epsilon_{i}, X_{j}\epsilon_{j}]$
which can be estimated by
$X$
$i,j:$
$g(i)=g(j)$
$$X_{i}\hat{\epsilon}_{i}X'$$
$$_{j}\hat{\epsilon}_{j}=$$
$$X$$
$$g$$
$$X$$
$$i\in g$$
$$X_{i}\hat{\epsilon}_{i}$$
$! X$
$j\in g$
$X_{j}\hat{\epsilon}_{j}$
$!'$

#### p. 52 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Sandwich meat satisfies

$$Var\left[\sum X_{i\epsilon i}\right] = \sum Cov[X_{i\epsilon i}, X_{j\epsilon j}]$$

$$= \sum_{i,j: g(i)=g(j)} Cov[X_{i\epsilon i}, X_{j\epsilon j}]$$

which can be estimated by

$$\sum_{i,j: g(i)=g(j)} X_{i\epsilon i}X_{j\epsilon j} = \sum_g \left(\sum_{i\epsilon g} X_{i\epsilon i}\right) \left(\sum_{j\epsilon g} X_{j\epsilon j}\right)'$$

46

### p. 53 — More on clustering

DoF correction is more of an art. Stata uses
$$G$$
$$G-1 \cdot$$
$N-1$
$N-$ dim $(X)$
Having many clusters is important. In the extreme of $G = 1$,
$X$
$i,j$
$X_{i}\hat{\epsilon}_{i}X'$
$$_{j}\hat{\epsilon}_{j}=$$
$$X$$
$$i$$
$$X_{i}\hat{\epsilon}_{i}$$
$$! X$$
$j$
$X_{j}\hat{\epsilon}_{j}$
$!'$
$= 0$
(and so $SE = 0$) which obviously does not approximate Var $[P$
$i X^{i}\epsilon^{i}]$ well
- And
$1$
$\sqrt$
$N$
$P$
$i X^{i}\epsilon^{i}$ may not even converge if all observations are strongly correlated
With few clusters, see guide by MacKinnon et al. (2023); with few treated clusters,
see Alvarez et al. (2025)

#### p. 53 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- DoF correction is more of an art. Stata uses $\frac{G}{G-1} \cdot \frac{N-1}{N - dim(X)}$

- Having many clusters is important. In the extreme of $G = 1$,
  $$ \sum_{i} X_i \hat{\epsilon}_i X_j \hat{\epsilon}_j = \left( \sum_i X_i \right) \left( \sum_j X_j \right) = 0 $$
  (and so $SE = 0$) which obviously does not approximate $Var[\sum_i X_i \hat{\epsilon}_i]$ well
  - And $\sqrt{N} \sum_i X_i \hat{\epsilon}_i$ may not even converge if all observations are strongly correlated

- With few clusters, see guide by MacKinnon et al. (2023); with few treated clusters, see Alvarez et al. (2025)

### p. 54 — At what level to cluster?

With individual-level data, when should you cluster by village? state? not at all?
General principle: if you believe $\mathbb{E}$
$$X_{i}\epsilon_{i}\epsilon_{j}X'$$
$$j$$
$= 0$ for $g(i)\neq  g(j)$, it’s enough to
cluster by $g$
If treatment assignment is independent across $g$, enough to cluster by $g$
- If $\mathbb{E}$
$h$
$\tilde{X}_{i}\tilde{X}_{j}\mid \epsilon$
$i$
$= 0$ for $g(i)\neq  g(j)$ where $\tilde{X}$ are residuals on the intercept and (at
most a small number of) included covariates,
$\mathbb{E}$
$h$
$\tilde{X}_{i}\epsilon_{i}\epsilon_{j}\tilde{X}'$
$j$
$i$
$$=\mathbb{E}$$
$$h$$
$$\mathbb{E}$$
$$h$$
$$\tilde{X}_{i}\tilde{X}$$
$$'$$
$$j \mid \epsilon^{i}, \epsilon^{j}$$
$$ii$$
$= 0,$
for $g(i)\neq  g(j)$
even if $\epsilon$ have correlations across clusters
If $\mathbb{E} [\epsilon_{i}\epsilon_{j}\mid$  X $] = 0$ for $g(i)\neq  g(j)$, enough to cluster by $g$ even if $X_{i}$ is correlated
across clusters

#### p. 54 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

With individual-level data, when should you cluster by village? state? not at all?

- General principle: if you believe $E[X_{i}X_{j} | \epsilon_{i} \epsilon_{j}] = 0$ for $g(i) \neq g(j)$, it’s enough to cluster by $g$

- If treatment assignment is independent across $g$, enough to cluster by $g$

  - If $E[X_{i}X_{j} | \epsilon_{i}] = 0$ for $g(i) \neq g(j)$ where $X$ are residuals on the intercept and (at most a small number of) included covariates,

    $$E[X_{i}X_{j}] = E[E[X_{i}X_{j} | \epsilon_{i} \epsilon_{j}]] = 0,$$ for $g(i) \neq g(j)$

    even if $\epsilon$ have correlations across clusters

- If $E[\epsilon_{i} \epsilon_{j} | X] = 0$ for $g(i) \neq g(j)$, enough to cluster by $g$ even if $X_{i}$ is correlated across clusters

48

### p. 55 — At what level to cluster? (2)

If you are not sure, picking larger (“more conservative”) clusters relaxes the
clustering assumption
- Note: overclustering does not necessarily increase SE
- E.g. if clustering by county is correct, clustering by state will give very similar SE: both approximate the true variance
But avoid too large/few clusters which makes SE downward biased

### p. 56 — Exercises

1. In a sample of twin siblings, you do a pair-randomization experiment, treating
exactly one of each twins
- Do you have to cluster SE in an individual-level regression of the outcome on the treatment?
- Is it worth clustering by city in which they live if unobserved city factors can affect all residents?
2. To trace the demand curve for strawberries, you randomize prices across stores into
50 distinct values: \$1.10, 1.20, ..., 6.00 per pound
- $Y_{i}$= quantity sold in a week, $X_{i}$= 50 price dummies
- Should you cluster SE by the price level?

### p. 57 — Regressions with pair fixed effects: It’s complicated

(De Chaisemartin and Ramirez-Cuellar, 2024, Fig. 1B)
PCVE = Randomization pair-clustered; UCVE = Randomization unit-clustered

#### p. 57 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Flowchart showing decision process for regressions with pair fixed effects]

(De Chaise martin and Ramirez-Cuellar, 2024, Fig. 1B)

PCVE = Randomization pair-clustered; UCVE = Randomization unit-clustered

### p. 58 — Multi-way clustering

Assume each unit belongs to group $g(i) \in \{1, \ldots , G\}$ and also to non-nested group
$h(i) \in \{1, \ldots , H\}$
- E.g. workers $i$ belong to state $g(i)$ and industry $h(i)$
- Or bilateral trade flows: $i = (g, h)$ corresponds to exporter $g(i)$ and importer $h(i)$
Two-way (a.k.a. double) clustering assumption $(cf.$ Cameron $et al. (2011))$:
$\mathbb{E}$
$X_{i}\epsilon_{i}\epsilon_{j}X'$
$j$
$= 0$
unless $g(i) = g(j)$ or $h(i) = h(j),$ or both
- Allows correlation of $X_{i}\epsilon_{i}$ between unit pairs that share at least one cluster

#### p. 58 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Assume each unit belongs to group $g(i) \in \{1, ..., G\}$ and also to non-nested group $h(i) \in \{1, ..., H\}$

  -  E.g. workers $i$ belong to state $g(i)$ and industry $h(i)$

  -  Or bilateral trade flows: $i = (g, h)$ corresponds to exporter $g(i)$ and importer $h(i)$

- Two-way (a.k.a. double) clustering assumption ($cf.$ Cameron et al. (2011)):

  $$E[X_{i \in I} X_{j \in I}] = 0 \text{ unless } g(i) = g(j) \text{ or } h(i) = h(j), \text{ or both}$$

- Allows correlation of $X_{i \in I}$ between pairs that share at least one cluster

52

### p. 59 — Multi-way clustering (2)

Variance estimator: for $G, H \to \infty$ ,
$d$
Var $(\hat{\beta} ) = ($ X $'$ X $)$
$-1 \Omega ($ X $_{'}$ X $)$
$$-1 ,$$
$$\Omega =$$
$$N$$
$$X$$
$$i,j=1$$
$$X_{i}\hat{\epsilon}_{i}\hat{\epsilon}_{j}X'$$
$j \cdot 1 [g(i) = g(j)$ or $h(i) = h(j)]$
with $\mathbb{E}$
$X_{i}\epsilon_{i}\epsilon_{j}X'$
$j$
$= 0$ plugged in for pairs that do not share any cluster
Simple implementation:
$$\Omega = \Omega_{g} + \Omega_{h} -\Omega_{gh}$$
where $\Omega_{g}$ is $g$-clustered, $\Omega_{h}$ is $h$-clustered, and $\Omega_{gh}$ is clustered by $(g, h)$ pair

#### p. 59 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Variance estimator: for $G, H \rightarrow \infty$,

$$ \text{Var}(\beta) = (X X^{-1} \Omega (X X^{-1})^{-1} $$

$$ \Omega = \sum_{i,j=1}^N X_i \hat{e}_j X_j' \cdot 1 [g(i) = g(j) \text{ or } h(i) = h(j)] $$

with $E[X_{i \in g} X_j'] = 0$ plugged in for pairs that do not share any cluster

- Simple implementation:

$$ \Omega = \Omega_g + \Omega_h - \Omega_{gh} $$

where $\Omega_g$ is g-clustered, $\Omega_h$ is h-clustered, and $\Omega_{gh}$ is clustered by (g, h) pair

53

### p. 60 — Multi-way clustering (3)

Warning: do not confuse it with one-way clustering by $(g(i), h(i))$ pair:
$\Omega =$
$N$
$X$
$i,j=1$
$$X_{i}\hat{\epsilon}_{i}\hat{\epsilon}_{j}X'$$
$j \cdot 1 [g(i) = g(j)$ and $h(i) = h(j)]$
E.g. two-way clustering by state and by industry $\neq $ clustering by state-industry
- The former is more conservative than clustering by state; the latter is less conservative
- Avoid ambiguous “I cluster by state and industry”
Exercise: how would you cluster when units belong to counties, which belong to
states, and you think $X_{i}\epsilon_{i}$ are correlated within counties and within states?

#### p. 60 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Warning: do not confuse it with one-way clustering by $(g(i), h(i))$ pair:
$$ \Omega = \sum_{j=1}^{N} X_{i \epsilon j} X_{j \epsilon i} \cdot 1_{g(i) = g(j) \text{ and } h(i) = h(j)} $$
- E.g. two-way clustering by state and by industry $\neq$ clustering by state-industry
  - The former is more conservative than clustering by state; the latter is less conservative
  - Avoid ambiguous "I cluster by state and industry"
- Exercise: how would you cluster when units belong to counties, which belong to states, and you think $X_{i \epsilon j}$ are correlated within counties and within states?

### p. 61 — Spatially-clustered standard errors

Suppose units are located in space (e.g., villages)
- And we believe nearby units may have correlated $X_{i}\epsilon_{i}$
Clustering by geographic areas (e.g., states) would ignore correlations between
places across area borders
Spatially-clustered standard errors (Conley, 1999) use
$d$
Var
$X$
$i$
$X_{i}\epsilon_{i}$
$$!$$
$$=$$
$$X$$
$$i,j: d(i,j)<d_{max}$$
$$\kappa$$
$d(i, j)$
$d_{max}$
$\cdot X_{i}\hat{\epsilon}_{i}\hat{\epsilon}_{j}X'$
$j$
- $d(i, j)$ is geographic distance
- $d_{max}$ is the distance cutoff such that Cov $[X_{i}\epsilon_{i}, X_{j}\epsilon_{j}] = 0$ if $d(i, j) > d_{max}$
- $\kappa (\cdot )$ is a kernel function: e.g. uniform kernel $\kappa (x) = 1 [\mid x\mid \leq 1]$
$^{\star}$ Or Bartlett kernel: $\kappa (x) =$ max $\{1 -\mid x\mid , 0\}$

### p. 62 — Spatially-clustered standard errors: Notes

The structure of spatial correlation for units closer than $d_{max}$ is not restricted
- E.g. doesn’t have to be constant even if uniform kernel is used
$d_{max}$ should be small enough, such that $d_{ij}> d_{max}$ for most $i, j$ pairs
- Similar to having many clusters with cluster-robust SE
- If spatial correlation is too wide-ranging, see Conley and Kelly (2025) for other inference methods
The issue solved here is spatial correlation that biases SE
- Not spatial spillovers (i.e., nearby $X_{j}$ affects $Y_{i}$) that bias estimates

### p. 63 — References I

Alvarez, L., B. Ferman, and K. Wüthrich (2025): “Inference with few treated units,” arXiv
preprint.
Cameron, A. C., J. B. Gelbach, and D. L. Miller (2011): “Robust Inference With Multiway
Clustering,” Journal $of$ Business $&$ Economic Statistics, 29, 238–249.
Conley, T. G. (1999): “GMM estimation with cross sectional dependence,” Journal $of$
Econometrics, 92, 1–45.
Conley, T. G. and M. Kelly (2025): “The Standard Errors of Persistence,” Journal $of$
International Economics, 153, 104027.
De Chaisemartin, C. and J. Ramirez-Cuellar (2024): “At What Level Should One Cluster
Standard Errors in Paired and Small-Strata Experiments?” American Economic Journal: Applied
Economics, 16, 193–212.
Deryugina, T., G. Heutel, N. H. Miller, D. Molitor, and J. Reif (2019): “The Mortality
and Medical Costs of Air Pollution: Evidence from Changes in Wind Direction,” American Economic
Review, 109, 4178–4219.

### p. 64 — References II

Gelbach, J. B. (2016): “When Do Covariates Matter? And Which Ones, and How Much?” Journal
$of$ Labor Economics, 34, 509–543.
Imbens, G. W. (2010): “Better LATE Than Nothing: Some Comments on Deaton (2009) and
Heckman and Urzua (2009),” Journal $of$ Economic Literature, 48, 399–423.
——— (2020): “Potential Outcome and Directed Acyclic Graph Approaches to Causality: Relevance
for Empirical Practice in Economics,” Journal $of$ Economic Literature, 58, 1129–1179.
MacKinnon, J. G., M. O. Nielsen, and M. D. Webb (2023): “Cluster-robust inference: A
guide to empirical practice,” Journal $of$ Econometrics, 232, 272–299.

## Extraction Gaps

- p. 10: figure or diagram present
- p. 14: display math with drawn rules
- p. 16: display math with drawn rules; large delimiter (matrix or cases)
- p. 17: display math with drawn rules
- p. 19: display math with drawn rules
- p. 20: display math with drawn rules; large delimiter (matrix or cases)
- p. 21: display math with drawn rules; large delimiter (matrix or cases)
- p. 22: figure or diagram present
- p. 24: display math with drawn rules; large delimiter (matrix or cases)
- p. 25: display math with drawn rules
- p. 27: display math with drawn rules
- p. 28: display math with drawn rules
- p. 29: display math with drawn rules
- p. 30: display math with drawn rules
- p. 35: display math with drawn rules
- p. 36: display math with drawn rules
- p. 39: display math with drawn rules
- p. 40: display math with drawn rules
- p. 41: display math with drawn rules
- p. 42: display math with drawn rules
- p. 44: figure or diagram present
- p. 45: display math with drawn rules; large delimiter (matrix or cases)
- p. 46: display math with drawn rules; large delimiter (matrix or cases)
- p. 47: display math with drawn rules
- p. 49: display math with drawn rules; large delimiter (matrix or cases)
- p. 51: display math with drawn rules
- p. 52: display math with drawn rules
- p. 53: display math with drawn rules
- p. 54: display math with drawn rules; large delimiter (matrix or cases)
- p. 57: figure or diagram present
- p. 58: large delimiter (matrix or cases)
- p. 59: display math with drawn rules; large delimiter (matrix or cases)
- p. 60: display math with drawn rules
- p. 61: display math with drawn rules; large delimiter (matrix or cases); layout reconstruction withheld: it wrote math the page does not have
