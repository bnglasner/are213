# A2: Potential outcomes and RCTs Translation

## Source

- PDF: `literature/raw_pdf/A2_causality.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/A2_causality.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 47/47 pages, word recall 0.998, words not in the text layer 0.002.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part A: Regression and causality
- p. 2: (untitled)
- p. 3: Outline
- p. 4: (Neyman-)Rubin causal model
- p. 5: Rubin causal model (2)
- p. 6: Fundamental problem of causal inference
- p. 7: Good news
- p. 8: Weakly causal estimands
- p. 9: Most common causal estimands
- p. 10: When is “correlation” causal?
- p. 11: What an RCT does
- p. 12: External vs. internal validity
- p. 13: Connecting to linear models
- p. 14: RCT with ordered or continuous treatments
- p. 15: Outline
- p. 16: Distribution of gains
- p. 17: Identification
- p. 18: Other Parameters: Individual causal effects
- p. 19: Outline
- p. 20: What can be a cause/treatment?
- p. 21: Attributes as treatments
- p. 22: Poorly defined treatments
- p. 23: SUTVA (1): Poorly defined treatments
- p. 24: SUTVA (2): Interference
- p. 25: Effects of causes vs. causes of effects
- p. 26: Criticisms by Heckman and Vytlacil (2007)
- p. 27: Criticisms by Heckman and Vytlacil (2007) (cont.)
- p. 28: Roy model
- p. 29: Roy model: Identification
- p. 30: Another alternative: Directed acyclic graphs (DAGs)
- p. 31: Some limitations of DAGs
- p. 32: Outline
- p. 33: What’s special about RCTs
- p. 34: Complex RCTs
- p. 35: Identifying causal effects in complex RCTs
- p. 36: What’s special about RCTs
- p. 37: RCT with one subject
- p. 38: RCT with one subject (2)
- p. 39: RCT in a small sample: Randomization inference
- p. 40: RCT without randomization?
- p. 41: References I
- p. 42: References II
- p. 43: References III
- p. 44: Outline
- p. 45: Causality vs. prediction
- p. 46: Causality vs. prediction (2)
- p. 47: Policy-relevant prediction problems: Examples

## Comprehensive Translation

### p. 1 — Part A: Regression and causality

A2: Potential outcomes and RCTs
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2

#### p. 2 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Correlation
[Figure: Correlation, Causality, and a man riding on the roof of a truck]
Causality

### p. 3 — Outline

1
The basics: Potential outcomes, average causal effects, and RCTs
2
Other estimands
3
Conceptual issues with the potential outcome framework. Alternative frameworks
4
Complex RCTs
(Skipped) Causality or prediction?

### p. 4 — (Neyman-)Rubin causal model

Consider some population of units $i$
Each unit is observed one of several treatment conditions $D_{i}\in$ D
- E.g. D $\in \{0, 1\}$: untreated and treated
Suppose we can imagine each unit under all possible conditions
(in the same period)
- Causality always requires specifying alternatives
- Corresponding potential outcomes are $\{Y_{i}(d): d \in$ D $\}$
$^{\star}$ e.g. $(Y_{i}(0), Y_{i}(1))$ (equivalently written as $(Y_{0i}, Y_{1i})$)
$^{\star}$ e.g. demand function $Q_{i}(p)$
- Causal effects $Y_{i}(d ') -Y_{i}(d)$ are defined by this abstraction
- Writing $Y_{i}(d)$ encodes a possibility that $D_{i}$ impacts $Y_{i}$

### p. 5 — Rubin causal model (2)

Unobserved vars: $Y_{i}(0), Y_{i}(1)$ (or $\{Y_{i}(d): d \in$ D $\}$ in general)
Observed vars: treatment status $D_{i}$; realized outcome $Y_{i}$
Restriction:
$$Y_{i}=$$
$$\{$$
$$Y_{i}(0)$$
if $D_{i}= 0$
$$Y_{i}(1)$$
if $D_{i}= 1$
- Can write it as $Y_{i}= Y_{i}(0) + (Y_{i}(1) -Y_{i}(0)) \cdot D_{i}\equiv Y_{i}(0) + \tau_{i}D_{i}$ with
$$\tau_{i}= Y_{i}(1) -Y_{i}(0)$$ (causal effect)
- Or as $Y_{i}= Y_{i}(D_{i})$ in general
- (More restrictions will come from experimental design, theory/contextual knowledge, or out of the blue)

#### p. 5 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: cases._

- Unobserved vars: $Y_i(0)$, $Y_i(1)$ (or $\{Y_i(d): d \in D\}$ in general)
- Observed vars: treatment status $D_i$; realized outcome $Y_i$
- Restriction:
  $$
  Y_i =
  \begin{cases}
  Y_i(0) & \text{if } D_i = 0 \\
  Y_i(1) & \text{if } D_i = 1
  \end{cases}
  $$
- Can write it as $Y_i = Y_i(0) + (Y_i(1) - Y_i(0)) \cdot D_i \equiv Y_i(0) + \tau_i D_i$ with
  $\tau_i = Y_i(1) - Y_i(0)$ (causal effect)
- Or as $Y_i = Y_i(D_i)$ in general
- (More restrictions will come from experimental design, theory/contextual knowledge, or out of the blue)

[Figure: Rubin causal model (2)]

### p. 6 — Fundamental problem of causal inference

We cannot learn the causal effect $Y_{i}(1) -Y_{i}(0)$ for any particular unit without
strong assumptions
- “Fundamental problem of causal inference”: multiple potential outcomes are never observed at once
$i$
$D$
$Y$
$$Y(0)$$
$$Y(1)$$
$Y(1) -Y(0)$
1
1
$Y_{1}$
?
$$Y_{1}$$
?
2
0
$Y_{2}$
$$Y_{2}$$
?
?
3
0
$Y_{3}$
$$Y_{3}$$
?
?
...
$N$
1
$Y_{N}$
?
$$Y_{N}$$
?

#### p. 6 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: columns, with._

- We cannot learn the causal effect $Y_i(1) - Y_i(0)$ for any particular unit without strong assumptions

- "Fundamental problem of causal inference": multiple potential outcomes are never observed at once

[Figure: Table with columns D, Y, Y(0), Y(1), Y(1) - Y(0)]
| i | D | Y | Y(0) | Y(1) | Y(1) - Y(0) |
|---|---|---|---|---|---|
| 1 | 1 | $Y_1$ | ? | $Y_1$ | ? |
| 2 | 0 | $Y_2$ | $Y_2$ | ? | ? |
| 3 | 0 | $Y_3$ | $Y_3$ | ? | ? |
| N | 1 | $Y_N$ | ? | $Y_N$ | ? |

### p. 7 — Good news

... But we can sometimes learn some averages
E.g. Average structural function $d 7\to \mathbb{E} [Y_{i}(d)]$
- $\mathbb{E} [Y_{i}(0)]$: what if nobody was treated
- $\mathbb{E} [Y_{i}(1)]$: what if everyone was treated
Causal inference can be understood as a missing data problem:
- $Y_{i}(1)$ is observed for treated units $\Rightarrow$ we know $\mathbb{E} [Y_{i}(1) \mid D_{i}= 1] =\mathbb{E} [Y_{i}\mid D_{i}= 1]$
- ... but not for untreated units. We need to impute $\mathbb{E} [Y_{i}(1) \mid D_{i}= 0]$

### p. 8 — Weakly causal estimands

Averages of causal effects: $\mathbb{E} [\omega_{i} \cdot (Y_{i}(1) -Y_{i}(0))] /\mathbb{E} [\omega_{i}]$
for observed or unobserved weights $\omega_{i}$
- A weakly causal estimand when $\omega_{i}\geq 0$ for all $i$ (see Blandhol et al. (2025) for non-binary $D_{i}$)
- This precludes sign reversals: when $Y_{i}(1) \geq Y_{i}(0)$ for all $i$ but estimand $< 0$
- (See pset for an estimator that can produce a non-convex average of effects)

### p. 9 — Most common causal estimands

Average treatment/causal effect: ATE $=\mathbb{E} [Y_{i}(1) -Y_{i}(0)] =\mathbb{E} [Y_{i}(1)] -\mathbb{E} [Y_{i}(0)]$
- The effect of treating everyone relative to not treating anyone
- ATE is the same regardless of how $D_{i}$ is actually determined
Average effect on the treated: ATT $=\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid D_{i}= 1]$, a.k.a. TOT, TT
- ATT depends on how selection into treatment happened (e.g. RCT vs self-selection)
- The effect of treating those who were treated relative to not treating anyone:
$\mathbb{E} [Y_{i} -Y_{i}(0)] =\mathbb{E} [(Y_{i}(1) -Y_{i}(0)) \cdot D_{i}] =$ ATT $\cdot P(D_{i}= 1)$
Average effect on the untreated: ATU $=\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid D_{i}= 0]$

### p. 10 — When is “correlation” causal?

All these estimands follow from the distribution of $(Y(1), Y(0), D)$. But are they
identified from observed $(Y, D)$?
$\beta_{OLS}=\mathbb{E} [Y \mid D = 1] -\mathbb{E} [Y \mid D = 0]$
(Difference in means)
$$=\mathbb{E} [Y_{1}\mid D = 1] -\mathbb{E} [Y_{0}\mid D = 0]$$
$$=\mathbb{E} [Y_{1} -Y_{0}\mid D = 1]$$
(ATT)
$$+ (\mathbb{E} [Y_{0}\mid D = 1] -\mathbb{E} [Y_{0}\mid D = 0])$$
(Selection bias)
Selection bias = 0 and $\beta_{OLS}=$ ATT iff $Y_{0}$ is mean-independent of $D$:
$$\mathbb{E} [Y_{0}\mid D = 1] =\mathbb{E} [Y_{0}\mid D = 0] =\mathbb{E} [Y_{0}]$$
ATE $=$ ATT iff $(Y_{1} -Y_{0})$ is mean-independent of $D$:
$$\mathbb{E} [Y_{1} -Y_{0}\mid D = 1] =\mathbb{E} [Y_{1} -Y_{0}\mid D = 0] =\mathbb{E} [Y_{1} -Y_{0}]$$

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: betaols, between, contains, diagram, relationships, showing, slide, transcribed._

All these estimands follow from the distribution of (Y(1), Y(0), D). But are they identified from observed (Y, D)?

$$
\beta_{OLS} = E[Y | D = 1] - E[Y | D = 0]
$$
(Difference in means)
$$
= E[Y_1 | D = 1] - E[Y_0 | D = 0]
$$
$$
= E[Y_1 - Y_0 | D = 1]
$$
+
$$
E[Y_0 | D = 1] - E[Y_0 | D = 0]
$$
(ATT)
(Selection bias)

- Selection bias = 0 and $\beta_{OLS} = ATT$ iff $Y_0$ is mean-independent of D:
$$
E[Y_0 | D = 1] = E[Y_0 | D = 0] = E[Y_0]
$$

- ATE = ATT iff $(Y_1 - Y_0)$ is mean-independent of D:
$$
E[Y_1 - Y_0 | D = 1] = E[Y_1 - Y_0 | D = 0] = E[Y_1 - Y_0]
$$

9
[Figure: The slide contains a diagram showing the causal relationships between Y, D, Y1, Y0, ATT, ATE, and BetaOLS. The diagram is not transcribed.]

### p. 11 — What an RCT does

In a randomized control trial (RCT), $(Y_{0}, Y_{1}) \perp \perp D$ by design
- Both mean-independence assumptions follow
Consider two causal diagrams (“directed acyclic graphs”, DAGs):
RCT: $Y = y(D, \xi_{Y})$ for $\xi_{Y}\perp \perp D$
- Potential outcomes $Y(d) \equiv y(d, \xi_{Y}) \perp \perp D$
Observational data: $D = d(U, \xi_{D})$, $Y = y(D, U, \xi_{Y})$
- Potential outcomes $Y(d) \equiv y(d, U, \xi_{Y})\not \perp \perp D$ because of confounders $U$

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- In a randomized control trial (RCT), $(Y_0, Y_1) \perp D$ by design
  - Both mean-independence assumptions follow
- Consider two causal diagrams ("directed acyclic graphs", DAGs):
  [Figure: D -> y vs. U -> D -> y]
- RCT: $Y = y(D, \xi_y) \perp D$ for $\xi_y \perp D$
  - Potential outcomes $Y(d) \equiv y(d, \xi_y) \perp D$
- Observational data: $D = d(U, \xi_D)$, $Y = y(D, U, \xi_y)$
  - Potential outcomes $Y(d) \equiv y(d, U, \xi_y) \not\perp D$ because of confounders $U$

10

### p. 12 — External vs. internal validity

If you run an RCT on a selected subpopulation $P$, e.g. those who signed up to a
clinical trial, you’d get
$$\mathbb{E} [Y_{1} -Y_{0}\mid P]$$
This may not equal to ATE $=\mathbb{E} [Y_{1} -Y_{0}]$ in the full population — external
validity problem
But selection bias in observational studies is worse
- Even if this pill has no effect on anyone, can have
$\mathbb{E} [Y_{0}\mid D = 1] -\mathbb{E} [Y_{0}\mid D = 0]\neq  0$ — internal validity problem

#### p. 12 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- If you run an RCT on a selected subpopulation $P$, e.g. those who signed up to a clinical trial, you’d get

  $$E[Y_1 - Y_0 | P]$$

- This may not equal to $ATE = E[Y_1 - Y_0]$ in the full population — external validity problem

- But selection bias in observational studies is worse

  - - Even if this pill has no effect on anyone, can have

    $$E[Y_0 | D = 1] - E[Y_0 | D = 0] \neq 0$$ — internal validity problem

11

### p. 13 — Connecting to linear models

With a binary treatment,
$$Y_{i}= Y_{0i} + (Y_{1i} -Y_{0i}) D_{i}= \beta_{0} + \tau_{i}D_{i} + \epsilon_{i}$$
where $\beta_{0}=\mathbb{E} [Y_{0}]$, $\tau_{i}= Y_{1i} -Y_{0i}$ and $\epsilon_{i}= Y_{0i} -\mathbb{E} [Y_{0}]$
With homogeneous effects, $Y_{i}= \beta_{0} + \beta_{1}D_{i} + \epsilon_{i}$ becomes a causal model where
$Y_{1i} -Y_{0i}\equiv \beta_{1}$
- Regardless of whether $\epsilon_{i}\perp \perp D_{i}$(think IV). But if $D_{i}\perp \perp Y_{0i}$, OLS yields $\beta_{1}$
With heterogeneous effects, can rederive that OLS identifies ATE in RCTs: if
$(\epsilon_{i}, \tau_{i}) \perp \perp D_{i}$ and denoting $\mu =\mathbb{E} [D_{i}]$,
$\beta_{OLS}= \mathbb{E} [(D^{i} -\mu ) Y^{i}]$
Var $[D_{i}]$
$=$ Cov $[D^{i}, \epsilon^{i}]$
Var $[D_{i}]$
$+ \mathbb{E} [D^{i} (D^{i} -\mu^{i}) \beta^{1i}]$
Var $[D_{i}]$
$=\mathbb{E} [\beta_{i}] \equiv$ ATE

#### p. 13 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- With a binary treatment,
  $$Y_{it} = Y_{0i} + (Y_{1i} - Y_{0i}) D_{it} = \beta_0 + \tau_{it} D_{it} + \epsilon_{it}$$
  where $\beta_0 = E[Y_0]$, $\tau_{it} = Y_{1i} - Y_{0i}$ and $\epsilon_{it} = Y_{0i} - E[Y_0]$
- With homogeneous effects, $Y_{it} = \beta_0 + \beta_1 D_{it} + \epsilon_{it}$ becomes a causal model where $Y_{1i} - Y_{0i} \equiv \beta_1$
  - Regardless of whether $\epsilon_{it} \perp D_{it}$ (think IV). But if $D_{it} \perp Y_{0i}$, OLS yields $\beta_1$
- With heterogeneous effects, can rederive that OLS identifies ATE in RCTs: if $(\epsilon_{it}, \tau_{it}) \perp D_{it}$ and denoting $\mu = E[D_i]$,
  $$\beta_{OLS} = \frac{E[(D_i - \mu) Y_{it}]}{\text{Var}[D_i]} = \frac{\text{Cov}[D_i, \epsilon_{it}]}{\text{Var}[D_i]} + \frac{E[(D_i - \mu) \beta_1 i]}{\text{Var}[D_i]} = E[\beta_i] = ATE$$

### p. 14 — RCT with ordered or continuous treatments

Consider a RCT where $D$ takes more than two values (e.g. different dosages)
$D \perp \perp \{Y(d)\}_{d\inD}$=$\Rightarrow \mathbb{E} [Y \mid D = d] =\mathbb{E} [Y(d) \mid D = d] =\mathbb{E} [Y(d)]$
A saturated regression of $Y$ on dummies for all values of $D$ (or a nonparametric
regression with continuous $D$) traces the average structural function $\mathbb{E} [Y(d)]$
A simple regression of $Y$ on $D$ identifies a convexly-weighted average of
$\partial \mathbb{E} [Y(d)] /\partial d$ (or its discrete version):
$\beta_{OLS}=$
$\int \infty$
$-\infty$
$\omega (\tilde{d})$
$\partial \mathbb{E}$
$[$
$$Y(\tilde{d})$$
$$]$$
$$\partial \tilde{d}$$
d $\tilde{d},$
$$\omega (\tilde{d}) =$$
Cov
$[$
$1$
$[$
$D \geq \tilde{d}$
$]$
$, D$
$]$
Var $[D]$
or $\beta_{OLS}=$
$K$
$\sum$
$k=1$
$\omega_{k}$
$$\mathbb{E} [Y(d_{k}) -Y(d_{k-1})]$$
$$d_{k} -d_{k-1}$$
$$,$$
$\omega_{k}= (d^{k} -d^{k-1})$ Cov $[1 [D \geq d^{k}] , D]$
Var $[D]$

#### p. 14 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Consider a RCT where $D$ takes more than two values (e.g. different dosages)

- $D \in \{ (Y_d) | d \in D \} \implies E[Y | D = d] = E[Y(d) | D = d] = E[Y(d)]$
- A saturated regression of $Y$ on dummies for all values of $D$ (or a nonparametric regression with continuous $D$) traces the average structural function $E[Y(d)]$
- A simple regression of $Y$ on $D$ identifies a convexly-weighted average of $\partial E[Y(d)] / \partial d$ (or its discrete version):

$$ \beta_{OLS} = \int_{-\infty}^{\infty} \frac{\partial E[Y(d)]}{\partial d} dd $$

or

$$ \beta_{OLS} = \sum_{k=1}^{K} \omega_k \frac{E[Y(d_k)] - Y(d_{k-1})}{d_k - d_{k-1}} $$

$$ \omega(d) = \frac{Cov[1[D \geq d], D]}{\Var[D]} $$

$$ \omega_k = \frac{(d_k - d_{k-1}) Cov[1[D \geq d_k], D]}{\Var[D]} $$

### p. 15 — Outline

1
The basics: Potential outcomes, average causal effects, and RCTs
2
Other estimands
3
Conceptual issues with the potential outcome framework. Alternative frameworks
4
Complex RCTs
(Skipped) Causality or prediction?

### p. 16 — Distribution of gains

Some other interesting parameters (cf. Heckman et al. (1999)):
1. How widely are the gains distributed?
a. The proportion of people taking the program who benefit from it: $P(Y_{1}> Y_{0})$
b. Median gains: Med $(Y_{1} -Y_{0})$
2. Does the program help the lower tail?
a. Distribution of gains by untreated value: e.g. $\mathbb{E} [Y_{1} -Y_{0}\mid Y_{0}= \bar{y}]$
b. Increase in % above a threshold due to a policy: $P(Y_{1}> \bar{y}) -P(Y_{0}> \bar{y})$

### p. 17 — Identification

Does an RCT identify these other parameters, e.g. median gains?
Not without extra restrictions!
E.g. imagine an RCT where $Y$ takes values 0, 1, 2 with equal prob. in both treated
and control groups
This is consistent with $(Y_{0}, Y_{1})$ taking values $(0, 0) , (1, 1) , (2, 2)$ with equal prob.
- No casual effect for anyone. Median gain = 0
Or with $(Y_{0}, Y_{1})$ taking values $(0, 1) , (1, 2) , (2, 0)$ with equal prob.
- Median gain = 1
Exception: $P(Y_{1}> \bar{y}) -P(Y_{0}> \bar{y})$ is identified $—$ how?

### p. 18 — Other Parameters: Individual causal effects

What if we want to identify $Y_{i}(0), Y_{i}(1),$ and $\tau_{i}$ for each $i$?
- Possible under very strong effect homogeneity restrictions
- E.g. if $\tau_{i}\equiv \beta$ , we can learn $\beta$ from an RCT (or relax to $\tau_{i}= \beta (X_{i})$)
- Then $Y_{i}(0) = Y_{i} -\tau_{i}$ for treated, $Y_{i}(1) = Y_{i} + \tau_{i}$ for untreated
International trade: the effect of NAFTA on wages in Mexico
Industrial organization: the effect of a merger between Northwest and Republic
Airlines on fares from Minneapolis
Berry and Haile (2021): $“Suppose a$ researcher $is$ able $to$ randomly assign price vectors.
$It$ may $be$ natural $to$ imagine that identification $of$ demand would $be$ trivial $in$ this case.
$It is$ not. The observed variation $in$ quantities will reveal certain averages $of$ demand
responses. But such averages are $of$ very limited value, $as$ they $do$ not reveal any
elasticity $of$ demand $—$ not $at$ the observed prices $or$ any other known $point”$ (abridged)

### p. 19 — Outline

1
The basics: Potential outcomes, average causal effects, and RCTs
2
Other estimands
3
Conceptual issues with the potential outcome framework. Alternative frameworks
4
Complex RCTs
(Skipped) Causality or prediction?

### p. 20 — What can be a cause/treatment?

Is it meaningful to say $“She$ did not get this position because she $is a woman”$
(example from Imbens (2020))?

#### p. 20 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Is it meaningful to say "She did not get this position because she is a woman" (example from Imbens (2020))?

Solomon Kurz
@SolomonKurz
...

What’s the word, #causaltwitter?

It’s ___ to use the potential outcomes framework to make causal inferences with respect to background variables like sex and ethnicity.

Give me all your hot takes in the comments.

okay 45.3%
not okay 54.7%

349 votes · Final results
8:43 AM · Feb 6, 2024 · 19.8K Views

[Figure: okay 45.3%, not okay 54.7%]

17

### p. 21 — Attributes as treatments

Imagining each unit under all possible conditions is non-trivial:
$“No$ causation without [imagining] $manipulation”$ (Holland & Rubin)
$“She$ did not get this position because she $is a woman”$ [?]
- Gender is an attribute, not a cause; same for race
$“She$ got $an$ orchestra job because $of a$ gender-blind $audition”$ [?]
(cf. Goldin and Rouse (2000))
- Resume studies (e.g., Bertrand and Mullainathan (2004)) similarly manipulate perceived gender

#### p. 21 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Imagining each unit under all possible conditions is non-trivial:

“No causation without [imagining] manipulation” (Holland & Rubin)

- “She did not get this position because she is a woman” ❌
  - Gender is an attribute, not a cause; same for race
- “She got an orchestra job because of a gender-blind audition” ✅
  - (cf. Goldin and Rouse (2000))
  - Resume studies (e.g., Bertrand and Mullainathan (2004)) similarly manipulate perceived gender

18

### p. 22 — Poorly defined treatments

$“Attending$ college increases average earnings $by $ X”$ — what does $ Y_{i}(1)$ mean?
How could you force someone to attend college?
- Not realistic $\Rightarrow$ less useful or even (in the strict sense) ill-defined
- Meaningful causal effects are tightly linked to policy relevance
And which college?
- A matter of defining $Y_{i}(1)$, not heterogeneous effects
- $“Attending a 4-year$ public $university”$ or $“Attending$ college $of$ the $person’s choice”$ would be better

### p. 23 — SUTVA (1): Poorly defined treatments

This is a violation of SUTVA (“stable unit treatment value assumption”)
- $D$ should summarize everything outcome-relevant about the intervention
- Defining treatment variables is imposing a causal model. Don’t take it lightly!
Note: Perhaps it’s easier to imagine forcing people out of the college they attended
- So $Y_{i}(0)$ and ATT are more well-defined
Note 2: current practice seems more permissive
- E.g. Orefice et al. (2025) study causal effects of migrant diversity, measured as Herfindahl index of migrant origins
- This measure can’t be manipulated without changing anything else

### p. 24 — SUTVA (2): Interference

More common meaning of SUTVA: no unmodeled interference
- I.e., treatment statuses of other units $d_{-i}$ do not affect $Y_{i}$
- Frequently violated: e.g. vaccines and infectious disease; information and technology adoption; equilibrium effects via prices
Allowing for interference, we could start from a different model: $Y_{i}(d_{1}, \ldots , d_{N})$ for
the population of size $N$
- We may be interested in own-treatment effects $Y_{i}(d '$
$i , d^{-i}) -Y^{i}(d^{i}, d^{-i})$ and various
spillover effects, e.g. $Y_{i}(d_{i}, 1, \ldots , 1) -Y_{i}(d_{i}, 0, \ldots , 0)$
- No interference is an exclusion restriction: $Y_{i}(d_{i}, d_{-i}) = Y_{i}(d_{i}, d '$
$_{-i}) \equiv Y_{i}(d_{i})$,
$\forall d_{i}, d_{-i}, d '$
$-i$
Intermediate model: $Y_{i}(-\to d_{i})$ for exposure mapping $-\to d_{i}= (d_{i}, \sum$
$k\in Friends(i) d^{k})$

### p. 25 — Effects of causes vs. causes of effects

Statistical analysis focuses on effects of causes (treatments) rather than causes of
effects (outcomes)
Causes are not clearly defined
Holland (1986, p.959)
But asking questions about causes is helpful: observing an anomaly in the data
motivates us to ask statistical questions about effects (Gelman and Imbens, 2013)

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Statistical analysis focuses on effects of causes (treatments) rather than causes of effects (outcomes)

-  Causes are not clearly defined

   For example, do bacteria cause disease? Well, yes . . . until we dig deeper and find that it is the toxins the bacteria produce that really cause the disease; and this is really not it either. Certain chemical reactions are the real causes . . . and so on, ad infinitum.

   Holland (1986, p.959)

-  But asking questions about causes is helpful: observing an anomaly in the data motivates us to ask statistical questions about effects (Gelman and Imbens, 2013)

22

### p. 26 — Criticisms by Heckman and Vytlacil (2007)

1. Estimated effects cannot be transferred to new environments (limited external
validity) and to new programs never previously implemented
- Interventions are black boxes, with little attempt to unbundle their components
- Mechanisms are not possible to pin down
- Knowledge does not cumulate across studies (contrast with estimates of a labor supply elasticity — a structural parameter)
$^{\star}$ Counterpoint from Angrist and Pischke (2010): $“Empirical$ evidence $on$ any given
causal effect $is$ always local, derived from $a$ particular time, place, and research
design. Invocation $of a$ superficially general structural framework does not make the
underlying variation more representative. Economic theory often suggests general
principles, but extrapolation $to$ new settings $is$ always speculative. $A$ constructive
response $to$ the specificity $of a$ given research design $is to$ look for more evidence, $so$
that $a$ more general picture begins $to emerge.”$

### p. 27 — Criticisms by Heckman and Vytlacil (2007) (cont.)

2. Estimands need not be relevant even to analyze the observed policy
- Informative on whether to throw out the program entirely (ATT) and whether to extend it forcing it on everyone not covered yet (ATU)
- But not whether to extend/shrink it on the margin (Heckman et al. (1999), Sec.3.4)
- Or a policy change that affects the assignment mechanism, e.g. available options
- No analysis from the social planner’s point of view, e.g. accounting for externalities
- No analysis of causal parameters other than means, e.g. median gains
Optional exercise: read Heckman-Vytlacil’s Sec. 4.4. Do you agree with
everything?

### p. 28 — Roy model

Alternative “structural” approach: to model self-selection explicitly
Original Roy (1951) model: self-selection based on outcome comparison
- $D$ = choice of occupation (e.g. agriculture vs not) or education level
- $Y(d)$ = earnings for a given occupation/education
- People vary by occupational productivities/returns to education, known to them
- They choose based on them: $D =$ arg max $_{d\inD} Y_{i}(d)$, perhaps with homogeneous costs $C(d)$
Extended Roy model: costs are heterogeneous but fully determined by observables
- which may or may not affect the outcome at the same time
Generalized Roy model: self-selection based on unobserved preferences
- $D =$ arg max $_{d\inD} R_{i}(d)$ where e.g. $R_{i}(d) = Y_{i}(d) -C_{i}(d)$ for costs $C_{i}(d)$

### p. 29 — Roy model: Identification

What does this structure buy us?
No free lunch: $“for$ general skill distributions [i.e., without parametric restrictions]$,$
the [original Roy] model $is$ not identified [from a single cross-section] and has $no$
empirical $content”$ (Heckman and Honore, 1990)
But with more data and restrictions can identify the ATE and even the distribution
of $(Y_{0}, Y_{1}, R_{1} -R_{0})$ =$\Rightarrow$ distribution of gains
Assumptions are often parametric: e.g. Heckman correction via normality of
potential outcomes
- Not living up to the goal of using economic theory for identification?
Can do better with cost shifters that shift selection but not outcomes
- Value over traditional IV methods is not so clear?

### p. 30 — Another alternative: Directed acyclic graphs (DAGs)

Directed acyclic graphs of Judea Pearl represent causal relationships graphically: e.g.
$X$ = soil treatment (fumigation)
$Y$ = crop yield
$Z_{1}$= eelworm population before the treatment
$Z_{2}$= eelworm population after the treatment
$Z_{3}$= eelworm population at the end of season
$Z_{0}$= eelworm population last season (unobserved)
$B$ = bird population (unobserved)
“Do-calculus” allows to verify whether the average total effect of $X$ on $Y$ is
identified from observing $(X, Y, Z_{1}, Z_{2}, Z_{3})$
Popular in epidemiology but not in economics. Why?

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: arrows, connecting, nodes, them, with._

Directed acyclic graphs of Judea Pearl represent causal relationships graphically: e.g.

[Figure: DAG with nodes X, Y, Z0, Z1, Z2, Z3, B and arrows connecting them]

X = soil treatment (fumigation)
Y = crop yield
Z<sub>1</sub> = eelworm population before the treatment
Z<sub>2</sub> = eelworm population after the treatment
Z<sub>3</sub> = eelworm population at the end of season
Z<sub>0</sub> = eelworm population last season (unobserved)
B = bird population (unobserved)

- “Do-calculus” allows to verify whether the average total effect of X on Y is identified from observing (X, Y, Z<sub>1</sub>, Z<sub>2</sub>, Z<sub>3</sub>)
- Popular in epidemiology but not in economics. Why?

### p. 31 — Some limitations of DAGs

Imbens (2020) lists some pitfalls of DAGs relative to potential outcomes:
1. Economists avoid complex models with many variables
2. Randomization and manipulability have no special value in DAGs
3. Too nonparametric:
a. Not possible to incorporate additional assumptions, such as continuity (important
in regression discontinuity designs)
b. Too much focus on identification, relative to estimation and inference
4. Difficult to model interference
5. Clunky to model simultaneity, e.g. demand and supply

### p. 32 — Outline

1
The basics: Potential outcomes, average causal effects, and RCTs
2
Other estimands
3
Conceptual issues with the potential outcome framework. Alternative frameworks
4
Complex RCTs
(Skipped) Causality or prediction?

### p. 33 — What’s special about RCTs

Simplest RCT with a binary treatment:
1. A large population of subjects
2. Treatment status is assigned by the researcher
3. Treatment status is assigned according to a known protocol
4. The protocol involves randomization
5. All units have the same probability of being assigned to the treatment group
6. Treatment status is assigned independently across units
Which of these is most important? Which can be relaxed?

### p. 34 — Complex RCTs

Abdulkadiroglu et al. (2017) study the effects of charter school attendance $D_{i}$ on grades
$Y_{i}$ in Denver (see also Borusyak and Hull (2021), Appx D.6)
Centralized assignment mechanism run by the city
Families submit preferences, they are processed by some algorithm that gives offers
The algorithm involves lotteries to tie breaks for oversubscribed schools
Lotteries can have knock on effects on other kids
Difference-in-means is no longer causal:
Treatment and control groups are not balanced on geography and other inputs

### p. 35 — Identifying causal effects in complex RCTs

Suppose the researcher has access to the algorithm and its inputs
- No self-selection is possible here
Running the algorithm many times, can measure the propensity score of each kid:
$p_{i}\equiv P(D_{i}= 1 \mid$  preferences of all families $),$
separately across $i$
- E.g. lower $p_{i}$ in more competitive areas
- Assume there is enough randomness so $0 < p_{i}< 1$
Adjusting for $p_{i}$ as a covariate is feasible and sufficient to get ATE and other causal
estimands
- Regression adjustment or reweighting (coming soon)
Note: RCT not run by the researcher; $p_{i}$ varies across $i$; $D_{i}$ can be interdependent
- Interdependence of $D_{i}$ affects efficiency and SE but doesn’t generate bias

### p. 36 — What’s special about RCTs

Simplest RCT with a binary treatment:
1. A large population of subjects
2. Treatment status is assigned by the researcher
3. Treatment status is assigned according to a known protocol
4. The protocol involves randomization
5. Unit are assigned to the treatment group with equal probabilities
6. Treatment status is assigned independently across units

#### p. 36 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Simplest RCT with a binary treatment:

- 1. A large population of subjects
- 2. Treatment status is assigned by the researcher
- 3. Treatment status is assigned according to a known protocol
- 4. The protocol involves randomization
- 5. Unit are assigned to the treatment group with equal probabilities
- 6. Treatment status is assigned independently across units
[Figure: 32]

### p. 37 — RCT with one subject

Can we learn something about causal effects if we have $N = 1$? Yes!
Randomize treatment with $P(D_{i}= 1) = p$
Estimate $\widehat{Y}_{i}(1) =$
$\{$
$Y_{i}/p,$
$$D_{i}= 1$$
$0,$
$$D_{i}= 0$$
This estimate is unbiased:
$\mathbb{E}$
$[$
$\widehat{Y}_{i}(1)$
$]$
$=\mathbb{E}$
$[$
$\widehat{Y}_{i}(1) \mid D_{i}= 1$
$$]$$
$$\cdot P(D_{i}= 1) +\mathbb{E}$$
$[$
$\widehat{Y}_{i}(1) \mid D_{i}= 0$
$]$
$\cdot P(D_{i}= 0)$
$= Y^{i}(1)$
$p$
$$\cdot p + 0 = Y_{i}(1)$$

#### p. 37 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: cases._

Can we learn something about causal effects if we have $N = 1$? Yes!

- Randomize treatment with $P(D_i = 1) = p$

- Estimate $Y_i(1) = \begin{cases}
Y_i/p, & D_i = 1 \\
0, & D_i = 0
\end{cases}$

- This estimate is unbiased:
$$E[Y_i(1)] = E[Y_i(1) | D_i = 1] \cdot P(D_i = 1) + E[Y_i(1) | D_i = 0] \cdot P(D_i = 0)$$
$$= Y_i(1) \cdot p + 0 = Y_i(1)$$
$$= \frac{Y_i(1)}{p} \cdot p = Y_i(1)$$

33

### p. 38 — RCT with one subject (2)

Similarly, $\widehat{Y}_{i}(0) =$
$\{$
$0,$
$$D_{i}= 1$$
$Y_{i}/(1 -p),$
$$D_{i}= 0$$
is unbiased for $Y_{i}(0)$
So $\hat{\tau}_{i}= \widehat{Y}_{i}(1) -\widehat{}$
$Y_{i}(0) =$
$\{$
$$Y_{i}/p,$$
$$D_{i}= 1$$
$$-Y_{i}/(1 -p),$$
$$D_{i}= 0$$
is unbiased for the causal effect
Of course, a single $\hat{\tau}_{i}$ is very noisy
- A real RCT essentially combines $\hat{\tau}_{i}$ across $i = 1, \ldots , N$ to consistently estimate ATE $=^{1}$
$N$
$\sum$
$i \tau^{i}$
- Different propensity scores are fine $\Rightarrow$ Horvitz-Thompson pscore adjustment

#### p. 38 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: cases._

- Similarly, $Y_i(0) = \begin{cases} 0, & D_i = 1 \\ Y_i/(1-p), & D_i = 0 \end{cases}$ is unbiased for $Y_i(0)$

- So $\tau_i = Y_i(1) - Y_i(0) = \begin{cases} Y_i/p, & D_i = 1 \\ -Y_i/(1-p), & D_i = 0 \end{cases}$ is unbiased for the causal effect

- Of course, a single $\tau_i$ is very noisy

  - A real RCT essentially combines $\tau_i$ across $i = 1, ..., N$ to consistently estimate
  - $ATE = \frac{1}{N} \sum_{i} \tau_i$

  - Different propensity scores are fine $\Rightarrow$ Horvitz-Thompson pscore adjustment

[Figure: RCT with one subject (2)]

### p. 39 — RCT in a small sample: Randomization inference

In a small sample, randomization inference yields exact tests for the sharp null
$\tau_{i}\equiv 0$ or any other constant effect, e.g. $\tau_{i}\equiv 3$
- No asymptotic approximation needed
Idea: $D_{i}$ and $Y_{i}$ are independent under the null but not under the alternative
- Random permutation $\{D^{*}$
$i \}$ is independent from $Y^{i}$ in both cases
- Reject $\tau_{i}\equiv 0$ if Cov $[D_{i}, Y_{i}]$ (or any other statistic of dependence) is in the tail of the distribution of Cov $[D^{*}$
$i , Y^{i}]$ over many permutations $\{D^{*}$
$i \}$
Collecting all effects that are not rejected (“test inversion”) gives a confidence
interval for the effect
- But only under constant effects

### p. 40 — RCT without randomization?

Bernoulli randomization: randomize treatment independently, e.g. with $p = 1/2$
More efficient: “complete randomization,” i.e. treat exactly $N/2$ units
$\Rightarrow$ Better not to randomize the number of treated units
Even more efficient: stratified randomization
- For each discrete strata $X_{i}= x$, treat exactly half units — ensures better balance
$\Rightarrow$ Better not to randomize the number of treated units per strata
Kasy (2016): with a continuous $X_{i}$, best not to randomize at all!
- Intuition: ordering units by $X_{i}$ and treated every other one ensures better balance
- It’s essentially by chance whether $i$ is even or odd on the list

### p. 41 — References I

Abdulkadiroglu, A., J. D. Angrist, Y. Narita, and P. A. Pathak (2017): “Research
Design Meets Market Design: Using Centralized Assignment for Impact Evaluation,” Econometrica,
85, 1373–1432.
Angrist, J. D. and J.-S. Pischke (2010): “The Credibility Revolution in Empirical Economics:
How Better Research Design is Taking the Con out of Econometrics,” Journal $of$ Economic
Perspectives, 24, 3–30.
Berry, S. T. and P. A. Haile (2021): Foundations $of$ demand estimation, vol. 4, Elsevier B.V.,
publication Title: Handbook of Industrial Organization Issue: 1 ISSN: 1573448X.
Bertrand, M. and S. Mullainathan (2004): “Are Emily and Greg more employable than
Lakisha and Jamal? A field experiment on labor market discrimination,” The American Economic
Review, 94, 991–1013.
Blandhol, C., J. Bonney, M. Mogstad, and A. Torgovitsky (2025): “When is TSLS
Actually LATE?” Working Paper.
Borusyak, K. and P. Hull (2021): “Non-Random Exposure to Exogenous Shocks: Theory and
Applications,” Mimeo.

### p. 42 — References II

Gelman, A. and G. Imbens (2013): “Why ask Why? Forward Causal Inference and Reverse Causal
Questions,” Tech. Rep. w19614, National Bureau of Economic Research, Cambridge, MA.
Goldin, C. and C. Rouse (2000): “Orchestrating Impartiality: The Impact of “Blind” Auditions on
Female Musicians,” American Economic Review, 90, 715–741.
Heckman, J. J. and B. E. Honore (1990): “The Empirical Content of the Roy Model,” .
Heckman, J. J., R. J. Lalonde, and J. A. Smith (1999): “The Economics and Econometrics of
Active Labor Market Programs,” in Handbook $of$ Labor Economics, Elsevier, vol. 3, 1865–2097.
Heckman, J. J. and E. J. Vytlacil (2007): “Chapter 70 Econometric Evaluation of Social
Programs, Part I: Causal Models, Structural Models and Econometric Policy Evaluation,” in
Handbook $of$ Econometrics, Elsevier, vol. 6, 4779–4874.
Holland, P. (1986): “Statistics and causal inference,” Journal $of$ the American Statistical
Association, 81, 945–960.
Imbens, G. W. (2020): “Potential Outcome and Directed Acyclic Graph Approaches to Causality:
Relevance for Empirical Practice in Economics,” Journal $of$ Economic Literature, 58, 1129–1179.

### p. 43 — References III

Kasy, M. (2016): “Why Experimenters Might Not Always Want to Randomize, and What They
Could Do Instead,” Political Analysis, 24, 324–339.
Orefice, G., H. Rapoport, and G. Santoni (2025): “How Do Immigrants Promote Exports?”
Journal $of$ Development Economics, 174, 103443.

### p. 44 — Outline

1
The basics: Potential outcomes, average causal effects, and RCTs
2
Other estimands
3
Conceptual issues with the potential outcome framework. Alternative frameworks
4
Complex RCTs
(Skipped) Causality or prediction?

### p. 45 — Causality vs. prediction

Economists obsess with causality but sometimes prediction is the relevant goal
The choice should be guided by the ultimate goal: decision making
Two scenarios (see Kleinberg et al., 2015):
1. The action/policy $D \in \{0, 1\}$ affects the outcome $Y$, and the payoff (i.e., utility) $\pi$
depends on $Y$
- E.g. $D$ = rain dance in a drought, $Y$ = it rains
$\pi (d) = aY(d) -bd$
=$\Rightarrow$
$\mathbb{E} [\pi (1) -\pi (0)] = a\mathbb{E} [Y(1) -Y(0)] -b$
- Optimal decision: $D = 1 [\mathbb{E} [Y(1) -Y(0)] \geq b/a]$
- This is a causal problem. Running an RCT is very helpful
- Better knowledge of heterogeneous causal effects $\mathbb{E} [Y(1) -Y(0) \mid X]$ based on observed covariates $X$ also yields better decisions $D(X)$

### p. 46 — Causality vs. prediction (2)

2. $Y$ is unaffected by $D$ but the marginal payoff of actions, $\partial \pi /\partial D$, depends on $Y$
- E.g. $D$ = take an umbrella, $Y$ = it rains
$\pi (d) = aY \cdot d -bd$
=$\Rightarrow$
$\mathbb{E} [\pi (1) -\pi (0)] = a\mathbb{E} [Y] -b$
- Optimal decision: $D = 1 [\mathbb{E} [Y] \geq b/a]$
- This is a prediction problem. Running an RCT is not helpful
- Better prediction $\mathbb{E} [Y \mid X]$ yields better decisions $D(X)$
Note: This scenario can also be recast as a causal problem:
- $D$ affects $\tilde{Y}(D) =$ you get wet $= Y \cdot (1 -D)$
- But we know potential outcome $\tilde{Y}(1) = 0$
- And we have data on $\tilde{Y}(0) = Y$ to make a prediction of $\tilde{Y}(1) -\tilde{Y}(0)$

### p. 47 — Policy-relevant prediction problems: Examples

1. Eliminating futile hip and knee replacement surgeries
- Surgery has costs: monetary + painful recovery
- Benefits depend on life expectancy
- Kleinberg et al. (2015) show 10% (1%) of patients have predictable probability of dying within a year of 24% (44%) for reasons unrelated to this surgery
2. Improving admissions by predicting college success
- Geiser and Santelices (2007) show that high-school GPA is a better predictor of performance at UC colleges than SAT
- If UC had to reduce admissions, rejecting applicants with marginal GPAs would result in losing fewer good students than rejecting marginal SAT applicants
3. See Kleinberg et al. “Human Decisions and Machine Predictions” (2018) for a
more subtle example on bail decisions by judges

## Extraction Gaps

- p. 2: figure or diagram present
- p. 5: display math with drawn rules
- p. 6: display math with drawn rules
- p. 10: display math with drawn rules
- p. 11: figure or diagram present
- p. 12: display math with drawn rules
- p. 13: display math with drawn rules
- p. 14: display math with drawn rules
- p. 20: figure or diagram present
- p. 21: undecodable glyph in text (shown as [?])
- p. 22: unbalanced $ in the text-layer lines
- p. 25: figure or diagram present
- p. 30: figure or diagram present
- p. 36: figure or diagram present
- p. 37: display math with drawn rules
- p. 38: display math with drawn rules
