# C1: IV Idea and Mechanics; Weak IV Translation

## Source

- PDF: `literature/raw_pdf/C1_IV_basics.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/C1_IV_basics.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 65/65 pages, word recall 0.993, words not in the text layer 0.001.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part C: Instrumental Variables
- p. 2: Part C outline
- p. 3: C1 outline
- p. 4: Instrumental variable DAGs
- p. 5: Instrumental variable DAGs (2)
- p. 6: IV with constant effects
- p. 7: IV identification with constant effects
- p. 8: Example 1: Angrist and Krueger (1991)
- p. 9: First stage
- p. 10: Reduced form
- p. 11: Exogeneity of QoB
- p. 12: Example 2: Encouragement designs
- p. 13: RCT with two-sided noncompliance
- p. 14: Example 3: Ingenious IVs from natural experiments
- p. 15: Example 4: Historical instruments
- p. 16: Example 4: Historical instruments (cont.)
- p. 17: Example 5: Overusing an instrument
- p. 18: Usage of rainfall IV
- p. 19: Often (but not always) a problem
- p. 20: Failure of exogeneity
- p. 21: Example 6: IV for structural equations
- p. 22: Recap
- p. 23: Outline
- p. 24: IV identification and estimation
- p. 25: Angrist and Krueger with single binary IV
- p. 26: Two-stage least squares (2SLS)
- p. 27: IV with included controls
- p. 28: IV with included controls (2)
- p. 29: IV with included controls (3)
- p. 30: Multiple endogenous variables & IVs
- p. 31: Overidentified case
- p. 32: 2SLS as a control function estimator
- p. 33: Control function approach to IV
- p. 34: Outline
- p. 35: IV for classical measurement error
- p. 36: Bias of OLS
- p. 37: IV estimation is immune
- p. 38: Lessons
- p. 39: Outline
- p. 40: Weak IV: Overview
- p. 41: Weak IV: Overview (2)
- p. 42: Weak IV: Overview (3)
- p. 43: Sensitivity to exogeneity violations
- p. 44: Large asymptotic variance of IV
- p. 45: $F$-statistics
- p. 46: Finite-sample bias towards OLS
- p. 47: Monte Carlo: Single strong IV
- p. 48: Tests and coverage: Single strong IV
- p. 49: Monte Carlo: Weak IV
- p. 50: Tests and coverage: Weak IV
- p. 51: Monte Carlo: Many IV
- p. 52: Tests and coverage: Many IV
- p. 53: Many IV bias in practice
- p. 54: What to do?
- p. 55: Pre-testing for weak IVs
- p. 56: Pre-testing for weak IVs (2)
- p. 57: Weak-robust inference
- p. 58: Properties of AR confidence intervals
- p. 59: Alternative estimators with overidentification: LIML
- p. 60: Alternative estimators: JIVE
- p. 61: Aside: Two-Sample IV
- p. 62: References I
- p. 63: References II
- p. 64: References III
- p. 65: References IV

## Comprehensive Translation

### p. 1 — Part C: Instrumental Variables

C1: IV Idea and Mechanics; Weak IV
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — Part C outline

1. Assumptions, uses, and mechanics of IV; weak IV
2. IV with treatment effect heterogeneity
3. Examiner designs (“judge IVs”)

### p. 3 — C1 outline

1
Setting and Examples
2
IV mechanics
3
IV for classical measurement error
4
Weak and Many (Weak) IVs
Readings:
$IV$ Mechanics: MHE (Ch. 4.1, 4.2.1, 4.6.4), Wooldridge (Ch. 5)
Weak $IV:$ Andrews et al. (2019, Annual Review of Economics), Imbens and
Wooldridge (Lecture 15)

### p. 4 — Instrumental variable DAGs

Exclusion: $Y(d, z) = Y(d, z') \equiv Y(d)$ for all $d, z, z'$
Independence (“as-good-as-random assignment”): $Z \perp \perp Y(d)$ for all $d$
Exclusion + independence = instrument exogeneity (a.k.a. orthogonality)
- $Z$ is only correlated with $Y$ if there is a causal effect of $D$ on $Y$
- Calling $Z$ an “excluded instrument” is somewhat misleading

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Three instrumental variable DAGs. The first has Z -> D -> Y. The second has Z -> D and D -> Y and D -> Y. The third has Z -> D and Z -> Y and D -> Y.]

- Exclusion: $Y(d, z) = Y(d, z')$ for all $d, z'$
- Independence ("as-good-as-random assignment"): $Z \perp Y(d)$ for all $d$
- Exclusion + independence = instrument exogeneity (a.k.a. orthogonality)
  -  $Z$ is only correlated with $Y$ if there is a causal effect of $D$ on $Y$
  -  Calling $Z$ an "excluded instrument" is somewhat misleading

### p. 5 — Instrumental variable DAGs (2)

Relevance: $D(z)\neq  D(z')$ with non-zero probability for some $z, z'$
Exogeneity + relevance = instrument validity
Note: non-causal first stage is also fine
- E.g. $D_{i}=$ import penetration from China in industry $i$ in the US
- $Z_{i}$= import penetration from China in Europe; $F_{i}$= ?

#### p. 5 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Relevance: $D(z) \neq D(z')$ with non-zero probability for some $z, z'$
- Exogeneity + relevance = instrument validity
- Note: non-causal first stage is also fine

[Figure: Instrumental variable DAGs (2)]

- E.g. $D_{i}$ = import penetration from China in industry $i$ in the US
- $Z_{i}$ = import penetration from China in Europe; $F_{i}$ = ?

### p. 6 — IV with constant effects

Structural equation: $Y_{i}= Y(D_{i}, -\to$
$$\epsilon_{i} )$$
=$\Rightarrow$
$Y_{i}= \tau D_{i} + \epsilon_{i}$(suppressing
intercepts)
First stage: $D_{i}= D(Z_{i}, -\to$
$u_{i} )$
=$\Rightarrow$
$$D_{i}= \pi Z_{i} + u_{i}$$
Relevance: $\pi \neq  0$ (assuming Cov $[Z_{i}, u_{i}] = 0$ by construction)
Instrument exogeneity: Cov $[Z_{i}, \epsilon_{i}] = 0$
Treatment endogeneity: Cov $[\epsilon_{i}, u_{i}]\neq  0$
Reduced-form equation: $Y_{i}= \tau \pi Z_{i} + (\epsilon_{i} + \tau u_{i}) \equiv \rho Z_{i} + e_{i}$

#### p. 6 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: arrows, diagram, direction, epsilon, indicate, influence, influencing._

- Structural equation: $Y_i = y(D_i, \vec{\epsilon}_i)$ $\Rightarrow$ $Y_i = \tau D_i + \epsilon_i$ (suppressing intercepts)
- First stage: $D_i = D(Z_i, u_i)$ $\Rightarrow$ $D_i = \pi Z_i + u_i$
- Relevance: $\pi \neq 0$ (assuming Cov $[Z_i, u_i] = 0$ by construction)
- Instrument exogeneity: Cov $[Z_i, \epsilon_i] = 0$
- Treatment endogeneity: Cov $[\epsilon_i, u_i] \neq 0$
- Reduced-form equation: $Y_i = \tau Z_i + (\epsilon_i + \tau u_i) \equiv \rho Z_i + e_i$
[Figure: IV diagram with Z influencing D and Y, D influencing Y, and epsilon influencing Y. Arrows indicate direction of influence.]

### p. 7 — IV identification with constant effects

Take 1:
- Cov $[Z_{i}, u_{i}] = 0 \Rightarrow$ First-stage OLS is consistent for $\pi$
- Cov $[Z_{i}, e_{i}] = 0 \Rightarrow$ Reduced-form OLS is consistent for $\rho = \tau \pi$
- We have $\tau = \rho /\pi =$ Reduced-form $/$ First-stage $=$ Cov $[Z_{i}, Y_{i}] /$ Cov $[Z_{i}, D_{i}]$
Take 2: Cov $[Z_{i}, \epsilon_{i}] = 0$ where $\epsilon_{i}= Y_{i} -\tau D_{i}$
- Solving Cov $[Z_{i}, Y_{i}] -\tau$ Cov $[Z_{i}, D_{i}] = 0$ yields the same answer

### p. 8 — Example 1: Angrist and Krueger (1991)

Estimate returns to schooling: $D$ = years of schooling, $Y$ = log earnings
OLS should be biased upwards: unobserved ability
$Z$ = quarter of birth dummies
Relevance: structure of compulsory schooling laws in the US
- Children born in Q4 start school a year earlier than those born in Q1 next year
- But can drop out at the same time upon reaching certain age, e.g. 16
- Q1-born get less schooling

### p. 9 — First stage

#### p. 9 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: A line graph showing average years of education by quarter of birth. The x-axis is labeled "Year of Birth" and ranges from 30 to 39. The y-axis is labeled "Years of Education" and ranges from 12.2 to 13.2. Data points are plotted and connected by a line. Several data points are labeled with numbers 1, 2, 3, and 4. The graph shows fluctuations in average education levels over the years, with some years showing higher or lower average education. The graph is titled "A. Average Education by Quarter of Birth (first stage)".]

7

### p. 10 — Reduced form

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Average Weekly Wage by Quarter of Birth (reduced form)

[Figure: Log Weekly Earnings vs. Year of Birth, with points labeled 1, 2, 3, 4]

8

### p. 11 — Exogeneity of QoB

Exclusion: no other mechanism through which QoB affects earnings
- Bound, Jaeger, and Baker (1995): QoB can affect school attendance, mental health issues
Independence: QoB is not affected by factors correlated with potential earnings
- Buckles and Hungerman (2013): Q1 births disproportionally happen to teenagers and unmarried mothers

### p. 12 — Example 2: Encouragement designs

$D$ = taking an experimental pill, $Y$ = health outcome
$Z$ = dummy for being invited to receive the pill (with an option to decline)
OLS bias?
Relevance?
Independence?
Exclusion?

### p. 13 — RCT with two-sided noncompliance

Angrist (1990): The impact of serving in Vietnam war ($D_{i}$) on future earnings ($Y_{i}$)
- Draft was based on televised lottery
- Men with low lottery numbers were enlisted first
- Still, some of them can avoid serving, while others can volunteer
- $Z_{i}$= bins of lottery numbers

### p. 14 — Example 3: Ingenious IVs from natural experiments

Angrist and Evans (1998): How does the number of kids affect mother’s labor
supply?
- Among mothers with 2+ kids, $D_{i}$= having 3+ kids
- $Z_{1i}$: twins at second birth
- $Z_{2i}$: first two kids are both boys or both girls

### p. 15 — Example 4: Historical instruments

Duranton and Turner (2012) study the impact of a region’s connection to
interstate highways in 1983 on urban growth 1983–2003
They worry about strategic placement of highways:

#### p. 15 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- Duranton and Turner (2012) study the impact of a region’s connection to interstate highways in 1983 on urban growth 1983–2003

- They worry about strategic placement of highways:

Our primary identification problem is the simultaneous determination of urban growth and transportation infrastructure. While one hopes that cities with high predicted employment and population growth receive new transportation infrastructure, we fear that such infrastructure is allocated to places with poor prospects. The resolution of this problem requires finding suitable instruments for transportation infrastructure. Our analysis suggests that such instruments should reflect either a city’s level of transportation infrastructure at some time long ago or ...

13

### p. 16 — Example 4: Historical instruments (cont.)

They use density of railroads in 1898 and highways in the plan of 1947 as IVs:
Exclusion?
Independence?

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- They use density of railroads in 1898 and highways in the plan of 1947 as IVs:

The a priori case for thinking that 1898 railroad kilometres satisfy exogeneity condition (17) rests on the length of time since railroads were built and the fundamental changes in the nature of the economy in the intervening years. The rail network was built, for the most part, during and immediately after the civil war, and during the industrial revolution.

Furthermore, the rail network was constructed by private companies who were looking to make a profit from railroad operations in the not too distant future (Fogel, 1964; Fishlow, 1965). It is difficult to imagine a rail network built for profit during the civil war and the industrial revolution could affect economic growth in cities 100 years later save through its effect on roads.

- Exclusion?

- Independence?

14

### p. 17 — Example 5: Overusing an instrument

Gallen and Raymond (2023) identify several instruments used for many endogenous
variables
- Local topography: presence of bodies of water and changes in elevation
- Sibling characteristics in a family, e.g. having a twin
- Ethnolinguistic fractionalization
- Religion
- Weather, e.g. rainfall

### p. 18 — Usage of rainfall IV

From Mellon (2024, AJPS); orange = $D$, purple = $Y$; circle size = # of studies

#### p. 18 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Rainfall network diagram with numerous nodes and connections. Nodes are labeled with various terms, and connection thickness represents the number of studies. Color coding is used: orange = D, purple = Y, and black = # of studies.]

From Mellon (2024, AJPS);
- Y<sub>it</sub>: size = # of studies

### p. 19 — Often (but not always) a problem

Problem
OK for $D_{1}\to Y$
OK (see Mellon (2024))

#### p. 19 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Z, D1, D2, Y, Problem, OK for D1 -> Y, OK (see Mellon (2024))]

17

### p. 20 — Failure of exogeneity

Studies of the impacts of income on conflict often instrument for income with
rainfall
Sarsons (2015) shows that exogeneity is violated
- Focuses on a subset of villages in India with a significant reduced-form
- But no first-stage because of... dams

### p. 21 — Example 6: IV for structural equations

IV was developed to deal with simultaneity in a system of structural equations
- Wright (1928) foundational study of the demand and supply for flaxseed
- IV in the supply equation: demand curve shifter (price of cottonseed, a substitute)
- IV in the demand equation: supply curve shifter (flaxseed yield per acre)
IV exogeneity is about the error term, not the endogenous variable
- Demand and supply have the same RHS variable (price) but require different IVs
$$Q = \tau_{d}P + \epsilon_{d},$$
$Q = \tau_{s}P + \epsilon_{s}$
- Demand and inverse demand have different RHS variables but the same IV
$$Q = \tau_{d}P + \epsilon_{d}$$
$$\Leftarrow \Rightarrow$$
$P = 1$
$\tau_{d}$
$Q -1$
$\tau_{d}$
$\epsilon_{d}$

#### p. 21 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- IV was developed to deal with simultaneity in a system of structural equations
  - Wright (1928) foundational study of the demand and supply for flaxseed
  - IV in the supply equation: demand curve shifter (price of cottonseed, a substitute)
  - IV in the demand equation: supply curve shifter (flaxseed yield per acre)
- IV exogeneity is about the error term, not the endogenous variable
  - Demand and supply have the same RHS variable (price) but require different IVs
  $$Q = \tau_d P + \epsilon_d$$
  $$Q = \tau_s P + \epsilon_s$$
  - Demand and inverse demand have different RHS variables but the same IV
  $$Q = \tau_d P + \epsilon_d \longleftrightarrow P = \frac{1}{\tau_d} Q - \frac{1}{\tau_d} \epsilon_d$$

19

### p. 22 — Recap

Exclusion and independence are distinct conditions
Independence is guaranteed with random assignment, but exclusion may still fail
Theory or common sense may promise exclusion, but independence may still fail
Economically exogenous (e.g. historical and not strategically chosen)$\not$ =$\Rightarrow$
econometrically exogenous
If two studies use the same $Z$ for different $D$ but the same $Y$, exclusion likely fails
for both
Exogeneity requires thinking about $\epsilon$ (structural error or potential outcomes)

### p. 23 — Outline

1
Setting and Examples
2
IV mechanics
3
IV for classical measurement error
Weak and Many (Weak) IVs

### p. 24 — IV identification and estimation

With constant effects, exogeneity implies moment condition: Cov $[Z_{i}, Y_{i} -\tau D_{i}] = 0$
Thus, if Cov $[Z_{i}, D_{i}]\neq  0$,
$\tau =$ Cov $[Z^{i}, Y^{i}]$
Cov $[Z_{i}, D_{i}] =$ Cov $[Z^{i}, Y^{i}] /$ Var $[Z^{i}]$
Cov $[Z_{i}, D_{i}] /$ Var $[Z_{i}] \equiv$ Reduced-form
First-stage
If $Z_{i}$ is binary, IV = Wald estimand:
$$\tau = \mathbb{E} [Y^{i}\mid Z^{i}= 1] -\mathbb{E} [Y^{i}\mid Z^{i}= 0]$$
$$\mathbb{E} [D_{i}\mid Z_{i}= 1] -\mathbb{E} [D_{i}\mid Z_{i}= 0]$$
Estimator = sample analog

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- With constant effects, exogeneity implies moment condition: $Cov[Z_{i}, Y_{i} - \tau D_{i}] = 0$

- Thus, if $Cov[Z_{i}, D_{i}] \neq 0$,
$$ \tau = \frac{Cov[Z_{i}, Y_{i}]}{Cov[Z_{i}, D_{i}]} = \frac{Cov[Z_{i}, Y_{i}] / Var[Z_{i}]}{Cov[Z_{i}, D_{i}] / Var[Z_{i}]} = \frac{Reduced-form}{First-stage} $$

- If $Z_{i}$ is binary, IV = Wald estimand:
$$ \tau = E[Y_{i} | Z_{i} = 1] - E[Y_{i} | Z_{i} = 0] - E[D_{i} | Z_{i} = 1] + E[D_{i} | Z_{i} = 0] $$

- Estimator = sample analog

[Figure: 21]

### p. 25 — Angrist and Krueger with single binary IV

(Reproduced from MHE)

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Table 4.1.2: Wald estimates of the returns to schooling using quarter of birth instruments

| | (1) Born in the 1st or 2nd quarter of year | (2) Born in the 3rd or 4th quarter of year | (3) Difference (std. error) (1)-(2) |
|---|---|---|---|
| ln (weekly wage) | 5.8916 | 5.9051 | -0.01349 (0.00337) |
| Years of education | 12.6881 | 12.8394 | -0.1514 (0.0162) |
| Wald estimate of return to education |  |  | 0.0891 (0.0210) |
| OLS estimate of return to education |  |  | 0.0703 (0.0005) |

(Reproduced from MHE)

22

### p. 26 — Two-stage least squares (2SLS)

Take first-stage fitted values $\hat{D}_{i}= \pi Z_{i}$ and regress $Y_{i}$ on $\hat{D}_{i}$(“second stage”):
$\tau_{2SLS}=$
Cov
$[$
$$Y_{i}, \hat{D}_{i}$$
$$]$$
Var
$[$
$$\hat{D}_{i}$$
$$]$$
$$=$$
Cov
$$[$$
$$Y_{i}, \hat{D}_{i}$$
$$]$$
Cov
$$[$$
$$D_{i}, \hat{D}_{i}$$
$] =$ Cov $[Y^{i}, Z^{i}]$
Cov $[D_{i}, Z_{i}] = \tau^{IV}$
Avoid doing 2SLS manually:
- SE are incorrect because they don’t account for estimation noise of $\pi$
- Easy to make mistakes, e.g. with controls

#### p. 26 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: bullet, equations, number, points, slide._

- Take first-stage fitted values $\hat{D}_i = \pi Z_i$ and regress $Y_i$ on $\hat{D}_i$ ("second stage"):

$$ \tau_{2SLS} = \frac{Cov[Y_i, \hat{D}_i]}{\text{Var}[\hat{D}_i]} = \frac{Cov[Y_i, \hat{D}_i]}{\text{Cov}[\hat{D}_i, \hat{D}_i]} = \frac{Cov[Y_i, Z_i]}{\text{Cov}[D_i, Z_i]} = \tau_{IV} $$

- Avoid doing 2SLS manually:
  -  SE are incorrect because they don't account for estimation noise of $\pi$
  -  Easy to make mistakes, e.g. with controls

[Figure: Equations, bullet points, slide number 23]

### p. 27 — IV with included controls

Expand structural equation, first-stage, and reduced-form to:
$$Y_{i}= \tau D_{i} + \kappa '$$
$$_{SE}X_{i}+ \epsilon_{i}$$
$$D_{i}= \pi Z_{i} + \kappa '$$
$$_{FS}X_{i}+ u_{i}$$
$$Y_{i}= \rho Z_{i} + \kappa '$$
$$_{RF}X_{i}+ e_{i}$$
Assume exogeneity $\mathbb{E} [Z_{i}\epsilon_{i}] = 0$
Without loss, we have $\mathbb{E} [X_{i}\epsilon_{i}] =\mathbb{E} [X_{i}u_{i}] =\mathbb{E} [Z_{i}u_{i}] = 0$
Denote $\tilde{Z}$ residuals from regressing $Z$ on $X$; similar for $\tilde{Y}$, $\tilde{D}$
There are several equivalent ways to get the IV estimand/estimator...

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Expand structural equation, first-stage, and reduced-form to:
  $$Y_{it} = T D_{i} + \kappa^{SE}X_{i} + \epsilon_{i}$$
  $$D_{i} = \pi Z_{i} + \kappa^{FS}X_{i} + u_{i}$$
  $$Y_{i} = \rho Z_{i} + \kappa^{RE}X_{i} + \epsilon_{i}$$

- Assume exogeneity $E[Z_{i}\epsilon_{i}] = 0$

- Without loss, we have $E[X_{i}\epsilon_{i}] = E[Z_{i}u_{i}] = 0$

- Denote $\tilde{Z}$ residuals from regressing $Z$ on $X$; similar for $\tilde{Y}$, $\tilde{D}$

- There are several equivalent ways to get the IV estimand/estimator...
[Figure: 24]

### p. 28 — IV with included controls (2)

1. Moment conditions: for D $_{i}= (D_{i}, X_{i})'$, $\tau = (\tau , \kappa_{SE})'$, and Z $_{i}= (Z_{i}, X_{i})'$,
$\mathbb{E} [$ Z $_{i}(Y_{i} -$ D $'$
$$_{i}\tau )] = 0$$
=$\Rightarrow$
$\tau =\mathbb{E} [$ Z $_{i}$ D $'$
$_{i}]$
$-1\mathbb{E} [$ Z $_{i}Y_{i}]$
if $\mathbb{E} [$ Z $_{i}$ D $'$
$_{i}]$ is full-rank (relevance)
2. Run first-stage and reduced-form regressions, take $\hat{\tau} = \hat{\rho} /\hat{\pi}$
3. By FWL, using $\tilde{Z}$ as an IV
$\tau =$
Cov
$[$
$\tilde{Z}_{i}, Y_{i}$
$]$
Cov
$[$
$\tilde{Z}_{i}, D_{i}$
$] =$
Cov
$$[$$
$$\tilde{Z}_{i}, Y_{i}$$
$$]$$
$/$ Var
$$[$$
$$\tilde{Z}_{i}$$
$$]$$
Cov
$$[$$
$$\tilde{Z}_{i}, D_{i}$$
$$]$$
$/$ Var
$$[$$
$$\tilde{Z}_{i}$$
$] \equiv$ Reduced-form with controls
First-stage with controls

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

1. Moment conditions: for $D_i = (D_{it}, X_i)'$, $\tau = (\tau, k_{SE})'$, and $Z_i = (Z_{it}, X_i)'$,

$$E[Z_i (Y_i - D_i' \tau)] = 0 \implies \tau = E[Z_i D_i']^{-1} E[Z_i Y_i]$$

if $E[Z_i D_i']$ is full-rank (relevance)

2. Run first-stage and reduced-form regressions, take $\hat{\rho} = \hat{p} \hat{\tau}$

3. By FWL, using $Z_i$ as an IV

$$\tau = \frac{Cov[Z_i, Y_i]}{Cov[Z_i, D_i]} = \frac{Cov[Z_i, Y_i] / Var[Z_i]}{Cov[Z_i, D_i] / Var[Z_i]} = \frac{\text{Reduced-form with controls}}{\text{First-stage with controls}}$$

[Figure: 25]

### p. 29 — IV with included controls (3)

4. Also by FWL, regressing $\tilde{Y}$ and $\tilde{D}$ and IV’ing with $Z$ or $\tilde{Z}$:
$\tau =$
Cov
$$[$$
$$Z_{i}, \tilde{Y}_{i}$$
$$]$$
Cov
$$[$$
$$Z_{i}, \tilde{D}_{i}$$
$$] =$$
Cov
$[$
$\tilde{Z}_{i}, \tilde{Y}_{i}$
$]$
Cov
$[$
$\tilde{Z}_{i}, \tilde{D}_{i}$
$]$
5. 2SLS: take first-stage fitted values $\hat{D}_{i}= \hat{\pi} Z_{i} + \hat{\kappa} '$
$_{FS}X_{i}$ and regress $Y_{i}$ on $\hat{D}_{i}$ and $X_{i}$

#### p. 29 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

4. Also by FWL, regressing $\tilde{Y}$ and $\tilde{D}$ and IV’ing with $Z$ or $\tilde{Z}$:

$$
\tau = \frac{Cov[Z_{i}, Y_{i}]}{Cov[Z_{i}, D_{i}]} = \frac{Cov[\tilde{Z}_{i}, \tilde{Y}_{i}]}{Cov[\tilde{Z}_{i}, \tilde{D}_{i}]}
$$

5. 2SLS: take first-stage fitted values $\tilde{D}_{i} = \hat{\pi}Z_{i} + \hat{k}_{FS}X_{i}$, and regress $Y_{i}$ on $\tilde{D}_{i}$ and $X_{i}$

26

### p. 30 — Multiple endogenous variables & IVs

Suppose we have dim $(Z_{i}) = K$ instruments for dim $(D_{i}) = J \leq K$ endogenous
variables
- Note: “included” controls are added to both lists
We have $K$ moment conditions for $J$ unknowns:
$$\mathbb{E} [Z_{i} (Y_{i} -D'$$
$$_{i}\tau )] = 0$$
Any $J$ linear combinations $\Pi 'Z_{i}$ of IVs (for $K \times J$ matrix $\Pi$ with full rank $J$) would
produce a consistent estimator:
$\mathbb{E} [\Pi 'Z_{i} (Y_{i} -D'$
$$_{i}\tau )] = 0$$
=$\Rightarrow$
$\tau = (\Pi '\mathbb{E} [Z_{i}D'$
$_{i}])^{-1} \Pi '\mathbb{E} [Z_{i}Y_{i}]$
In the just-identified case $K = J$, $\Pi$ cancels out
- There is a single IV estimator

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Suppose we have dim($Z_i$) = $K$ instruments for dim($D_i$) = $J \leq K$ endogenous variables
  - Note: “included” controls are added to both lists
- We have $K$ moment conditions for $J$ unknowns:
  $$E[Z_i(Y_i - D_i'\tau)] = 0$$
- Any $J$ linear combinations $\Pi'Z_i$ of IVs (for $K \times J$ matrix $\Pi$ with full rank $J$) would produce a consistent estimator:
  $$E[\Pi'Z_i(Y_i - D_i'\tau)] = 0 \implies \tau = (\Pi'E[Z_iD_i])^{-1}\Pi'E[Z_iY_i]$$
- In the just-identified case $K = J$, $\Pi$ cancels out
  - There is a single IV estimator

27

### p. 31 — Overidentified case

In the overidentified case $K > J$, we have many consistent estimators
2SLS uses the first-stage matrix as $\Pi$ :
$$\Pi =\mathbb{E} [Z_{i}Z'$$
$$_{i}]^{-1}\mathbb{E} [Z_{i}D'$$
$_{i}]$
i.e. using as instruments the first-stage fitted values $\Pi 'Z_{i}$
- Note: there are $J$ first-stages, each with all instruments on the RHS
Instrumenting $D_{i}$ with $\Pi 'Z_{i}$= regressing $Y$ on $\Pi 'Z_{i}$=$\Rightarrow$ 2SLS procedure
We can also test that all combinations of IVs yield the same estimate (up to noise)
- Hansen’s J-statistic for overidentifying restrictions
- If the test rejects, you don’t know which IVs violate exogeneity
- And the test can reject because of heterogeneous effects

#### p. 31 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- In the overidentified case $K > J$, we have many consistent estimators
- 2SLS uses the first-stage matrix as $\Pi$:
  $$ \Pi = E[Z_i Z_i']^{-1} E[Z_i D_i'] $$
  i.e. using as instruments the first-stage fitted values $\Pi' Z_i$
  - Note: there are $J$ first-stages, each with all instruments on the RHS
- Instrumenting $D_i$ with $\Pi' Z_i$ = regressing $Y$ on $\Pi' Z_i$ $\Rightarrow$ 2SLS procedure
- We can also test that all combinations of IVs yield the same estimate (up to noise)
- Hansen’s J-statistic for overidentifying restrictions
  - If the test rejects, you don’t know which IVs violate exogeneity
  - And the test can reject because of heterogeneous effects

### p. 32 — 2SLS as a control function estimator

We have two strategies for dealing with endogenous $D_{i}$: adding controls and IV
- Are they related to each other?
IV isolates “clean” variation in $D_{i}$
- 2SLS estimates first-stage $D_{i}= \hat{\pi} 'Z_{i} + \hat{u}_{i}$ and regresses $Y_{i}$ on $\hat{\pi} 'Z_{i}$
What if we control for “dirty” variation in $D_{i}$ instead (control function estimator)
$Y_{i}= \tau D_{i} + \mu \hat{u}_{i} +$ error
- Exercise: the two estimators are numerically the same (even with covariates)
- Converse is also true: controlling for $X_{i}$= instrumenting $D_{i}$ with its FWL residual

### p. 33 — Control function approach to IV

Is the control function approach to IV useful?
- Equivalence breaks with nonlinearities: e.g. first-stage is probit or has square terms
- Helpful when combining IVs with parametric restrictions: e.g. Heckman selection model that imposes joint normality of $\epsilon_{i}$ and latent first-stage error

### p. 34 — Outline

1
Setting and Examples
2
IV mechanics
3
IV for classical measurement error
Weak and Many (Weak) IVs

### p. 35 — IV for classical measurement error

Another use of IV is when your RHS variable has classical measurement error:
$Y_{i}= \beta X^{*}$
$i + \epsilon^{i},$
$$X^{*}$$
$i$ is what you’d like to measure
$X_{i}= X^{*}$
$i + \xi^{i},$
$X_{i}$ is what you observe
Classical measurement error: Cov $[\xi_{i}, X^{*}$
$$i ] = 0$$
Caveat: can only happen with continuous variables
- Misclassification of discrete variables is never classical: e.g. when $X^{*}$
$i , X^{i}\in \{0, 1\}$,
$$X^{*}$$
$$i = 0$$
=$\Rightarrow$
$\xi_{i}\geq 0$
$$X^{*}$$
$$i = 1$$
=$\Rightarrow$
$\xi_{i}\leq 0$
so Cov $[\xi_{i}, X^{*}$
$i ] < 0$

#### p. 35 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Another use of IV is when your RHS variable has classical measurement error:
  $$Y_{it} = \beta X_{it}^* + \epsilon_i$$
  $X_{it}^*$ is what you'd like to measure
  $$X_{it} = X_{it}^* + \xi_i$$
  $X_{it}$ is what you observe

- Classical measurement error: $Cov[\xi_i, X_{it}^*] = 0$

- Caveat: can only happen with continuous variables
  - Misclassification of discrete variables is never classical: e.g. when $X_{it}^*, X_{it} \in \{0, 1\}$,
    - $X_{it}^* = 0 \implies \xi_i \geq 0$
    - $X_{it}^* = 1 \implies \xi_i \leq 0$
    so $Cov[\xi_i, X_{it}^*] < 0$

31

### p. 36 — Bias of OLS

Suppose OLS would have no bias absent measurement error: Cov $[X^{*}$
$i , \epsilon ] = 0$
OLS with mismeasured $X_{i}$ suffers from attenuation bias:
$\beta_{OLS}=$ Cov $[Y, X]$
Var $[X]$
$=$ Cov $[\beta X^{*}+ \epsilon , X^{*}+ \xi ]$
Var $[X^{*}+ \xi ]$
$= \beta$
Var $[X^{*}]$
Var $[X^{*}] +$ Var $[\xi ]$
with
Var $[X^{*}]$
$Var[X^{*}]+Var[\xi ] \in (0, 1)$ determined by the signal-to-noise ratio
Can also see this from
$$Y_{i}= \beta (X_{i} -\xi_{i}) + \epsilon_{i}= \beta X_{i} + (\epsilon_{i} -\beta \xi_{i})$$
where Cov $[X_{i}, \xi_{i}] =$ Cov $[X^{*}$
$i + \xi^{i}, \xi^{i}] =$ Var $[\xi^{i}]\neq  0$

#### p. 36 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Suppose OLS would have no bias absent measurement error: $Cov[X_i^*, \epsilon_i] = 0$

- OLS with mismeasured $X_i$ suffers from attenuation bias:
  $$ \beta_{OLS} = \frac{Cov[Y, X_i]}{Var[X_i]} = \frac{Cov[\beta X_i^* + \epsilon_i, X_i]}{Var[X_i^* + \xi_i]} = \beta \frac{Var[X^*]}{Var[X^*] + Var[\xi]} $$
  with $\frac{Var[X^*]}{Var[X^*] + Var[\xi]} \in (0, 1)$ determined by the signal-to-noise ratio

- Can also see this from
  $$ Y_i = \beta (X_i - \xi_i) + \epsilon_i = \beta X_i + (\epsilon_i - \beta \xi_i) $$
  where $Cov[X_i, \xi_i] = Cov[X_i^* + \xi_i, \xi_i] = Var[\xi_i] \neq 0$

### p. 37 — IV estimation is immune

Classical error in the RHS variable: if Cov $[Z, \epsilon ] = 0$ and Cov $[Z, \xi ] = 0$,
$\beta_{IV}=$ Cov $[Y, Z]$
Cov $[X, Z] =$ Cov $[\beta X^{*}+ \epsilon , Z]$
Cov $[X^{*}+ \xi , Z] = \beta$
Can also have non-classical measurement error in the IV: if also $Z_{i}= Z^{*}$
$i + \zeta^{i}$
$\beta_{IV}=$ Cov $[Y, Z]$
Cov $[X, Z] =$ Cov $[\beta X^{*}+ \epsilon , Z^{*}+ \zeta ]$
Cov $[X^{*}+ \xi , Z^{*}+ \zeta ] = \beta$
assuming Cov $[Z^{*}, \epsilon ] =$ Cov $[Z^{*}, \xi ] =$ Cov $[\epsilon , \zeta ] =$ Cov $[\xi , \zeta ] =$ Cov $[X^{*}, \zeta ] = 0$

### p. 38 — Lessons

1. Do not need to worry about classical error if already using IVs
- Measurement error is a possible reason why OLS estimates tend to be smaller than IV
2. When using OLS, can solve measurement error by using a second imperfect
measurement of $X_{i}$ as an IV, as long as the errors are independent
- E.g. Chalfin and McCrary (2018) instrument police-per-capita from Uniform Crime Reports data with the same from Annual Survey of Government
- And use the 2nd measure to quantify measurement error in the 1st
- Exercise: We can use $X_{1i}$ as IV for $X_{2i}$ or the other way round. What is better? Is there something better yet?

### p. 39 — Outline

1
Setting and Examples
2
IV mechanics
3
IV for classical measurement error
Weak and Many (Weak) IVs

### p. 40 — Weak IV: Overview

What is the weak IV situation?
Instruments do not provide enough variation in the endogenous variables
$K = J = 1$: low (partial) correlation of $D_{i}$ and $Z_{i}$(even if $\hat{\pi}$ is significant)
$K > J = 1$: low (partial) correlation of $D_{i}$ with all or most $Z_{ki}$
$J > 1$:
- First-stage is weak for at least one endogenous variable
- Or all individual first stages are strong, yet the same combinations of instruments predict multiple endog.vars
$\Rightarrow$ 2nd stage of 2SLS is close to perfect multicollinearity
- General condition: the 1st stage matrix $\Pi$ is close to rank-deficient

### p. 41 — Weak IV: Overview (2)

Problems:
Large sensitivity to violations of IV exogeneity
Large variance of IV estimates
Failure of the asymptotic approximation (and bootstrap, too):
- Finite-sample bias of IV estimates in the direction of OLS
- Non-Gaussian distributions of IV estimates and $t$-statistics
- Distorted coverage of tests and confidence intervals (both asymptotic and bootstrap)

### p. 42 — Weak IV: Overview (3)

Solutions:
- Pre-screening: checking that IVs are strong enough (usually via first-stage $F$-stats)
- Using “weak-robust” tests and confidence intervals (e.g. Anderson-Rubin)
- With many (even strong) IVs: replacing 2SLS with more well-behaved estimators (LIML, JIVE)
Severity of the problem and available solutions vary by:
- Number of endogenous vars: $J = 1$ vs. $J > 1$
- Just-identified vs. overidentified case: $K = J$ vs. $K > J$
- Few or many IV
See Andrews, Stock, Sun (ARE 2019) but the debate continues

### p. 43 — Sensitivity to exogeneity violations

Recall $Y_{i}= \tau D_{i} + \epsilon_{i}$ and $D_{i}= \pi Z_{i} + u_{i}$ with Cov $[Z_{i}, u_{i}] = 0$
When Cov $[Z_{i}, \epsilon_{i}]\neq  0$, it is not guaranteed that IV is less biased than OLS,
especially when the IV is weak: for a scalar IV,
$\tau_{OLS} -\tau =$ Cov $[\epsilon^{i}, D^{i}]$
Var $[D_{i}] ,$
$\tau_{IV} -\tau =$ Cov $[\epsilon^{i}, Z^{i}]$
Cov $[D_{i}, Z_{i}] =$ Cov $[\epsilon^{i}, \pi Z^{i}]$
Cov $[D_{i}, \pi Z_{i}]$
- Here Var $[\pi Z_{i}] /$ Var $[D_{i}] = R^{2}$
$FS$ from the first-stage
- If $R^{2}$
$FS = 0.01$, the covariance with the error term to go down by more $> 100$ times
to reduce bias

### p. 44 — Large asymptotic variance of IV

For a scalar IV and under homoskedasticity Var $[\epsilon_{i}\mid Z_{i}] = \sigma^{2}$,
Var
$[\sqrt$
$$N (\hat{\tau}_{IV} -\tau )$$
$$]$$
$$\approx$$
$$\sigma^{2}$$
Var $[\pi Z_{i}] =$
$\sigma^{2}$
Var $[D_{i}] \cdot R^{2}$
$FS$
Compare with OLS when OLS is unbiased:
Var
$$[\sqrt$$
$$N (\hat{\tau}_{OLS} -\tau )$$
$$]$$
$$\approx$$
$\sigma^{2}$
Var $[D_{i}]$

#### p. 44 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- For a scalar IV and under homoskedasticity Var[${\epsilon_i} | Z_i$] = $σ^2$,
$$Var[\sqrt{N}(\hat{\tau}_{IV} - \tau)] \approx \frac{σ^2}{\text{Var}[\pi Z_i]} = \frac{σ^2}{\text{Var}[D_i] \cdot R^2_F}$$

- Compare with OLS when OLS is unbiased:
$$Var[\sqrt{N}(\hat{\tau}_{OLS} - \tau)] \approx \frac{σ^2}{\text{Var}[D_i]}$$

### p. 45 — $F$-statistics

First-stage $F$-statistics play a key role when $J = 1$
They test for $\pi = 0$ (and not also $\kappa_{FS}= 0$!) in
$$D_{i}= \pi 'Z_{i} + \kappa '$$
$$_{FS}X_{i}+ u_{i}$$
$F =^{1}$
$K \hat{\pi} ' \cdot \hat{\sum}^{-1}$
$\pi \pi \cdot \hat{\pi}$ where $\hat{\sum}$
$\pi \pi$ is the estimate of Var $[\hat{\pi} ]$
- With homoskedastic $\hat{\sum}$
$_{\pi \pi}$: “Cragg–Donald F-statistic”
- With robust $\hat{\sum}$
$_{\pi \pi}$: “Kleibergen–Paap F-statistic”
- When $K = 1$, $F = t^{2}$

#### p. 45 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

First-stage F-statistics play a key role when $J = 1$

- They test for $\pi = 0$ (and not also $\kappa_{FS} = 0!$) in
  $$D_i = \pi' Z_i + \kappa_{FS}' X_i + u_i$$

- $F = \frac{k \hat{\pi}' \cdot \sum_{\pi \pi}^{-1} \hat{\pi}}{\sum_{\pi \pi}}$ where $\sum_{\pi \pi}$ is the estimate of $Var[\hat{\pi}]$

- With homoskedastic $\sum_{\pi \pi}$: “Cragg-Donald F-statistic”
- With robust $\sum_{\pi \pi}$: “Kleibergen-Paap F-statistic”
- When $K = 1$, $F = t^2$

40

### p. 46 — Finite-sample bias towards OLS

Bound et al. (1995): with scalar $D_{i}$ and homoskedasticity, IV is biased towards
OLS in finite samples when the first-stage $F$-stat is small:
$\mathbb{E} [\hat{\tau}_{IV} -\tau ] \approx$ Cov $[\epsilon^{i}, u^{i}]$
Var $[u_{i}]$
$\cdot$
$1$
$F + 1,$
where the first factor equals OLS bias when $\pi = 0$ (and so $D_{i}= u_{i}$)
Intuition:
- With many IVs, even if all of them are completely irrelevant, the first-stage overfits and produces fitted values $\hat{D}_{i}$ approximating $D_{i}$
- With few IVs, this will happen only a bit — but the $F$-stat still reflects that
Note: In just-identified cases with Gaussian $u_{i}$, $\mathbb{E} [\hat{\tau}_{IV}]$ doesn’t exist (but think
median bias instead)

### p. 47 — Monte Carlo: Single strong IV

Set $N = 300$, true effect $\tau = 0$, OLS = 1. Strong IV: $\pi = 1$
0
.2
.4
.6
.8
Density
-4
-3
-2
-1
0
1
2
3
4
tau
Kernel density estimate
Normal density
Median bias =  0.006. Avg F-stat = 78.198
$$Density of IV estimates: \pi = 1.0, K = 1$$

#### p. 47 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Set $N = 300$, true effect $\tau = 0$, OLS = 1. Strong IV: $\pi = 1$

Density of IV estimates: $\pi = 1.0$, $K = 1$

[Figure: Density, tau, Kernel density estimate, Normal density, Median bias, Avg F-stat]

Median bias = 0.006. Avg F-stat = 78.198

### p. 48 — Tests and coverage: Single strong IV

With single strong IV, distribution of $t$-stats $\approx N(0, 1)$
0
.1
.2
.3
.4
Density
-4
-2
0
2
4
t-statistic
Kernel density estimate
Standard normal density
Coverage =  0.947
$$Density of t-statistics: \pi = 1.0, K = 1$$

#### p. 48 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: axis, label, lines, shown._

With single strong IV, distribution of t-stats $\approx N(0, 1)$

[Figure: Density of t-statistics: π = 1.0, K = 1. Y-axis label: Density. X-axis label: t-statistic. Kernel density estimate and Standard normal density lines are shown.]

Coverage = 0.947
43

### p. 49 — Monte Carlo: Weak IV

Now set $\pi = 0.1$ =$\Rightarrow$ Non-Gaussian distribution and bias
0
.05
.1
.15
Density
-4
-3
-2
-1
0
1
2
3
4
tau
Kernel density estimate
Normal density
Median bias =  0.546. Avg F-stat =  1.782
$$Density of IV estimates: \pi = 0.1, K = 1$$
(The distribution is winsorized at $\mid \hat{\tau} \mid = 4$)

#### p. 49 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Now set $\pi = 0.1 \Rightarrow$ Non-Gaussian distribution and bias

Density of IV estimates: $\pi = 0.1$, K = 1

[Figure: Density, tau, Kernel density estimate, Normal density, Median bias, Avg F-stat, (The distribution is winsorized at $|\hat{\tau}| = 4$)]

Median bias = 0.546. Avg F-stat = 1.782

(The distribution is winsorized at $|\hat{\tau}| = 4$)

### p. 50 — Tests and coverage: Weak IV

Angrist and Kolesár (2024): with $K = J = 1$, unless endogeneity is super strong, SE will
be very high and coverage is conservative
0
.2
.4
.6
Density
-2
-1
0
1
2
t-statistic
Kernel density estimate
Standard normal density
Coverage =  0.998
$$Density of t-statistics: \pi = 0.1, K = 1$$

#### p. 50 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Angrist and Kolesár (2024): with $K = J = 1$, unless endogeneity is super strong, SE will be very high and coverage is conservative

[Figure: Density of t-statistics: π = 0.1, K = 1. Kernel density estimate, Standard normal density. Coverage = 0.998]

### p. 51 — Monte Carlo: Many IV

Now set $\pi = 1$ but add $K -1$ irrelevant IVs for $K = 50$ =$\Rightarrow$ Also bias
0
.5
1
Density
-4
-3
-2
-1
0
1
2
3
4
tau
Kernel density estimate
Normal density
Median bias =  0.408. Avg F-stat =  2.565
$$Density of IV estimates: \pi = 1.0, K = 50$$

#### p. 51 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: around, axis, centered, dashed, from, labeled, line, peaks, plot, ranges, shows, solid._

Now set $\pi = 1$ but add $K-1$ irrelevant IVs for $K = 50 \Rightarrow$ Also bias

Density of IV estimates: $\pi = 1.0, K = 50$

[Figure: Density plot with x-axis labeled "tau" and y-axis labeled "Density". The plot shows a kernel density estimate (solid line) and a normal density (dashed line). The x-axis ranges from -4 to 4. The kernel density estimate peaks around tau = 1. The normal density is centered around tau = 0.]

Median bias = 0.408. Avg F-stat = 2.565

46

### p. 52 — Tests and coverage: Many IV

With many IV, first-stage overfits and appears strong =$\Rightarrow$ undercovered confidence
intervals
0
.1
.2
.3
.4
Density
-2
0
2
4
6
t-statistic
Kernel density estimate
Standard normal density
Coverage =  0.774
$$Density of t-statistics: \pi = 1.0, K = 50$$

#### p. 52 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: axis, label, line._

With many IV, first-stage overfits and appears strong $\Rightarrow$ undercovered confidence intervals

[Figure: Density of t-statistics: $\pi = 1.0$, K = 50. x-axis label: t-statistic. y-axis label: Density. Kernel density estimate line. Standard normal density line. Coverage = 0.774]

### p. 53 — Many IV bias in practice

Bound et al. (1995) reanalyze many-instrument 2SLS estimates of Angrist and
Krueger (1991)
- 30 IVs: QoB interacted with year of birth
- 180 IVs: additionally, QoB interacted with state of birth
They use randomly generated QoB instead of actual ones
- Find coefs centered near OLS, possibly significant

### p. 54 — What to do?

Report OLS as a reference point
Report and visualize first-stage estimates
Report the appropriate first-stage $F$-statistic on the instruments
Report and visualize reduced-form estimates: $“if$ the reduced form estimates are
not significantly different from zero, $...$ the effect $of$ interest $is$ either absent $or$ the
instruments are too weak $to$ detect $it”$ (Angrist and Krueger, 2001)
Report “weak-robust” confidence intervals
With $K > J$, try alternative estimators: just-identified IV; LIML or JIVE

### p. 55 — Pre-testing for weak IVs

Test for weak IV for $J = 1$ (Staiger and Stock (1997), Stock and Yogo (2005))
- Understood as worst-case bias (in % of OLS bias) or worst-case distortion of Wald test coverage
- Test: $F >$ special critical value. Heuristic: $F > 10$. Requires homoskedasticity
Montiel Olea and Pflueger (2013) extend to heteroskedastic case:
- $K = 1$: use robust (a.k.a. Kleibergen–Paap) $F$-stat, with Stock & Yogo critical values
- $K > 1$: use “effective $F$-stat” they propose ($\neq $ homoskedastic or robust), with different critical values (but not too different from Stock and Yogo)

### p. 56 — Pre-testing for weak IVs (2)

Angrist and Kolesár (2024) for $J = K = 1$, no need to worry about $F$-stats
- The worst-case is too extreme for most practical situations
For $K > 1$, Sanderson and Windmeijer (2016) test for homoskedastic case
- Can correctly reject even if each first-stage has a high $F$-stat
- See Lewis and Mertens (2024) on the worst-case with $K > 1$ and heteroskedasticity

### p. 57 — Weak-robust inference

Consider $J = 1$ but any $K$
Exogeneity implies $\rho = \tau \pi$ even with weak IVs
- $(\hat{\rho} , \hat{\pi} )$ are jointly asy. normal; can get robust variance estimate $\hat{\Sigma}$
To test $\tau = b$, use the Anderson-Rubin statistic
$AR = (\hat{\rho} -\hat{\pi} b)' \hat{V}^{-1}(b) (\hat{\rho} -\hat{\pi} b) ,$
$$\hat{V}(b) = \hat{\Sigma}_{\rho \rho} -b$$
$($
$\hat{\Sigma}_{\rho \pi} + \hat{\Sigma}_{\pi \rho}$
$)$
$+ b^{2} \hat{\Sigma}_{\pi \pi}$
- Under the null, $AR \sim \chi^{2}$
$K$ =$\Rightarrow$ Reject if $AR > \chi^{2}$
$K,1-\alpha$
- Construct confidence interval by test inversion: collect all $b$ that are not rejected
- With homoskedastic $\hat{\Sigma}$ or with $K = 1$, there is an analytical formula for the CI (Mikusheva (2010))

### p. 58 — Properties of AR confidence intervals

CI can be infinite ($=\mathbb{R}$ or, weirdly, $\mathbb{R}\ [a_{1}, a_{2}]$)
- Not surprising: when $\pi = 0$ there is no information about $\tau$
- Indeed, CI is infinite whenever can’t reject $\pi = 0$ by Wald test
With $K = J = 1$:
- CI $\neq  \emptyset$ : $\hat{\tau} = \hat{\rho} /\hat{\pi}$ is always in it (since $AR(\hat{\tau} ) = 0$), but needn’t be in the middle
- Test is asymptotically efficient (see Andrews, Stock, Sun, Section 5.1.1)
With $K > J = 1$:
- CI is empty if overidentifying restrictions are rejected ($\hat{\rho}$ is far from $\tau \hat{\pi}$ for all $\tau$ )
- Since the test is sensitive to overid. restrictions, it’s inefficient for testing $\tau = b$
- Improvements have been proposed (see Andrews et al. Section 5.2)
With $J > 1$, test inversion produces inconvenient $J$-dimensional confidence sets
- See Andrews et al. (Section 5.3) on CIs for individual coefficients

### p. 59 — Alternative estimators with overidentification: LIML

Limited information maximum likelihood (LIML):
Proposed as joint MLE estimator for the structural equation + first-stage,
assuming homoskedastic normal errors
Minimizes (homoskedastic) $AR(b)$ =$\Rightarrow$ lies within the AR conf. interval (whenever
non-empty)
Has much smaller median bias than 2SLS under weak IV
But higher variance =$\Rightarrow$ MSE comparison unclear (e.g. Blomquist and Dahlberg
(1999))
Doesn’t have moments =$\Rightarrow$ can have extreme outliers
Doesn’t work well with heterogeneous effects (Kolesar (2013))

### p. 60 — Alternative estimators: JIVE

Jackknife IV estimator (JIVE; Angrist, Imbens, and Krueger (1999)):
Avoids overfitting in the first-stage by a leave-out procedure
For each $i$ estimate the first-stage $\hat{\pi}_{-i}$ excluding observation $i$
Obtain fitted values $\tilde{D}_{i}= \hat{\pi} '$
$_{-i}Z_{i}$ and set $\hat{\tau}_{jackknife}= (\tilde{D}'D)^{-1}\tilde{D}Y$
There is a way to obtain $\hat{\tau}_{jackknife}$ without actually running the first-stage $N$ times
Small median bias but variance is typically even worse than LIML

### p. 61 — Aside: Two-Sample IV

For simplicity, consider just-identified IV, perhaps with covariates
Usual situation: observe $($ Z $,$ D $, Y)$, compute $\hat{\tau} = ($ Z $'$ D $)^{-1}$ Z $'Y$
Angrist (1990) Vietnam lottery paper:
1. Social Security data: earnings $Y$, date of birth $\to$ lottery number $Z$, covariates
(race, year of birth) — but not veteran status $D$
2. Veteran records: $Z$, $D$, covariates — but not $Y$
- Note: $Y$ and $D$ never observed together
Two-sample IV: $\hat{\tau} =$
$($
$1$
$_{N2}$ Z $'$
$_{2}$ D $_{2}$
$$)-1$$
$$1$$
$_{N1}$ Z $'$
$$_{1}Y$$
Two-sample 2SLS: $\hat{\tau} =$
$($
$\hat{}$ D
$'$
$1 \hat{}$ D $^{1}$
$)_{-1}\hat{}$ D
$$'$$
$_{1}Y$ where $\hat{}$ D $_{1}=$ Z $_{1}($ Z $'$
$_{2}$ Z $_{2})$
$-1$ Z $_{2}$ D $_{2}$ are fitted
values from the 2nd-sample first-stage computed for the 1st sample
Inoue and Solon (2010): they differ; two-sample TSLS is more efficient; derive SE

#### p. 61 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- For simplicity, consider just-identified IV, perhaps with covariates
- Usual situation: observe $(Z, D, Y)$, compute $\hat{\tau} = (Z^D)^{-1} Z^T Y$
- Angrist (1990) Vietnam lottery paper:
  - Social Security data: earnings $Y$, date of birth $\rightarrow$ lottery number $Z$, covariates (race, year of birth) — but not veteran status $D$
  - Veteran records: $Z$, $D$, covariates — but not $Y$
  -  Note: $Y$ and $D$ never observed together
- Two-sample IV: $\hat{\tau} = \left(\frac{1}{N_2} Z_2 D_2\right)^{-1} \frac{1}{N_1} Z_1^T Y$
- Two-sample 2SLS: $\hat{\tau} = \left(\hat{D}_1^T \hat{D}_1\right)^{-1} \hat{D}_1^T Y$ where $\hat{D}_1 = Z_1 (Z_2^T Z_2)^{-1} Z_2 D_2$ are fitted values from the 2nd-sample first-stage computed for the 1st sample
- Inoue and Solon (2010): they differ; two-sample TSLS is more efficient; derive SE

### p. 62 — References I

Andrews, I., J. Stock, and L. Sun (2019): “Weak Instruments in Instrumental Variable
Regression: Theory and Practice,” Annual Review $of$ Economics.
Angrist, J. and M. Kolesár (2024): “One Instrument to Rule Them All: The Bias and Coverage
of Just-ID IV,” Journal $of$ Econometrics, arXiv:2110.10556 [econ, stat].
Angrist, J. D. (1990): “Lifetime earnings and the Vietnam era draft lottery: evidence from social
security administrative records,” American Economic Review, 80, 313–336.
Angrist, J. D. and W. N. Evans (1998): “Children and Their Parents ’ Labor Supply : Evidence
from Exogenous Variation in Family,” American Economic Association, 88, 450–477.
Angrist, J. D., G. W. Imbens, and A. Krueger (1999): “Jackknife instrumental variables
estimation,” Journal $of$ Applied Econometrics, 67, 57–67.
Angrist, J. D. and A. B. Krueger (1991): “Does Compulsory School Attendance Affect
Schooling and Earnings?” Quarterly Journal $of$ Economics.
——— (2001): “Instrumental Variables and the Search for Identification: From Supply and Demand to
Natural Experiments,” Journal $of$ Economic Perspectives.

### p. 63 — References II

Blomquist, S. and M. Dahlberg (1999): “Small sample properties of LIML and jackknife IV
estimators: experiments with weak instruments,” Journal $of$ Applied Econometrics, 14, 69–88.
Bound, J., D. a. Jaeger, and R. M. Baker (1995): “Problems with Instrumental Variables
Estimation when the Correlation between the Instruments and the Endogenous Explanatory Variable
is Weak,” Journal $of$ the American Statistical Association, 90, 443–450, iSBN: 01621459.
Buckles, K. S. and D. M. Hungerman (2013): “Season of Birth and Later Outcomes: Old
Questions, New Answers,” Review $of$ Economics and Statistics, 95, 711–724.
Chalfin, A. and J. McCrary (2018): “Are U.S. Cities Underpoliced? Theory and Evidence,”
Review $of$ Economics and Statistics, 100, 167–186.
Duranton, G. and M. A. Turner (2012): “Urban Growth and Transportation,” Review $of$
Economic Studies, 79, 1407–1440.
Gallen, T. and B. Raymond (2023): “Broken Instruments,” Working Paper.
Inoue, A. and G. Solon (2010): “Two-Sample Instrumental Variable Estimators,” Review $of$
Economics and Statistics, 92, 557–561.

### p. 64 — References III

Kolesar, M. (2013): “Estimation in an Instrumental Variables Model With Treatment Effect
Heterogeneity,” 1–45.
Lewis, D. J. and K. Mertens (2024): “A Robust Test for Weak Instruments for 2SLS with
Multiple Endogenous Regressors,” Working Paper.
Mellon, J. (2024): “Rain, Rain, Go Away: 194 Potential Exclusion-Restriction Violations for Studies
Using Weather as an Instrumental Variable,” American Journal $of$ Political Science.
Mikusheva, A. (2010): “Robust confidence sets in the presence of weak instruments,” Journal $of$
Econometrics, 157, 236–247, publisher: Elsevier B.V.
Montiel Olea, J. L. and C. Pflueger (2013): “A robust test for weak instruments in Stata,”
Journal $of$ Business and Economic Statistics, 31, 358–369, arXiv: The Stata Journal ISBN:
0735-0015\r1537-2707.
Sanderson, E. and F. Windmeijer (2016): “A weak instrument F -test in linear IV models with
multiple endogenous variables,” Journal $of$ Econometrics, 190, 212–221.
Sarsons, H. (2015): “Rainfall and Conflict: A Cautionary Tale,” Journal $of$ Development Economics,
115, 62–72.

### p. 65 — References IV

Staiger, D. and J. H. Stock (1997): “Instrumental Variables Regression with Weak Instruments,”
Econometrica, 65, 557–586.
Stock, J. H. and M. Yogo (2005): “Testing for Weak Instruments in Linear IV Regression,” in
Identification and Inference for Econometric Models, 80–108.

## Extraction Gaps

- p. 4: figure or diagram present
- p. 5: figure or diagram present
- p. 6: display math with drawn rules; figure or diagram present
- p. 9: figure or diagram present
- p. 10: figure or diagram present
- p. 15: figure or diagram present
- p. 16: figure or diagram present
- p. 18: figure or diagram present
- p. 19: figure or diagram present
- p. 21: display math with drawn rules
- p. 24: display math with drawn rules
- p. 25: figure or diagram present
- p. 26: display math with drawn rules
- p. 27: display math with drawn rules
- p. 28: display math with drawn rules
- p. 29: display math with drawn rules
- p. 30: display math with drawn rules
- p. 31: display math with drawn rules
- p. 35: display math with drawn rules
- p. 36: display math with drawn rules
- p. 44: display math with drawn rules
- p. 45: display math with drawn rules
- p. 47: display math with drawn rules; figure or diagram present
- p. 48: display math with drawn rules; figure or diagram present
- p. 49: display math with drawn rules; figure or diagram present
- p. 50: display math with drawn rules; figure or diagram present
- p. 51: display math with drawn rules; figure or diagram present
- p. 52: display math with drawn rules; figure or diagram present
- p. 57: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 61: display math with drawn rules
