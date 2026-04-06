Part D: Panel Data Methods
D4: Difference-in-Differences: Extensions
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

Extensions
Feature Baseline Extensions
Model of Y(0): TWFE (PTA) Including covariates
Partial identification approach
Multiplicative models
Factor models
Model of τ : Arbitrary heterogeneity Ex ante restrictions
it
Maintained No anticipation effects Some anticipation effects
assumptions: No spillovers Some spillovers
Treatment: Binary Discrete or continuous
Absorbing Treatment reversals
Data structure: Panel Repeated cross-sections
Two-dimensional cross-sections
Triple-difference designs

D4 outline
1 Richer models of Y(0): covariates and partial identification
Restrictions on treatment effects
2
Anticipation and spillover effects
3
4 Treatments beyond binary absorbing
5 Beyond panel data

DiD with covariates (1)
Two ways of thinking about covariates:
1. Borusyak, Jaravel, and Spiess (2024): make the model of Y (0) richer,
it
E[Y ′
(0)] = α +β +γ X
it i t it
▶ Continuous covariates (avoid bad controls!)
·t
▶ Unit-specific linear trends γ i
′
▶ Time-interacted baseline characteristics γ X ,
t i
e.g. state-year FE in a county-level panel
▶ Exercise: What do these mean in first-differences?
⇒
Estimate γ from untreated observations only (along with α,β), i i then imputation

DiD with covariates (2)
2. Impose PTA conditional on baseline characteristics
Abadie (2005) and Sant’Anna and Zhao (2020) for non-staggered DiD:
E[∆Y (0) G = 1,X] = E[∆Y (0) G = 0,X]
it i i it i i
▶ A standard problem of selection on observables for ∆Y (for ATT)
it
⇒ Propose to use inverse probability weighting (Abadie (2005)), augmented IPW, or
other covariate adjustment (Sant’Anna and Zhao (2020))
Callaway and Sant’Anna (2021) extend this approach to manual averaging under
staggered adoption
▶ Impose E[∆Y (0) | X ,E = e] = E[∆Y (0) | X ,E > s] for all s ≥ t ≥ e
it i i it i i
▶ Involves estimating a separate pscore for each e,t

DiD with covariates: What NOT to do
With heterogeneous effects, do not just add covariates to TWFE and event study
regressions even in non-staggered settings, e.g. avoid
˜ ′
Y = α˜ +β +τD +γ X +error
it i t it it
▶ γˆ will use treated observations too, misattributing some treatment effects
Example: Wolfers (2006) studies the effect of unilateral divorce laws on divorce
rates
▶ Reanalyzes Friedberg (1998) who found a positive effect when including
state-specific linear trends

Results without and with state-specific trends
Which results should we trust: with extra controls or without?

Example of California

Example of California (2)
With appropriate estimators, state-specific trends don’t change estimates
(de Chaisemartin and D’Haultfœuille (2023))

Partial identification approach
Rambachan and Roth (2023) for non-staggered DiD: checking robustness to PTA
violations
Let δ = E[Y (0)−Y (0) G = 1]−E[Y (0)−Y (0) G = 0]
t it i,t−1 i it i,t−1 i
PTA requires δ = 0; Estimable for t < E but not t ≥ E
t
≥
Weaker assumptions for t E as robustness checks:
0. (Not in the paper) Exercise: what would δ = const mean?
t
1. Differential trends are not too large: δ ≤ M·max δ
t s<E s

∞
Simplified case: N =
Imagine a stylized event study plot [not a plot of δ ]:
t

With sampling noise

Partial identification approach (cont’d)
Rambachan and Roth (2023) weaker assumptions for t ≥ E:
δ ≤ M·max δ
1. Differential trends are not too large:
t s<E s
2. Differential trends are smooth: δ −δ ≤ M
t t−1
▶ Note: for M = 0 this is not PTA but a linear differential trend
When pre-trends are noisily estimated, conf.interval will be wider
Need to pick M or compute the largest M that doesn’t kill your findings
See Liu (2025) for extensions to staggered adoption via manual averaging and
imputation

Outline
1 Richer models of Y(0): covariates and partial identification
Restrictions on treatment effects
2
Anticipation and spillover effects
3
4 Treatments beyond binary absorbing
5 Beyond panel data

Restrictions on treatment effects
So far we have considered estimators robust to arbitrary effect heterogeneity
This is a strong demand on the estimator =⇒ can’t get all estimands; others can
be noisy
Model is very asymmetric: strong assumptions on Y (0) and none on Y (1)
it it
With so much heterogeneity possible, are ATTs informative about future policy?
“Anyone who makes a living out of data analysis probably believes that het-
erogeneity is limited enough that the well-understood past can be informative
about the future” (Angrist and Pischke, 2010)

Restrictions on treatment effects (2)
Can we identify more estimands (e.g. long-run effects) or get more power for the same
estimands using extra restrictions on τ and Y (1)?
it it
Impose some simple model of treatment effects, τ = Γ′ θ: e.g.
it it
τ = τ¯ is homogeneous across i and t =⇒ static TWFE specification
▶ it
≡ =⇒
▶ τ τ t−Ei is homogeneous across i for any given horizon semi-dynamic
it
τ = 0 when t > E +K for some K
▶ it i
▶ τ = τ when t > E +K
it+1 it i
Proposition (BJS): Under PTA, spherical errors, and model of τ , the eﬀicient
it
unbiased estimator of τ is:
w
1. Run OLS on the full sample for the “true” model: Y = α +β +D Γ ′ θ+ε
it i t it it it
∑
′ θˆand
2. Compute τˆ = Γ τˆ = w τˆ
it it w it∈Ω1 it it

Outline
1 Richer models of Y(0): covariates and partial identification
Restrictions on treatment effects
2
Anticipation and spillover effects
3
4 Treatments beyond binary absorbing
5 Beyond panel data

Anticipation effects
If anticipation effects of at most L periods are possible, redefine the treatment to L
periods earlier
▶ Interpret the estimates accordingly
▶ Can separately estimate anticipation effects vs. post-treatment effects
Same if there is a gap between announcement and implementation (that can vary
by i)

Spillovers (1)
Consider a 2-period DiD with spillovers: Y = Y (D ) ≡ Y (0)+τ (D )
i2 i2 2 i2 i2 2
▶ τ (d ) is the effect of a vector of treatments d on person i’s outcome relative to
i2 2 2
the counterfactual where nobody is treated
Impose PTA on untreated outcomes:
E[Y (0)−Y E[Y (0)−Y
(0) D = 1] = (0) D = 0]
i2 i1 i2 i2 i1 i2
Then DiD yields relative effect E[τ (D ) | D = 1]−E[τ (D ) | D = 0]
i2 2 i2 i2 2 i2
Identifies the aggregate ATT if and only if E[τ (D ) | D = 0] = 0
i2 2 i2
▶ Still cannot separate direct and indirect effects

Spillovers (2)
What to do if control group can be affected?
Specify which untreated observations can experience spillover effects (e.g., because
within a short geographic distance from a treated)
View them as a separate treated group
If there are enough observations that are not treated directly or indirectly, use them
as controls
Identify both causal effects on the treated and spillover effects on the untreated as
two estimands

Outline
1 Richer models of Y(0): covariates and partial identification
Restrictions on treatment effects
2
Anticipation and spillover effects
3
4 Treatments beyond binary absorbing
5 Beyond panel data

Continuous treatment intensity (1)
When the treatment is not binary, there are multiple scenarios
Are there untreated units in every period and untreated periods for every unit?
Yes: e.g. in the BJS application, the tax rebate amount is a continuous treatment
but that’s no problem
▶ PTA on Y (0) still identifies counterfactual trends
it
)−Y
▶ Can binarize the treatment (without loss) and impute τ = Y (D (0)
it it i it
▶ Then identify e.g. (1) average MPC as % of household-specific rebate or (2) the
total increase in spending as % of total rebates:
∑
1 τ τ
τ (1) = it or τ (2) = ∑ t−Ei=h it
w w
Ω Rebate Rebate
1,h t−Ei=h i t−Ei=h i

Continuous treatment intensity (2)
Are there untreated units in every period, untreated periods for every unit?
No: Then PTA on Y (0) is unhelpful
it
Can make progress by randomization, restrictions on heterogeneous effects, or
other/stronger PTAs
de Chaisemartin and D’Haultfœuille (2025) develop a “random coeﬀicients
distributed-lag linear [causal] model”:
∑H
Y = α +β + τ D +ε
it i t ih i,t−h it
h=0
where effects τ vary across i and can be correlated with treatments;
▶ ih
▶ but don’t depend on t (only on h); only appear up to a known lag H; are linear in
dosage
Expect more work on imputation with other restrictions on heterogeneity

Continuous treatment intensity (3)
Making progress with no untreated units via other/stronger PTAs
Appendix of de Chaisemartin and D’Haultfoeuille (2020) considers settings where
D is discrete and there are many “stayers” (D = D i,t−1 )
it it
▶ Decide to compare stayers and switchers with the same initial treatment
⇒ Impose E[∆Y (d) D = d,D ] = E[∆Y (d) D = d]
i2 i1 i2 i2 i1
E[Y )−Y
▶ Can identify e.g. (D (D ) D > D ]
i2 i2 i2 i1 i2 i1

Continuous treatment intensity (4)
Making progress with no untreated units via other/stronger PTAs
de Chaisemartin, d’Haultfoeuille, Pasquier, Sow, and Vazquez‐Bare (2025) extend
this to continuous treatments:
▶ E.g. D it = state-level minimum wage; changes only when there is a local reform
=⇒
▶ For switchers, they can’t find stayers with exact same D i1 estimate
E[∆Y (d) D = D = d] nonparametrically for stayers
i2 i1 i2
See Callaway, Goodman-Bacon, and Sant’Anna (2021) for another version of PTA

Treatment reversals
What if treatment is not an absorbing state?
E.g. Adda (2016): Economic effects of epidemics (e.g., flu); D = dummy for
it
school holidays
Key assumption: no carryover effects
▶ If lagged treatment can have effects far into the future, there is no control group
Imputation approach extends immediately
▶ Estimate α ,β from untreated observations both before and after treatment
i t
de Chaisemartin and D’Haultfoeuille (2020) use groups with D i,t−1 = D = 1 as
it
controls for “leavers” who switch from D = 1, D = 0
i,t−1 it
▶ Requires assuming PTA on Y it (1) for them. Parameter is no longer ATT
The no-carryover effects assumption should be tested

Outline
1 Richer models of Y(0): covariates and partial identification
Restrictions on treatment effects
2
Anticipation and spillover effects
3
4 Treatments beyond binary absorbing
5 Beyond panel data

Repeated cross-sections
Instead of a state-year panel, observe a new random sample of individuals i in each
state s and year t
▶ Can’t include individual FE but don’t need to
Model E[Y (0)] = α +β
▶ i s(i) t(i)

Two-dimensional cross-sections
Suppose we have data by region i and age group g in a single period
D = 1[g < E], e.g. a policy applies to exactly 18 year-olds but was rolled out in
ig i
a staggered way across regions
▶ Older age cohorts in the same region experienced it, younger didn’t
▶ Some age cohorts are treated in states that adopted early but not others
E[Y
▶ Impose (0)] = α +β ; use older groups and late-adopting regions as controls
ig i g
Both manual averaging and imputation extend by redefining variables
E.g. D = 1[b ≥ B ] where b is birth year and B is the earliest birth year eligible
▶ ib i i

Triple-differences (1)
Suppose for each state i = NJ,PA and period t = 1,2 we observe groups g = L,H:
low- and high-wage occupations
Min.wage should affect group L only: D = 1[i = NJ]×1[g = L]×1[t = 2]
igt
Strategy 1 (not triple-differences):
Use DiD on data from group L to learn the ATT for them
▶
▶ Also run placebo DiD for group H: test τ = 0 in
H
NJ]×1[t
Y = α +β +τ 1[i = = 2]+ε
iHt iH Ht H iHt

Triple-differences (2)
Strategy 2 (triple-differences):
Allow non-parallel trends between NJ and PA: placebo would fail
▶
▶ But assume violations of PTA are the same for g = L,H:
E[∆Y (0)−∆Y (0)] = E[∆Y (0)−∆Y (0)] ≡ α
NJ,L PA,L NJ,H PA,H
E[∆Y E[Y
▶ Equivalent to ig (0)] = α i +β g and igt (0)] = α it +β gt +γ ig
Can estimate ATT = τ from 2
▶ NJ,L,2
Y = α˜ +β˜ +γ˜ +τD +error
igt it gt ig igt igt

Triple-differences (3)
With multiple groups and periods:
Manual averaging can be manually extended
Imputation extends immediately: estimate
Y (0) = α +β +γ +error
igt it gt ig
on all untreated observations

̸
Triple-diff = effect heterogeneity
Do not confuse triple-differences with estimating effect heterogeneity: in triple-diff,
Group H is untreated in NJ at t = 2
Differential trends for group H between NJ and PA are not a consequence of the
treatment, but unexplained
The estimand is the causal effect on group L in NJ at t = 2, not some difference in
effects
The regression may look the same, but the underlying assumptions and the
estimand are different

References I
Abadie, A. (2005): “Semiparametric Difference-in-Difference Estimators,” Review of Economic
Studies, 72, 1–19, iSBN: 0034-6527.
Adda, J. (2016): “Economic Activityand the Spreadof Viral Diseases: Evidence from High Frequency
Data,” Quarterly Journal of Economics, 131, 891–941, arXiv: 1011.1669v3 ISBN: 9788578110796.
Angrist, J. D. and J.-S. Pischke (2010): “The Credibility Revolution in Empirical Economics:
How Better Research Design is Taking the Con out of Econometrics,” Journal of Economic
Perspectives, 24, 3–30.
Borusyak, K., X. Jaravel, and J. Spiess (2024): “Revisiting Event Study Designs: Robust and
Eﬀicient Estimation,” Review of Economic Studies, 91, 3253–3285.
Callaway, B., A. Goodman-Bacon, and P. H. Sant’Anna (2021): “Difference-in-Differences
with a Continuous Treatment,” Working paper, arXiv: 2107.02637.
Callaway, B. and P. H. Sant’Anna (2021): “Difference-in-Differences with Multiple Time
Periods,” Journal of Econometrics.
de Chaisemartin, C. and X. D’Haultfoeuille (2020): “Two-way fixed effects estimators with
heterogeneous treatment effects,” American Economic Review, 110, 2964–2996.

References II
de Chaisemartin, C., X. d’Haultfoeuille, F. Pasquier, D. Sow, and G. Vazquez‐Bare
(2025): “Difference-in-Differences Estimators for Treatments Continuously Distributed at Every
Period,” Working Paper.
de Chaisemartin, C. and X. D’Haultfœuille (2025): “Treatment-Effect Estimation in
Complex Designs under a Parallel-trends Assumption,” Technical Report.
de Chaisemartin, C. and X. D’Haultfœuille (2023): “Two-way fixed effects and
differences-in-differences with heterogeneous treatment effects: a survey,” The Econometrics
Journal, 26, C1–C30.
Friedberg, L. (1998): “Did Unilateral Divorce Raise Divorce Rates? Evidence from Panel Data,”
NBER Working Paper.
Liu, Z. (2025): “Cohort-Anchored Robust Inference for Event-Study with Staggered Adoption,” arXiv
preprint.
Rambachan, A. and J. Roth (2023): “An More Credible Approach to Parallel Trends,” Review of
Economic Studies, 90, 2555–2591.

References III
Sant’Anna, P. H. and J. Zhao (2020): “Doubly robust difference-in-differences estimators,”
Journal of Econometrics, 219, 101–122, arXiv: 1812.01723 Publisher: Elsevier B.V.
Wolfers, J. (2006): “Did Unilateral Divorce Laws Raise Divorce Rates? A Reconciliation and New
Results,” American Economic Review, 1802–1820.
