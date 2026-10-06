# D5: Synthetic Control Methods and Factor Models Translation

## Source

- PDF: `literature/raw_pdf/D5_Factor_models.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/D5_Factor_models.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 31/31 pages, word recall 0.98, words not in the text layer 0.006.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part D: Panel Data Methods
- p. 2: D5 outline
- p. 3: Setting
- p. 4: Setting (2)
- p. 5–6: Motivating example: Abadie et al. (2010)
- p. 7: DiD vs. Synthetic control method (SCM)
- p. 8: How does it work?
- p. 9: Synthetic California (Abadie et al., 2010)
- p. 10: Details
- p. 11: Details (2)
- p. 12: Abadie et al. (2010) example (cont.)
- p. 13: Inference
- p. 14: Inference in Abadie et al. (2010): “Spaghetti plot”
- p. 15: Inference details
- p. 16: Inference details (2)
- p. 17: Diagnostic testing and robustness
- p. 18: Some extensions
- p. 19: SCM: When and why?
- p. 20: Outline
- p. 21: Factor model
- p. 22: Factor models vs. SCM
- p. 23–24: Strategy #1: Synthetic DiD (Arkhangelsky et al. (2021))
- p. 25: Choosing $\hat{v}_{t}$ and $\hat{\omega}_{i}$
- p. 26: Strategy #2: Imputation with factor models
- p. 27–28: Athey et al. (2021) matrix completion approach
- p. 29: References I
- p. 30: References II
- p. 31: References III

## Comprehensive Translation

### p. 1 — Part D: Panel Data Methods

D5: Synthetic Control Methods and Factor Models
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — D5 outline

1
Synthetic control methods
2
Factor models
Recommended reading: Abadie (2021)

### p. 3 — Setting

Consider a complete panel with a non-staggered binary treatment again
$t = 1$
$$\ldots$$
$$t = T_{0}$$
$$t = T_{0} + 1$$
$\ldots$
$t = T_{0} + T_{1}\equiv T$
$i = 1$
$\ldots$
$i = N_{0}$
$i = N_{0} + 1$
$\ldots$
$i = N_{0} + N_{1}\equiv N$

#### p. 3 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Consider a complete panel with a non-staggered binary treatment again

|  | $t = 1$ | ... | $t = T_0$ | $t = T_0 + 1$ | ... | $t = T_0 + T_1 = T$ |
|---|---|---|---|---|---|---|
| $i = 1$ |  |  |  |  |  |  |
| ... |  |  |  |  |  |  |
| $i = N_0$ |  |  |  |  |  |  |
| $i = N_0 + 1$ |  |  |  |  |  |  |
| ... |  |  |  |  |  |  |
| $i = N_0 + N_1 = N$ |  |  |  |  |  |  |

[Figure: Setting]

2

### p. 4 — Setting (2)

For now, assume $N_{1}= T_{1}= 1$:
$$t = 1$$
$$\ldots$$
$$t = T_{0}$$
$t = T$
$i = 1$
$\ldots$
$i = N_{0}$
$i = N$
We just need to impute $Y_{NT}(0)$ to get $\hat{\tau}_{NT}= Y_{NT} - \widehat{Y}_{NT}(0)$
We’ll come back to inference later

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: columns, rows, with._

For now, assume $N_1 = T_1 = 1$:

[Figure: Table with rows i=1, i=$N_0$, i=N and columns t=1, ..., t=$T_0$, t=T]

-  We just need to impute $Y_{NT(0)}$ to get $\hat{Y}_{NT} = Y_{NT} - Y_{NT(0)}$

-  We’ll come back to inference later

### p. 5 — Motivating example: Abadie et al. (2010)

Abadie, Diamond, and Hainmueller (2010) study the effect of California’s 1988 tobacco
control program (Proposition 99) on cigarette sales per capita
They try DiD but it clearly fails:

#### p. 5 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Abadie, Diamond, and Hainmueller (2010) study the effect of California’s 1988 tobacco control program (Proposition 99) on cigarette sales per capita.
They try DiD but it clearly fails:

[Figure: California vs. rest of the U.S. cigarette sales per capita over time, with Passage of Proposition 99 marked]

4

### p. 6 — Motivating example: Abadie et al. (2010)

Abadie, Diamond, and Hainmueller (2010) study the effect of California’s 1988 tobacco
control program (Proposition 99) on cigarette sales per capita
How about this?

#### p. 6 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Abadie, Diamond, and Hainmueller (2010) study the effect of California’s 1988 tobacco control program (Proposition 99) on cigarette sales per capita.

How about this?

[Figure: per-capita cigarette sales (in packs) vs year (1970-2000). Two lines are plotted: California and synthetic California. An arrow points to 1988, labeled "Passage of Proposition 99".]

[Figure: A photo of a person wearing an orange jacket.]

### p. 7 — DiD vs. Synthetic control method (SCM)

DiD uses the simple average of untreated units (“donors”) as the control:
$\hat{\tau}_{NT}= Y_{NT} - \widehat{Y}_{NT}(0),$
$$\widehat{Y}_{NT}(0) \equiv 1$$
$$N_{0}$$
$$N_{0}$$
$$X$$
$$i=1$$
$Y_{iT} + 1$
$T_{0}$
$T_{0}$
$X$
$t=1$
$Y_{Nt} -1$
$N_{0}$
$N_{0}$
$X$
$i=1$
$Y_{it}$
$!$
What if we found a weighted average of donors that closely traced the
pre-treatment path of $Y_{Nt}$: a “synthetic control” unit?
- If the same relationship continues into $t = T$, can use $\widehat{Y}_{NT}(0) = P^{N0}$
$i=1 \omega^{iT}Y^{iT}$
- Avoid manually picking comparable states (think Card and Krueger (1994))

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- DiD uses the simple average of untreated units ("donors") as the control:
  $$ \hat{Y}_{NT} = Y_{NT} - Y_{NT(0)} $$
  $$ Y_{NT(0)} = \frac{1}{N_0} \sum_{i=1}^{N_0} Y_{iT} + \frac{T_0}{T_0} \sum_{i=1}^{N_0} \left(Y_{Nt} - \frac{1}{N_0} \sum_{i=1}^{N_0} Y_{iT}\right) $$
- What if we found weighted average of donors that closely traced the pre-treatment path of $Y_{NE}$: a "synthetic control" unit?
  - If the same relationship continues into $t = T$, can use $Y_{NT(0)} = \sum_{i=1}^{N_0} w_{iT} Y_{iT}$
  - Avoid manually picking comparable states (think Card and Krueger (1994))

[Figure: 6]

### p. 8 — How does it work?

For some $\{v_{t}\}$, we choose weights $\omega_{i}$ on donors to solve
min
$\omega_{1},...,\omega_{N0}$
$T_{0}$
$X$
$t=1$
$v_{t} \cdot$
$Y_{Nt} -$
$$N_{0}$$
$$X$$
$$i=1$$
$$\omega_{i}Y_{it}$$
$$!2$$
s.t. $\omega_{i}\geq 0,$
$N_{0}$
$X$
$i=1$
$\omega_{i}= 1$
“Simplex constraints” produce a well-defined average and avoid extrapolation
They are also a form of regularization
- Otherwise, a “vertical” regression of $Y_{Nt}$ on $Y_{1t}, \ldots , Y_{N0t}$ across $t = 1, \ldots , T_{0}$
$^{\star}$ With $N_{0}> T_{0}$ there would be $\infty$ ways to fit $Y_{Nt}$ in pre-periods perfectly
- And no reason to get good $\widehat{Y}_{NT}(0)$ — overfitting
- With the constraints, typically get a unique, sparse solution: few non-zero weights
Sparsity makes the counterfactual transparent

#### p. 8 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

For some {$v_t$}, we choose weights $\omega_i$ on donors to solve

$$ \min_{\omega_{1\dots,\omega N_0}} \sum_{t=1}^{T_0} v_t \cdot \left(Y_{Nt} - \sum_{i=1}^{N_0} \omega_i Y_{it}\right)^2 \text{ s.t. } \omega_i \geq 0, \sum_{i=1}^{N_0} \omega_i = 1 $$

- "Simplex constraints" produce a well-defined average and avoid extrapolation
- They are also a form of regularization
  - Otherwise, a "vertical" regression of $Y_{Nt}$ on $Y_{it\dots}, Y_{Nt}$ across $t = 1,\dots, T_0$
    - With $N_0 > T_0$ there would be $\infty$ ways to fit $Y_{Nt}$ in pre-periods perfectly
    - And no reason to get good $Y_{Nt}(0)$ — overfitting
    - With the constraints, typically get a unique, sparse solution: few non-zero weights
- Sparsity makes the counterfactual transparent

### p. 9 — Synthetic California (Abadie et al., 2010)

State
Weight
Utah
0.334
Nevada
0.234
Montana
0.199
Colorado
0.164
Connecticut
0.069
Other 33 states
0

### p. 10 — Details

1. Besides pre-period outcomes, can match on any predetermined predictors:
$X_{i}= (Y_{i1}, \ldots , Y_{iT0}, Z_{i})$
2. How to pick weights on predictors, $v$?
- Inverse variance of the predictor across all units
- Or cross-validation:
$^{\star}$ Choose $t_{0}< T_{0}$ training periods: $t = 1, \ldots , t_{0}$
$^{\star}$ Search for $v$ to minimize out-of-sample MSE on the validation period $t_{0} + 1, \ldots , T_{0}$
$^{\star}$ For estimation, limit the sample to the last $t_{0}$ pre-periods & treated period

### p. 11 — Details (2)

3. $\{\omega_{i}\}$ are not unique if the treated unit is in the convex hull of many donors
- Abadie and L’Hour (2021): try to match with donors that are more similar to the treated unit min
$\omega_{1},...,\omega_{N0}$
$X$
$t$
$$Y_{Nt} -$$
$$N_{0}$$
$$X$$
$$i=1$$
$$\omega_{i}Y_{it}$$
$$!2$$
$+ \lambda$
$N_{0}$
$X$
$i=1$
$\omega_{i} (Y_{Nt} -Y_{it})^{2}$
s.t. $\omega_{i}\geq 0, P^{N0}$
$i=1 \omega^{i}= 1$, with penalty $\lambda > 0$
$^{\star}$ Restores uniqueness and reduces interpolation bias
- Robbins et al. (2017): pick weights that minimize the distance from equal weights

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: bullet, equation, points._

3.  $\{ \omega_i \}$ are not unique if the treated unit is in the convex hull of many donors

-   Abadie and L'Hour (2021): try to match with donors that are more similar to the treated unit

    $$ \min_{\omega_1, ..., \omega_{N_0}} \sum_t \left\{ \left( Y_{Nt} - \sum_{i=1}^{N_0} \omega_i Y_{it} \right)^2 + \lambda \sum_{i=1}^{N_0} \omega_i (Y_{Nt} - Y_{it})^2 \right\} $$
    s.t. $\omega_i \ge 0$, $\sum_{i=1}^{N_0} \omega_i = 1$, with penalty $\lambda > 0$

    -   Restores uniqueness and reduces interpolation bias

-   Robbins et al. (2017): pick weights that minimize the distance from equal weights

[Figure: Details (2), equation, bullet points]

### p. 12 — Abadie et al. (2010) example (cont.)

As predictors, use several observables (averaged in 1980–88) and outcome in three
pre-periods
Note: Drop states that adopted other tobacco restrictions during the sample period

#### p. 12 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

As predictors, use several observables (averaged in 1980–88) and outcome in three pre-periods

| Variables | California | Synthetic | Average of 38 control states |
|---|---|---|---|
| Ln(GDP per capita) | 10.08 | 9.86 | 9.86 |
| Percent aged 15–24 | 17.40 | 17.40 | 17.29 |
| Retail price | 89.42 | 89.41 | 87.27 |
| Beer consumption per capita | 24.28 | 24.20 | 23.75 |
| Cigarette sales per capita 1988 | 90.10 | 91.62 | 114.20 |
| Cigarette sales per capita 1980 | 120.20 | 120.43 | 136.58 |
| Cigarette sales per capita 1975 | 127.10 | 126.99 | 132.81 |

- Note: Drop states that adopted other tobacco restrictions during the sample period

[Figure: Variables, California, Synthetic, Average of 38 control states, Ln(GDP per capita), Percent aged 15–24, Retail price, Beer consumption per capita, Cigarette sales per capita 1988, Cigarette sales per capita 1980, Cigarette sales per capita 1975]
11

### p. 13 — Inference

Inference is difficult with only 1 treated unit
Abadie et al. (2010) “spaghetti plot”: randomization inference
- Under the null of zero effect, the treated unit is no different than others
- For each $i$ (including $i = N$), construct synthetic $i$ and compute prediction error:
$R_{i}= P$
$t>T_{0}$
$Y_{it} - \widehat{Y}_{it}(0)$
$$2$$
- Reject the null if $R_{N}$ is extreme in the set of $R_{1}, \ldots , R_{N}$; p-value =
$1$
$N$
$PN$
$i=1 1 [R^{N}\geq R^{i}]$

### p. 14 — Inference in Abadie et al. (2010): “Spaghetti plot”

#### p. 14 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

gap in per-capita cigarette sales (in packs)
30
California
control states
20
10
0
-10
-20
-30
Passage of Proposition 99
1970 1975 1980 1985 1990 1995 2000
year
13
[Figure: gap in per-capita cigarette sales (in packs) vs. year, showing California and control states]

### p. 15 — Inference details

Complication 1: for some $i$, synthetic control may not match the pre-treatment
trajectory well
- Can drop spaghettis with high pre-treatment MSE
- Or use $R_{i}$= post-treatment MSE divided by pre-treatment MSE
Complication 2: how can we get a confidence interval?
- Test inversion: for each $\tau_{0}$ test $\tau = \tau_{0}$; collect all $\tau_{0}$ that are not rejected
- To test $\tau = \tau_{0}$, replace $Y_{NT}$ with $Y_{NT} -\tau_{0}$ and test $\tau = 0$

### p. 16 — Inference details (2)

Problem: randomization inference is not valid without randomization
- Test has a 5% significance level in the sense that for 5% of units if they were treated the correct null would be rejected
$^{\star}$ Not very useful since the treated unit was not chosen randomly with equal
probabilities
- Abadie, Diamond, and Hainmueller (2015) study the economic impacts of German reunification on West Germany
$^{\star}$ What does assigning this treatment to another country mean?
One alternative (Chernozhukov et al. (2021)): “conformal inference” based on
permuting periods instead of units

### p. 17 — Diagnostic testing and robustness

Placebo test: “backdating”
(From Abadie (2021))
Robustness check: dropping each contributing donor at a time

#### p. 17 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- Placebo test: “backdating”

[Figure: Per Capita (GDP in 2012 USD) vs. Year, with lines for West Germany, Synthetic West Germany, and a vertical line indicating "Reunification backdated to 1990".]
Figure 3. Backdating the 1990 German Reunification Application
(From Abadie (2021))

- Robustness check: dropping each contributing donor at a time

16

### p. 18 — Some extensions

Everything works with multiple treated periods
Multiple treated units:
- Create a synthetic control for each treated unit and estimate the effects, then average (Abadie and L’Hour (2021))
- Or a single synthetic control for the average of treated units (Robbins et al. (2017))
Sun, Ben-Michael, and Feller (2025): construct a single synthetic control for
multiple outcome variables
Ben-Michael, Feller, and Rothstein (2021): Augmented SCM estimators, augsynth
- Adjust the estimator for mismatches in the pre-periods for double-robustness

### p. 19 — SCM: When and why?

In which contexts should one use synthetic controls?
Abadie (2021):
- No anticipation, no spillovers
- Donor units shouldn’t experience large idiosyncratic shocks in the post-periods
- Big effects and low-volatility outcomes (when few treated units)
- When a good synthetic control exists
But which outcome models imply existence of good synthetic controls?
- And is SCM the best for those models?
- SCM is usually motivated by factor models (although see Arkhangelsky and Hirshberg (2023))

### p. 20 — Outline

1
Synthetic control methods
Factor models

### p. 21 — Factor model

Factor (a.k.a. latent factor, interactive fixed-effect) model:
$Y_{it}(0) = \alpha_{i} + \beta_{t} + L_{it} + \epsilon_{it},$
$$L_{it}= S'$$
$$_{i}F_{t}\equiv$$
$R$
$X$
$r=1$
$S_{ir}F_{tr},$
$\mathbb{E} [\epsilon_{it}] = 0$
with an unknown small number $R$ of unobserved time-varying factors $F_{t}$ and unobserved
unit sensitivities (factor loadings) $S_{i}$
$\alpha_{i}= \alpha_{i} \cdot 1$;
$\beta_{t}= 1 \cdot \beta_{t}$;
unit-specific trend = $\gamma_{i} \cdot t$
E.g. $F_{t}=$ (National minimum wage, Dummy of Democratic administration),
$S_{i}$= (Share of min.wage occupations in state $i$, Democratic majority)
Viewing $S_{ir}$ and $F_{tr}$ as unknown parameters, this is a nonlinear model
Treatment $D_{it}$ can be correlated with $L_{it}$(but not with $\epsilon_{it}$)

#### p. 21 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Factor (a.k.a. latent factor, interactive fixed-effect) model:

$Y_{it}(0) = \alpha_i + \beta_t + L_{it} + \epsilon_{it}$,  $L_{it} = S_i F_t = \sum_{r=1}^{R} S_{ir} F_{tr}$,  $E[\epsilon_{it}] = 0$

with an unknown small number $R$ of unobserved time-varying factors $F_t$ and unobserved unit sensitivities (factor loadings) $S_i$;

- $\alpha_i = \alpha_i \cdot 1$; $\beta_t = 1 \cdot \beta_t$; unit-specific trend = $\gamma_i \cdot t$
- E.g. $F_t$ = (National minimum wage, Dummy of Democratic administration), $S_i$ = (Share of min-wage occupations in state $i$, Democratic majority)
- Viewing $S_{ir}$ and $F_{tr}$ as unknown parameters, this is a nonlinear model
- Treatment $D_{it}$ can be correlated with $L_{it}$ (but not with $\epsilon_{it}$)

19

### p. 22 — Factor models vs. SCM

$Y_{it}(0) = \alpha_{i} + \beta_{t} + L_{it} + \epsilon_{it},$
$$L_{it}=$$
$$R$$
$$X$$
$$r=1$$
$S_{ir}F_{tr},$
$\mathbb{E} [\epsilon_{it}] = 0$
Why synthetic controls if you have a factor model?
$Y_{Nt}\approx P^{N0}$
$i=1 \omega^{i}Y^{it}$ for many pre-periods $t$ if $S^{rN}\approx P^{N0}$
$i=1 \omega^{i}S^{ri}$ for each factor $r$ (and
for $\alpha_{i}$)
Then can recover $\hat{\alpha}_{i} + \hat{\beta}_{t} + \hat{L}_{NT}\equiv \widehat{Y}_{NT}(0)$ with SCM... but there are other methods

### p. 23 — Strategy #1: Synthetic DiD (Arkhangelsky et al. (2021))

Consider a non-staggered case
DiD puts equal weight on all untreated units and all pre-periods
But control units similar to the treated ones in the pre-periods are more useful
- Must have factor loadings similar to $i = N$ (or to average of $N_{0} + 1, \ldots , N$)
Pre-periods similar to the post-period on untreated outcomes are more useful
- Must have factors similar to $t = T$ (or to average of $T_{0} + 1, \ldots , T$)

### p. 24 — Strategy #1: Synthetic DiD (Arkhangelsky et al. (2021))

Obtain weights $v_{1}, \ldots , v_{T0}$ and $\omega_{1}, \ldots \omega_{N0}$ that add up to one; then
$d$
ATT $= Y_{treated,post} -$
$$N_{0}$$
$$X$$
$$i=1$$
$$\hat{\omega}_{i}Y_{i,post} -$$
$$T_{0}$$
$$X$$
$$t=1$$
$$\hat{v}_{t}$$
$Y_{treated,t} -$
$N_{0}$
$X$
$i=1$
$\hat{\omega}_{i}Y_{it}$
$!$
- Estimate via TWFE regression weighted by $\hat{v}_{t} \cdot \hat{\omega}_{i}$ (with $\hat{v}_{T0+1}= \ldots = \hat{v}_{T}= 1$ and $\hat{\omega}_{N0+1}= \ldots = \hat{\omega}_{N}= 1$)
- How to choose $\hat{v}_{t}$ and $\hat{\omega}_{i}$?

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: treated._

- Obtain weights $v_1, ..., v_{T_0}$ and $\omega_1, ..., \omega_{N_0}$ that add up to one; then

$$ATT = \overline{Y_{treated,post}} - \sum_{i=1}^{N_0} \omega_i Y_{i,post} - \sum_{t=1}^{T_0} v_t \left( Y_{treated,t} - \sum_{i=1}^{N_0} \omega_i Y_{it} \right)$$

- Estimate via TWFE regression weighted by $\hat{v}_t \cdot \omega_i$ (with $\hat{v}_{T_0+1} = ... = \hat{v}_T = 1$ and $\omega_{N_0+1} = ... = \omega_N = 1$)

- How to choose $\hat{v}_t$ and $\omega_i$?

22

### p. 25 — Choosing $\hat{v}_{t}$ and $\hat{\omega}_{i}$

Choose $\hat{v}_{t}$ to make $Y_{i,post}$ close to $\beta_{post} + P^{T0}$
$t=1 v^{t}Y^{it}$ across untreated units
- $\beta_{post}$ captures period FEs
- Horizontal regression of $Y_{i,post}$ on a constant and $Y_{i1}, \ldots , Y_{iT0}$ with restrictions
$PT_{0}$
$t=1 v^{t}= 1$ and $v^{t}\geq 0$
Choose $\hat{\omega}_{i}$ to make $Y_{treated,t}$ close to $\alpha_{treated} + P^{N0}$
$i=1 \omega^{i}Y^{it}$ across periods
- $\alpha_{treated}$ captures unit FEs
- Vertical regression; because $N_{0}> T_{0}$, regularize (using ridge) min
$\alpha_{treated},\{\omega_{i}\}$
$1$
$T_{0}$
$$T_{0}$$
$$X$$
$$t=1$$
$$Y_{treated,t} -\alpha_{treated} -$$
$N_{0}$
$X$
$i=1$
$\omega_{i}Y_{it}$
$!2$
$+ \lambda$
$N_{0}$
$X$
$i=1$
$\omega^{2}$
$i$
s.t. $P^{N0}$
$i=1 \omega^{i}= 1,$
$\omega_{i}\geq 0$ (See paper for choice of penalty $\lambda$ )

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Choose $\hat{v}_t$ to make $Y_{i,post}$ close to $\beta_{post} + \sum_{t=1}^{T_0} v_t Y_{it}$ across untreated units
  - $\beta_{post}$ captures period FEs
  - Horizontal regression of $Y_{i,post}$ on a constant and $Y_{1:T_0}$ with restrictions
  - $\sum_{t=1}^{T_0} v_t = 1$ and $v_t \geq 0$
- Choose $\omega_i$ to make $Y_{treated,t}$ close to $\alpha_{treated} + \sum_{i=1}^{N_0} \omega_i Y_{it}$ across periods
  - $\alpha_{treated}$ captures unit FEs
  - Vertical regression; because $N_0 > T_0$, regularize (using ridge)
  - $$ \min_{\alpha_{treated}, \{\omega_i\}} \sum_{t=1}^{T_0} \frac{1}{T_0} \sum_{i=1}^{N_0} (Y_{treated,t} - \alpha_{treated} - \sum_{i=1}^{N_0} \omega_i Y_{it})^2 + \lambda \sum_{i=1}^{N_0} \omega_i^2 $$
  - s.t. $\sum_{i=1}^{N_0} \omega_i = 1$, $\omega_i \geq 0$ (See paper for choice of penalty $\lambda$)

### p. 26 — Strategy #2: Imputation with factor models

Recall $Y_{it}(0) = \alpha_{i} + \beta_{t} + L_{it} + \epsilon_{it},$
$$L_{it}= P^{R}$$
$$r=1 S^{ir}F^{tr}$$
SCM and SDiD balance out latent factors without estimating them
Alternatively, can estimate $L_{it}$ from untreated observations and use them for $\widehat{Y}_{it}(0)$
Can estimate factors, loadings, and $R$ using principle component analysis (Bai and
Ng (2002))
Another idea: estimate the $L$ matrix directly
- Key property: rank $(L) = R$ is small

#### p. 26 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Recall $Y_{it}(0) = \alpha_i + \beta_t + L_{it} + \epsilon_{it}$, $L_{it} = \sum_{r=1}^R S_{ir} F_{tr}$

- SCM and SDiD balance out latent factors without estimating them

- Alternatively, can estimate $L_{it}$ from untreated observations and use them for $Y_{it}(0)$

- Can estimate factors, loadings, and $R$ using principle component analysis (Bai and Ng (2002))

- Another idea: estimate the $L$ matrix directly

  - Key property: rank($L$) = $R$ is small

[Figure: 24]

### p. 27 — Athey et al. (2021) matrix completion approach

Athey, Bayati, Doudchenko, Imbens, and Khosravi (2021): matrix completion
$L_{it}$
$t = 1$
$$\ldots$$
$$t = T_{0}$$
$$t = T_{0} + 1$$
$\ldots$
$t = T_{0} + T_{1}\equiv T$
$i = 1$
$\ldots$
$i = N_{0}$
$i = N_{0} + 1$
?
?
?
$\ldots$
?
?
?
$i = N_{0} + N_{1}\equiv N$
?
?
?
Recover $L$ from:
- observing $Y_{it}$ for untreated observations = noisy version of $\alpha_{i} + \beta_{t} + L_{it}$
- knowing that $L$ has low rank

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Athey, Bayati, Doudchenko, Imbens, and Khosravi (2021): matrix completion

$$
L_{it}
$$
$t = 1$ ... $t = T_0$ $t = T_0 + 1$ ... $t = T_0 + T_1 \equiv T$

| | $t = 1$ | ... | $t = T_0$ | $t = T_0 + 1$ | ... | $t = T_0 + T_1$ |
|---|---|---|---|---|---|---|
| $i = 1$ |  |  |  | ? | ? | ? |
| ... |  |  |  | ? | ? | ? |
| $i = N_0$ |  |  |  | ? | ? | ? |
| $i = N_0 + 1$ |  |  |  | ? | ? | ? |
| ... |  |  |  | ? | ? | ? |
| $i = N_0 + N_1 = N$ |  |  |  | ? | ? | ? |

- Recover $L$ from:
  - observing $Y_{it}$ for untreated observations = noisy version of $\alpha_i + \beta_t + L_{it}$
  - knowing that $L$ has low rank

[Figure: Athey et al. (2021) matrix completion]

### p. 28 — Athey et al. (2021) matrix completion approach

Athey et al. (2021) solve:
min
$\{\alpha_{i}\},\{\beta_{t}\},L$
$$X$$
$$it: D_{it}=0$$
$$(Y_{it} -\alpha_{i} -\beta_{t} -L_{it})^{2}+ \lambda \parallel L\parallel_{*}$$
$\parallel L\parallel_{*}$ is the “nuclear” norm of matrix $L$: small when $L$ is close to some low-rank
matrix
Computationally efficient (unlike searching among low-rank matrices)
Then take average of $Y_{it} -\hat{\alpha}_{i} -\hat{\beta}_{t} -\hat{L}_{it}$ among treated observations
No results on inference

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Athey et al. (2021) solve:

$$
\min_{\substack{\{a_i\}, \{b_i\}, L}} \sum_{it: D_{it}=0} (Y_{it} - a_i - b_t - L_{it})^2 + \lambda ||L||_*
$$

- $||L||_*$ is the "nuclear" norm of matrix L: small when L is close to some low-rank matrix

-  Computationally efficient (unlike searching among low-rank matrices)

-  Then take average of $Y_{it} - \hat{a}_i - \hat{b}_t - \hat{L}_{it}$ among treated observations

-  No results on inference

### p. 29 — References I

Abadie, A. (2021): “Using Synthetic Controls: Feasibility, Data Requirements, and Methodological
Aspects,” Journal $of$ Economic Literature, 59, 391–425.
Abadie, A., A. Diamond, and J. Hainmueller (2010): “Synthetic control methods for
comparative case studies: Estimating the effect of California’s Tobacco control program,” Journal $of$
the American Statistical Association, 105, 493–505, arXiv: 1011.1669v3 ISBN: 0162-1459.
——— (2015): “Comparative Politics and the Synthetic Control Method,” American Journal $of$
Political Science, 59, 495–510, iSBN: 1540-5907.
Abadie, A. and J. L’Hour (2021): “A Penalized Synthetic Control Estimator for Disaggregated
Data,” Journal $of$ the American Statistical Association, 116, 1817–1834.
Arkhangelsky, D., S. Athey, D. A. Hirshberg, G. W. Imbens, and S. Wager (2021):
“Synthetic Difference-in-Differences,” American Economic Review, 111, 4088–4118.
Arkhangelsky, D. and D. Hirshberg (2023): “Large-Sample Properties of the Synthetic
Control Method under Selection on Unobservables,” ArXiv:2311.13575 [econ].

### p. 30 — References II

Athey, S., M. Bayati, N. Doudchenko, G. W. Imbens, and K. Khosravi (2021): “Matrix
Completion Methods for Causal Panel Data Models,” Journal $of$ the American Statistical
Association, 116, 1716–1730, arXiv: 1710.10251.
Bai, J. and S. Ng (2002): “Determining the Number of Factors in Approximate Factor Models,”
Econometrica, 70, 191–221.
Ben-Michael, E., A. Feller, and J. Rothstein (2021): “The Augmented Synthetic Control
Method,” Journal $of$ the American Statistical Association, 116, 1789–1803.
Card, D. and A. Krueger (1994): “Minimum Wages and Employment: A Case Study of the
Fast-Food Industry in New Jersry and Pennsylvania,” The American Economic Review, 84, 772–793.
Chernozhukov, V., K. Wüthrich, and Y. Zhu (2021): “An Exact and Robust Conformal
Inference Method for Counterfactual and Synthetic Controls,” Journal $of$ the American Statistical
Association, 116, 1849–1864.
Robbins, M. W., J. Saunders, and B. Kilmer (2017): “A Framework for Synthetic Control
Methods With High-Dimensional, Micro-Level Data: Evaluating a Neighborhood-Specific Crime
Intervention,” Journal $of$ the American Statistical Association, 112, 109–126.

### p. 31 — References III

Sun, L., E. Ben-Michael, and A. Feller (2025): “Using Multiple Outcomes to Improve the
Synthetic Control Method,” Review $of$ Economics and Statistics.

## Extraction Gaps

- p. 3: display math with drawn rules; figure or diagram present
- p. 4: display math with drawn rules; figure or diagram present
- p. 5: figure or diagram present
- p. 6: figure or diagram present
- p. 7: display math with drawn rules
- p. 8: display math with drawn rules
- p. 11: display math with drawn rules; large delimiter (matrix or cases)
- p. 12: figure or diagram present
- p. 13: display math with drawn rules; large delimiter (matrix or cases); layout reconstruction withheld: it wrote math the page does not have
- p. 14: figure or diagram present
- p. 17: figure or diagram present
- p. 21: display math with drawn rules
- p. 22: display math with drawn rules; layout reconstruction withheld: it wrote math the page does not have
- p. 24: display math with drawn rules
- p. 25: display math with drawn rules
- p. 26: display math with drawn rules
- p. 27: display math with drawn rules; figure or diagram present
- p. 28: display math with drawn rules
