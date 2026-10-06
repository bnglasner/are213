# Shift-Share and Other Formula Instruments Translation

## Source

- PDF: `literature/raw_pdf/F_Spillovers_Formula_IV.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/F_Spillovers_Formula_IV.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 68/68 pages, word recall 0.985, words not in the text layer 0.003.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part F: Spillovers Effects.
- p. 2: F Outline
- p. 3: Recap of interference
- p. 4: Example: Munro (2025)
- p. 5: Bipartite interference
- p. 6: What can we do?
- p. 7: Example: Estimating local geographic spillovers with DiD
- p. 8: Example 2: Estimating direct effects in spatial RD
- p. 9: What can we do? (2)
- p. 10: What can we do? (3)
- p. 11: Outline
- p. 12: Constructed (“Formula”) treatments and instruments
- p. 13: Example: Miguel and Kremer (2004)
- p. 14: Variation 1: Nonlinear spillovers
- p. 15: Variation 2: Imperfect takeup
- p. 16: Answer key: Miguel and Kremer
- p. 17: Answer key: Nonlinear spillovers
- p. 18: Answer key: Incomplete takeup
- p. 19: Outline
- p. 20: Non-random exposure to exogenous shocks
- p. 21: Formal results
- p. 22: Formal results (2)
- p. 23: Outline
- p. 24: Application: Effects of railway upgrades
- p. 25: First task: Specifying exposure mapping(s) $D_{i}$
- p. 26: Realized 2016 network and MA growth
- p. 27: OVB problems & recentering solution
- p. 28: Actual vs. counterfactual MA growth
- p. 29: Expected and recentered MA growth
- p. 30: Testing the specification of counterfactuals
- p. 31: Employment effects of HSR
- p. 32: Inference
- p. 33: Randomization inference leveraging shock randomness
- p. 34: Outline
- p. 35: Example: Simulated instruments
- p. 36: Simulated instruments
- p. 37: Application to Obamacare
- p. 38: More examples
- p. 39: Outline
- p. 40: Shift-share IV
- p. 41: Example 0: Linear spillovers
- p. 42: Example 1: Labor supply
- p. 43: Example 2: Enclave instrument for migration
- p. 44: The SSIV exogeneity challenge
- p. 45: Outline
- p. 46: Identification from many exogenous shifts
- p. 47: Consistency
- p. 48: “Incomplete shares” case
- p. 49: Shift-level controls
- p. 50: Shift-level (“exposure-robust”) standard errors
- p. 51: Shift-level (“exposure-robust”) standard errors (2)
- p. 52: Application: “China shock” (Autor et al. (2013), ADH)
- p. 53: ADH’s shift-share approach
- p. 54–56: BHJ revisit ADH
- p. 57: Shift-share meets RD
- p. 58: Outline
- p. 59: Motivating example: Mariel Boatlift (following Card (1990))
- p. 60: Exogenous shares approach: Pooling diff-in-diffs
- p. 61: Rotemberg weights
- p. 62: Summary of two approaches to shift-share IV
- p. 63: More shift-share IV examples (Borusyak et al. (2025b))
- p. 64: Conclusion: Formula and shift-share IV
- p. 65: References I
- p. 66: References II
- p. 67: References III
- p. 68: References IV

## Comprehensive Translation

### p. 1 — Part F: Spillovers Effects.

Shift-Share and Other Formula Instruments
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — F Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs
Readings: Borusyak and Hull (2023, BH), Borusyak, Hull, and Jaravel (2022)
See also reviews by Borusyak, Hull, and Jaravel (2025b,a)

### p. 3 — Recap of interference

With interference/spillover effects, potential outcomes are $Y_{i}(d_{1}, \ldots , d_{N})$
$\Rightarrow$ There are many types of causal estimands
Direct effects: $Y_{i}(1, d_{-i}) -Y_{i}(0, d_{-i})$ for fixed $d_{-i}$, e.g. $Y_{i}(1, 0_{-i}) -Y_{i}(0, 0_{-i})$
- or $Y_{i}(1,$ D $_{-i}) -Y_{i}(0,$ D $_{-i})$ for realized D $_{-i}$
Indirect effects: $Y_{i}(d_{i},$ d $'$
$_{-i}) -Y_{i}(d_{i},$ d $_{-i})$, e.g. $Y_{i}(0, 1_{-i}) -Y_{i}(0, 0_{-i})$
Aggregate effects:
- E.g. realized vs none:
$1$
$N$
$$\sum$$
$_{i}(Y_{i}($ D $) -Y_{i}(0))$
- Global treatment effect:
$$1$$
$$N$$
$$\sum$$
$$_{i}(Y_{i}(1) -Y_{i}(0))$$

#### p. 3 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- With interference/spillover effects, potential outcomes are $Y_{it}(d_1, ..., d_N)$
  ⇒ There are many types of causal estimands
- Direct effects: $Y_i(1, d_{-i}) - Y_i(0, d_{-i})$ for fixed $d_{-i}$, e.g. $Y_i(1, 0_{-i}) - Y_i(0, 0_{-i})$
  - or $Y_i(1, D_{-i}) - Y_i(0, D_{-i})$ for realized $D_{-i}$
- Indirect effects: $Y_i(d_i, d_{-i}') - Y_i(d_i, d_{-i})$, e.g. $Y_i(0, 1_{-i}) - Y_i(0, 0_{-i})$
- Aggregate effects:
  -  E.g. realized vs none: $\frac{1}{N} \sum_i Y_i(D) - Y_i(0)$
  -  Global treatment effect: $\frac{1}{N} \sum_i (Y_i(1) - Y_i(0))$

### p. 4 — Example: Munro (2025)

Effect of randomly giving information about good schools to low-income families in
Chile on their enrollment in good schools (from Allende et al. (2019))
Munro (2025), Fig.2

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Effect of randomly giving information about good schools to low-income families in Chile on their enrollment in good schools (from Allende et al. (2019))
[Figure: Percent Allocated to Good Schools, Control Eq, Observed Eq, Treated Eq, Direct Effect, Bias, Global Effect, Munro (2025), Fig. 2]

### p. 5 — Bipartite interference

We can also have treatments assigned to intervention units $k = 1, \ldots , K$
different from outcome units $i$
- $d_{k}$= training for Uber driver $k$; $Y_{i}$= revenue from customer $i$
- $d_{k}$= installing filters at manuf. plant $k$; $Y_{i}$= pollution at location $i$
- $d_{k}$= import tariff in industry $k$; $Y_{i}$= employment in region $i$
- $d_{k}$= dummy of railway line $k$ opening; $Y_{i}$= employment in region $i$
Potential outcomes $Y_{i}(d_{1}, \ldots , d_{K})$ (No direct effects here)

### p. 6 — What can we do?

If all outcome can be arbitrarily affected by all treatments, we can’t learn anything
- We’ll use a network: which $i$ and $k$ are connected, how far they are
- And put some structure or limits on interference
- (One alternative: interference through markets; Munro et al. (2025); Munro (2025))
Approach #1: local interference
- Assume $Y_{i}$ can only depend on $d_{k}$ if dist $(i, k) < M$ (but dependence can be complex and unknown)
- E.g. only my friends’ treatments affects my outcome

### p. 7 — Example: Estimating local geographic spillovers with DiD

E.g. treat some buildings, allow and estimate average effects within 200m and 400m via
DiD imputation

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

E.g. treat some buildings, allow and estimate average effects within 200m and 400m via DiD imputation

[Figure: Treated within 200m, within 400m, Rest: control]

- Treated
  - within 200m
  - within 400m
- Rest: control

### p. 8 — Example 2: Estimating direct effects in spatial RD

In some spatial RDs spillovers are very important
- Comparing places just around the boundary is a terrible idea
One approach: “donut” RD (see Noack and Rothe (2023), Auerbach et al. (2025))
- What do you think of this idea?
$X_{i}$= signed distance from the boundary $(figure from Dowd (2021))$

#### p. 8 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- In some spatial RDs spillovers are very important
  - Comparing places just around the boundary is a terrible idea
- One approach: “donut” RD (see Noack and Rothe (2023), Auerbach et al. (2025))
  - What do you think of this idea?

[Figure: X<sub>i</sub> = signed distance from the boundary (figure from Dowd (2021))]

6

### p. 9 — What can we do? (2)

Approach #2: interference through sufficient statistics, “exposure mappings”
$Y_{i}$ depends on d via a small number of known statistics
E.g. $d_{i}$ and number of treated friends, $\sum$
$$k\in neighbors(i) d^{k}$$
Or more complex: network distance to the nearest treated person
Linear version:
$Y_{i}($ d $) = \beta_{1}d_{i} + \beta_{2}$
$$\sum$$
$k\in$ neighbors $(i)$
$d_{k} + Y_{i}(0)$

#### p. 9 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Approach #2: interference through sufficient statistics, "exposure mappings"

- $Y_i$ depends on $d$ via a small number of known statistics
-  E.g. $d_i$ and number of treated friends, $\sum_{k \in neighbors(i)} d_k$
-  Or more complex: network distance to the nearest treated person
-  Linear version:
   $$Y_i(d) = \beta_1 d_i + \beta_2 \sum_{k \in neighbors(i)} d_k + Y_i(0)$$

### p. 10 — What can we do? (3)

Approach #3: interference through outcomes
E.g. linear-in-means model of endogenous peer effects:
$$Y_{i}= \tau D_{i} + \theta \bar{Y}_{neighbors(i)} + \epsilon_{i}$$
Not a coherent potential outcome formulation: can’t have cyclical causal effects
- But the solution yields a reduced-form $Y_{i}($ d $)$
Rather, a game, e.g. with simultaneous moves
OLS estimation of $Y_{i}= \beta D_{i} + \theta \bar{Y}_{neighbors(i)} + \epsilon_{i}$ does not work
- Correlation of $\epsilon_{i}$ among neighbors creates endogeneity (reflection problem) even if neighbors are randomly assigned

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Approach #3: interference through outcomes

-   E.g. linear-in-means model of endogenous peer effects:
    $$Y_i = \tau D_i + \theta Y_{neighbors(i)} + \epsilon_i$$

-   Not a coherent potential outcome formulation: can’t have cyclical causal effects

    -   But the solution yields a reduced-form $Y_i(d)$

-   Rather, a game, e.g. with simultaneous moves

-   OLS estimation of $Y_i = \beta D_i + \theta Y_{neighbors(i)} + \epsilon_i$ does not work

    -   Correlation of $\epsilon_i$ among neighbors creates endogeneity (reflection problem) even if neighbors are randomly assigned

### p. 11 — Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

### p. 12 — Constructed (“Formula”) treatments and instruments

Many treatments (in OLS) and instruments (in IV) are:
- constructed from multiple sources of variation using a formula/algorithm
- with some as-good-as-random sources of variation, while others are not

### p. 13 — Example: Miguel and Kremer (2004)

Spillover effects of deworming kids in Kenya
- $Y_{i}$= educational achievement of student $i \in I$
- $D_{i}$= the number of $i$’s neighbors (students who go to school within a certain distance from $i$) within $I$ who have been dewormed
Implicitly constructed from two sources of variation:
- Who neighbors whom: $w_{ik}= 1 [k$ is a neighbor of $i]$
- Who got dewormed: $g_{k}= 1 [k$ was dewormed $]$
- We can express as a “formula”: $D_{i}= \sum^{N}$
$$k=1 w^{ik}g^{k}$$
Deworming is randomized
- Is it correct to consider $D_{i}$ as-good-as-random and estimate $Y_{i}= \tau D_{i} + \epsilon_{i}$ by OLS?
- What can we do to avoid OVB?

#### p. 13 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: spillowover._

- Spillowover effects of deworming kids in Kenya
  - $Y_i$ = educational achievement of student $i \in I$
  - $D_i$ = the number of $i$'s neighbors (students who go to school within a certain distance from $i$) within $I$ who have been dewormed
- Implicitly constructed from two sources of variation:
  - Who neighbors whom: $w_{ik}$ = 1 [($k$ is a neighbor of $i$)]
  - Who got dewormed: $g_k$ = 1 [($k$ was dewormed)]
  - We can express as a "formula": $D_i = \sum_{k=1}^N w_{ik}g_k$
- Deworming is randomized
- Is it correct to consider $D_i$ as-good-as-random and estimate $Y_i = \tau D_i + \epsilon_i$ by OLS?
- What can we do to avoid OVB?

10

### p. 14 — Variation 1: Nonlinear spillovers

Now suppose $D_{i}=$ dummy of having at least one dewormed neighbor
- Can we represent it as a formula in terms of the same $w_{ik}$ and $g_{k}$? $D_{i}=$ max $_{k} w_{ik}g_{k}$
Suppose girls were dewormed with prob. 50%, while boys with prob. 25%
What could cause OVB here?
What should we control for?

### p. 15 — Variation 2: Imperfect takeup

Suppose again $D_{i}=$ number of dewormed friends
- But only offer $g_{k}$ was randomized, while some kids didn’t take up
Can we represent $D_{i}$ as a formula in terms of $w_{ik}$ and new $g_{k}$?
What would you do?

### p. 16 — Answer key: Miguel and Kremer

In this RCT, is it correct to estimate $Y_{i}= \tau D_{i} + \epsilon_{i}$ by OLS?
- No! Randomizing deworming $\not \Rightarrow$ randomizing the number of dewormed neighbors
- Kids in denser areas will systematically have more dewormed neighbors (higher $D_{i}$)
- They may also have systematically different $\epsilon_{i}$, leaving to OVB
How to fix this? Control for the total number of neighbors
- With that control, randomization of $g_{k}$ implies as-good-as-random $D_{i}$
Alternatively, instrument $D_{i}$ with $D_{i} -$ Total # of neighbors $_{i} \times$  Prob of deworming

### p. 17 — Answer key: Nonlinear spillovers

We can represent the treatment as an explicit formula, $D_{i}=$ max $_{k} w_{ik}g_{k}$
- But it is not necessary: any algorithm $f_{i}(w, g)$ is already a “formula”
Two reasons for OVB:
- More neighbors $\Rightarrow$ higher probability of having a dewormed neighbor
- More girls among neighbors $\Rightarrow$ same
Sufficient to control for the probability of having a dewormed neighbor
- Computed analytically as a function of neighbors of each sex
- Or just by simulating the randomization protocol many times

### p. 18 — Answer key: Incomplete takeup

$D_{i}$ is no longer fully determined by $\{w_{ik}\}$ and $\{g_{k}\}$
- But we can construct a candidate IV for $D_{i}$ that is a formula: the number of neighbors invited for deworming
Reduced-form & first-stage are not causal yet: would compare kids with more vs.
fewer neighbors
- Controlling for the total number of neighbors does the job

### p. 19 — Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

### p. 20 — Non-random exposure to exogenous shocks

Borusyak and Hull (2023, BH) setup: $Y_{i}= \tau D_{i} + \epsilon_{i}$, constant linear effects
- Extensions to heterogeneous effects, other controls, multiple treatments, panel data
Consider a candidate instrument $Z_{i}= f_{i}(g; w)$, where $g = (g_{1}, \ldots , g_{K})$ are shocks,
$w$ collects predetermined variables, $f_{i}$ are known formulas
- Nests reduced-form regressions when $D_{i}= Z_{i}$
Assumption 1: Shock exogeneity, $g \perp \perp \epsilon \mid w$
(or $g \perp \perp (\epsilon , w)$)
- E.g. $g$ = deworming assignment; $w = \{w_{ik},$ gender $_{k}\}$
$^{\star}$ Note $w_{ik}$ enters the formula and gender $_{k}$ enters the DGP of $g$
- Exclusion: shocks $g$ don’t causally affect $Y_{i}$ other than through $D_{i}$
- Independence: $g$ is assigned independently of potential outcomes, conditionally on $w$
Importantly, we do not assume $\epsilon \perp \perp w$

### p. 21 — Formal results

Define the expected instrument $\mu_{i}=\mathbb{E} [f_{i}(g; w) \mid w]$
Theorem:
$\mu_{i}$ is the sole confounder generating OVB under Assumption 1,
$\mathbb{E}$
$[ 1$
$N$
$\sum$
$i Z^{i}\epsilon^{i}$
$]$
$= 0$ in general
but $=\mathbb{E}$
$[ 1$
$N$
$\sum$
$i \mu^{i}\epsilon^{i}$
$]$
- Exercise: Prove it!
$\Rightarrow$ The recentered instrument $\tilde{Z}_{i}= Z_{i} -\mu_{i}$ is a valid instrument for $D_{i}$:
$$\mathbb{E}$$
$$[$$
$$1$$
$$N$$
$$\sum$$
$$i$$
$$\tilde{Z}_{i}\epsilon_{i}$$
$$]$$
$$= 0.$$

#### p. 21 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Define the expected instrument $\mu_i = E[f(g; w) | w]$
- Theorem: $\mu_i$ is the sole confounder generating OVB under Assumption 1,
  $$E\left[\frac{1}{N}\sum_{i} Z_{i} \epsilon_{i}\right] \neq 0 \text{ in general} \quad \text{but} \quad E\left[\frac{1}{N}\sum_{i} \mu_{i} \epsilon_{i}\right] = 0$$
  - Exercise: Prove it!
- $\Rightarrow$ The recentered instrument $\tilde{Z}_i = Z_i - \mu_i$ is a valid instrument for $D_i$:
  $$E\left[\frac{1}{N}\sum_{i} \tilde{Z}_{i} \epsilon_{i}\right] = 0.$$

17

### p. 22 — Formal results (2)

Instrumenting $D_{i}$ with $Z_{i}$ and controlling for $\mu_{i}$ also identifies $\tau$
- Because numerically equivalent to IVing with $\tilde{Z}_{i}$ while controlling for $\mu_{i}$
- Given recentering, control for $\mu_{i}$ does not matter in large samples
Recentered fn’s of $(g, w)$ are the only IVs guaranteed to be valid by Assumption 1
- Otherwise, need to restrict $\epsilon$ , like in DiD
To recenter, need to measure $\mu_{i}=\mathbb{E} [f_{i}(g; w) \mid w] \equiv$
$\int$
$f_{i}(g; w)dG(g \mid w)$
- If the shock DGP $G(g \mid w)$) is known (e.g., randomization protocol), just simulate it
- In observational data, can use appropriate permutations of $g$ (example below)
Consistency: with many shocks and weak dependence of $\tilde{Z}_{i}$ across $i$
Robustness to heterogeneous effects: identify a convex average of $\partial Y_{i}/\partial D_{i}$ under
non-causal first-stage monotonicity

### p. 23 — Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

### p. 24 — Application: Effects of railway upgrades

BH study the employment effects of the Chinese high-speed railway system
Observe 83 lines open by 2016 (also 66 planned but not yet opened lines)

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

BH study the employment effects of the Chinese high-speed railway system
- Observe 83 lines open by 2016 (also 66 planned but not yet opened lines)

[Figure: Map of China with HSR lines, legend indicating Built and Unbuilt HSR lines, HSR 2016 lines, and HSR unbuilt lines. Labels include: Urumqi, Lhasa, Shanghai, and a scale bar from 0 to 2000 km]

19

### p. 25 — First task: Specifying exposure mapping(s) $D_{i}$

A dummy of (at least one) line passing through city $i$?
- Wouldn’t capture the effects on neighboring cities
Distance to the nearest line $,$ computed from line locations and location of city $i$?
BH choose a version suggested by models of economic geography:
- Railways reduce travel time to big cities and thus increase regional “market access”
$\Delta Y_{i}= \tau \Delta$ log $MA_{i} + \epsilon_{i}$
where $MA_{it}=$
$$\sum N$$
$k=1$ TravelTime $($ loc $^{i},$ loc $^{k}, g^{t})^{-1}$ Pop $^{k},$
$t = 0, 1$
- $g_{t}$ is transportation network
- loc $_{k}$ is region’s location on the map
- Pop $_{k}$ is time-invariant regional population [what if it changes endogenously?]
- $\epsilon_{i}$ is effects of unobserved local shocks (e.g. productivity)

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: europe, lines, railway, with._

- A dummy of (at least one) line passing through city $i$?
  - Wouldn't capture the effects on neighboring cities
- Distance to the nearest line, computed from line locations and location of city $i$?
- BH choose a version suggested by models of economic geography:
  - Railways reduce travel time to big cities and thus increase regional "market access"
  
  $$
  \Delta Y_{it} = \tau \Delta log MA_{it} + \epsilon_{it}
  $$

  where $MA_{it} = \sum_{k=1}^{N} TravelTime(loc_{i}, loc_{k}, g_{t})^{-1} Pop_{k}$,  $t = 0, 1$

  - $g_{t}$ is transportation network
  - $loc_{k}$ is region’s location on the map
  - $Pop_{k}$ is time-invariant regional population [what if it changes endogenously?]
  - $\epsilon_{it}$ is effects of unobserved local shocks (e.g. productivity)

[Figure: A map of Europe with railway lines and city locations]

### p. 26 — Realized 2016 network and MA growth

#### p. 26 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Realized 2016 network and MA growth
Figure: Realized 2016 network and MA growth
MA growth 2007-2016
0.000 - 0.050
0.051 - 0.100
0.101 - 0.250
0.251 - 0.400
0.401 - 0.550
0.551 - 0.700
0.701 - 0.850
0.851 - 1.000
1.001 - 1.150
1.151 - 1.272
HSR lines

Urumqi
Harbin
Hohhot
Beijing
Tianjin
Chengdu
Chongqing
Shanghai
Wuhan
Lhasa

0
500 1,000 2,000 Km
21

### p. 27 — OVB problems & recentering solution

Lines are not randomly placed: e.g. tend to connect big cities
- And even if they were randomly placed, MA would still grow more near big cities!
- Big cities and cities nearby can be on different trends from rest of country =$\Rightarrow$ OVB
Conventional strategy: throw $ad$ hoc covariates
Recentering approach: view one component of MA growth as a natural experiment
- BH assume exogenous timing of lines: it’s random which lines get built first, within groups of lines of similar length
- $g$ = opening status of 149 planned lines by 2016
- $w$ = city locations and populations, set and grouping of planned lines, pre-HSR transportation

### p. 28 — Actual vs. counterfactual MA growth

Actual 2016 network
Example counterfactual 2016 network
Draw 1,000 simulated HSR networks by permuting opening statuses of lines
randomly within groups
- Recompute MA growth of each city; then take the average across simulations

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

[Figure: Actual 2016 network, Example counterfactual 2016 network]

- Draw 1,000 simulated HSR networks by permuting opening statuses of lines randomly within groups
-  Recompute MA growth of each city; then take the average across simulations

### p. 29 — Expected and recentered MA growth

Expected MA growth
Recentered MA growth
Treated/control group: regions with MA growth higher/lower than expected
Valid comparison if realized and counterfactual networks are equally likely

#### p. 29 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Expected MA growth
[Figure: Expected MA growth map with legend showing "Expected MA growth 2007-2016" and color scale from 0-0.500 to 1.001-1.152]

Recentered MA growth
[Figure: Recentered MA growth map with legend showing "Recentered MA growth" and color scale from -0.200 to -0.050 to 0.301-0.577]

Treated/control group: regions with MA growth higher/lower than expected
-  Valid comparison if realized and counterfactual networks are equally likely

### p. 30 — Testing the specification of counterfactuals

Recentered instrument should be uncorrelated with predetermined observables

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

TABLE II
REGRESSIONS OF MARKET ACCESS GROWTH ON MEASURES OF ECONOMIC GEOGRAPHY.

|  | Unadjusted |  | Recentered |  |
|---|---|---|---|---|
|  | (1) |  | (3) |  |
| Distance to Beijing | -0.291 |  | 0.088 |
|  | (0.062) |  | (0.045) |
| Latitude/100 | -3.324 |  | -0.182 |
|  | (0.646) |  | (0.319) |
| Longitude/100 | 1.321 |  | 0.440 |
|  | (0.458) |  | (0.240) |
| Expected Market Access Growth |  |  | 0.026 |
|  |  |  | (0.056) |
| Constant | 0.536 |  | 0.018 |
|  | (0.029) |  | (0.021) |
| Joint RI p-value |  | 0.443 |  | 0.492 |
| $R^2$ | 0.824 |  | 0.083 |  | 0.010 |
| Prefectures | 275 |  | 275 |  | 275 |

[Figure: Distance to Beijing, Latitude/100, Longitude/100, Expected Market Access Growth, Constant, Joint RI p-value, $R^2$, Prefectures]

Recentered instrument should be uncorrelated with predetermined observables.

25

### p. 31 — Employment effects of HSR

Column 2 instruments realized MA with recentered MA
Column 3 is OLS controlling for expected MA

#### p. 31 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

TABLE I
EMPLOYMENT EFFECTS OF MARKET ACCESS GROWTH: UNADJUSTED AND RECENTERED ESTIMATES.

|  | Unadjusted OLS (1) | Recentered IV (2) | Controlled OLS (3) |
|---|---|---|---|
Panel A: No Controls |  |  |  |
Market Access Growth | 0.232 (0.075) | 0.084 (0.097) $[-0.245, 0.337]$ | 0.072 (0.093) $[-0.169, 0.337]$ |
Expected Market Access Growth |  |  | 0.317 (0.096) |

-  Column 2 instruments realized MA with recentered MA
-  Column 3 is OLS controlling for expected MA

[Figure: TABLE I, Panel A: No Controls, Market Access Growth, Expected Market Access Growth, Unadjusted OLS, Recentered IV, Controlled OLS]

26

### p. 32 — Inference

Complication: recentered MA is correlated across all regions
- A long line affects many regions across the country
Approach 1: restrict dependence of $\epsilon_{i}$ and thus $\tilde{Z}_{i}\epsilon_{i}$
- Spatially-clustered SE
Approach 2: leverage randomness of shocks, allowing unrestricted dependence of $\epsilon_{i}$
- Randomization inference [for any recentered IV with constant causal effects, not only spatial]
- (Later: Asymptotic solution when $Z_{i}$ takes the shift-share form)

### p. 33 — Randomization inference leveraging shock randomness

To test the sharp null $\tau = b$ (assuming constant effects), compute statistic
$T(g) = 1$
$$N$$
$$\sum$$
$$i (Y^{i} -bD^{i}) (f^{i}(g; w) -\mu^{i}(w))$$
For many simulated counterfactual shock vectors $g^{(s)}$, compute
$T(g^{(s)}) = 1$
$$N$$
$$\sum$$
$$i (Y^{i} -bD^{i})$$
$$($$
$f_{i}(g^{(s)}; w) -\mu_{i}(w)$
$)$
Check that $T(g)$ is not in the tails of the distribution of $T(g^{(s)})$
- If $\tau = b$ holds, no reason for $\epsilon_{i}$ to correlate with more $f_{i}(g, w)$ than $f_{i}(g^{(s)}, w)$
- But if $\tau \neq  b$, $T(g^{(s)})$ are centered around 0 while $T(g)$ is not
Tests and confidence intervals (by test inversion) are valid in finite samples, with
no assumptions on $\epsilon$
This statistic is natural but any statistic $T(g; Y -bD, w)$ would work, too

#### p. 33 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- To test the sharp null $\tau = b$ (assuming constant effects), compute statistic
  $$T(g) = \frac{1}{N} \sum_{i} (Y_{i} - bD_{i}) (f_{i}(g; w) - \mu_{i}(w))$$

- For many simulated counterfactual shock vectors $g^{(s)}$, compute
  $$T(g^{(s)}) = \frac{1}{N} \sum_{i} (Y_{i} - bD_{i}) (f_{i}(g^{(s)}; w) - \mu_{i}(w))$$

- Check that $T(g)$ is not in the tails of the distribution of $T(g^{(s)})$
  - If $\tau = b$ holds, no reason for $\epsilon_{i}$ to correlate with more $f_{i}(g, w)$ than $f_{i}(g^{(s)}, w)$
  - But if $\tau \neq b$, $T(g^{(s)})$ are centered around 0 while $T(g)$ is not

- Tests and confidence intervals (by test inversion) are valid in finite samples, with no assumptions on $\epsilon$

- This statistic is natural but any statistic $T(g; Y - bD, w)$ would work, too

### p. 34 — Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

### p. 35 — Example: Simulated instruments

Currie and Gruber (1996a,b) study the effects of Medicaid eligibility on health
- OLS is surely biased because richer households are less likely to be eligible
Assume variation in eligibility policy across states is exogenous
- But policy is a complicated object: set of eligibility rules
- Construct a scalar measure of policy generosity as IV
- “Simulated instrument”: % of population nationally that would be eligible under policy of $i$’s state

### p. 36 — Simulated instruments

What do you think of the simulated instrument: Exogeneity? Relevance?
How can we recast household $i$’s Medicaid eligibility $D_{i}$ as a formula treatment?
What is a household’s expected eligibility? How can we control for it?
What is the benefit of this approach over simulated IV?
What if $D_{i}$= Medicaid takeup, rather than eligibility?

### p. 37 — Application to Obamacare

Borusyak and Hull (2025) estimate crowding-out effects of Medicaid takeup ($D_{i}$)
on private health insurance ($Y_{i}$)
Leverage eligibility expansions to 146% of the federal poverty line under the
Affordable Care Act
- 11 of 13 states with Democratic governor, 8 of 30 states with Republican governor
- View expansion decisions as random across states with same-party governors, but not household demographics or pre-2014 policy
Compare two IVs:
- Simulated IV: expansion dummy (controlling for governor’s party)
- Recentered IV: predict eligibility from expansion decisions & non-random demographics, and recenter
By not fearing non-random exposure, recentered IV has much better first-stage
- ~2x smaller standard errors

### p. 38 — More examples

Number of days of extreme heat measured from the local crop composition, their
temperature thresholds, and local weather
(Hsiao, Moscona, and Sastry (2025), Zappala (2025))
Radio signal strength, predicted from country’s topography and location of
transmitters (Olken (2009), Yanagizawa-Drott (2014))
IVs from partially-randomized assignment mechanisms, e.g. for charter schools
(Abdulkadiroglu et al. (2017), Narita and Yata (2023))
Linear [and nonlinear] shift-share instruments...

### p. 39 — Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

### p. 40 — Shift-share IV

General structure of shift-share IV (SSIV):
$$Z_{i}=$$
$$K$$
$$\sum$$
$$k=1$$
$$S_{ik}g_{k}$$
- $g_{1}, \ldots , g_{K}$ are a set of common shifts not specific to $i$
- $S_{ik}$ are exposure “shares” (weights), often with $\sum$
$k S^{ik}= 1$ for all $i$

#### p. 40 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- General structure of shift-share IV (SSIV):
  $$Z_i = \sum_{k=1}^{K} S_{ik}g_k$$

- $g_1, \dots, g_K$ are a set of common shifts not specific to $i$

- $S_{ik}$ are exposure “shares” (weights), often with $\sum_{k} S_{ik} = 1$ for all $i$

33

### p. 41 — Example 0: Linear spillovers

Cai, De Janvry, and Sadoulet (2015): spillover effects of randomized information
about an insurance product
- $Y_{i}$= person $i$ takes up the insurance product
- $D_{i}$= the fraction of $i$’s friends who were given the information
- Use OLS: $Z_{i}= D_{i}$
Not usually understood as a shift-share design, but it is:
$Z_{i}=$
$N$
$\sum$
$k=1$
$1 [i$ and $k$ are friends $]$
# of $i$’s friends
$\cdot$  Treated $_{k}$

### p. 42 — Example 1: Labor supply

Consider the (inverse) regional labor supply equation: $\Delta w_{i}= \tau \Delta L_{i} + \epsilon_{i}$
- $\Delta w_{i}$= log-change in region $i$’s average wage over some period
- $\Delta L_{i}$= log-change in $i$’s employment
- $\epsilon_{i}$= labor supply shocks (e.g. migration, UI benefits)
Need a regional labor demand shock as IV
Regional labor demand combines demand for different industries $k$:
- $\Delta L_{i}\approx \sum$
$k S^{ik}\Delta L^{ik}$
- $\Delta L_{ik}$= log-change of $k$-specific employment in $i$
- $S_{ik}$= initial share of $k$ in $i$’s employment
Consider $Z_{i}= \sum$
$k S^{ik}g^{k}$, replacing $\Delta L^{ik}$ with national industry shifts $g^{k}$
- E.g. $g_{k}$= randomized subsidy
- Bartik (1991): $g_{k}$= observed growth rate of industry employment

### p. 43 — Example 2: Enclave instrument for migration

Consider the (inverse) elasticity of substitution between native and immigrant
workers
- $\Delta$ log $^{Immigrant wagei}$ Native wage $_{i}$
$= \tau \Delta$ log $^{Immigrant employmenti}$
Native employment $_{i}$
$+ \epsilon_{i}$
- $\epsilon_{i}$= change in relative labor demand in region $i$
Need a relative labor supply shock as IV
- New immigrants from country $k$ tend to go where there are historic enclaves of $k$’s immigrants
$Z_{i}$= migration intensity prediction from historic enclaves & some “push shocks”
- $g_{k}$= dummy of war in $k$ (Llull (2017)) or observed national migration rate from $k$ (Card (2009))
- $S_{ik}$= initial share of origin $k$ in $i$’s population

### p. 44 — The SSIV exogeneity challenge

How should we think about SSIV exogeneity, $\mathbb{E} [Z_{i}\epsilon_{i}] = 0$?
- Which properties of the shifts and/or shares can make $Z_{i}$ exogenous?
- Do we need exogeneity of both shifts and shares, or just one?
- What is exogeneity of shifts, which don’t vary across $i$?
- What is exogeneity of shares, which are measured in a pre-period?
Two narratives + sets of sufficient conditions (plausible in different applications):
- “Many exogenous shifts” (Borusyak, Hull, and Jaravel (2022); BHJ): leveraging a shift-level natural experiment, translated to the observation level
- “Exogenous shares” (Goldsmith-Pinkham, Sorkin, and Swift (2020); GPSS): pooling diff-in-diffs based on heterogeneous exposure shares

### p. 45 — Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

### p. 46 — Identification from many exogenous shifts

Suppose the shifts are as-good-as-random: $\mathbb{E} [g_{k}\mid$  all errors and all shares $] = \alpha$
Then the expected instrument is $\mu_{i}=\mathbb{E} [\sum$
$k S^{ik}g^{k}\mid S^{i}, \ldots , S^{iK}] = \alpha \sum$
$k S^{ik}$
- If the shares add up to one, $\mu_{i}=$ const =$\Rightarrow$ no corrections are needed
- Note: No need to run 1,000 simulations, or to know the joint CDF of shifts
Intuition: A weighted average of as-good-as-random shifts is as-good-as-random
- If industries with high vs. low $g_{k}$ are comparable, regions specializing in those industries are comparable
$^{\star}$ True whatever the initial shares are: we don’t require Cov $[S_{ik}, \epsilon_{i}] = 0$
- The SSIV allows to translate random variation across $k$ into random variation across $i$ (under appropriate exclusion)

### p. 47 — Consistency

Proposition:
$1$
$N$
$\sum$
$i Z^{i}\epsilon^{i}\to 0$ if
1. Weaker notion of shift exogeneity: $g_{k}$ are uncorrelated with $\bar{\epsilon}_{k}= \sum$
$i S^{ik}\epsilon^{i}/ \sum$
$i S^{ik}$
2. The effective number of shifts is large: $N_{eff}= 1/ \sum$
$k s^{2}$
$k \to \infty$ for $s^{k}=^{1}$
$N$
$\sum$
$i S^{ik}$
3. Shares add up to one for each observation
Holds because $^{1}$
$N$
$\sum$
$i Z^{i}\epsilon^{i}=^{1}$
$$N$$
$$\sum$$
$$i,k S^{ik}g^{k}\epsilon^{i}= \sum$$
$k s^{k}g^{k}\bar{\epsilon}^{k}$, by changing the order of
summation

#### p. 47 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Proposition: $\frac{1}{N} \sum_{i} Z_{i} \epsilon_{i} \rightarrow 0$ if

  - Weaker notion of shift exogeneity: $g_{k}$ are uncorrelated with $\overline{\epsilon}_{k} = \sum_{i} S_{ik} \epsilon_{i} / \sum_{i} S_{ik}$

  - The effective number of shifts is large: $N_{eff} = 1 / \sum_{k} S_{k}^2 \rightarrow \infty$ for $s_{k} = \frac{1}{N} \sum_{i} S_{ik}$

  - Shares add up to one for each observation

- Holds because $\frac{1}{N} \sum_{i} Z_{i} \epsilon_{i} = \frac{1}{N} \sum_{i,k} S_{ik} g_{k} \epsilon_{i} = \sum_{k} s_{k} g_{k} \overline{\epsilon}_{k}$, by changing the order of summation

39

### p. 48 — “Incomplete shares” case

What if $\sum$
$k S^{ik}\neq  1$, so $Z^{i}$ is a weighted sum, not weighted average?
- Then randomization of subsidies does not make $Z_{i}$ as-good-as-random
E.g. subsidies are only in manufacturing industries $k$
- Regions with more manufacturing will mechanically get higher $Z_{i}$, potentially creating bias
But recall that the expected instrument is $\mu_{i}= \alpha \cdot \sum$
$k S^{ik}$
- Thus, controlling for $\sum$
$k S^{ik}$ avoids OVB

### p. 49 — Shift-level controls

What if shifts are as-good-as-random only after controlling for some $q_{k}$?
- In an industry-level regression you’d control for $q_{k}$. But what about a SSIV regression?
Expected instrument is $\mu_{i}= \sum$
$$k S^{ik} (\alpha^{0} + \alpha^{1}q^{k})$$
- To avoid OVB, it’s sufficient to control for $\sum$
$k S^{ik}$ and $\sum$
$k S^{ik}q^{k}$
E.g. industry subsidies are random only controlling the dummy of hi-tech industries
- Control for the total local share of hi-tech industries
- Then you leverage variation between regions with similar composition of hi- and low-tech industries but different exposure to subsidies within each group

#### p. 49 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- What if shifts are as-good-as-random only after controlling for some $q_k$?
  - In an industry-level regression you’d control for $q_k$. But what about a SSIV regression?
- Expected instrument is $\mu_i = \sum_k S_{ik} (\alpha_0 + \alpha_1 q_k)$
  - To avoid OVB, it’s sufficient to control for $\sum_k S_{ik}$ and $\sum_k S_{ik}q_k$
- E.g. industry subsidies are random only controlling the dummy of hi-tech industries
  - Control for the total local share of hi-tech industries
  - Then you leverage variation between regions with similar composition of hi- and low-tech industries but different exposure to subsidies within each group
41

### p. 50 — Shift-level (“exposure-robust”) standard errors

Unusual clustering problem: observations with similar shares are exposed to the
same shocks, both $g_{k}$ and unobserved $\nu_{k}$
- Conventional clustering of SE (e.g. by state) wouldn’t capture that
- Adao, Kolesar, and Morales (2019) generate placebo shifts $g^{*}$
$k$ and find a significant
reduced-form in ~50% simulations
If each region was exposed to just one industry, we’d cluster by industry
- But how to do it in a “fuzzy” case?
Adao et al. derive a formula that leverages mutual independence of $g_{k}$, regardless
of clustering of $\epsilon_{i}$

### p. 51 — Shift-level (“exposure-robust”) standard errors (2)

BHJ propose a convenient solution:
- SSIV estimate is exactly equal to the estimate from a special shift-level regression with $g_{k}$ as the IV
$$\bar{Y}^{\perp}$$
$$k = \tau \bar{D}^{\perp}$$
$$k + \gamma 'q^{k}+ \bar{\epsilon}^{k},$$ weighted by $s_{k}=^{1}$
$N$
$\sum$
$i S^{ik}$, where $\bar{V}^{\perp}$
$$k = \sum$$
$$i S^{ik}V^{\perp}$$
$i / \sum S^{ik}$ and $V^{\perp}$
$i$ is residual from
the regression of $V_{i}$ on included $i$-level controls
- In Stata and R, package ssaggregate helps run this special IV regression
- Then use robust or clustered SE in the way you’d do it for any other regression leveraging these shifts

#### p. 51 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- BHJ propose a convenient solution:

- SSIV estimate is exactly equal to the estimate from a special shift-level regression with $g_k$ as the IV

$$Y_{it} = \tau D_{kt} + \gamma' q_k + \epsilon_k$$

weighted by $s_k = \frac{1}{N} \sum_i S_{ik}$, where $V_k = \sum_i S_{ik} V_i^+\ / \sum_i S_{ik}$ and $V_i^+$ is residual from the regression of $V_i$ on included $i$-level controls

- In Stata and R, package ssaggregate helps run this special IV regression

- Then use robust or clustered SE in the way you'd do it for any other regression leveraging these shifts

43

### p. 52 — Application: “China shock” (Autor et al. (2013), ADH)

ADH study the effects of import competition on local labor market outcomes
Region $i$ = commuting zone ($N = 722$)
Industry $k$ = SIC4 manufacturing industry ($K = 397$)
Two periods $t$: 1991–2000 and 2000–2007
$Y_{it}$= local change in manufacturing employment rate
$D_{it}$= local growth of exposure to Chinese imports:
$D_{it}=$
$\sum$
manuf. ind. $k$
Initial emp share $_{ikt} \cdot \Delta$ US imports from China $^{kt}$
Initial employment $_{kt}$
Control for period FE and some initial regional characteristics, including total
manufacturing share of employment

### p. 53 — ADH’s shift-share approach

OLS can be biased: imports grow in industries and regions where US productivity
growth is slow
Idea: use industry productivity growth in China as shifts
- Construct a proxy: import growth from China in other countries (e.g. Europe)
- Requires (1) China productivity to be exogenous and (2) productivity growth in the US and Europe to be uncorrelated
SSIV: $Z_{it}= \sum$
$k S^{ikt}g^{kt}$ where
- $S_{ikt}$= 10-year lagged share of $k$ in total employment of $i$; $\sum$
$k S^{ikt}$= lagged total
share of manufacturing in employment
- $g_{kt}$= growth of Chinese imports in eight non-US countries in \$1,000/US worker
The shifts are the IV in the industry-level analysis in Acemoglu et al. (2016)

### p. 54 — BHJ revisit ADH

Step 1: Picking controls
Hypothesize that shifts $g_{kt}$ are as-good-as-random controlling for period FEs $q_{t}$
Regional regression should thus control for
$$\sum$$
$$k$$
$$S_{ikt}q_{t}=$$
$$(\sum$$
$$k$$
$$S_{ikt}$$
$$)$$
$\times q_{t}$
i.e. lagged total share of manufacturing interacted with period dummies
Also consider the industry controls from Acemoglu et al., e.g. initial skill intensity
of the industry

#### p. 54 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Hypothesize that shifts $g_{kt}$ are as-good-as-random controlling for period FEs $q_t$

- Regional regression should thus control for
  $$ \sum_{k} S_{ikt}q_t = \left( \sum_{k} S_{ikt} \right) \times q_t $$
  i.e. lagged total share of manufacturing interacted with period dummies

- Also consider the industry controls from Acemoglu et al., e.g. initial skill intensity of the industry

46

### p. 55 — BHJ revisit ADH

Step 2: Balance tests to falsify conditional as-good-as-random shift assignment:
Shifts are uncorrelated with industry observables, controlling for period FE
SSIV is uncorrelated with regional observables, controlling for period FE $\times$ lagged
total manuf. share

#### p. 55 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Step 2: Balance tests to falsify conditional as-good-as-random shift assignment:

- Shifts are uncorrelated with industry observables, controlling for period FE
- SSIV is uncorrelated with regional observables, controlling for period FE × lagged total manuf. share

Balance variable
Coef.
SE

Panel B: Industry-level balance
Production workers’ share of employment, 1991
-0.011
(0.012)
Ratio of capital to value-added, 1991
-0.007
(0.019)
Log real wage (2007 USD), 1991
-0.005
(0.022)
Computer investment as share of total, 1990
0.750
(0.465)
High-tech equipment as share of total investment, 1990
0.532
(0.296)
No. of industry-periods
794
Panel B: Region-level balance
Start-of-period % of college-educated population
0.915
(1.196)
Start-of-period % of foreign-born population
-2.920
(0.952)
Start-of-period % of employment women
-0.159
(0.521)
Start-of-period % of employment in routine occupations
-0.302
(0.272)
Start-of-period average offshoring index of occupations
0.087
(0.075)
Manufacturing employment growth, 1970s
0.543
(0.227)
Manufacturing employment growth, 1980s
0.055
(0.187)
No. of region-periods
1,444

[Figure: Balance variable, Coef., SE, Panel B: Industry-level balance, Panel B: Region-level balance]
47

### p. 56 — BHJ revisit ADH

Step 3: Obtain the estimates, including the necessary controls and with SE from the
equivalent industry-by-year level IV regression
Controls are important: China shock $g_{kt}$ is larger in the 2000s (post WTO entry)
when overall manuf. decline is stronger for other reasons

#### p. 56 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Step 3: Obtain the estimates, including the necessary controls and with SE from the equivalent industry-by-year level IV regression

[Figure: TABLE 4 Shift-share IV estimates of the effect of Chinese imports on manufacturing employment]

Coefficient	-0.596	-0.489	-0.267	-0.314	-0.310	-0.290	-0.432
(0.114)	(0.100)	(0.099)	(0.107)	(0.134)	(0.129)	(0.205)

Regional controls
	✓	✓	✓	✓	✓	✓	✓
Autor et al. (2013) controls
	✓	✓	✓	✓	✓	✓	✓
Start-of-period mfg. share
	✓	✓	✓	✓	✓	✓	✓
Lagged mfg. share
Period-specific lagged mfg. share
	✓	✓
Lagged 10-sector shares
Local Acemoglu et al. (2016) controls
Lagged industry shares
	✓
SSIV first stage F-stat.	188.6	166.7	123.6	272.4	64.6	63.3	27.6
No. of region-periods	1,444	1,444	1,444	1,444	1,444	1,444	1,444
No. of industry-periods	796	794	794	794	794	794	794

- Controls are important: China shock $g_{kt}$ is larger in the 2000s (post WTO entry) when overall manuf. decline is stronger for other reasons

48

### p. 57 — Shift-share meets RD

“RD aggregation”: $D_{i}$= fraction of women in the state House
- An aggregate across seat-specific elections
- Can instrument with $Z_{i}$= fraction of women who won in close races against men
“RD spillovers”: $D_{i}$= number of neighboring states with Democratic governor
- An aggregate across elections in neighboring states
- Can instrument with $Z_{i}$= number of neighbors where Democrat won in a close race
$Z_{i}$= shift-share IV with RD dummies as shifts
- Borusyak and Kolerman-Shemer (2024) extend local linear estimation (key: shifts are only approximately random)
- See also Borusyak and Hull (2023) and Narita and Yata (2023) via recentering

### p. 58 — Outline

1
Modeling and estimating spillover effects
2
Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3
Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

### p. 59 — Motivating example: Mariel Boatlift (following Card (1990))

Consider the substitution elasticity between demand for migrant and native labor
- $D_{i}$= $\Delta$ relative immigrant/native employment, $Y_{i}$= $\Delta$ relative wage
Many Cubans arrive in the US in 1980 for exogenous reasons
$\Rightarrow$ Local arrival rate of Cubans is relevant
- But violates exogeneity if they settle in areas with growing demand for their labor
Consider instrumenting local immigration rate with the initial share of Cubans
- Relevance: new Cubans tend to go to places with a lot of Cubans
- Exogeneity: parallel outcome trends in places with high vs. low initial Cuban share
$^{\star}$ Violated if factors that attracted Cubans in the past are correlated with today’s trends
This is a simple shift-share IV: $Z_{i}= S_{i,Cubans} \cdot 1 + \sum$
$k\neq Cubans S^{ik} \cdot 0$
- Justified by parallel trends in outcomes, not a natural experiment in shifts

### p. 60 — Exogenous shares approach: Pooling diff-in-diffs

This logic generalizes to having multiple shocked countries
- Goldsmith-Pinkham, Sorkin, and Swift (2020) develop this view
Assume exogenous shares: Cov $[\epsilon_{i}, S_{ik}] = 0$ for every $k$
- With $Y_{i}$ measured in differences, this is $K$ parallel trends assumptions
- Strong assumption even though shares are measured in the pre-period
- Wrong interpretation of exogeneity: $“shares$ are not affected $by \epsilon_{i}”$ (they can’t be)
- Correct: $“all$ unobservables are uncorrelated with everything about local $shares”$
- Rules out any unobserved $\nu_{k}$ shocks that affect regions based on $S_{ik}$
Then we have $K$ valid IVs: $S_{i1}, \ldots , S_{iK}$
- SSIV $Z_{i}= \sum$
$k S^{ik}g^{k}$ is one reasonable way to combine them
- 2SLS (for small $K$) and LIML are other reasonable ways
- Or just use your favorite share (e.g. of Cubans)

### p. 61 — Rotemberg weights

If you insist on using SSIV (and not LIML), GPSS recommend computing the
importance of each share: Rotemberg weights $\hat{\alpha}_{k}$
- $\hat{\tau} = \sum$
$k \hat{\alpha}^{k}\hat{\tau}^{k}$ for $\hat{\tau}^{k}$ that uses $S^{ik}$ as IV one at a time
- $\hat{\alpha}_{k}$ are higher for $k$ with more extreme shifts and larger first stages
- $\hat{\alpha}_{k}$ add up to one but need not be positive
Then scrutinize validity of the share IVs with highest Rotemberg weights

### p. 62 — Summary of two approaches to shift-share IV

Two sets of narratives & sufficient conditions for SSIV validity
- Pick one $ex$ ante, then validate $ex$ post
Many exogenous shifts is appropriate when you could imagine using your shifts
as IV in a shift-level analysis
Exogenous shares is appropriate when you would be OK using any other
combination of shares as the IV

### p. 63 — More shift-share IV examples (Borusyak et al. (2025b))

#### p. 63 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Study Unit ($i$) Outcome ($y_i$) Treatment ($τ_i$) Level of shift variation ($k$) Share ($s_ik$) Instrument ($z_i$) Shift ($g_k$)
- Hummels et al. (2014) Worker Wage Imports of intermediate goods by employer Product-by-country $\frac{Imports_k}{Imports}$ Imports from k to other countries
- Nunn and Qian (2014) Country-by-year Conflict Quantity of food aid (wheat) from the US Year Fraction of years with non-zero food aid US wheat production in previous year
- Cai et al. (2015) Individual Takeup of insurance % of friends selected for an information session Individual Dummy ($i$ is friend of $i$) Dummy of information session
- Jaravel (2019) Product category Inflation & Quantity demanded Socio-demographic group Sales of $i$ to group $k$ Total sales of $i$ Population change
- Greenstone et al. (2020) Region Δ Employment Δ Credit Bank Credit market share of $k$ Estimated credit supply shock
- Aghion et al. (2022) Firm Δ Firm employment Δ Firm stock of automation technologies Technology-by-country $\frac{Imports_k}{Imports}$ Δ imports from k to other countries
- Xu (2022) Region Δ Exports Exposure to banking crisis Bank Credit market share of $k$ Bankruptcy during banking crisis
- Franklin et al. (2023) Local labor market Wage Shift-share exposure to the intervention Residential neighborhood Commuters,$/$, Employment, Population $45+$/ Population $45+$ Dummy of public works intervention
- Mohsen (2024) Region Δ Young labor market outcome Retirement rate (within 45+) National retirement rate at age $k$
[Figure: Study, Unit, Outcome, Treatment, Level of shift variation, Share, Instrument, Shift]
54

### p. 64 — Conclusion: Formula and shift-share IV

The goal is for you to have an instinct to:
Identify settings with formula and shift-share treatments/instruments
Ask which determinants are as-good-as-random and which are non-random
Understand what it means to call your shocks as-good-as-random, by thinking of
counterfactuals shocks
Recognize that OVB is possible even with as-good-as-random shocks
Know how to fix OVB, via “recentering” (or simpler controls with shift-shares)

### p. 65 — References I

Abdulkadiroglu, A., J. D. Angrist, Y. Narita, and P. A. Pathak (2017): “Research
Design Meets Market Design: Using Centralized Assignment for Impact Evaluation,” Econometrica,
85, 1373–1432.
Acemoglu, D., D. H. Autor, D. Dorn, G. H. Hanson, and B. Price (2016): “Import
Competition and the Great U.S. Employment Sag of the 2000s,” Journal $of$ Labor Economics, 34,
S141–S198.
Adao, R., M. Kolesar, and E. Morales (2019): “Shift-Share Designs: Theory and Inference,”
Quarterly Journal $of$ Economics, 134, 1949–2010.
Allende, C., F. Gallego, and C. Nielson (2019): “Approximating the Equilibrium Effects of
Informed School Choice,” Working Paper.
Auerbach, E., Y. Cai, and A. Rafi (2025): “Regression Discontinuity Design with Spillovers,”
Working Paper, arXiv:2404.06471 [econ].
Autor, D. H., D. Dorn, and G. H. Hanson (2013): “The China Syndrome: Local Labor Market
Impacts of Import Competition in the United States,” American Economic Review, 103, 2121–2168.

### p. 66 — References II

Bartik, T. J. (1991): Who Benefits from State and Local Economic Development Policies?, W. E.
Upjohn Institute for Employment Research.
Borusyak, K. and P. Hull (2023): “Non-Random Exposure to Exogenous Shocks,”
Econometrica, 91, 2155–2185.
——— (2025): “Optimal Formula Instruments,” Working Paper.
Borusyak, K., P. Hull, and X. Jaravel (2022): “Quasi-Experimental Shift-Share Research
Designs,” Review $of$ Economic Studies, 89, 181–213.
——— (2025a): “Design-Based Identification with Formula Instruments: A Review,” Econometrics
Journal, 83–108.
——— (2025b): “A Practical Guide to Shift-Share Instruments,” $Journal of Economic Perspectives$, 39.
Borusyak, K. and M. Kolerman-Shemer (2024): “Regression Discontinuity Aggregation, with
an Application to the Union Effects on Inequality,” Mimeo.
Cai, J., A. De Janvry, and E. Sadoulet (2015): “Social Networks and the Decision to Insure,”
American Economic Journal: Applied Economics, 7, 81–108.

### p. 67 — References III

Card, D. (1990): “The Impact of the Mariel Boatlift on the Miami Labor Market,” ILR Review, 43,
245–257.
——— (2009): “Immigration and Inequality,” American Economic Review: Papers $&$ Proceedings, 99,
1–21.
Currie, J. and J. Gruber (1996a): “Health Insurance Eligibility, Utilization of Medical Care, and
Child Health,” The Quarterly Journal $of$ Economics, 111, 431–466, iSBN: 00335533.
——— (1996b): “Saving Babies: The Efficacy and Cost of Recent Changes in the Medicaid Eligibility
of Pregnant Women,” Journal $of$ Political Economy, 104, 1263–1296.
Goldsmith-Pinkham, P., I. Sorkin, and H. Swift (2020): “Bartik Instruments: What, When,
Why, and How,” American Economic Review, 110, 2586–2624.
Hsiao, A., J. Moscona, and K. A. Sastry (2025): “Food Policy in a Warming World,” Working
Paper.
Llull, J. (2017): “The effect of immigration on wages: Exploiting exogenous variation at the
national level,” Journal $of$ Human Resources, 53, 608–662.

### p. 68 — References IV

Miguel, E. and M. Kremer (2004): “Worms: Identifying impacts on education and health in the
presence of treatment externalities,” Econometrica, 72, 159–217.
Munro, E. (2025): “Causal Inference under Interference through Designed Markets,”
ArXiv:2504.07217 [econ].
Munro, E., X. Kuang, and S. Wager (2025): “Treatment Effects in Market Equilibrium,”
American Economic Review, 115, 3273–3321.
Narita, Y. and K. Yata (2023): “Algorithm as Experiment: Machine Learning, Market Design,
and Policy Eligibility Rules,” Working Paper, arXiv:2104.12909 [econ].
Noack, C. and C. Rothe (2023): “Donut Regression Discontinuity Designs,” Working Paper,
arXiv:2308.14464 [econ].
Olken, B. A. (2009): “Do television and radio destroy social capital? Evidence from indonesian
villages,” American Economic Journal: Applied Economics, 1, 1–33.
Yanagizawa-Drott, D. (2014): “Propaganda and conflict: Evidence from the Rwandan genocide,”
Quarterly Journal $of$ Economics, 129, 1947–1994.
Zappala, G. (2025): “Propagation of extreme heat in agriculture across sectors and space,” Working
Paper.

## Extraction Gaps

- p. 3: display math with drawn rules
- p. 4: figure or diagram present
- p. 7: figure or diagram present
- p. 8: figure or diagram present
- p. 9: display math with drawn rules
- p. 10: display math with drawn rules
- p. 13: display math with drawn rules
- p. 21: display math with drawn rules
- p. 24: figure or diagram present
- p. 25: display math with drawn rules
- p. 26: figure or diagram present
- p. 28: figure or diagram present
- p. 29: figure or diagram present
- p. 30: figure or diagram present
- p. 31: figure or diagram present
- p. 33: display math with drawn rules
- p. 40: display math with drawn rules
- p. 47: display math with drawn rules
- p. 49: display math with drawn rules
- p. 51: display math with drawn rules
- p. 54: display math with drawn rules
- p. 55: figure or diagram present
- p. 56: figure or diagram present
- p. 63: figure or diagram present
