# D2: Canonical Difference-in-Differences Translation

## Source

- PDF: `literature/raw_pdf/D2_Canonical_DiD.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/D2_Canonical_DiD.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 34/34 pages, word recall 0.985, words not in the text layer 0.014.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part D: Panel Data Methods
- p. 2: It’s everywhere
- p. 3: D2 outline
- p. 4: Difference-in-differences: Idea
- p. 5: Card and Krueger (1994)
- p. 6: Is this causal?
- p. 7: Parallel trends (PTA)
- p. 8: PTA = TWFE for $Y(0)$
- p. 9: 2x2 DiD estimator
- p. 10: Problems with 2x2 designs (1)
- p. 11–12: Problems with 2x2 designs (2)
- p. 13: Outline
- p. 14: Causal structure with multiple periods
- p. 15: PTA with multiple units and periods
- p. 16: Static TWFE specification
- p. 17: Dynamic event study specification
- p. 18: Example event study plot
- p. 19: Outline
- p. 20: #1: Pre-trend tests are at best suggestive
- p. 21: #2: Justifying PTA $ex$ ante
- p. 22: PTA in levels vs. logs
- p. 23: Justifying PTA is important
- p. 24: Example: Yagan (2015)
- p. 25: Yagan (2015): Plotting raw data
- p. 26: #3: Pre-testing problems (Roth, 2022)
- p. 27: #4: Event studies conflate estimation and testing
- p. 28: #5: Pre-trend tests are not always conceptually informative
- p. 29: #6: Pre-trend tests are not always powerful (Roth, 2022)
- p. 30–31: #6: Pre-trend tests are now always powerful (Roth, 2022)
- p. 32: The “Straight line test”
- p. 33: References I
- p. 34: References II

## Comprehensive Translation

### p. 1 — Part D: Panel Data Methods

D2: Canonical Difference-in-Differences
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — It’s everywhere

Fraction of NBER working papers mentioning DiD (Goldsmith-Pinkham (2024), Fig.5a)

#### p. 2 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

It’s everywhere

[Figure: Fraction of NBER working papers mentioning DID (Goldsmith-Pinkham (2024), Fig.5a)]

(a) Difference-in-differences
Fraction of NBER working papers mentioning DID (Goldsmith-Pinkham (2024), Fig.5a)
2

### p. 3 — D2 outline

1
$2x2$ DiD
2
DiD and event studies with multiple units and periods
Discussion of conventional event studies

### p. 4 — Difference-in-differences: Idea

We are interested in causal effects of some binary treatment
But treatment is not randomly assigned across units
“Quasi-experimental” contrasts are easier to find in panel data
Card and Krueger (1994): effect of minimum wages on employment
- On April 1, 1992, NJ raised the min.wage from \$4.25 to \$5.05
- Min.wage in PA stayed at \$4.25
- Measure average employment at fast food restaurants after (Nov 1992) minus before (Feb 1992), in NJ minus PA

### p. 5 — Card and Krueger (1994)

(Card-Krueger Table 3, reproduced from MHE Table 5.2.1)

#### p. 5 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Card and Krueger Table 3, reproduced from MHE Table 5.2.1]

Variable | PA (i) | NJ (ii) | Difference, NJ-PA (iii)
------- | -------- | -------- | --------
1. FTE employment before, all available observations | 23.33 (1.35) | 20.44 (0.51) | -2.89 (1.44)
2. FTE employment after, all available observations | 21.17 (0.94) | 21.03 (0.52) | -0.14 (1.07)
3. Change in mean FTE employment | -2.16 (1.25) | 0.59 (0.54) | 2.76 (1.36)

### p. 6 — Is this causal?

Define potential outcomes $Y_{it}(d)$ for $d = 0, 1$ (low/high min.wage), with
$\tau_{it}= Y_{it}(1) -Y_{it}(0)$ and $Y_{it}= Y_{it}(D_{it})$
$$D_{it}$$
$$i = PA$$
$$i = NJ$$
$$t = 1$$
0
0
$$t = 2$$
0
1
Estimand: ATT $= \tau_{NJ,2}$
Assumptions for this potential outcomes formulation:
- No spillovers
- No anticipation effects: $Y_{i1}$ does not depend on $D_{i2}$
- Parallel trends...

#### p. 6 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: columns, estimated, rows._

- Define potential outcomes $Y_{it}(d)$ for $d = 0, 1$ (low/high min.wage), with
  $\tau_{it} = Y_{it}(1) - Y_{it}(0)$ and $Y_{it} = Y_{it}(D_{it})$

- [Figure: Table with columns D_it, i=PA, i=NJ and rows t=1, t=2]

  | D<sub>it</sub> | i=PA | i=NJ |
  |---|---|---|
  | t=1 | 0 | 0 |
  | t=2 | 0 | 1 |

- Estimated: $ATT = \tau_{NJ,2}$

- Assumptions for this potential outcomes formulation:
  - - No spillovers
  - - No anticipation effects: $Y_{it}$ does not depend on $D_{i2}$
  - - Parallel trends...

### p. 7 — Parallel trends (PTA)

(MHE Figure 5.2.1, corrected by Peter Hull)
Parallel trends: $\mathbb{E} [Y_{NJ,2}(0) -Y_{NJ,1}(0)]$
$\mid$
$\{z$
$$\}$$
unobserved
$$=\mathbb{E} [Y_{PA,2}(0) -Y_{PA,1}(0)]$$
$$\mid$$
$$\{z$$
$\}$
observed
Note: notation for a fixed sample, $\mathbb{E} [Y_{it}(0)]$ depends on $i, t$. Expectations taken with
respect to other determinants of the outcome

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Employment Rate vs. Time, showing Employment trend in control state, Employment trend in treatment state, Counterfactual employment trend in treatment state, Treatment Effect]

Parallel trends: $$E[Y_{NJ,2}(0) - Y_{NJ,1}(0)] = E[Y_{PA,2}(0) - Y_{PA,1}(0)]$$

Note: notation for a fixed sample, $E[Y_{it}(0)]$ depends on $i, t$. Expectations taken with respect to other determinants of the outcome.

### p. 8 — PTA = TWFE for $Y(0)$

$$\mathbb{E} [Y_{NJ,2}(0) -Y_{NJ,1}(0)] =\mathbb{E} [Y_{PA,2}(0) -Y_{PA,1}(0)]$$
is equivalent to
$\mathbb{E} [Y_{it}(0)] = \alpha_{i} + \beta_{t}$
for $i = NJ, PA; t = 1, 2$
$\Leftarrow$ : Obvious
$\Rightarrow$ : Let $\alpha_{i}=\mathbb{E} [Y_{i,1}(0)]$, $\beta_{1}= 0$,
$\beta_{2}=\mathbb{E} [Y_{NJ,2}(0) -Y_{NJ,1}(0)] =\mathbb{E} [Y_{PA,2}(0) -Y_{PA,1}(0)]$

#### p. 8 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

$$ \mathbb{E} [Y_{NJ,2}(0) - Y_{NJ,1}(0)] = \mathbb{E} [Y_{PA,2}(0) - Y_{PA,1}(0)] $$

is equivalent to

$$ \mathbb{E} [Y_{it}(0)] = \alpha_i + \beta_t \quad \text{for } i = NJ, PA; \ t = 1, 2 $$

$\Leftarrow$: Obvious

$\Rightarrow$: Let $\alpha_1 = \mathbb{E} [Y_{1,1}(0)]$, $\beta_1 = 0$,
$\beta_2 = \mathbb{E} [Y_{NJ,2}(0) - Y_{NJ,1}(0)] = \mathbb{E} [Y_{PA,2}(0) - Y_{PA,1}(0)]$

### p. 9 — 2x2 DiD estimator

$\hat{\tau} =$
$Y_{NJ,2}-Y_{NJ,1}$
$-(Y_{PA,2} -Y_{PA,1})$ is unbiased for ATT
$\hat{\tau}$ can be obtained as OLS from the TWFE specification
$$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} + \tau D_{it} + \epsilon_{it}$$
- Proof: with 2 periods, the first-differenced equation gives the same $\hat{\tau}$ ,
$$Y_{i2} -Y_{i1}= \tilde{\beta} + \tau (D_{i2} -D_{i1})$$
$$\mid$$
$$\{z$$
$\}$
$$=1[i=NJ]$$
$+ (\epsilon_{i2} -\epsilon_{i1})$

#### p. 9 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- $\hat{\tau} = (Y_{N,I,2} - Y_{N,I,1}) - (Y_{PA,2} - Y_{PA,1})$ is unbiased for ATT

- $\hat{\tau}$ can be obtained as OLS from the TWFE specification

  $$Y_{it} = \alpha_i + \beta_t + \tau D_{it} + \epsilon_{it}$$

- Proof: with 2 periods, the first-differenced equation gives the same $\hat{\tau}$.

  $$Y_{I2} - Y_{I1} = \beta + \tau (D_{I2} - D_{I1}) + (\epsilon_{I2} - \epsilon_{I1})$$
  $=1[i=N,I]$

### p. 10 — Problems with 2x2 designs (1)

1. Effectively 4 observations: can’t separate $\tau$ from other shocks in NJ relative to PA
These SE are not clustered, and cannot be!

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

1. Effectively 4 observations: can’t separate $\tau$ from other shocks in NJ relative to PA

| Variable | PA (i) | NJ (ii) | Difference, NJ-PA (iii) |
|---|---|---|---|
| 1. FTE employment before, all available observations | 23.33 (1.35) | 20.44 (0.51) | -2.89 (1.44) |
| 2. FTE employment after, all available observations | 21.17 (0.94) | 21.03 (0.52) | -0.14 (1.07) |
| 3. Change in mean FTE employment | -2.16 (1.25) | 0.59 (0.54) | 2.76 (1.36) |

These SE are not clustered, and cannot be!

### p. 11 — Problems with 2x2 designs (2)

Clustering is necessary: there are state-level fluctuations all the time
(Card and Krueger (2000) for an extended time period)

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Clustering is necessary: there are state-level fluctuations all the time

[Figure: Employment in New Jersey and Pennsylvania Fast-Food Restaurants, October 1991 to September 1997 (Card and Krueger (2000) for an extended time period)]

10

### p. 12 — Problems with 2x2 designs (2)

1. Effectively 4 observations: can’t separate $\tau$ from other shocks in NJ relative to PA
2. Can’t falsify parallel trends
Solution: have more (pre-)periods and more units
$$i = A$$
$$i = B$$
$$i = C$$
$i = D$
$t = 1$
$t = 2$
$t = 3$
$t = 4$
$t = E = 5$
$t = 6$

#### p. 12 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

1. Effectively 4 observations: can’t separate $\tau$ from other shocks in NJ relative to PA
2. Can’t falsify parallel trends

Solution: have more (pre-)periods and more units

[Figure: i=A i=B i=C i=D t=1 t=2 t=3 t=4 t=E=5 t=6]

11

### p. 13 — Outline

1
$2x2$ DiD
2
DiD and event studies with multiple units and periods
Discussion of conventional event studies

### p. 14 — Causal structure with multiple periods

We continue to write $Y_{it}= Y_{it}(D_{it})$ but have in mind three distinct scenarios:
1. Policy switches on at $t = 5$ and stays on; has no lagged effects
2. Same but with lagged effects: $Y_{i6}= Y_{i6}(D_{i5}, D_{i6})$
- But in the data, $D_{i5}\equiv D_{i6}$
$\Rightarrow$ Can’t separate contemporaneous effects of $D_{i6}$ from delayed effects of $D_{i5}$
$\Rightarrow$ Simplify notation to $Y_{i6}(D_{i6})$, with $Y_{i6}(1) -Y_{i6}(0) \equiv Y_{i6}(1, 1) -Y_{i6}(0, 0)$
3. A single event happens at $t = 5$ but can have lagged effects: $Y_{i6}= Y_{i6}(D_{i5})$
- Since $D_{i5}\equiv D_{i6}$, again simplify notation to $Y_{i6}(D_{i6})$
- $D_{it}$= having ever been exposed to the event

### p. 15 — PTA with multiple units and periods

PTA at the unit level (in a fixed sample):
$$\mathbb{E} [Y_{it}(0) -Y_{i,t-1}(0)] =\mathbb{E} [Y_{jt}(0) -Y_{j,t-1}(0)]$$
$\forall i, j, t$
$$\Leftarrow \Rightarrow \mathbb{E} [Y_{it}(0)] = \alpha_{i} + \beta_{t}$$
$\forall i, t$
Or impose PTA at the treatment/control group level (in a random sample):
$$\mathbb{E} [Y_{it}(0) -Y_{i,t-1}(0) \mid G_{i}= 1] =\mathbb{E} [Y_{it}(0) -Y_{i,t-1}(0) \mid G_{i}= 0] ,$$
$\forall t$
where $G_{i}= 1 [$ treatment group $_{i}]$

#### p. 15 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

-  PTA at the unit level (in a fixed sample):
   $$
   E[Y_{it}(0) - Y_{it-1}(0)] = E[Y_{it}(0) - Y_{it-1}(0)]
   $$
   $$
   E[Y_{it}(0)] = \alpha_i + \beta_t
   $$
   $ \forall i, j, t $
   $ \forall i, t $

-  Or impose PTA at the treatment/control group level (in a random sample):
   $$
   E[Y_{it}(0) - Y_{it-1}(0) | G_i = 1] = E[Y_{it}(0) - Y_{it-1}(0) | G_i = 0]
   $$
   $ \forall t $
   where $G_i = 1$ [treatment group]

13

### p. 16 — Static TWFE specification

Assume a balanced panel. Static TWFE specification:
$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} + \tau D_{it} + \epsilon_{it},$
$D_{it}= G_{i} \times$ Post $_{t}$
$\mid \{z \}$
$=1[t\geq E]$
$$\hat{\tau} = (\bar{Y}_{treated,post} -\bar{Y}_{treated,pre}) -(\bar{Y}_{control,post} -\bar{Y}_{control,pre})$$
Under PTA,
$\mathbb{E} [\hat{\tau} ] =$
$\bar{\alpha}_{treated} + \bar{\beta}_{post} +$ ATT $-\bar{\alpha}_{treated} -\bar{\beta}_{pre}$
$$-$$
$\bar{\alpha}_{control} + \bar{\beta}_{post} -\bar{\alpha}_{controls} -\bar{\beta}_{pre}$
$=$ ATT
which is the avg $\tau_{it}$ across all treated units and “post” periods
This result doesn’t require constant or static effects but it is not very useful with
strong dynamics

### p. 17 — Dynamic event study specification

“Event study” dynamic specification:
$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$
$T-E$
$X$
$h=-(E-1)$
$$\tau_{h}1 [t -E = h] \times G_{i} + \epsilon_{it},$$
$\tau_{-1}= 0$
$$\hat{\tau}_{h}= (\bar{Y}_{treated,E+h} -\bar{Y}_{treated,E-1}) -(\bar{Y}_{control,E+h} -\bar{Y}_{control,E-1})$$
For $h \geq 0$, unbiased for ATT $h$ periods after the event
For $h < -1$, unbiased for zero under PTA: yields a “pre-trends” test

#### p. 17 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: control, treated._

"Event study" dynamic specification:

$$Y_{it} = \tilde{\alpha}_i + \tilde{\beta}_t + \sum_{h=-(E-1)}^{T-E} \tau_h \textbf{1}\{t-E = h\} \times G_i + \epsilon_{it}, \quad \tau_{-1} = 0$$

$$ \hat{\tau}_h = (Y_{treated, E+h} - Y_{treated, E-1}) - (Y_{control, E+h} - Y_{control, E-1}) $$

- For $h \geq 0$, unbiased for ATT $h$ periods after the event

- For $h < -1$, unbiased for zero under PTA: yields a "pre-trends" test

15

### p. 18 — Example event study plot

(Mixtape Fig. 9.6 based on Miller et al. (2021, Fig. I.E))

#### p. 18 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Example event study plot

[Figure: Coefficient vs. Event Time, with error bars, and a horizontal line at 0. The x-axis is labeled "Event Time" ranging from -6 to 2. The y-axis is labeled "Coefficient" ranging from -0.06 to 0.02. The bottom of the figure includes the text "(Mixtape Fig. 9.6 based on Miller et al. (2021, Fig. I.E))"]

16

### p. 19 — Outline

1
$2x2$ DiD
2
DiD and event studies with multiple units and periods
Discussion of conventional event studies

### p. 20 — #1: Pre-trend tests are at best suggestive

We imposed parallel trends in $Y_{it}(0)$ both pre- and post-treatment
- Parallel trends after $t = E -1$ are key and untestable
- Parallel trends before $t = E -1$ are not necessary but make pre-trend tests useful
Never say:
- “My identification assumption is parallel pre-trends”
- “The pre-trend test passes, which implies that my diff-in-diff strategy is solid”

### p. 21 — #2: Justifying PTA $ex$ ante

Design-based approach: assignment into treatment vs control group is random
- Balance on levels in addition to trends =$\Rightarrow$ have better tools than DiD! (Roth and Sant’Anna (2023a))
- No need for DiD in RCTs!
Model-based approach: stability of the environment, i.e. unobserved factors
- No balance on levels, only on trends
- Better with large shocks and in the short-run
- Levels vs logs matters (Roth and Sant’Anna (2023b))

### p. 22 — PTA in levels vs. logs

#### p. 22 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Employment Rate vs. Time, showing Employment trend in control state (straight line), Employment trend in treatment state (dashed line), and PTA in logs (dashed line)]

19

### p. 23 — Justifying PTA is important

Common bad practice: don’t justify PTA, just check for pre-trends
From David McKenzie’s 2022 blog post (link):
[Three recent QJE] papers all use a variety of statistical methods to assess and
assert the validity of their DiD estimates [...] But I found all three lacking in
providing a discussion of why parallel trends should hold
It is commonplace in papers that use IV to spend a lot of time arguing for the
plausibility of the ultimately untestable exclusion restriction, but I think DiD papers
have not done the same for the untestable assumption about future trends

### p. 24 — Example: Yagan (2015)

Studies the effects of the 2003 dividend tax cut from 38.6% to 15%
Treatment group: C-corporations; control group: S-corporations
S-corporations don’t pay dividend tax; otherwise similar taxation
$“The$ identifying assumption $is$ not random assignment $of C-$ versus S-status; $it is$
that $C-$ and S-corporation outcomes would have trended similarly $in$ the absence $of$
the tax $cut”$
Justifications:
1. $“C-$ and S-corporations $of$ the same ages operate $in$ the same narrow industries and
$at$ the same $scale”$
2. $“Contemporaneous$ stimulative tax provisions applied almost $identically”$
3. $“Key$ outcomes empirically trended similarly for $C-$ and S-corporations before $2003”$

### p. 25 — Yagan (2015): Plotting raw data

What would you ask the author?

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Panel A. Investment

[Figure: Investment per dollar of lagged capital vs. Year (1998-2008) for C-corporations and S-corporations]

Year
98 99 00 01 02 03 04 05 06 07 08

C-corporations
S-corporations

Panel D. Total payouts to shareholders

[Figure: Payouts per dollar of lagged revenue vs. Year (1998-2008) for C-corporations and S-corporations]

Year
98 99 00 01 02 03 04 05 06 07 08

C-corporations (left scale)
S-corporations (right scale)

200% [$0.0063]
150% [$0.0047]
100% [$0.0031]

200% [$0.075]
150% [$0.056]
100% [$0.037]

What would you ask the author?

### p. 26 — #3: Pre-testing problems (Roth, 2022)

Estimators of causal effects and pre-trends are correlated, e.g. by using the same
reference period
$$(\bar{Y}_{treated,E+h} -\bar{Y}_{control,E+h}) -(\bar{Y}_{treated,E-1} -\bar{Y}_{control,E-1})$$
vs.
$$(\bar{Y}_{treated,E-\ell}-\bar{Y}_{control,E-\ell}) -(\bar{Y}_{treated,E-1} -\bar{Y}_{control,E-1})$$
Suppose you only report the results if some pre-trend test doesn’t reject
(“pre-testing”)
If PTA holds, you are distorting inference for causal effects
If PTA doesn’t hold, you are changing the bias; under some conditions increase it

#### p. 26 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: control, treated._

Estimators of causal effects and pre-trends are correlated, e.g. by using the same reference period

$$
\left(Y_{treated, E+h} - Y_{control, E+h}\right) - \left(Y_{treated, E-1} - Y_{control, E-1}\right)
\text{ vs. }
\left(Y_{treated, E-\ell} - Y_{control, E-\ell}\right) - \left(Y_{treated, E-1} - Y_{control, E-1}\right)
$$

-  Suppose you only report the results if some pre-trend test doesn’t reject ("pre-testing")
-  If PTA holds, you are distorting inference for causal effects
-  If PTA doesn’t hold, you are changing the bias; under some conditions increase it

23

### p. 27 — #4: Event studies conflate estimation and testing

Borusyak et al. (2024):
If PTA holds, why not use all pre-periods for more efficient estimation?
$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$
$$X$$
$$h\geq 0$$
$\tau_{h}1 [t -E = h] \times G_{i} + \epsilon_{it}$
with all $t < E$ as reference periods ($\hat{\tau}_{h}= (\bar{Y}_{tr,E+h} -\bar{Y}_{tr,pre}) -(\bar{Y}_{co,E+h} -\bar{Y}_{co,pre})$)
Testing PTA is a separate exercise: using untreated data only,
$Y_{it}= \tilde{\alpha}_{i} + \tilde{\beta}_{t} +$
$$-1$$
$$X$$
$$h=-L$$
$\tau_{h}1 [t -E = h] \times G_{i} + \epsilon_{it}$
with $t < E -L$ reference periods ($\hat{\tau}_{h}= (\bar{Y}_{tr,E+h} -\bar{Y}_{tr,t<E-L}) -(\bar{Y}_{co,E+h} -\bar{Y}_{co,t<E-L})$)

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: axis, labeled, line, outcome, scatterplot, time, treated, trend._

Borusyak et al. (2024):

- If PTA holds, why not use all pre-periods for more efficient estimation?

$$Y_{it} = \bar{\alpha}_i + \beta_t + \sum_{h>0} \tau_h [1_{\{t-E = h\}} \times G_i + \epsilon_{it}$$

with all $t < E$ as reference periods ($\hat{\tau}_h = (Y_{tr,E+h} - Y_{tr,pre}) - (Y_{co,E+h} - Y_{co,pre})$)

- Testing PTA is a separate exercise: using untreated data only.

$$Y_{it} = \bar{\alpha}_i + \beta_t + \sum_{h=-L}^{-1} \tau_h [1_{\{t-E = h\}} \times G_i + \epsilon_{it}$$

with $t < E-L$ reference periods ($\hat{\tau}_h = (Y_{tr,E+h} - Y_{tr,t<E+h}) - (Y_{co,E+h} - Y_{co,t<E-L})$)

[Figure: A scatterplot with a trend line, labeled "Untreated data" and "Treated data". The x-axis is labeled "Time". The y-axis is labeled "Outcome".]

24

### p. 28 — #5: Pre-trend tests are not always conceptually informative

Mann and Pozzoli (2024) study the effects of low-skill immigration into Danish
municipalities on industrial robot adoption by firms in 1995-2019
How informative are their regressions of pre-period (1993-95) changes in robot
adoption and other variables on the 1995-2019 change in low-skill immigration?

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Mann and Pozzoli (2024) study the effects of low-skill immigration into Danish municipalities on industrial robot adoption by firms in 1995-2019

- How informative are their regressions of pre-period (1993-95) changes in robot adoption and other variables on the 1995-2019 change in low-skill immigration?

[Figure: Table 3. Pre-sample trends and long-run changes in robotization.]

|  | $\Delta$ robot users (broad) (1993-1995) (1) | $\Delta$ imports (1993-1995) (2) | $\Delta$ exports (1993-1995) (3) |
|---|---|---|---|
| $\Delta$ Non-West Img (1995-2019) | 0.476 (0.583) | 0.300 (0.262) | -0.272 (0.482) |
| N | 94 | 94 | 94 |
| R-sq | 0.355 | 0.166 | 0.067 |

25

### p. 29 — #6: Pre-trend tests are not always powerful (Roth, 2022)

E.g. He and Wang (2017) study the effects of college-graduated bureaucrats placed to
Chinese villages on a measure of poverty
(From Jonathan Roth’s Mixtape Session slides)

#### p. 29 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

E.g. He and Wang (2017) study the effects of college-graduated bureaucrats placed to Chinese villages on a measure of poverty

[Figure: Effect on Subsidized Population, Estimated Coefficients, x-axis: -4, -3, -2, -1, 0, 1, 2, 3, y-axis: -0.4, 0.0, 0.4]

(From Jonathan Roth’s Mixtape Session slides)

26

### p. 30 — #6: Pre-trend tests are now always powerful (Roth, 2022)

(From Jonathan Roth’s Mixtape Session slides)
$“The$ estimated coefficients $on$ the leads $of$ treatment $...$ are statistically indifferent
from $0. ... We$ conclude that the pretreatment trends $in$ the outcomes $in$ both
groups $of$ villages are similar, and villages without [treatment] can serve $as a$
suitable control group for villages with [treatment] $in$ the treatment $period.”$

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Effect on Subsidized Population, Estimated Coefficients vs. Time]

- “The estimated coefficients on the leads of treatment … are statistically indifferent from 0 … We conclude that the pretreatment trends in the outcomes in both groups of villages are similar, and villages without [treatment] can serve as a suitable control group for villages with [treatment] in the treatment period.”

### p. 31 — #6: Pre-trend tests are now always powerful (Roth, 2022)

(From Jonathan Roth’s Mixtape Session slides)

#### p. 31 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Effect on Subsidized Population

[Figure: Estimated Coefficients, x-axis: -4 to 3, y-axis: -0.4 to 0.4, red line with error bars]

(From Jonathan Roth’s Mixtape Session slides)

28

### p. 32 — The “Straight line test”

The more nonlinearity is needed to kill the effects, the more robust the results are
See Stata and R package pretrends accompanying Roth (2022)
Having many pre-periods is also important

#### p. 32 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- The more nonlinearity is needed to kill the effects, the more robust the results are
  [Figure: Two graphs. The left graph has the title "Coefficient" on the y-axis and "Event Time" on the x-axis. The right graph has the title "Coefficient" on the y-axis and "Event Time" on the x-axis. Both graphs show data points with error bars.]
- See Stata and R package pretrends accompanying Roth (2022)
- Having many pre-periods is also important

29

### p. 33 — References I

Borusyak, K., X. Jaravel, and J. Spiess (2024): “Revisiting Event Study Designs: Robust and
Efficient Estimation,” Review $of$ Economic Studies, 91, 3253–3285.
Card, D. and A. Krueger (1994): “Minimum Wages and Employment: A Case Study of the
Fast-Food Industry in New Jersry and Pennsylvania,” The American Economic Review, 84, 772–793.
——— (2000): “Minimum Wages and Employment: A Case Study of the Fast-Food Industry in New
Jersey and Pennsylvania: Reply,” American Economic Review, 90, 1397–1420.
Goldsmith-Pinkham, P. (2024): “Tracking the Credibility Revolution across Fields,” Working
Paper.
He, G. and S. Wang (2017): “Do College Graduates Serving as Village Officials Help Rural China?”
American Economic Journal: Applied Economics, 9, 186–215.
Mann, K. and D. Pozzoli (2024): “Robots and immigration,” Journal $of$ Economic Behavior $&$
Organization, 227, 106708.
Miller, S., N. Johnson, and L. R. Wherry (2021): “Medicaid and Mortality: New Evidence
From Linked Survey and Administrative Data,” The Quarterly Journal $of$ Economics, 136,
1783–1829.

### p. 34 — References II

Roth, J. (2022): “Pre-test with Caution: Event-study Estimates After Testing for Parallel Trends,”
American Economic Review: Insights, 4, 305–322.
Roth, J. and P. H. Sant’Anna (2023a): “Efficient Estimation for Staggered Rollout Designs,”
JPE: Micro, arXiv: 2102.01291.
——— (2023b): “When Is Parallel Trends Sensitive to Functional Form?” Econometrica, 91.
Yagan, D. (2015): “Capital Tax Reform and the Real Economy: The Effects of the 2003 Dividend
Tax Cut,” American Economic Review, 105, 3531–3563.

## Extraction Gaps

- p. 2: figure or diagram present
- p. 5: figure or diagram present
- p. 6: display math with drawn rules
- p. 7: display math with drawn rules; figure or diagram present
- p. 8: display math with drawn rules
- p. 9: display math with drawn rules; large delimiter (matrix or cases)
- p. 10: figure or diagram present
- p. 11: figure or diagram present
- p. 12: display math with drawn rules; figure or diagram present
- p. 15: display math with drawn rules
- p. 16: display math with drawn rules; large delimiter (matrix or cases); layout reconstruction withheld: it wrote math the page does not have
- p. 17: display math with drawn rules
- p. 18: figure or diagram present
- p. 22: figure or diagram present
- p. 25: figure or diagram present
- p. 26: display math with drawn rules
- p. 27: display math with drawn rules
- p. 28: figure or diagram present
- p. 29: figure or diagram present
- p. 30: figure or diagram present
- p. 31: figure or diagram present
- p. 32: figure or diagram present
