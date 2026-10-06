# E2: RDD Extensions Translation

## Source

- PDF: `literature/raw_pdf/E2_RDD_extensions.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/E2_RDD_extensions.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 36/36 pages, word recall 0.99, words not in the text layer 0.004.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part E: Regression Discontinuity
- p. 2: E2 Outline
- p. 3: Fuzzy RDD
- p. 4: Fuzzy RDD examples
- p. 5: Identification and estimation
- p. 6: Outline
- p. 7: Discrete running variables
- p. 8: An “honest” (“bias-aware”) approach
- p. 9: An “honest” (“bias-aware”) approach (2)
- p. 10: RD in time
- p. 11: How to think about RD in time?
- p. 12: Outline
- p. 13: Adding covariates
- p. 14: Outline
- p. 15: Multiple cutoffs or running variables
- p. 16: #1: Scalar running variable, single heterogeneous cutoff
- p. 17: #2: Scalar running variable, multiple cutoffs
- p. 18: #3: Multiple running variables, single discontinuity
- p. 19: Special case: Spatial discontinuity designs
- p. 20: Effects at a single boundary point
- p. 21: Effects at a single boundary point: Identification
- p. 22: Effects at a single boundary point: Estimation
- p. 23: Problems of distance-based estimation
- p. 24: Pooled effect
- p. 25: Pooled effect: better estimators
- p. 26: Outline
- p. 27: Local randomization approach to RDDs
- p. 28: Choosing the window
- p. 29: Outline
- p. 30: Extrapolating RD estimates
- p. 31: Extrapolating RD estimates (2)
- p. 32: Extrapolating RD estimates (3)
- p. 33: References I
- p. 34: References II
- p. 35: References III
- p. 36: References IV

## Comprehensive Translation

### p. 1 — Part E: Regression Discontinuity

E2: RDD Extensions
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — E2 Outline

1
Fuzzy RDD
2
Discrete running variables and RD in time
3
Adding covariates
4
Multiple cutoffs or running variables and Spatial RD
5
Local randomization approach
6
Extrapolating RD estimates
Reading: Cattaneo, Idrobo, and Titiunik (2023)

### p. 3 — Fuzzy RDD

Think of fuzzy RDD as using $Z_{i}= 1 [X_{i}\geq c]$ as an instrument:
- $D_{i}\neq  Z_{i}$: treatment is not fully determined by $X_{i}$
- But $\mathbb{E} [D_{i}\mid X_{i}]$ jumps at the cutoff =$\Rightarrow Z_{i}$ is a relevant IV around $X_{i}= c$ (Illustration from Van Der Klaauw (2002), Fig. 2)

#### p. 3 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- Think of fuzzy RDD as using $Z_i = 1[X_i \ge c]$ as an instrument:
  - $D_i \neq Z_i$: treatment is not fully determined by $X_i$
  - But $E[D_i | X_i]$ jumps at the cutoff $\Rightarrow Z_i$ is a relevant IV around $X_i = c$

[Figure: Propensity score Pr(T=1|S) vs. X, Fuzzy RD Design, Sharp RD Design, (Illustration from Van Der Klaauw (2002), Fig. 2)]

### p. 4 — Fuzzy RDD examples

Class size “first stage”
Financial aid “first stage”
(MHE, Fig. 6.2.1a, based on Angrist and Lavy (1999))
(Van Der Klaauw (2002), Fig. 4)

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Class size “first stage”
[Figure: Actual class size, Maimonides Rule, Enrollment count, Class size]

(MHE, Fig. 6.2.1a, based on Angrist and Levy (1999))

Financial aid “first stage”
[Figure: Financial aid ($) in thousands, Ability index ($), Asterisks]

(Van Der Klaauw (2002), Fig. 4)

3

### p. 5 — Identification and estimation

With binary treatment, need standard IV assumptions:
- Exclusion: $Y_{i}(d, z) \equiv Y_{i}(d)$
- Independence: continuity of $\mathbb{E} [D_{i}(z) \mid X_{i}= x]$ and $\mathbb{E} [Y_{i}(d) \mid X_{i}= x]$ at $x = c$
- Monotonicity: $D_{i}(1) \geq D_{i}(0)$
With binary $D$, reduced form $/$ first stage $\equiv \tau_{Y}/\tau_{D}$ identifies LATE:
$\tau_{Y}$
$\tau_{D}$
$$=\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid D_{i}(1) > D_{i}(0), X_{i}= c]$$
Report $\hat{\tau}_{D}$, $\hat{\tau}_{Y}$ and fuzzy RD estimate $\hat{\tau}_{Y}/\hat{\tau}_{D}$ from local polynomial estimation with
the same bandwidth for $Y$ and $D$
- rdrobust chooses bandwidth to minimize MSE for the IV
- Show RD plots for the first stage and reduced form (ITT)

#### p. 5 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- With binary treatment, need standard IV assumptions:
  - Exclusion: $Y_i(d, z) = Y_i(d)$
  - Independence: continuity of $E[D_i(z) | X_i = x]$ and $E[Y_i(d) | X_i = x]$ at $x = c$
  - Monotonicity: $D_i(1) \ge D_i(0)$
- With binary $D$, reduced form/first stage $\equiv \tau_Y / \tau_D$ identifies LATE:
  $$
  \frac{\tau_Y}{\tau_D} = E[Y_i(1) - Y_i(0) | D_i(1) > D_i(0), X_i = c]
  $$
- Report $\hat{r}_D$, $\hat{r}_Y$ and fuzzy RD estimate $\hat{r}_Y / \hat{r}_D$ from local polynomial estimation with the same bandwidth for $Y$ and $D$
  - rdrobust chooses bandwidth to minimize MSE for the IV
  - Show RD plots for the first stage and reduced form (ITT)

### p. 6 — Outline

1
Fuzzy RDD
2
Discrete running variables and RD in time
3
Adding covariates
4
Multiple cutoffs or running variables and Spatial RD
5
Local randomization approach
Extrapolating RD estimates

### p. 7 — Discrete running variables

In many RDD applications $X_{i}$ is discrete
- E.g. number of kids in a cohort (Angrist and Lavy $(1999))$
Does this matter conceptually?
- lim $_{x\downarrow,\uparrowc}\mathbb{E} [Y_{i}\mid X_{i}= x]$ is not well-defined =$\Rightarrow$ RD identification fails
- As $N \to \infty$ , we can’t shrink bandwidth $h \to 0$
Does this matter in practice?
- If there are many mass points of $X_{i}$ around $c$, can probably ignore the issue
- If $X_{i}$ is sparse around $c$, it’s more salient

### p. 8 — An “honest” (“bias-aware”) approach

Armstrong and Kolesár (2018) and Kolesár and Rothe (2018) develop an “honest”
approach to RDDs
- Acknowledges that bias in local linear estimation is inevitable
- With discrete $X_{i}$ we cannot consistently estimate bias
Instead, it bounds worst-case bias by assuming that $\mathbb{E} [Y_{i}\mid X_{i}]$ is sufficiently
smooth on either side of $c$
- Choose bound $M$ on the curvature of $\mathbb{E} [Y_{i}\mid X_{i}] \Rightarrow$ get a partially identified set of $\tau$
- Reminds you of anything?
Choosing $M$ is annoying but ignoring discreteness does the same implicitly
- A rule of thumb is available

### p. 9 — An “honest” (“bias-aware”) approach (2)

rdhonest produces a “bias-aware” confidence interval
- Centered around the local linear estimator
$^{\star}$ With a different bandwidth (optimized for CI length); in practice, similar to the
Calonico et al. (2014) bandwidth
- $\pm$ worst-case bias (rather than subtracting estimated bias), in addition to SE
Approach applies even with continuous running variable
- And can have good finite-sample properties because doesn’t rely on $h$ being small
See Imbens and Wager (2019) for an honest approach not based on local linear
estimation
- More complex (via numerical optimization) but more generalizable

### p. 10 — RD in time

Related problems arise with “RD in time”
$X_{i}$= period; often no cross-sectional variation at all, just a time series
E.g. Anderson (2014): the effect of a public transit strike in LA on highway
congestion
(Anderson (2014), Fig. 2)
Similar situation: $X_{i}$= age

#### p. 10 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Related problems arise with “RD in time”

- $X_i$ = period; often no cross-sectional variation at all, just a time series
- E.g. Anderson (2014): the effect of a public transit strike in LA on highway congestion

[Figure: Average delay by week All highways]

- Similar situation: $X_i$ = age

### p. 11 — How to think about RD in time?

Theoretically, time is a continuous variable
- Could measure the outcome a second before and after the policy change — like event studies in finance
- Asymptotic with data frequency growing
In practice, outcomes are measured at discrete intervals, and collecting more data
involves going further in time from $c$
- As $T \to \infty$ , the bandwidth can’t (and doesn’t) shrink
- Understanding check: is the McCrary test helpful here?

### p. 12 — Outline

1
Fuzzy RDD
2
Discrete running variables and RD in time
3
Adding covariates
4
Multiple cutoffs or running variables and Spatial RD
5
Local randomization approach
Extrapolating RD estimates

### p. 13 — Adding covariates

As usual, covariates $W_{i}$ can be added to increase efficiency or to avoid OVB
If $W_{i}$ are predetermined, i.e. $\mathbb{E} [W_{i}\mid X_{i}]$ is continuous at the cutoff:
- Include $W_{i}$ in the regression implementation of local linear estimator without interactions:
$Y_{i}= \tau D_{i} + \gamma_{0} + \gamma_{1}(X_{i} -c) + \gamma_{2}(X_{i} -c)D_{i} + \delta 'W_{i} +$ error
- This increases efficiency without changing the estimand (Calonico $et al. (2019))$
- See Noack, Olma, and Rothe (2023) on flexible covariate adjustment
If $W_{i}$ jumps at the cutoff, the effects of $D_{i}$ and $W_{i}$ cannot be separated without
further assumptions
- Frölich and Huber (2019) make a selection-on-observables assumption; see also Peng and Ning (2021)

### p. 14 — Outline

1
Fuzzy RDD
2
Discrete running variables and RD in time
3
Adding covariates
4
Multiple cutoffs or running variables and Spatial RD
5
Local randomization approach
Extrapolating RD estimates

### p. 15 — Multiple cutoffs or running variables

Four scenarios:
1. Scalar running variable, single heterogeneous cutoff
2. Scalar running variable, multiple cutoffs
3. Multiple running variables, single discontinuity — including spatial RD
(see Cattaneo, Titiunik, and Yu (2025d) for a review)
4. Aggregating multiple discontinuities (Borusyak and Kolerman-Shemer (2024))
Note: package rdmulti provides commands for estimation and plotting in #1–3

### p. 16 — #1: Scalar running variable, single heterogeneous cutoff

E.g. states have different income cutoffs for a means-tested program:
$D_{i}= 1 [X_{i}\geq C_{i}]$ for $C_{i}\in \{c_{1}, \ldots , c_{K}\}$
Obviously, we can RD by subgroup $C_{i}= c$:
$$\tau_{c}=\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid X_{i}= c, C_{i}= c]$$
Can also pool them by using “normalized” $\tilde{X}_{i}= X_{i} -C_{i}$ with a cutoff of zero
- Pooled RDD identifies a weighted average of group-specific ones:
$$\tau_{pooled}=$$
$$\sum$$
$$c \omega^{c}\tau^{c}$$
$$\sum$$
$$c \omega^{c}$$
$$,$$
$\omega_{c}= f_{X\midC}(c, c)$

#### p. 16 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- E.g. states have different income cutoffs for a means-tested program:
  $D_i = 1 [X_i \geq C_i]$ for $C_i \in \{c_1, ..., c_k\}$

- Obviously, we can RD by subgroup $C_i = c$:
  $$ \tau_c = E[Y(1) - Y(0) | X_i = c, C_i = c] $$

- Can also pool them by using "normalized" $\tilde{X}_i = X_i - C_i$ with a cutoff of zero

- Pooled RDD identifies a weighted average of group-specific ones:
  $$ \tau_{pooled} = \frac{\sum_c \omega_c \omega_c \tau_c}{\sum_c \omega_c} , \quad \omega_c = f_X(c, c) $$

### p. 17 — #2: Scalar running variable, multiple cutoffs

E.g. rounding of Yelp stars (Anderson and Magruder $(2012))$ generates cutoffs at
$X_{i}= 3.25, 3.75, 4.25, 4.75$
Or federal subsidies determined by local population, with several discontinuities
Consider a sharp design with multi-valued $D_{i}=$
$d_{0},$
if $X_{i}< c_{1}$
$d_{1},$
if $c_{1}\leq X_{i}< c_{2}$
$\ldots$
$d_{K},$
if $c_{K}\leq X_{i}$
RDD on subsample with $D_{i}\in \{d_{k-1}, d_{k}\}$ identifies $\mathbb{E} [Y_{i}(d_{k}) -Y_{i}(d_{k-1}) \mid X_{i}= c_{k}]$
Mostly similar to the previous case
- Except same observation can be used twice (unless bandwidth is small enough)

#### p. 17 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: cases._

- E.g. rounding of Yelp stars (Anderson and Magruder (2012)) generates cutoffs at $X_i = 3.25, 3.75, 4.25, 4.75$
- Or federal subsidies determined by local population, with several discontinuities
- Consider a sharp design with multi-valued $D_i = \begin{cases}
d_0, & \text{if } X_i < c_1 \\
d_1, & \text{if } c_1 \le X_i < c_2 \\
\vdots & \\
d_k, & \text{if } c_K \le X_i
\end{cases}$
- RDD on subsample with $D_i \in \{d_{k-1}, d_k\}$ identifies $\mathbb{E}[Y_i(d_k) - Y_i(d_{k-1}) | X_i = c_k]$
- Mostly similar to the previous case
  - Except same observation can be used twice (unless bandwidth is small enough)

### p. 18 — #3: Multiple running variables, single discontinuity

E.g. scholarship awarded to students scoring above a cutoff in both math and English:
X $_{i}= ($ Math $_{i},$ English $_{i}) ,$
$D_{i}= 1 [$ Math $_{i}\geq c_{Math}] \times 1 [$ English $_{i}\geq c_{English}]$
(Cattaneo et al. (2023), Fig. 5.5a)
Note that a student needn’t be close to the border on both running variables to be
near the boundary

#### p. 18 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

E.g. scholarship awarded to students scoring above a cutoff in both math and English:

$X_i = (Math_i, English_i)$,

$D_i = 1 [Math_i \geq c_{Math} \times 1 [English_i \geq c_{English}]]$

[Figure: Mathematics Cutoff, Language Cutoff, Boundary, Treated Area, Control Area, Mathematics Score (%), Language Score ($X_i$)]

(Cattaneo et al. (2023), Fig. 5.5a)

-  Note that a student needn't be close to the border on both running variables to be near the boundary

### p. 19 — Special case: Spatial discontinuity designs

X $_{i}= ($ Longitude $_{i},$ Latitude $_{i})$; border is often complex
(Cattaneo et al. (2023), Fig. 5.5b)
E.g. Dell (2010) compares today’s outcomes across the boundary of a forced
mining labor system in Peru and Bolivia $“mita”$

#### p. 19 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

$X_{i} = (Longitude_{i}, Latitude_{i})$; border is often complex
[Figure: Treated Area, Control Area, Longitude (X₁) and Latitude (Y) axes, with labeled coordinates]
(Cattaneo et al. (2023), Fig. 5.5b)
-  E.g. Dell (2010) compares today’s outcomes across the boundary of a forced mining labor system in Peru and Bolivia “mita”

### p. 20 — Effects at a single boundary point

#### p. 20 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: Mathematics Score (%), Language Score (%), Mathematics Cutoff, Language Cutoff, Boundary, Control Area, Created Area]

16

### p. 21 — Effects at a single boundary point: Identification

Let $D_{i}= a($ X $_{i})$, $A_{0}= \{x: a(x) = 0\}$, $A_{1}= \{x: a(x) = 1\}$, and $B$ = boundary
between $A_{0}$ and $A_{1}$
Assume $\mathbb{E} [Y_{i}(d) \mid$  X $_{i}= x]$ is continuous at $x \in B$
- Violated when multiple outcome-relevant treatments jump at the same boundary
- Or when location X $_{i}$ or the boundary can be manipulated
Average causal effect at point $b \in B$, $\tau (b)$, is identified by
$\tau (b) =$
lim
$^{x\tob, x\inA}1 \mathbb{E} [Y^{i}\mid$  X $^{i}= x] -$
lim
$^{x\tob, x\inA}0 \mathbb{E} [Y^{i}\mid$  X $^{i}= x]$

### p. 22 — Effects at a single boundary point: Estimation

1. Let $d($ X $_{i}, b)$ denote some distance metric (e.g. Euclidean)
- Use “signed distance” as the running variable: $\tilde{X}_{i}=$
$\{$
$d($ X $_{i}, b),$
$D_{i}= 1$
$-d($ X $_{i}, b),$
$D_{i}= 0$
(with a cutoff of zero)
- Use local linear estimation, controlling for $\tilde{X}_{i}$ and $D_{i}\tilde{X}_{i}$
- But Cattaneo et al. (2025b) show poor behavior near irregular points of the boundary (e.g., kinks)
2. Location-based approach (Cattaneo et al. (2025c)): within $d($ X $_{i}, b) \leq h$, regress $Y_{i}$
on $D_{i}$ controlling for a polynomial of X $_{i} -b$ and its interaction with $D_{i}$
- Does not suffer from problems of the distance-based approach

### p. 23 — Problems of distance-based estimation

Cattaneo et al. (2025b), Fig.1

#### p. 23 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Problems of distance-based estimation

[Figure: (a) Distance to b ∈ ℬ. (b) Distance-based Conditional Expectation. Cattaneo et al. (2025b), Fig.1]

(a) Distance to b ∈ ℬ.
(b) Distance-based Conditional Expectation.
Cattaneo et al. (2025b), Fig.1

19

### p. 24 — Pooled effect

How can we estimate the average effect pooling across boundary points,
$\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid$  X $_{i}\in B]$?
Naive “pre-aggregation” approach: Compute distance $d_{min}($ X $_{i})$ to the closest
boundary point
- Use signed distance $\tilde{X}_{i}=$
$$\{$$
$d_{min}($ X $_{i}),$
$$D_{i}= 1$$
$-d_{min}($ X $_{i}),$
$D_{i}= 0$ and a cutoff of zero, controlling for
$\tilde{X}_{i}$ and $\tilde{X}_{i}D_{i}$
But in finite samples this may not be enough
- Observations on the two sides of the border may be geographically imbalanced

#### p. 24 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: cases._

- How can we estimate the average effect pooling across boundary points,
  $E[Y_i(1) - Y_i(0) | X_i \in B]$?

- Naive "pre-aggregation" approach: Compute distance $d_{min}(X_i)$ to the closest
  boundary point.

  - Use signed distance $\tilde{X}_i = \begin{cases}
    d_{min}(X_i), & D_i = 1 \\
    -d_{min}(X_i), & D_i = 0
  \end{cases}$ and a cutoff of zero, controlling for
    $\tilde{X}_i$ and $\tilde{X}_i D_i$

- But in finite samples this may not be enough

  - Observations on the two sides of the border may be geographically imbalanced

20

### p. 25 — Pooled effect: better estimators

Better pre-aggregation:
- Black (1999) further controls for FEs of boundary segments to improve geographic balance
- Dell (2010) further controls for polynomials in X $_{i}$(better: interacted with $D_{i}$!)
Imbens and Zajonc (2009) and Cattaneo et al. (2025a) “post-aggregation”:
manually average estimated $\hat{\tau} (b)$ over the boundary $b \in B$
The honest approach of Imbens and Wager (2019)
- Directly chooses the optimal estimator (via numerical optimization), accounting for worst-case bias under a bound on two-dimensional curvature of $\mathbb{E} [Y_{i}(d) \mid$  X $_{i}]$

### p. 26 — Outline

1
Fuzzy RDD
2
Discrete running variables and RD in time
3
Adding covariates
4
Multiple cutoffs or running variables and Spatial RD
5
Local randomization approach
Extrapolating RD estimates

### p. 27 — Local randomization approach to RDDs

Lee (2008) title: $“Randomized$ experiments from non-random selection $in U.S.$
House $elections”$
In the continuity approach this idea is a heuristic
- $D_{i}$ is only approximately independent from $Y_{i}(d)$ =$\Rightarrow$ local polynomial adjustments
Local randomization approach (Cattaneo et al. (2015)) takes this idea seriously
- Assume $X_{i}\perp \perp Y_{i}(d) \mid X_{i}\in X$ in a (potentially unknown) window $X = [c -h, c + h]$
- And that $F(X_{i}\mid X_{i}\in X)$ is known, e.g. uniform in $X$ or across permutations
- For no good reason!
Under these assumptions, can use all RCT machinery
- E.g. randomization inference that is valid in finite-samples

### p. 28 — Choosing the window

Cattaneo et al. (2015) propose to start from smallest $h$ and increase it until you reject
balance of some predetermined $W_{i}$
(Cattaneo et al. (2023), Figure 2.4)

#### p. 28 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

Cattaneo et al. (2015) propose to start from smallest $h$ and increase it until you reject
balance of some predetermined $W_i$

[Figure: Covariate vs. Score (x), H0 is false, H0 is true, H0 is false, E[Z|X=x], W1, W2, W3, W4, W5, c = n/5, c = n/5, c = n/5, c = n/5, c = n/5]

(Cattaneo et al. (2023), Figure 2.4)
23

### p. 29 — Outline

1
Fuzzy RDD
2
Discrete running variables and RD in time
3
Adding covariates
4
Multiple cutoffs or running variables and Spatial RD
5
Local randomization approach
Extrapolating RD estimates

### p. 30 — Extrapolating RD estimates

A key limitation of RDDs is the local nature of $\tau =\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid X_{i}= c]$
Kids who barely receive financial aid and politicians who barely win may be unusual
When can we identify effects away from the cutoff to improve external validity?
Idea #1 (Dong and Lewbel (2015)): local linear estimation automatically yields
$$\symbol = \partial \mathbb{E} [Y^{i}(1) -Y^{i}(0) \mid X^{i}= x]$$
$$\partial x$$
$\mid_{x=c}$
$=$ Difference in regression slopes on the right and left
Thus, $\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid X_{i}= x] \approx \tau + \symbol (x -c)$ for $x \approx c$

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

A key limitation of RDDs is the local nature of $\tau = E[Y_i(1) - Y_i(0) | X_i = c]$

- Kids who barely receive financial aid and politicians who barely win may be unusual
- When can we identify effects away from the cutoff to improve external validity?

Idea #1 (Dong and Lewbel (2015)): local linear estimation automatically yields

$$
\phi = \frac{\partial E[Y_i(1) - Y_i(0) | X_i = x]}{\partial x} \Big|_{x=c}
$$

= Difference in regression slopes on the right and left

- Thus, $E[Y_i(1) - Y_i(0) | X_i = x] \approx \tau + \phi(x - c)$ for $x \approx c$

### p. 31 — Extrapolating RD estimates (2)

Idea #2 (Angrist and Rokkanen (2015)): suppose $X_{i}$ is a noisy version of observable $W_{i}$
E.g. $D_{i}$= offer for a selective school in Boston, $X_{i}$= admission test score
- Assume $X_{i}$ is random noise conditionally on pre-application test score
Conditional independence assumption:
$\mathbb{E} [Y_{i}(d) \mid X_{i}, W_{i}] =\mathbb{E} [Y_{i}(d) \mid W_{i}]$
=$\Rightarrow$
$\mathbb{E} [Y_{i}(d) \mid D_{i}, W_{i}] =\mathbb{E} [Y_{i}(d) \mid W_{i}]$
- Given $W_{i}$, we can compare treated and untreated, as long as there is overlap
- Can use standard CIA methods to get the ATE (on everyone — nothing local)
- Note: we used that $D_{i}$ is a deterministic function of $X_{i}$, but not its discontinuity

### p. 32 — Extrapolating RD estimates (3)

Angrist and Rokkanen’s CIA assumption is falsifiable: it implies
$$\mathbb{E} [Y_{i}\mid X_{i}, D_{i}, W_{i}] =\mathbb{E} [Y_{i}\mid D_{i}, W_{i}]$$
Among the treated, $X_{i}$ should not predict $Y_{i}$ given $W_{i}$; same for the untreated
Exercise: prove this!

#### p. 32 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

Angrist and Rokkanen’s CIA assumption is falsifiable: it implies

$$E[Y_{it} | X_{i}, D_{i}, W_{i}] = E[Y_{it} | D_{i}, W_{i}]$$

- Among the treated, $X_{i}$ should not predict $Y_{i}$ given $W_{i}$; same for the untreated

- Exercise: prove this!

26

### p. 33 — References I

Anderson, M. and J. Magruder (2012): “Learning from the Crowd: Regression Discontinuity
Estimates of the Effects of an Online Review Database,” The Economic Journal, 122, 957–989.
Anderson, M. L. (2014): “Subways, Strikes, and Slowdowns: The Impacts of Public Transit on
Traffic Congestion,” American Economic Review, 104, 2763–2796.
Angrist, J. D. and V. Lavy (1999): “Using Maimonides’ Rule to Estimate the Effect of Class Size
on Scholastic Achievement,” The Quarterly Journal $of$ Economics, 114, 533–575.
Angrist, J. D. and M. Rokkanen (2015): “Wanna Get Away? Regression Discontinuity
Estimation of Exam School Effects Away From the Cutoff,” Journal $of$ the American Statistical
Association, 110, 1331–1344.
Armstrong, T. B. and M. Kolesár (2018): “Optimal Inference in a Class of Regression
Models,” Econometrica, 86, 655–683.
Black, S. E. (1999): “Do Better Schools Matter? Parental Valuation of Elementary Education,”
The Quarterly Journal $of$ Economics, 114, 577–599.
Borusyak, K. and M. Kolerman-Shemer (2024): “Regression Discontinuity Aggregation, with
an Application to the Union Effects on Inequality,” Mimeo.

### p. 34 — References II

Calonico, S., M. D. Cattaneo, M. H. Farrell, and R. Titiunik (2019): “Regression
Discontinuity Designs Using Covariates,” The Review $of$ Economics and Statistics, 101, 442–451.
Calonico, S., M. D. Cattaneo, and R. Titiunik (2014): “Robust Nonparametric Confidence
Intervals for Regression-Discontinuity Designs: Robust Nonparametric Confidence Intervals,”
Econometrica, 82, 2295–2326.
Cattaneo, M. D., B. R. Frandsen, and R. Titiunik (2015): “Randomization Inference in the
Regression Discontinuity Design: An Application to Party Advantages in the U.S. Senate,” Journal
$of$ Causal Inference, 3, 1–24.
Cattaneo, M. D., N. Idrobo, and R. Titiunik (2023): “A Practical Introduction to Regression
Discontinuity Designs: Extensions,” arXiv preprint, arXiv:2301.08958 [econ, stat].
Cattaneo, M. D., R. Titiunik, and R. Yu (2025a): “Causal Treatment Effect Aggregation in
Boundary Discontinuity Designs,” Working Paper.
——— (2025b): “Estimation and Inference in Boundary Discontinuity Designs: Distance-Based
Methods,” Working Paper.

### p. 35 — References III

——— (2025c): “Estimation and Inference in Boundary Discontinuity Designs: Location-Based
Methods,” Working Paper.
Cattaneo, M. D., R. Titiunik, and R. R. Yu (2025d): “Boundary Discontinuity Designs:
Theory and Practice,” Working Paper, arXiv:2511.06474 [econ].
Dell, M. (2010): “The Persistent Effects of Peru’s Mining Mita,” Econometrica, 78, 1863–1903.
Dong, Y. and A. Lewbel (2015): “Identifying the Effect of Changing the Policy Threshold in
Regression Discontinuity Models,” Review $of$ Economics and Statistics, 97, 1081–1092.
Frölich, M. and M. Huber (2019): “Including Covariates in the Regression Discontinuity Design,”
Journal $of$ Business $&$ Economic Statistics, 37, 736–748.
Imbens, G. and S. Wager (2019): “Optimized Regression Discontinuity Designs,” The Review $of$
Economics and Statistics, 101, 264–278.
Imbens, G. and T. Zajonc (2009): “Regression Discontinuity Design with Vector-Argument
Assignment Rules,” .
Kolesár, M. and C. Rothe (2018): “Inference in Regression Discontinuity Designs with a Discrete
Running Variable,” American Economic Review, 108, 2277–2304.

### p. 36 — References IV

Lee, D. S. (2008): “Randomized experiments from non-random selection in U.S. House elections,”
Journal $of$ Econometrics, 142, 675–697, iSBN: 03044076.
Noack, C., T. Olma, and C. Rothe (2023): “Flexible Covariate Adjustments in Regression
Discontinuity Designs,” ArXiv:2107.07942 [econ, stat].
Peng, S. and Y. Ning (2021): “Regression Discontinuity Design under Self-selection,” International
Conference $on$ Artificial Intelligence and Statistics, 118–126.
Van Der Klaauw, W. (2002): “Estimating the Effect of Financial Aid Offers on College Enrollment:
A Regression–Discontinuity Approach*,” International Economic Review, 43, 1249–1287.

## Extraction Gaps

- p. 3: figure or diagram present
- p. 4: figure or diagram present
- p. 5: display math with drawn rules
- p. 10: figure or diagram present
- p. 16: display math with drawn rules
- p. 17: large delimiter (matrix or cases)
- p. 18: figure or diagram present
- p. 19: figure or diagram present
- p. 20: figure or diagram present
- p. 23: figure or diagram present
- p. 24: display math with drawn rules
- p. 28: figure or diagram present
- p. 30: display math with drawn rules
- p. 32: display math with drawn rules
