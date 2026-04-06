Part D: Panel Data Methods
D3: Staggered-Adoption Difference-in-Differences
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

D3 outline
1 Staggered adoption: Setting and estimands
2 Traditional estimators
3 What to do instead

Staggered adoption/rollout setting
i = Z i = A i = B i = C i = D
t = 1
t = 2
t = 3
t = 4
t = 5
t = 6
Assume binary treatment; i gets treated at t = E and stays treated forever:
i
D = 1[t ≥ E]
it i
▶ “Cohort” = units with the same E
i
May or may not have never-treated units (E = ∞), always-treated units (E = 1)
D Z
▶ Assume away always-treated that will mostly be useless

An extra source of variation
In addition to treated vs. never-treated comparisons, we can now compare treated
vs. not-yet-treated
Sometimes researchers explicitly drop the never-treated group to focus on more
comparable units
E.g. a panel of mothers, where E = year of birth of first child
▶ i
May drop women without kids, as they are not expected to be on parallel trends
▶
Other times, researchers leverage both

Notation and assumptions
{it}
Fixed sample Ω = with untreated obs Ω and treated obs Ω
0 1
▶ Ω includes never-treated and not-yet-treated it pairs
0
Causal structure: Y (D ) (no spillovers, no anticipation effects)
it it
E[Y (1)−Y
Causal effects: τ = (0)], varying across i,t
it it it
E[Y
Parallel trends: (0)] = α +β
it i t

A note on modeling dynamics
We could have defined potential outcomes as Y (...,d ,d ,d ,d ,d ,...)
it t+2 t+1 t t−1 t−2
∞)
With absorbing treatment, same as Y (e) where e is date first treated (or
it
No anticipation effects: Y (e) = Y (e ′ ) ≡ Y (∞) for e,e ′ > t
▶ it it it
We will focus on ATT-type estimands based on Y (E)−Y (∞)
it i it
⇒ ≡ ≡ (∞)
Can simplify potential outcomes: Y (1) Y (E) = Y , Y (0) Y
it it i it it it
E[Y (1)−Y
▶ Interpret τ = (0)] as reflecting, in part, dynamic effects
it it it

Target estimands
∑
Linear target estimand: w τ for w chosen by researcher...
it∈Ω1 it it it
∑
1 1 ∈
ATT: τ , i.e. w = for all it Ω
Ω1 it∈Ω1 it it Ω1 1
i = A i = B i = C i = D
t = 1
t = 2
t = 3
t = 4
t = 5
t = 6
Note: this estimand is very sensitive to how many periods are observed when the
effects exhibit dynamics

More estimands of interest
ATT
ATT h ≥ 0 periods since treatment (typically fewer units for longer horizons)
i = A i = B i = C i = D
t = 1
t = 2 h = 0
t = 3 h = 1 h = 0
t = 4 h = 2 h = 1
t = 5 h = 3 h = 2 h = 0
t = 6 h = 4 h = 3 h = 1

More estimands of interest
ATT
ATT h ≥ 0 periods since treatment
≥
ATT h 0 periods since treatment on a balanced set of units for different h
i = A i = B i = C i = D
t = 1
t = 2 h = 0
t = 3 h = 1 h = 0
t = 4 h = 2 h = 1
t = 5 h = 3 h = 2 h = 0
t = 6 h = 4 h = 3 h = 1

More estimands of interest
ATT
ATT h ≥ 0 periods since treatment
ATT h ≥ 0 periods since treatment on a balanced set of units for different h
Difference of ATT across subgroups
Size-weighted ATT; etc.

Outline
1 Staggered adoption: Setting and estimands
2 Traditional estimators
3 What to do instead

Conventional practice
By analogy with non-staggered DiD, it used to be common to estimate:
Static TWFE specification — to get a single summary statistic of treatment effects:
˜
Y = α˜ +β +τ D +ε
it i t static it it
Event study (dynamic) specification:
∑b−1
˜ ≥
Y = α˜ +β + τ 1[t = E +h]+τ 1[t E +b]+ε
it i t h i b+ i it
h=−a
h̸=−1
▶ Some dummies are often binned or dropped on the left and/or on the right
−1
▶ “Fully-dynamic” if h = is the only omitted term
▶ “Semi-dynamic” if include all h ≥ 0 terms and nothing else

Static TWFE specification
Does the static TWFE specification estimate the ATT?
˜
Y = α˜ +β +τ D +ε
it i t static it it
de Chaisemartin and D’Haultfoeuille (AER 2020), Borusyak, Jaravel, and Spiess
(REStud 2024) (BJS):
▶ Yes if the effects are homogeneous across units and periods. Not otherwise!
∑
Under PTA, estimand τ = ws taticτ for some weights ws tatic that add up
▶ static it∈Ω1 it it it
to one
▶ But wstatic ̸= 1 and some can be negative due to “forbidden comparisons”...
it |Ω1 |

Forbidden comparisons
˜
Y = α˜ +β +τ D +ε
it i t static it it
E[Y ] i = A i = B
it
t = 1 α α
A B
t = 2 α +β +τ α +β
A 2 A2 B 2
t = 3 α +β +τ α +β +τ
A 3 A3 B 3 B3
( ) ( )
Here τˆ = Y −Y − 1 (Y −Y )− 1 Y − Y
static A2 B2 2 A1 B1 2 A3 B3
Future periods are used as reference periods for treated observations of early
adopters
Long-term effects for early adopters can get a negative weight:
τ = τ + 1τ − 1τ
static A2 2 B3 2 A3

Mechanics of negative weights
By Frisch–Waugh–Lovell, τˆ can be obtained from
static
˜
Y = τ D +error
it static it
˜
where D are residuals from regressing D = a +b +error.
it it i t
∑
Thus, τˆ = ∑it
D˜ itYit.
Weights
∑D˜
it are easy to compute
static D˜2 D˜2
js js js js
But they can be negative for some treated observations: where ˆa is high (early
i
ˆ
adopters) and b is high (late periods if few never-treated units)
t
▶ Angrist (1998) result does not apply to TWFE!

Characterizing negative weights
You can compute wstatic (by observation or group totals) and total negative weights
it
Goodman-Bacon (2021) provides a decomposition of τ as convex weighted
static
average of several types of comparisons (package bacondecomp):
Treated vs. never treated (good)
▶
▶ Early adopters vs. late adopters (good)
▶ Late adopters vs. early adopters (forbidden)
▶ Treated during the sample vs. always-treated (forbidden)
Note: only useful if you plan to use the static TWFE specification

Under-identification of the fully-dynamic specification
Fully-dynamic specification:
∑
Y = α˜ +β ˜ + τ 1[t = E +h]+ε
it i t h i it
h̸=−1
Proposition (BJS): Without never-treated units, the path {τ } is not point
h h̸=−1
identified in the fully-dynamic specification. Adding any linear trend to this path,
{τ +κ(h+1)},
fits the data equally well
h
κ(t−(E −1))
▶ This transformation corresponds to adding to fitted values, which
i
−1) −κt
can be offset by changing unit and time FEs by κ(E i and resp.

Under-identification of the fully-dynamic specification
4
2
0
-2
-4
Y
emoctuO
1 2 3 4 5 6 7
Calendar time t
Treated at t=2 Treated at t=4
(from BJS)
Diff-in-diff doesn’t work without some assumption of no anticipation effects!

Spurious identification of very long-run effects
Semi-dynamic specification can be estimated:
∑
˜
Y = α˜ +β + τ 1[t = E +h]+ε
it i t h i it
h≥0
Proposition (BJS): Without never-treated units and with heterogeneous effects,
long-run effects (h ≥ max E −min E) are not identified by PTA, while the
i i i i
semi-dynamic specification produces some (heroic/spurious) estimates
E[Y
] i = A i = B
it
t = 1
3
t = 2
7 7
t = 3

Spurious identification of very long-run effects
∑1
˜
Y = α˜ +β + τ 1[t = E +h]+ε
it i t h i it
h=0
E[Y ] i = A i = B
it
t = 1 α α
A B
t = 2 α +β +τ α +β
A 2 0 B 2
t = 3 α +β +τ α +β +τ
A 3 1 B 3 0
( ) ( )
Here τˆ = Y − Y + Y −Y −2(Y −Y )
1 A3 B3 A2 B2 A1 B1

Spurious identification of very long-run effects
∑1
˜
Y = α˜ +β + τ 1[t = E +h]+ε
it i t h i it
h=0
E[Y ] i = A i = B
it
t = 1 α α
A B
t = 2 α +β +τ α +β
A 2 A2 B 2
t = 3 α +β +τ α +β +τ
A 3 A3 B 3 B3
( ) ( )
Here τˆ = Y − Y + Y −Y −2(Y −Y )
1 A3 B3 A2 B2 A1 B1
Estimand τ = τ +τ −τ inevitably involves extrapolation that is invalid with
1 A3 A2 B3
heterogeneous effects

Cross-horizon contamination
Sun and Abraham (2021):
Similar problems occur even for short-run effects in dynamic specification
▶ Estimand τ is not an average of horizon-h effects: contaminated by heterogeneity
h
of effects at other horizons
And pre-trend coeﬀicients are contaminated by treatment effect heterogeneity
▶ Can be significant even if PTA holds!
Note: these problems tend to be small in practice

Outline
1 Staggered adoption: Setting and estimands
2 Traditional estimators
3 What to do instead

Plot treatment timing
(from Chiu, Lan, Liu, and Xu (2023);
(From BJS, with no never-treated)
package panelView in Stata & R)

Plot raw outcome data by cohort
(from Fadlon and Nielsen (2015))

Estimation robust to heterogeneous effects
The problems arise from conventional specifications being too restrictive
They are not fundamental to staggered adoption DiD
▶ Under PTA, there are many valid 2x2 contrasts
How to combine them?
▶ Manual averaging approaches
Yield simpler estimators, more closely parallel conventional event studies
⋆
▶ Imputation approaches
⋆ Transparently link assumptions to estimators, more versatile, often more eﬀicient
Regression-based approaches
▶

Manual averaging estimators
de Chaisemartin and D’Haultfoeuille (2020) for h = 0:
i = A i = B i = C i = D i = A i = B i = C i = D
t = 1 t = 1
t = 2 h = 0 t = 2 h = 0
t = 3 h = 0 t = 3 h = 0
t = 4 t = 4
t = 5 h = 0 t = 5 h = 0
t = 6 t = 6
For each cohort E = e: form the clean control group; compute cohort-average
i
treatment effect (CATT ) by comparing Y −Y
e,e+0 ie i,e−1
▶ Note: they compare to e−1 only, ignoring earlier periods
Average across cohorts weighting by cohort size

Manual averaging estimators (2)
Callaway and Sant’Anna (2021) for any h ≥ 0:
i = A i = B i = C i = D i = A i = B i = C i = D
t = 1 t = 1
t = 2 t = 2
t = 3 h = 1 t = 3 h = 1
t = 4 h = 1 t = 4 h = 1
t = 5 t = 5
t = 6 h = 1 t = 6 h = 1
For each cohort E = e: form the control group as cohorts not treated by e+h;
i
−Y
compute CATT by comparing Y i,e−1
e,e+h i,e+h

Manual averaging estimators (3)
Callaway and Sant’Anna (2021, 2nd estimator) and Sun and Abraham (2021): same but
use never-treated controls only
i = A i = B i = C i = D i = A i = B i = C i = D
t = 1 t = 1
t = 2 t = 2
t = 3 h = 1 t = 3 h = 1
t = 4 h = 1 t = 4 h = 1
t = 5 t = 5
t = 6 h = 1 t = 6 h = 1
(If no never-treated, use latest-treated cohort instead)

Manual averaging: Pre-trend tests
de Chaisemartin and D’Haultfœuille (2024) pre-trend tests:
i = A i = B i = C i = D
t = 1
t = 2 ℓ = 3
t = 3
t = 4
t = 5
t = 6
−Y
For cohort e and lead ℓ > 1, measure Y i,e−ℓ i,e−1
Compare to the control group of units not treated by e
Average across cohorts; test it’s zero

Manual averaging: Pre-trend tests
Callaway and Sant’Anna (2021) default pre-trend tests:
i = A i = B i = C i = D
t = 1
t = 2
t = 3
t = 4
t = 5
t = 6
⇒
Pre-trends always compare consecutive periods magnitudes not comparable to
post-treatment coeﬀicients (Roth (2024))

Imputation estimators
E[Y
PTA requires (0)] = α +β
it i t
No anticipation effects means Y = Y (0) for untreated observations
it it
(it ∈ Ω : both never-treated and pre-treatment)
0
Imputation approach:
1. Estimate α and β from untreated observations, e.g. by OLS
i t
⋆ Need pre-treatment obs for every unit to get αˆ i
βˆ
⋆ Need untreated obs in every period to get
t
∈ −αˆ −βˆ
2. For each treated observation it Ω , compute τˆ = Y
1 it it i t
⋆ Each τˆ it is very noisy!
∑ ∑
3. Estimate τ = w τ by τˆ = w τˆ
w it∈Ω1 it it w it∈Ω1 it it
⋆ Averaging across many units makes τˆ consistent
w

Eﬀiciency of imputation
Proposition (BJS) If Y (0) = α +β +ε for homoskedastic and serially uncorrelated
it i t it
ˆ
ε , estimating αˆ,β by OLS in the untreated sample yields most eﬀicient τˆ for any τ
it i t w w
Proof idea:
This imputation estimator can be obtained by OLS from a very flexible regression
Y = α +β +τ D +ε
it i t it it it
which dummies out each treated observation
By Gauss-Markov, OLS is eﬀicient for the vector of τ and for any linear
it
combination τ
w

Comparison to manual averaging
Proposition (BJS): Any unbiased estimator for τ under arbitrary heterogeneity of
w
treatment effects can be represented as an imputation estimator for some unbiased
ˆ
αˆ,β
i t
E.g. manual averaging estimators are (implicitly) imputation estimators that
estimate αˆ,β ˆ differently than by OLS
i t
They use less information... although that’s not always bad
▶ Harmon (2022): If ε is a random walk, the de Chaisemartin and D’Haultfoeuille
it
(2020) estimator is eﬀicient for h = 0
▶ Outcomes at E −1 contain all useful information; earlier periods only add noise
i

BJS: Standard errors
∑
∈
Represent τˆ = v Y : v = w for it Ω ; v can be computed for Ω
w it it it it it 1 it 0
∑ [∑ ∑ ]
True variance: Var[τˆ ] = Var[ v ε ] = E ( v ε )2
w it it it i t it it
∑ ∑
Plug-in clustered estimator: σˆ2 = ( v εˆ )2
it it
w i t
−αˆ −β ˆ
For untreated obs, εˆ = Y
it it i t
εˆnaive −αˆ −β ˆ −τˆ
Key challenge: for treated obs, = Y = 0 by construction
it it i t it

BJS: Standard errors (2)
If cohorts are large, instead use
−αˆ −β ˆ −τˆ ≈ −τ¯
εˆ = Y ε +(τ )
it it i t Eit it it Eit
where τˆ = avg of τˆ in the same cohort E = E
Eit jt j i
SE are conservative when there is variation in τ within cohorts; otherwise
▶ it
asymptotically exact
If cohorts are small, either replace τˆ with averages that pool multiple cohorts or
Eit
use leave-out estimation; see BJS
▶ Note: SE for all other estimators are only proved with large cohorts

BJS: Pre-trend and other falsifications tests
To test for pre-trends, always use only untreated observations
Null hypothesis: Y = α +β +ε
it i t it
+η′W
Choose a richer alternative model: Y = α +β +ε
it i t it it
−1],...,1[t −L]
▶ E.g. anticipation effects: W are 1[t = E = E
it i i
▶ Non-parallel linear trends: W are cohort dummies ×t
it
▶ Structural break: W are cohort dummies × post financial crisis
it
Use F-test for η = 0. (Don’t include too many covariates to avoid low power)
Note 1: not all violations affect causal estimates much
Note 2: η should not be directly compared to causal effect estimates

Estimators equivalent to imputation
Gardner (2021): Two-Stage Diff-in-Diff estimator:
▶ Estimate α e ,β t using untreated observations (note cohort FEs instead of unit FEs)
−βˆ
▶ Regress Y −αˆ on the treatment dummy or event study indicators
it Ei t
Liu, Wang, and Xu (AJPS, 2022): Counterfactual Estimators
▶ Applied to both TWFE and richer Interactive FE models of Y (0)
it
Be mindful of some differences in pre-trend tests, SE computation, behavior with
unbalanced panels

Event study graphs from two groups of methods
(de Chaisemartin and D’Haultfœuille (2024) (BJS Figure 2a,
Figure 1) using event_plot Stata command)
Note different reference groups and different behavior of SE
See Roth (2024) and Li and Strezhnev (2025) on correct interpretations of
pre-trend coeﬀicients with different methods

Liu et al. (2022) pre-trend test and graph
≥ −αˆ −β ˆ
Both for h 0 and h < 0, plot averages of Y
it i t
Like with de Chaisemartin and D’Haultfœuille (2024) graphs, comparable on the
left and right (although see Li and Strezhnev (2025))
But no single reference period because imputation-based
Unlike BJS, no explicit alternative hypothesis

Extended TWFE regression
Can the convenience of OLS be preserved without negative weights and other
problems?
Wooldridge (2025): the problem with old-school estimators is restrictive
specifications
⇒ Let’s keep running regressions but more flexibly
∑∑
e]×1[t
Y = α +β + τ 1[E = = s]+error,
it i t es i
e s≥e
where τ estimates CATT for cohort e in period t; then aggregate estimates as
et
required

Extended TWFE regression
e = 2 e = 3 e = 5 e = ∞
t = 1
t = 2 τ
22
t = 3 τ 23 τ 33
t = 4 τ τ
24 34
t = 5 τ τ τ
25 35 55
t = 6 τ τ τ
26 36 56
Numerically equivalent to BJS for CATT-based estimands in complete panels

Local projection DiD
Dube, Girardi, Jorda, and Taylor (2023) propose to estimate, for each h,
−Y
Y i,t−1 = β +τ 1[t = E]+error
i,t+h ht h i
on the subsample where E = t or E > t+h
i i
▶ Combines the local projections estimator for time series of Jorda (2005) with
“stacking” approach of Cengiz, Dube, Lindner, and Zippere (2019, Appendix D)
τ estimates a convex weighted average of treatment effects
h
▶ Can be reweighted to get Callaway and Sant’Anna (2021)
Instead of subtracting Y can subtract average of several pre-period outcomes
▶ i,t−1
=⇒ closer to imputation

Does heterogeneity-robust estimation matter?
BJS application with no never-treated units:
Yes, relative to specifications that restrict dynamics
Yes, for the spurious long-run coeﬀicients
For the short-run, the semi-dynamic specification seems fine
Setting: marginal propensity to spend (MPC) from the 2008 Economic Stimulus
Payments (tax rebates)
Staggered disbursement of rebates. Weekly spending data from Nielsen
Broda and Parker (2014) find a very large MPC from a monthly-binned specification:
∑∞
Y = α +β + τ 1[t−E ∈ {4m−3,...,4m}]+error
it i t m i it
m=−1

BJS results
$
,CPM
06
04
02
0
02-
04-
0 5 10 15 20 25 30 35
Week since receipt
Binned OLS Imputation estimator
Because the effects are fast decaying, binned specification overstates them in the
first month
Binned specification also extrapolates them to all future months

Chiu, Lan, Liu, and Xu (2023) are less convinced
Chiu et al. (2023) reanalyze main significant TWFE coeﬀicients in 37 political science
papers and don’t find big differences — but also no cost of being robust
Ratio between SEs from Imputation Method and TWFE
ycneuqerF
1.0 1.5 2.0 2.5 3.0
8
6
4
2
0
(FromChiuetal.) (ComputationbyYixingXu)

Software packages
Method Stata R Python
Borusyak et al. 2024 did_imputation didimputation (coming soon)
(limited)
Callaway and Sant’Anna 2021 csdid, csdid2 did csdid
de Chaisemartin, D’Haultfoeuille did_multiplegt_dyn *
2020, 2024
Sun and Abraham 2021 eventstudyinteract * *
Plotting any event studies event_plot — (coming soon)
Visualizing event timing panelview panelView —
* Callaway and Sant’Anna’s packages can be used instead

References I
Angrist, J. (1998): “Estimating the labor market impact of voluntary military service using social
security data on military applicants,” Econometrica, 66, 249–288.
Borusyak, K., X. Jaravel, and J. Spiess (2024): “Revisiting Event Study Designs: Robust and
Eﬀicient Estimation,” Review of Economic Studies, 91, 3253–3285.
Broda, C. and J. A. Parker(2014): “Theeconomicstimuluspaymentsof2008andtheaggregate
demand for consumption,” Journal of Monetary Economics, 68, S20–S36, publisher: Elsevier.
Callaway, B. and P. H. Sant’Anna (2021): “Difference-in-Differences with Multiple Time
Periods,” Journal of Econometrics.
Cengiz, D., A. Dube, A. Lindner, and B. Zippere (2019): “The Effect of Minimum Wages on
Low-Wage Jobs,” The Quarterly Journal of Economics, 1405–1454.
Chiu, A., X. Lan, Z. Liu, and Y. Xu (2023): “What To Do (and Not to Do) with Causal Panel
Analysis under Parallel Trends: Lessons from A Large Reanalysis Study,” .
de Chaisemartin, C. and X. D’Haultfoeuille (2020): “Two-way fixed effects estimators with
heterogeneous treatment effects,” American Economic Review, 110, 2964–2996, arXiv:
1803.08807v1.

References II
de Chaisemartin, C. and X. D’Haultfœuille (2024): “Difference-in-Differences Estimators of
Intertemporal Treatment Effects,” Review of Economics and Statistics, arXiv: 2007.04267v1.
Dube, A., D. Girardi, O. Jorda, and A. M. Taylor (2023): “A Local Projections Approach
to Difference-in-Differences Event Studies,” Working Paper.
Fadlon, I. and T. H. Nielsen (2015): “Household Responses to Severe Health Shocks and the
Design of Social Insurance,” Working Paper.
Gardner, J. (2021): “Two-stage differences in differences,” Working Paper.
Goodman-Bacon, A. (2021): “Difference-in-differences with variation in treatment timing,” Journal
of Econometrics, 225, 254–277, publisher: Elsevier B.V.
Harmon, N. A. (2022): “Difference-in-Differences and Eﬀicient Estimation of Treatment Effects,” .
Jorda, O. (2005): “Estimation and Inference of Impulse Responses by Local Projections,” American
Economic Review, 95, 161–182.
Li, Z. and A. Strezhnev (2025): “Benchmarking parallel trends violations in regression imputation
difference-in-differences,” Working Paper.

References III
Liu, L., Y. Wang, and Y. Xu (2022): “A Practical Guide to Counterfactual Estimators for Causal
Inference with Time-Series Cross-Sectional Data,” American Political Science Review.
Roth, J. (2024): “A Cautionary Note on Interpreting Event-Studies from Recent
Difference-in-Differences Methods,” .
Sun, L. and S. Abraham (2021): “Estimating Dynamic Treatment Effects in Event Studies with
Heterogeneous Treatment Effects,” Journal of Econometrics.
Wooldridge, J. M. (2025): “Two-Way Fixed Effects, the Two-Way Mundlak Regression, and
Difference-in-Differences Estimators,” Empirical Economics.
