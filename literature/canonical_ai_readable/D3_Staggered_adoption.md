# D3: Staggered-Adoption Difference-in-Differences Translation

## Source

- PDF: `literature/raw_pdf/D3_Staggered_adoption.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/D3_Staggered_adoption.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 50/50 pages, word recall 0.983, words not in the text layer 0.009.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part D: Panel Data Methods
- p. 2: D3 outline
- p. 3: Staggered adoption/rollout setting
- p. 4: An extra source of variation
- p. 5: Notation and assumptions
- p. 6: A note on modeling dynamics
- p. 7: Target estimands
- p. 8–10: More estimands of interest
- p. 11: Outline
- p. 12: Conventional practice
- p. 13: Static TWFE specification
- p. 14: Forbidden comparisons
- p. 15: Mechanics of negative weights
- p. 16: Characterizing negative weights
- p. 17–18: Under-identification of the fully-dynamic specification
- p. 19–21: Spurious identification of very long-run effects
- p. 22: Cross-horizon contamination
- p. 23: Outline
- p. 24: Plot treatment timing
- p. 25: Plot raw outcome data by cohort
- p. 26: Estimation robust to heterogeneous effects
- p. 27: Manual averaging estimators
- p. 28: Manual averaging estimators (2)
- p. 29: Manual averaging estimators (3)
- p. 30–31: Manual averaging: Pre-trend tests
- p. 32: Imputation estimators
- p. 33: Efficiency of imputation
- p. 34: Comparison to manual averaging
- p. 35: BJS: Standard errors
- p. 36: BJS: Standard errors (2)
- p. 37: BJS: Pre-trend and other falsifications tests
- p. 38: Estimators equivalent to imputation
- p. 39: Event study graphs from two groups of methods
- p. 40: Liu et al. (2022) pre-trend test and graph
- p. 41–42: Extended TWFE regression
- p. 43: Local projection DiD
- p. 44: Does heterogeneity-robust estimation matter?
- p. 45: BJS results
- p. 46: Chiu, Lan, Liu, and Xu (2023) are less convinced
- p. 47: Software packages
- p. 48: References I
- p. 49: References II
- p. 50: References III

## Comprehensive Translation

### p. 1 — Part D: Panel Data Methods

D3: Staggered-Adoption Difference-in-Differences
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — D3 outline

1
Staggered adoption: Setting and estimands
2
Traditional estimators
What to do instead

### p. 3 — Staggered adoption/rollout setting

$i = Z$
$$i = A$$
$$i = B$$
$i = C$
$i = D$
$t = 1$
$t = 2$
$t = 3$
$t = 4$
$t = 5$
$t = 6$
Assume binary treatment; $i$ gets treated at $t = E_{i}$ and stays treated forever:
$D_{it}= 1 [t \geq E_{i}]$
- “Cohort” = units with the same $E_{i}$
May or may not have never-treated units ($E_{D}= \infty$ ), always-treated units ($E_{Z}= 1$)
- Assume away always-treated that will mostly be useless

#### p. 3 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: along, assignment, cells, checkmarks, columns, contain, indicating, over, rows, runs, showing, time._

[Figure: Table showing treatment assignment over time for units Z, A, B, C, and D. Time runs along the rows (t=1 to t=6), and units are along the columns. Cells contain checkmarks indicating treatment.]

- Assume binary treatment; i gets treated at t = $E_i$, and stays treated forever:
  $D_{it} = 1$ [ $t \ge E_i$ ]
  - "Cohort" = units with the same $E_i$
- May or may not have never-treated units ($E_D = \infty$), always-treated units ($E_Z = 1$)
- Assume away always-treated that will mostly be useless

2

### p. 4 — An extra source of variation

In addition to treated vs. never-treated comparisons, we can now compare treated
vs. not-yet-treated
Sometimes researchers explicitly drop the never-treated group to focus on more
comparable units
- E.g. a panel of mothers, where $E_{i}$= year of birth of first child
- May drop women without kids, as they are not expected to be on parallel trends
Other times, researchers leverage both

### p. 5 — Notation and assumptions

Fixed sample $\Omega = \{it\}$ with untreated obs $\Omega_{0}$ and treated obs $\Omega_{1}$
- $\Omega_{0}$ includes never-treated and not-yet-treated $it$ pairs
Causal structure: $Y_{it}(D_{it})$ (no spillovers, no anticipation effects)
Causal effects: $\tau_{it}=\mathbb{E} [Y_{it}(1) -Y_{it}(0)]$, varying across $i, t$
Parallel trends: $\mathbb{E} [Y_{it}(0)] = \alpha_{i} + \beta_{t}$

### p. 6 — A note on modeling dynamics

We could have defined potential outcomes as $Y_{it}(\ldots , d_{t+2}, d_{t+1}, d_{t}, d_{t-1}, d_{t-2}, \ldots )$
With absorbing treatment, same as $Y_{it}(e)$ where $e$ is date first treated (or $\infty$ )
- No anticipation effects: $Y_{it}(e) = Y_{it}(e') \equiv Y_{it}(\infty )$ for $e, e'> t$
We will focus on ATT-type estimands based on $Y_{it}(E_{i}) -Y_{it}(\infty )$
$\Rightarrow$ Can simplify potential outcomes: $Y_{it}(1) \equiv Y_{it}(E_{i}) = Y_{it}$,
$Y_{it}(0) \equiv Y_{it}(\infty )$
- Interpret $\tau_{it}=\mathbb{E} [Y_{it}(1) -Y_{it}(0)]$ as reflecting, in part, dynamic effects

### p. 7 — Target estimands

Linear target estimand: $\sum$
$^{it\in\Omega}1 w^{it}\tau^{it}$ for $w^{it}$ chosen by researcher...
ATT:
$1$
$\mid \Omega_{1}\mid$
$\sum$
$^{it\in\Omega}1 \tau^{it}$, i.e. $w^{it}=$
$$1$$
$\mid \Omega_{1}\mid$ for all $it \in \Omega^{1}$
$$i = A$$
$$i = B$$
$$i = C$$
$i = D$
$t = 1$
$t = 2$
$t = 3$
$t = 4$
$t = 5$
$t = 6$
Note: this estimand is very sensitive to how many periods are observed when the
effects exhibit dynamics

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Linear target estimand: $\sum_{i \in \Omega_1} w_{it} \tau_{it}$ for $w_{it}$ chosen by researcher...
- ATT: $\frac{1}{\Omega_1} \sum_{i \in \Omega_1} \tau_{it}$, i.e. $w_{it} = \frac{1}{\Omega_1}$ for all $it \in \Omega_1$

|       | i = A | i = B | i = C | i = D |
|-------|-------|-------|-------|-------|
| t = 1 |       |       |       |       |
| t = 2 |       |       |       |       |
| t = 3 |       |       |       |       |
| t = 4 |       |       |       |       |
| t = 5 |       |       |       |       |
| t = 6 |       |       |       |       |

-  Note: this estimand is very sensitive to how many periods are observed when the effects exhibit dynamics.

[Figure: t=1, t=2, t=3, t=4, t=5, t=6, i=A, i=B, i=C, i=D]

### p. 8 — More estimands of interest

ATT
ATT $h \geq 0$ periods since treatment (typically fewer units for longer horizons)
$$i = A$$
$$i = B$$
$$i = C$$
$i = D$
$t = 1$
$t = 2$
$$h = 0$$
$t = 3$
$$h = 1$$
$$h = 0$$
$t = 4$
$$h = 2$$
$$h = 1$$
$t = 5$
$$h = 3$$
$$h = 2$$
$$h = 0$$
$t = 6$
$$h = 4$$
$$h = 3$$
$$h = 1$$

#### p. 8 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: columns, entries, rows, with._

- ATT
- ATT $h \geq 0$ periods since treatment (typically fewer units for longer horizons)

[Figure: Table with columns i=A, i=B, i=C, i=D and rows t=1, t=2, t=3, t=4, t=5, t=6. The table entries are h=0, h=0, h=1, h=0, h=2, h=0, h=3, h=1, h=4, h=3, h=1]
7

### p. 9 — More estimands of interest

ATT
ATT $h \geq 0$ periods since treatment
ATT $h \geq 0$ periods since treatment on a balanced set of units for different $h$
$$i = A$$
$$i = B$$
$$i = C$$
$i = D$
$t = 1$
$t = 2$
$$h = 0$$
$t = 3$
$$h = 1$$
$$h = 0$$
$t = 4$
$$h = 2$$
$$h = 1$$
$t = 5$
$$h = 3$$
$$h = 2$$
$$h = 0$$
$t = 6$
$$h = 4$$
$$h = 3$$
$$h = 1$$

#### p. 9 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- ATT
  - ATT $h \ge 0$ periods since treatment
- ATT $h \ge 0$ periods since treatment on a balanced set of units for different h

[Figure: t=1, t=2, t=3, t=4, t=5, t=6, i=A, i=B, i=C, i=D, h=0, h=1, h=2, h=3, h=4]

### p. 10 — More estimands of interest

ATT
ATT $h \geq 0$ periods since treatment
ATT $h \geq 0$ periods since treatment on a balanced set of units for different $h$
Difference of ATT across subgroups
Size-weighted ATT; etc.

### p. 11 — Outline

1
Staggered adoption: Setting and estimands
2
Traditional estimators
What to do instead

### p. 12 — Conventional practice

By analogy with non-staggered DiD, it used to be common to estimate:
Static TWFE specification — to get a single summary statistic of treatment effects:
$$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} + \tau_{static}D_{it} + \epsilon_{it}$$
Event study (dynamic) specification:
$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$
$$b-1$$
$$\sum$$
$$h=-a$$
$$h\neq -1$$
$\tau_{h}1 [t = E_{i} + h] + \tau_{b+}1 [t \geq E_{i} + b] + \epsilon_{it}$
- Some dummies are often binned or dropped on the left and/or on the right
- “Fully-dynamic” if $h = -1$ is the only omitted term
- “Semi-dynamic” if include all $h \geq 0$ terms and nothing else

#### p. 12 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

By analogy with non-staggered DID, it used to be common to estimate:

- Static TWFE specification – to get a single summary statistic of treatment effects:

$$Y_{it} = \alpha_i + \beta_t + \tau_{static}D_{it} + \epsilon_{it}$$

- Event study (dynamic) specification:

$$Y_{it} = \alpha_i + \beta_t + \sum_{h=-1}^{b-1} \tau_h 1[t = E_i + h] + \tau_b 1[t \geq E_i + b] + \epsilon_{it}$$

- Some dummies are often binned or dropped on the left and/or on the right
- “Fully-dynamic” if $h = -1$ is the only omitted term
- “Semi-dynamic” if include all $h \geq 0$ terms and nothing else

10

### p. 13 — Static TWFE specification

Does the static TWFE specification estimate the ATT?
$$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} + \tau_{static}D_{it} + \epsilon_{it}$$
de Chaisemartin and D’Haultfoeuille (AER 2020), Borusyak, Jaravel, and Spiess
(REStud 2024) (BJS):
- Yes if the effects are homogeneous across units and periods. Not otherwise!
- Under PTA, estimand $\tau_{static}= \sum$
$$^{it\in\Omega}1 w^{static}$$
$$it$$
$\tau_{it}$ for some weights $w^{static}$
$it$
that add up
to one
- But $w^{static}$
$it$
$=$
$1$
$\mid \Omega_{1}\mid$ and some can be negative due to “forbidden comparisons”...

#### p. 13 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: chaise, haultefeuille, martin, resstud._

- Does the static TWFE specification estimate the ATT?

$$Y_{it} = \alpha_i + \beta_t + \tau_{static}D_{it} + \epsilon_{it}$$

- de Chaise martin and D’Haultefeuille (AER 2020), Borusyak, Jaravel, and Spiess (RESStud 2024) (BJS):

  -  Yes if the effects are homogeneous across units and periods. Not otherwise!

  -  Under PTA, estimand $\tau_{static} = \sum_{i \in \Omega_1} w_{it}^{static} \tau_{it}$ for some weights $w_{it}^{static}$ that add up to one

  -  But $w_{it}^{static} \neq \frac{1}{\Omega_1}$ and some can be negative due to “forbidden comparisons"...

11

### p. 14 — Forbidden comparisons

$$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} + \tau_{static}D_{it} + \epsilon_{it}$$
$\mathbb{E} [Y_{it}]$
$$i = A$$
$i = B$
$t = 1$
$$\alpha_{A}$$
$\alpha_{B}$
$t = 2$
$$\alpha_{A} + \beta_{2} + \tau_{A2}$$
$\alpha_{B} + \beta_{2}$
$t = 3$
$$\alpha_{A} + \beta_{3} + \tau_{A3}$$
$\alpha_{B} + \beta_{3} + \tau_{B3}$
Here $\hat{\tau}_{static}=$
$($
$Y_{A2}-Y_{B2}$
$)$
$-^{1}$
$$2 (Y^{A1} -Y^{B1}) -^{1}$$
$$2$$
$$($$
$Y_{A3}-Y_{B3}$
$)$
Future periods are used as reference periods for treated observations of early
adopters
Long-term effects for early adopters can get a negative weight:
$\tau_{static}= \tau_{A2} +^{1}$
$_{2}\tau_{B3} -^{1}$
$_{2}\tau_{A3}$

#### p. 14 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: columns, rows, with._

$Y_{it} = \alpha_i + \beta_t + \tau_{static} D_{it} + \epsilon_{it}$

[Figure: Table with columns i=A, i=B and rows t=1, t=2, t=3]
|  | i = A | i = B |
|---|---|---|
| t = 1 | $\alpha_A$ | $\alpha_B$ |
| t = 2 | $\alpha_A + \beta_2 + \tau_{A2}$ | $\alpha_B + \beta_2$ |
| t = 3 | $\alpha_A + \beta_3 + \tau_{A3}$ | $\alpha_B + \beta_3 + \tau_{B3}$ |

Here $\hat{\tau}_{static} = (Y_{A2} - Y_{B2}) - \frac{1}{2} (Y_{A1} - Y_{B1}) - \frac{1}{2} (Y_{A3} - Y_{B3})$

-  Future periods are used as reference periods for treated observations of early adopters

-  Long-term effects for early adopters can get a negative weight:

$\tau_{static} = \tau_{A2} + \frac{1}{2} \tau_{B3} - \frac{1}{2} \tau_{A3}$

12

### p. 15 — Mechanics of negative weights

By Frisch–Waugh–Lovell, $\hat{\tau}_{static}$ can be obtained from
$Y_{it}= \tau_{static}\tilde{D}_{it} +$ error
where $\tilde{D}_{it}$ are residuals from regressing $D_{it}= a_{i} + b_{t} +$ error.
Thus, $\hat{\tau}_{static}=$
$\sum$
$it \tilde{D}^{it}Y^{it}$
$\sum$
$js \tilde{D}^{2}$
$js$ . Weights
$$\tilde{D}_{it}$$
$$\sum$$
$$js \tilde{D}^{2}$$
$js$ are easy to compute
But they can be negative for some treated observations: where $\hat{a}_{i}$ is high (early
adopters) and $\hat{b}_{t}$ is high (late periods if few never-treated units)
- Angrist (1998) result does not apply to TWFE!

#### p. 15 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: loveli._

- By Frisch-Waugh-LovelI, $\hat{\tau}_{static}$ can be obtained from
  $$Y_{it} = \tau_{static} \tilde{D}_{it} + error$$
  where $\tilde{D}_{it}$ are residuals from regressing $D_{it} = a_i + b_t + error$.

- Thus, $\hat{\tau}_{static} = \sum_{i,j} \frac{D_{it}Y_{it}}{\sum_{i,j} D_{is}^2} \frac{D_{it}}{\sum_{i,j} D_{is}^2}$. Weights $\frac{D_{it}}{\sum_{i,j} D_{is}^2}$ are easy to compute

- But they can be negative for some treated observations: where $a_i$ is high (early adopters) and $b_t$ is high (late periods if few never-treated units)

  - Angrist (1998) result does not apply to TWFE!

### p. 16 — Characterizing negative weights

You can compute $w^{static}$
$it$
(by observation or group totals) and total negative weights
Goodman-Bacon (2021) provides a decomposition of $\tau_{static}$ as convex weighted
average of several types of comparisons (package bacondecomp):
- Treated vs. never treated (good)
- Early adopters vs. late adopters (good)
- Late adopters vs. early adopters (forbidden)
- Treated during the sample vs. always-treated (forbidden)
Note: only useful if you plan to use the static TWFE specification

### p. 17 — Under-identification of the fully-dynamic specification

Fully-dynamic specification:
$$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$$
$$\sum$$
$$h\neq -1$$
$\tau_{h}1 [t = E_{i} + h] + \epsilon_{it}$
Proposition (BJS): Without never-treated units, the path $\{\tau_{h}\}_{h\neq -1}$ is not point
identified in the fully-dynamic specification. Adding any linear trend to this path,
$\{\tau_{h} + \kappa (h + 1)\}$, fits the data equally well
- This transformation corresponds to adding $\kappa (t -(E_{i} -1))$ to fitted values, which can be offset by changing unit and time FEs by $\kappa (E_{i} -1)$ and $-\kappa t$ resp.

### p. 18 — Under-identification of the fully-dynamic specification

-4
-2
0
2
4
Outcome Y
1
2
3
4
5
6
7
Calendar time t
Treated at t=2
Treated at t=4
(from BJS)
Diff-in-diff doesn’t work without some assumption of no anticipation effects!

#### p. 18 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: axis, blue, dashed, dotted, labeled, line, lines, mark, plotted, solid, vertical._

[Figure: Outcome Y vs. Calendar time t. Two lines are plotted: "Treated at t=2" (blue solid line) and "Treated at t=4" (red dashed line). Vertical dotted lines mark t=2 and t=4. The x-axis is labeled "Calendar time t". The y-axis is labeled "Outcome Y".]

- Diff-in-diff doesn't work without some assumption of no anticipation effects!

### p. 19 — Spurious identification of very long-run effects

Semi-dynamic specification can be estimated:
$$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$$
$$\sum$$
$$h\geq 0$$
$\tau_{h}1 [t = E_{i} + h] + \epsilon_{it}$
Proposition (BJS): Without never-treated units and with heterogeneous effects,
long-run effects ($h \geq$ max $_{i} E_{i} -$ min $_{i} E_{i}$) are not identified by PTA, while the
semi-dynamic specification produces some (heroic/spurious) estimates
$$\mathbb{E} [Y_{it}]$$
$$i = A$$
$$i = B$$
$$t = 1$$
$$t = 2$$
[?]
$$t = 3$$
[?]
[?]

#### p. 19 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Semi-dynamic specification can be estimated:
$$Y_{it} = \alpha_i + \beta_t + \sum_{h \geq 0} \tau_h 1[t = E_i + h] + \epsilon_{it}$$

- Proposition (BJS): Without never-treated units and with heterogeneous effects, long-run effects ($h \geq \max\{E_i\} - \min\{E_i\}$) are not identified by PTA, while the semi-dynamic specification produces some (heroic/spurious) estimates

[Figure: E[Y<sub>it</sub>] i=A i=B t=1, t=2, t=3]
17

### p. 20 — Spurious identification of very long-run effects

$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$
$$1$$
$$\sum$$
$$h=0$$
$$\tau_{h}1 [t = E_{i} + h] + \epsilon_{it}$$
$\mathbb{E} [Y_{it}]$
$$i = A$$
$i = B$
$t = 1$
$$\alpha_{A}$$
$\alpha_{B}$
$t = 2$
$$\alpha_{A} + \beta_{2} + \tau_{0}$$
$\alpha_{B} + \beta_{2}$
$t = 3$
$$\alpha_{A} + \beta_{3} + \tau_{1}$$
$\alpha_{B} + \beta_{3} + \tau_{0}$
Here $\hat{\tau}_{1}=$
$($
$Y_{A3}-Y_{B3}$
$)$
$$+$$
$$($$
$$Y_{A2}-Y_{B2}$$
$$)$$
$-2 (Y_{A1} -Y_{B1})$

### p. 21 — Spurious identification of very long-run effects

$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$
$$1$$
$$\sum$$
$$h=0$$
$$\tau_{h}1 [t = E_{i} + h] + \epsilon_{it}$$
$\mathbb{E} [Y_{it}]$
$$i = A$$
$i = B$
$t = 1$
$$\alpha_{A}$$
$\alpha_{B}$
$t = 2$
$$\alpha_{A} + \beta_{2} + \tau_{A2}$$
$\alpha_{B} + \beta_{2}$
$t = 3$
$$\alpha_{A} + \beta_{3} + \tau_{A3}$$
$\alpha_{B} + \beta_{3} + \tau_{B3}$
Here $\hat{\tau}_{1}=$
$($
$Y_{A3}-Y_{B3}$
$)$
$$+$$
$$($$
$$Y_{A2}-Y_{B2}$$
$$)$$
$-2 (Y_{A1} -Y_{B1})$
Estimand $\tau_{1}= \tau_{A3} + \tau_{A2} -\tau_{B3}$ inevitably involves extrapolation that is invalid with
heterogeneous effects

### p. 22 — Cross-horizon contamination

Sun and Abraham (2021):
Similar problems occur even for short-run effects in dynamic specification
- Estimand $\tau_{h}$ is not an average of horizon-$h$ effects: contaminated by heterogeneity of effects at other horizons
And pre-trend coefficients are contaminated by treatment effect heterogeneity
- Can be significant even if PTA holds!
Note: these problems tend to be small in practice

### p. 23 — Outline

1
Staggered adoption: Setting and estimands
2
Traditional estimators
What to do instead

### p. 24 — Plot treatment timing

(From BJS, with no never-treated)
(from Chiu, Lan, Liu, and Xu (2023);
package panelView in Stata & R)

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

(From BJS, with no never-treated)
[Figure: Week of year 2008 vs. Number of households receiving rate. Histogram showing distribution of treatment timing.]

(from Chiu, Lan, Liu, and Xu (2023); package panelView in Stata & R)
[Figure: Election Cycle vs. District firm 2000. Heatmap showing election cycles and presence/absence of Asian candidates.]

### p. 25 — Plot raw outcome data by cohort

(from Fadlon and Nielsen (2015))

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

(b) Health Shocks in Different Years and No Shock

[Figure: Participation Rates by Year vs. Year, with lines for No Shock, 2010, 2005, 2000, 1998, 1995]

(from Fadlon and Nielsen (2015))
22

### p. 26 — Estimation robust to heterogeneous effects

The problems arise from conventional specifications being too restrictive
They are not fundamental to staggered adoption DiD
- Under PTA, there are many valid 2x2 contrasts
How to combine them?
- Manual averaging approaches
$^{\star}$ Yield simpler estimators, more closely parallel conventional event studies
- Imputation approaches
$^{\star}$ Transparently link assumptions to estimators, more versatile, often more efficient
- Regression-based approaches

### p. 27 — Manual averaging estimators

de Chaisemartin and D’Haultfoeuille (2020) for $h = 0$:
$i = A$
$i = B$
$i = C$
$$i = D$$
$t = 1$
$t = 2$
$h = 0$
$t = 3$
$h = 0$
$t = 4$
$t = 5$
$h = 0$
$t = 6$
$i = A$
$i = B$
$i = C$
$i = D$
$$t = 1$$
$$t = 2$$
$h = 0$
$$t = 3$$
$h = 0$
$$t = 4$$
$$t = 5$$
$h = 0$
$$t = 6$$
For each cohort $E_{i}= e$: form the clean control group; compute cohort-average
treatment effect (CATT $_{e,e+0}$) by comparing $Y_{ie} -Y_{i,e-1}$
- Note: they compare to $e -1$ only, ignoring earlier periods
Average across cohorts weighting by cohort size

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: catt, cell, chaismartin, columns, first, haulfoeuille, indicates, into, second, showing, split, time._

de Chaismartin and D’Haulfoeuille (2020) for h = 0:

[Figure: Table showing cohorts A, B, C, and D with time periods t=1 to t=6. Each cell indicates whether h=0 or not. The table is split into two columns, one for the first set of cohorts and one for the second set.]

• For each cohort $E_i = e$: form the clean control group; compute cohort-average
  treatment effect ($CATT_{e,e+0}$) by comparing $Y_{ie} - Y_{i,e-1}$
  ► Note: they compare to e – 1 only, ignoring earlier periods
• Average across cohorts weighting by cohort size

### p. 28 — Manual averaging estimators (2)

Callaway and Sant’Anna (2021) for any $h \geq 0$:
$i = A$
$i = B$
$i = C$
$$i = D$$
$t = 1$
$t = 2$
$t = 3$
$h = 1$
$t = 4$
$h = 1$
$t = 5$
$t = 6$
$h = 1$
$i = A$
$i = B$
$i = C$
$i = D$
$$t = 1$$
$$t = 2$$
$$t = 3$$
$h = 1$
$$t = 4$$
$h = 1$
$$t = 5$$
$$t = 6$$
$h = 1$
For each cohort $E_{i}= e$: form the control group as cohorts not treated by $e + h$;
compute CATT $_{e,e+h}$ by comparing $Y_{i,e+h} -Y_{i,e-1}$

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: catt, cells, columns, green, highlighted, labeled, left, right, rows, same, tables._

Callaway and Sant’Anna (2021) for any $h \geq 0$:

[Figure: Two tables. The left table has rows labeled t=1, t=2, t=3, t=4, t=5, t=6 and columns labeled i=A, i=B, i=C, i=D. The right table has the same rows and columns. The cells at t=3, i=A and t=3, i=B are highlighted in green. The cells at t=4, i=A and t=4, i=B are highlighted in green. The cells at t=5, i=C and t=5, i=D are highlighted in green. The cells at t=6, i=A and t=6, i=B are highlighted in green.]

- For each cohort $E_i = e$: form the control group as cohorts not treated by $e + h$; compute $CATT_{e,e+h}$ by comparing $Y_{i,e+h} - Y_{i,e-1}$

### p. 29 — Manual averaging estimators (3)

Callaway and Sant’Anna (2021, 2nd estimator) and Sun and Abraham (2021): same but
use never-treated controls only
$i = A$
$i = B$
$i = C$
$$i = D$$
$t = 1$
$t = 2$
$t = 3$
$h = 1$
$t = 4$
$h = 1$
$t = 5$
$t = 6$
$h = 1$
$i = A$
$i = B$
$i = C$
$i = D$
$$t = 1$$
$$t = 2$$
$$t = 3$$
$h = 1$
$$t = 4$$
$h = 1$
$$t = 5$$
$$t = 6$$
$h = 1$
(If no never-treated, use latest-treated cohort instead)

#### p. 29 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: both, cells, columns, contain, corresponds, either, empty, have, labeled, left, right, rows._

Callaway and Sant’Anna (2021, 2nd estimator) and Sun and Abraham (2021): same but use never-treated controls only

[Figure: Two tables showing manual averaging estimators. The left table corresponds to Callaway and Sant’Anna (2021, 2nd estimator) and the right table corresponds to Sun and Abraham (2021). Both tables have the same structure with rows labeled t=1, t=2, t=3, t=4, t=5, t=6 and columns labeled i=A, i=B, i=C, i=D. The cells contain either a value or are empty. The left table has h=1 in cells (3,A), (4,B), (6,D). The right table has h=1 in cells (3,A), (4,B), (6,C). ]

- (If no never-treated, use latest-treated cohort instead)

26

### p. 30 — Manual averaging: Pre-trend tests

de Chaisemartin and D’Haultfœuille (2024) pre-trend tests:
$$i = A$$
$$i = B$$
$$i = C$$
$i = D$
$t = 1$
$t = 2$
$$\ell = 3$$
$t = 3$
$t = 4$
$t = 5$
$t = 6$
For cohort $e$ and lead $\ell > 1$, measure $Y_{i,e-\ell}-Y_{i,e-1}$
Compare to the control group of units not treated by $e$
Average across cohorts; test it’s zero

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: background, cell, chaise, column, columns, haulftoeuille, labeled, martin, rows, text, with._

de Chaise martin and D’Haulftoeuille (2024) pre-trend tests:

[Figure: A table with rows labeled t=1, t=2, t=3, t=4, t=5, t=6 and columns labeled i=A, i=B, i=C, i=D. The cell at row t=2, column i=C has the text l=3 and a red background.]

- For cohort e and lead $l > 1$, measure $Y_{i,e-l} - Y_{i,e-1}$
- Compare to the control group of units not treated by e
- Average across cohorts; test it’s zero

27

### p. 31 — Manual averaging: Pre-trend tests

Callaway and Sant’Anna (2021) default pre-trend tests:
$$i = A$$
$$i = B$$
$$i = C$$
$i = D$
$t = 1$
$t = 2$
$t = 3$
$t = 4$
$t = 5$
$t = 6$
Pre-trends always compare consecutive periods $\Rightarrow$ magnitudes not comparable to
post-treatment coefficients (Roth (2024))

#### p. 31 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Callaway and Sant’Anna (2021) default pre-trend tests:

|       | i = A | i = B | i = C | i = D |
|-------|-------|-------|-------|-------|
| t = 1 |       |       |       |       |
| t = 2 |       |       |       |       |
| t = 3 |       |       |       |       |
| t = 4 |       |       |       |       |
| t = 5 |       |       |       |       |
| t = 6 |       |       |       |       |

[Figure: Callaway and Sant’Anna (2021) default pre-trend tests]

- Pre-trends always compare consecutive periods → magnitudes not comparable to post-treatment coefficients (Roth (2024))

### p. 32 — Imputation estimators

PTA requires $\mathbb{E} [Y_{it}(0)] = \alpha_{i} + \beta_{t}$
No anticipation effects means $Y_{it}= Y_{it}(0)$ for untreated observations
($it \in \Omega_{0}$: both never-treated and pre-treatment)
Imputation approach:
1. Estimate $\alpha_{i}$ and $\beta_{t}$ from untreated observations, e.g. by OLS
$^{\star}$ Need pre-treatment obs for every unit to get $\hat{\alpha}_{i}$
$^{\star}$ Need untreated obs in every period to get $\hat{\beta}_{t}$
2. For each treated observation $it \in \Omega_{1}$, compute $\hat{\tau}_{it}= Y_{it} -\hat{\alpha}_{i} -\hat{\beta}_{t}$
$^{\star}$ Each $\hat{\tau}_{it}$ is very noisy!
3. Estimate $\tau_{w}= \sum$
$^{it\in\Omega}1 w^{it}\tau^{it}$ by $\hat{\tau}^{w}= \sum$
$$^{it\in\Omega}1 w^{it}\hat{\tau}^{it}$$
$^{\star}$ Averaging across many units makes $\hat{\tau}_{w}$ consistent

#### p. 32 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- PTA requires $E[Y_{it}(0)] = \alpha_i + \beta_t$
- No anticipation effects means $Y_{it} = Y_{it}(0)$ for untreated observations ($it \in \Omega_0$: both never-treated and pre-treatment)
- Imputation approach:
  - 1. Estimate $\alpha_i$ and $\beta_t$ from untreated observations, e.g. OLS
    -  Need pre-treatment obs for every unit to get $\hat{\alpha}_i$
    -  Need untreated obs in every period to get $\hat{\beta}_t$
  - 2. For each treated observation $it \in \Omega_1$, compute $\hat{u}_{it} = Y_{it} - \hat{\alpha}_i - \beta_t$
    -  Each $\hat{u}_{it}$ is very noisy!
  - 3. Estimate $T_w = \sum_{it \in \Omega_1} W_{it} \hat{u}_{it}$ by $\hat{T_w} = \sum_{it \in \Omega_1} W_{it} \hat{u}_{it}$
    -  Averaging across many units makes $\hat{T_w}$ consistent
[Figure: Imputation Estimators]

### p. 33 — Efficiency of imputation

Proposition (BJS) If $Y_{it}(0) = \alpha_{i} + \beta_{t} + \epsilon_{it}$ for homoskedastic and serially uncorrelated
$\epsilon_{it}$, estimating $\hat{\alpha}_{i}, \hat{\beta}_{t}$ by OLS in the untreated sample yields most efficient $\hat{\tau}_{w}$ for any $\tau_{w}$
Proof idea:
This imputation estimator can be obtained by OLS from a very flexible regression
$$Y_{it}= \alpha_{i} + \beta_{t} + \tau_{it}D_{it} + \epsilon_{it}$$
which dummies out each treated observation
By Gauss-Markov, OLS is efficient for the vector of $\tau_{it}$ and for any linear
combination $\tau_{w}$

#### p. 33 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Proposition (BJS) If $Y_{it}(0) = \alpha_i + \beta_t + \epsilon_{it}$ estimating $\alpha_i, \beta_t$ by OLS in the untreated sample yields most efficient $\hat{\tau}_w$ for any $T_w$

Proof idea:
- This imputation estimator can be obtained by OLS from a very flexible regression

$$Y_{it} = \alpha_i + \beta_t + \tau_{it}D_{it} + \epsilon_{it}$$

which dummies out each treated observation
- By Gauss-Markov, OLS is efficient for the vector of $\tau_{it}$ and for any linear combination $\tau_w$

[Figure: 30]

### p. 34 — Comparison to manual averaging

Proposition (BJS): Any unbiased estimator for $\tau_{w}$ under arbitrary heterogeneity of
treatment effects can be represented as an imputation estimator for some unbiased
$\hat{\alpha}_{i}, \hat{\beta}_{t}$
E.g. manual averaging estimators are (implicitly) imputation estimators that
estimate $\hat{\alpha}_{i}, \hat{\beta}_{t}$ differently than by OLS
They use less information... although that’s not always bad
- Harmon (2022): If $\epsilon_{it}$ is a random walk, the de Chaisemartin and D’Haultfoeuille (2020) estimator is efficient for $h = 0$
- Outcomes at $E_{i} -1$ contain all useful information; earlier periods only add noise

### p. 35 — BJS: Standard errors

Represent $\hat{\tau}_{w}= \sum$
$it v^{it}Y^{it}$: $v^{it}= w^{it}$ for $it \in \Omega^{1}$; $v^{it}$ can be computed for $\Omega^{0}$
True variance: Var $[\hat{\tau}_{w}] =$ Var $[\sum$
$$it v^{it}\epsilon^{it}] =\mathbb{E}$$
$$[\sum$$
$i (\sum$
$t v^{it}\epsilon^{it})^{2}]$
Plug-in clustered estimator: $\hat{\sigma}^{2}$
$$w = \sum$$
$$i (\sum$$
$$t v^{it}\hat{\epsilon}^{it})^{2}$$
For untreated obs, $\hat{\epsilon}_{it}= Y_{it} -\hat{\alpha}_{i} -\hat{\beta}_{t}$
Key challenge: for treated obs, $\hat{\epsilon}^{naive}$
$$it$$
$= Y_{it} -\hat{\alpha}_{i} -\hat{\beta}_{t} -\hat{\tau}_{it}= 0$ by construction

#### p. 35 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Represent $\hat{r}_w = \sum_{it} v_{it} Y_{it} = w_{it}$ for $it \in \Omega_1$; $v_{it}$ can be computed for $\Omega_0$

- True variance: $Var[\hat{r}_w] = Var[\sum_{it} v_{it}\varepsilon_{it}] = E[\sum_i (\sum_t v_{it}\varepsilon_{it})^2]$

- Plug-in clustered estimator: $\hat{\sigma}^2_w = \sum_i (\sum_t v_{it}\varepsilon_{it})^2$

- For untreated obs, $\varepsilon_{it} = Y_{it} - \hat{\alpha}_i - \beta_t$

- Key challenge: for treated obs, $\hat{\varepsilon}^naive_{it} = Y_{it} - \hat{\alpha}_i - \beta_t - \tau_{it} = 0$ by construction

32

### p. 36 — BJS: Standard errors (2)

If cohorts are large, instead use
$$\hat{\epsilon}_{it}= Y_{it} -\hat{\alpha}_{i} -\hat{\beta}_{t} -\hat{\tau}_{Eit}\approx \epsilon_{it} + (\tau_{it} -\bar{\tau}_{Eit})$$
where $\hat{\tau}_{Eit}=$ avg of $\hat{\tau}_{jt}$ in the same cohort $E_{j}= E_{i}$
- SE are conservative when there is variation in $\tau_{it}$ within cohorts; otherwise asymptotically exact
If cohorts are small, either replace $\hat{\tau}_{Eit}$ with averages that pool multiple cohorts or
use leave-out estimation; see BJS
- Note: SE for all other estimators are only proved with large cohorts

#### p. 36 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- If cohorts are large, instead use

$$
\hat{E}_{it} = Y_{it} - \hat{\alpha}_i - \beta_t - \hat{E}_{E,t} \approx E_{it} + (T_{it} - \overline{T}_{E,t})
$$

where $\hat{E}_{E,t} = avg \ of \ T_{jt} \ in \ the \ same \ cohort \ E_j = E_i$

- SE are conservative when there is variation in $\tau_{it}$ within cohorts; otherwise asymptotically exact

- If cohorts are small, either replace $\hat{E}_{E,t}$ with averages that pool multiple cohorts or use leave-out estimation; see BJS

- *Note:* SE for all other estimators are only proved with large cohorts

### p. 37 — BJS: Pre-trend and other falsifications tests

To test for pre-trends, always use only untreated observations
Null hypothesis: $Y_{it}= \alpha_{i} + \beta_{t} + \epsilon_{it}$
Choose a richer alternative model: $Y_{it}= \alpha_{i} + \beta_{t} + \eta 'W_{it} + \epsilon_{it}$
- E.g. anticipation effects: $W_{it}$ are $1 [t = E_{i} -1] , \ldots , 1 [t = E_{i} -L]$
- Non-parallel linear trends: $W_{it}$ are cohort dummies $\times t$
- Structural break: $W_{it}$ are cohort dummies $\times$ post financial crisis
Use $F$-test for $\eta = 0$. (Don’t include too many covariates to avoid low power)
Note $1:$ not all violations affect causal estimates much
Note $2: \eta$ should not be directly compared to causal effect estimates

### p. 38 — Estimators equivalent to imputation

Gardner (2021): Two-Stage Diff-in-Diff estimator:
- Estimate $\alpha_{e}, \beta_{t}$ using untreated observations (note cohort FEs instead of unit FEs)
- Regress $Y_{it} -\hat{\alpha}_{Ei}-\hat{\beta}_{t}$ on the treatment dummy or event study indicators
Liu, Wang, and Xu (AJPS, 2022): Counterfactual Estimators
- Applied to both TWFE and richer Interactive FE models of $Y_{it}(0)$
Be mindful of some differences in pre-trend tests, SE computation, behavior with
unbalanced panels

### p. 39 — Event study graphs from two groups of methods

(de Chaisemartin and D’Haultfœuille (2024)
(BJS Figure 2a,
Figure 1)
using event_plot Stata command)
Note different reference groups and different behavior of SE
See Roth (2024) and Li and Strezhnev (2025) on correct interpretations of
pre-trend coefficients with different methods

#### p. 39 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Two graphs. The left graph is titled "Length of exposure to treatment" and ranges from -3 to 8 on the x-axis and -0.1 to 0.1 on the y-axis. The right graph is titled "Average MPC" and ranges from -8 to 11 on the x-axis and -10 to 30 on the y-axis. The right graph has two lines, one black and one red, with error bands.]

(de Chaise martin and D’Haultfoeuille (2024)
Figure 1)

(BJS Figure 2a,
using event_plot Stata command)

- Note different reference groups and different behavior of SE
- See Roth (2024) and Li and Strezhnev (2025) on correct interpretations of pre-trend coefficients with different methods

36

### p. 40 — Liu et al. (2022) pre-trend test and graph

Both for $h \geq 0$ and $h < 0$, plot averages of $Y_{it} -\hat{\alpha}_{i} -\hat{\beta}_{t}$
Like with de Chaisemartin and D’Haultfœuille (2024) graphs, comparable on the
left and right (although see Li and Strezhnev (2025))
But no single reference period because imputation-based
Unlike BJS, no explicit alternative hypothesis

### p. 41 — Extended TWFE regression

Can the convenience of OLS be preserved without negative weights and other
problems?
Wooldridge (2025): the problem with old-school estimators is restrictive
specifications
$\Rightarrow$ Let’s keep running regressions but more flexibly
$Y_{it}= \alpha_{i} + \beta_{t} +$
$$\sum$$
$$e$$
$$\sum$$
$$s\geq e$$
$\tau_{es}1 [E_{i}= e] \times 1 [t = s] +$ error $,$
where $\tau_{et}$ estimates CATT for cohort $e$ in period $t$; then aggregate estimates as
required

#### p. 41 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Can the convenience of OLS be preserved without negative weights and other problems?

- Wooldridge (2025): the problem with old-school estimators is restrictive specifications

- Let's keep running regressions but more flexibly

$$Y_{it} = \alpha_i + \beta_t + \sum_{e} \tau_{es} \mathbb{I}[E_i = e] \times 1 [t = s] + error,$$

where $\tau_{et}$ estimates CATT for cohort $e$ in period $t$; then aggregate estimates as required

38

### p. 42 — Extended TWFE regression

$$e = 2$$
$$e = 3$$
$$e = 5$$
$e = \infty$
$t = 1$
$t = 2$
$$\tau_{22}$$
$t = 3$
$$\tau_{23}$$
$$\tau_{33}$$
$t = 4$
$$\tau_{24}$$
$$\tau_{34}$$
$t = 5$
$$\tau_{25}$$
$$\tau_{35}$$
$$\tau_{55}$$
$t = 6$
$$\tau_{26}$$
$$\tau_{36}$$
$$\tau_{56}$$
Numerically equivalent to BJS for CATT-based estimands in complete panels

#### p. 42 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: cells, columns, contain, labeled, rows, values, with._

[Figure: Table with rows labeled t=1, t=2, t=3, t=4, t=5, t=6 and columns labeled e=2, e=3, e=5, e=∞. The cells contain the values T22, T23, T24, T25, T26, T33, T34, T35, T36, T55, T56.]

- Numerically equivalent to BJS for CATT-based estimands in complete panels

### p. 43 — Local projection DiD

Dube, Girardi, Jorda, and Taylor (2023) propose to estimate, for each $h$,
$Y_{i,t+h} -Y_{i,t-1}= \beta_{ht} + \tau_{h}1 [t = E_{i}] +$ error
on the subsample where $E_{i}= t$ or $E_{i}> t + h$
- Combines the local projections estimator for time series of Jorda (2005) with “stacking” approach of Cengiz, Dube, Lindner, and Zippere (2019, Appendix D)
$\tau_{h}$ estimates a convex weighted average of treatment effects
- Can be reweighted to get Callaway and Sant’Anna (2021)
- Instead of subtracting $Y_{i,t-1}$ can subtract average of several pre-period outcomes =$\Rightarrow$ closer to imputation

### p. 44 — Does heterogeneity-robust estimation matter?

BJS application with no never-treated units:
Yes, relative to specifications that restrict dynamics
Yes, for the spurious long-run coefficients
For the short-run, the semi-dynamic specification seems fine
Setting: marginal propensity to spend (MPC) from the 2008 Economic Stimulus
Payments (tax rebates)
Staggered disbursement of rebates. Weekly spending data from Nielsen
Broda and Parker (2014) find a very large MPC from a monthly-binned specification:
$Y_{it}= \alpha_{i} + \beta_{t} +$
$\infty$
$\sum$
$m=-1$
$\tau_{m}1 [t -E_{i}\in \{4m -3, \ldots , 4m\}] +$ error $_{it}$

### p. 45 — BJS results

-40
-20
0
20
40
60
MPC, \$
0
5
10
15
20
25
30
35
Week since receipt
Binned OLS
Imputation estimator
Because the effects are fast decaying, binned specification overstates them in the
first month
Binned specification also extrapolates them to all future months

#### p. 45 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

[Figure: MPC, $, Week since receipt, Binned OLS, Imputation estimator]

- Because the effects are fast decaying, binned specification overstates them in the first month
- Binned specification also extrapolates them to all future months

### p. 46 — Chiu, Lan, Liu, and Xu (2023) are less convinced

Chiu et al. (2023) reanalyze main significant TWFE coefficients in 37 political science
papers and don’t find big differences — but also no cost of being robust
Ratio between SEs from Imputation Method and TWFE
Frequency
1.0
1.5
2.0
2.5
3.0
0
2
4
6
8
(From Chiu et al.)
(Computation by Yixing Xu)

#### p. 46 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Chiu et al. (2023) reanalyze main significant TWFE coefficients in 37 political science papers and don’t find big differences – but also no cost of being robust

FIGURE 4. TWFE vs. Imputation Method

[Figure: Estimated from the Outliered Estimate (est) / Reported TWFE SE vs. Reported TWFE Coefficient / Reported TWFE SE. The x-axis ranges from -10 to 10. The y-axis ranges from -10 to 10. There are many points scattered around the graph. A line of best fit is drawn. The line is y = x. There are four points highlighted with larger markers.]

(From Chiu et al.)

[Figure: Histogram of Ratio between SEs from Imputation Method and TWFE. The x-axis ranges from 1.0 to 3.0. The y-axis is Frequency. There are multiple bars.]

(Computation by Yixing Xu)

43

### p. 47 — Software packages

Method
Stata
R
Python
Borusyak et al. 2024
did_imputation
didimputation
(limited)
(coming soon)
Callaway and Sant’Anna 2021
csdid, csdid2
did
csdid
de Chaisemartin, D’Haultfoeuille
2020, 2024
did_multiplegt_dyn
*
Sun and Abraham 2021
eventstudyinteract
*
*
Plotting any event studies
event_plot
—
(coming soon)
Visualizing event timing
panelview
panelView
—
* Callaway and Sant’Anna’s packages can be used instead

### p. 48 — References I

Angrist, J. (1998): “Estimating the labor market impact of voluntary military service using social
security data on military applicants,” Econometrica, 66, 249–288.
Borusyak, K., X. Jaravel, and J. Spiess (2024): “Revisiting Event Study Designs: Robust and
Efficient Estimation,” Review $of$ Economic Studies, 91, 3253–3285.
Broda, C. and J. A. Parker (2014): “The economic stimulus payments of 2008 and the aggregate
demand for consumption,” Journal $of$ Monetary Economics, 68, S20–S36, publisher: Elsevier.
Callaway, B. and P. H. Sant’Anna (2021): “Difference-in-Differences with Multiple Time
Periods,” Journal $of$ Econometrics.
Cengiz, D., A. Dube, A. Lindner, and B. Zippere (2019): “The Effect of Minimum Wages on
Low-Wage Jobs,” The Quarterly Journal $of$ Economics, 1405–1454.
Chiu, A., X. Lan, Z. Liu, and Y. Xu (2023): “What To Do (and Not to Do) with Causal Panel
Analysis under Parallel Trends: Lessons from A Large Reanalysis Study,” .
de Chaisemartin, C. and X. D’Haultfoeuille (2020): “Two-way fixed effects estimators with
heterogeneous treatment effects,” American Economic Review, 110, 2964–2996, arXiv:
1803.08807v1.

### p. 49 — References II

de Chaisemartin, C. and X. D’Haultfœuille (2024): “Difference-in-Differences Estimators of
Intertemporal Treatment Effects,” Review $of$ Economics and Statistics, arXiv: 2007.04267v1.
Dube, A., D. Girardi, O. Jorda, and A. M. Taylor (2023): “A Local Projections Approach
to Difference-in-Differences Event Studies,” Working Paper.
Fadlon, I. and T. H. Nielsen (2015): “Household Responses to Severe Health Shocks and the
Design of Social Insurance,” Working Paper.
Gardner, J. (2021): “Two-stage differences in differences,” Working Paper.
Goodman-Bacon, A. (2021): “Difference-in-differences with variation in treatment timing,” Journal
$of$ Econometrics, 225, 254–277, publisher: Elsevier B.V.
Harmon, N. A. (2022): “Difference-in-Differences and Efficient Estimation of Treatment Effects,” .
Jorda, O. (2005): “Estimation and Inference of Impulse Responses by Local Projections,” American
Economic Review, 95, 161–182.
Li, Z. and A. Strezhnev (2025): “Benchmarking parallel trends violations in regression imputation
difference-in-differences,” Working Paper.

### p. 50 — References III

Liu, L., Y. Wang, and Y. Xu (2022): “A Practical Guide to Counterfactual Estimators for Causal
Inference with Time-Series Cross-Sectional Data,” American Political Science Review.
Roth, J. (2024): “A Cautionary Note on Interpreting Event-Studies from Recent
Difference-in-Differences Methods,” .
Sun, L. and S. Abraham (2021): “Estimating Dynamic Treatment Effects in Event Studies with
Heterogeneous Treatment Effects,” Journal $of$ Econometrics.
Wooldridge, J. M. (2025): “Two-Way Fixed Effects, the Two-Way Mundlak Regression, and
Difference-in-Differences Estimators,” Empirical Economics.

## Extraction Gaps

- p. 3: display math with drawn rules; figure or diagram present
- p. 7: display math with drawn rules; figure or diagram present
- p. 8: display math with drawn rules; figure or diagram present
- p. 9: display math with drawn rules; figure or diagram present
- p. 12: display math with drawn rules
- p. 13: display math with drawn rules
- p. 14: display math with drawn rules
- p. 15: display math with drawn rules
- p. 17: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 18: figure or diagram present
- p. 19: display math with drawn rules; undecodable glyph in text (shown as [?])
- p. 20: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 21: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 24: figure or diagram present
- p. 25: figure or diagram present
- p. 27: display math with drawn rules; figure or diagram present
- p. 28: display math with drawn rules; figure or diagram present
- p. 29: display math with drawn rules; figure or diagram present
- p. 30: display math with drawn rules; figure or diagram present
- p. 31: display math with drawn rules; figure or diagram present
- p. 32: display math with drawn rules
- p. 33: display math with drawn rules
- p. 35: display math with drawn rules
- p. 36: display math with drawn rules
- p. 39: figure or diagram present
- p. 40: figure or diagram present; layout reconstruction withheld: it wrote math the page does not have
- p. 41: display math with drawn rules
- p. 42: display math with drawn rules; figure or diagram present
- p. 45: figure or diagram present
- p. 46: figure or diagram present
