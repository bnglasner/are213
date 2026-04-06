Part C: Instrumental Variables
C1: IV Idea and Mechanics; Weak IV
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

Part C outline
1. Assumptions, uses, and mechanics of IV; weak IV
2. IV with treatment effect heterogeneity
3. Examiner designs (“judge IVs”)

C1 outline
Setting and Examples
1
2 IV mechanics
3 IV for classical measurement error
Weak and Many (Weak) IVs
4
Readings:
IV Mechanics: MHE (Ch. 4.1, 4.2.1, 4.6.4), Wooldridge (Ch. 5)
Weak IV: Andrews et al. (2019, Annual Review of Economics), Imbens and
Wooldridge (Lecture 15)

Instrumental variable DAGs
Exclusion: Y(d,z) = Y(d,z′) ≡ Y(d) for all d,z,z′
Independence (“as-good-as-random assignment”): Z ⊥⊥ Y(d) for all d
Exclusion + independence = instrument exogeneity (a.k.a. orthogonality)
▶ Z is only correlated with Y if there is a causal effect of D on Y
Calling Z an “excluded instrument” is somewhat misleading
▶

Instrumental variable DAGs (2)
Relevance: D(z) ̸= D(z′) with non-zero probability for some z,z′
Exogeneity + relevance = instrument validity
Note: non-causal first stage is also fine
▶ E.g. D = import penetration from China in industry i in the US
i
▶ Z = import penetration from China in Europe; F = ?
i i

IV with constant effects
−→
Structural equation: Y = Y(D, ε ) =⇒ Y = τD +ε (suppressing
i i i i i i
intercepts)
−→
First stage: D = D(Z, u ) =⇒ D = πZ +u
i i i i i i
Relevance: π ̸= 0 (assuming Cov[Z,u] = 0 by construction)
i i
Instrument exogeneity: Cov[Z,ε] = 0
i i
Treatment endogeneity: Cov[ε,u] ̸= 0
i i
Reduced-form equation: Y = τπZ +(ε +τu) ≡ ρZ +e
i i i i i i

IV identification with constant effects
Take 1:
Cov[Z ,u ] = 0 ⇒ First-stage OLS is consistent for π
▶ i i
▶ Cov[Z ,e ] = 0 ⇒ Reduced-form OLS is consistent for ρ = τπ
i i
▶ We have τ = ρ/π = Reduced-form/First-stage = Cov[Z ,Y ]/Cov[Z ,D ]
i i i i
Take 2: Cov[Z,ε] = 0 where ε = Y −τD
i i i i i
]−τCov[Z
▶ Solving Cov[Z ,Y ,D ] = 0 yields the same answer
i i i i

Example 1: Angrist and Krueger (1991)
Estimate returns to schooling: D = years of schooling, Y = log earnings
OLS should be biased upwards: unobserved ability
Z = quarter of birth dummies
Relevance: structure of compulsory schooling laws in the US
Children born in Q4 start school a year earlier than those born in Q1 next year
▶
▶ But can drop out at the same time upon reaching certain age, e.g. 16
▶ Q1-born get less schooling

First stage

Reduced form

Exogeneity of QoB
Exclusion: no other mechanism through which QoB affects earnings
▶ Bound, Jaeger, and Baker (1995): QoB can affect school attendance, mental
health issues
Independence: QoB is not affected by factors correlated with potential earnings
▶ Buckles and Hungerman (2013): Q1 births disproportionally happen to teenagers
and unmarried mothers

Example 2: Encouragement designs
D = taking an experimental pill, Y = health outcome
Z = dummy for being invited to receive the pill (with an option to decline)
OLS bias?
Relevance?
Independence?
Exclusion?

RCT with two-sided noncompliance
Angrist (1990): The impact of serving in Vietnam war (D) on future earnings (Y)
i i
Draft was based on televised lottery
▶
Men with low lottery numbers were enlisted first
▶
Still, some of them can avoid serving, while others can volunteer
▶
Z = bins of lottery numbers
▶ i

Example 3: Ingenious IVs from natural experiments
Angrist and Evans (1998): How does the number of kids affect mother’s labor
supply?
▶ Among mothers with 2+ kids, D i = having 3+ kids
Z : twins at second birth
▶ 1i
▶ Z : first two kids are both boys or both girls
2i

Example 4: Historical instruments
Duranton and Turner (2012) study the impact of a region’s connection to
interstate highways in 1983 on urban growth 1983–2003
They worry about strategic placement of highways:

Example 4: Historical instruments (cont.)
They use density of railroads in 1898 and highways in the plan of 1947 as IVs:
Exclusion?
Independence?

Example 5: Overusing an instrument
Gallen and Raymond (2023) identify several instruments used for many endogenous
variables
▶ Local topography: presence of bodies of water and changes in elevation
▶ Sibling characteristics in a family, e.g. having a twin
▶ Ethnolinguistic fractionalization
▶ Religion
▶ Weather, e.g. rainfall

Usage of rainfall IV
From Mellon (2024, AJPS); orange = D, purple = Y; circle size = # of studies

Often (but not always) a problem
→
Problem OK for D Y
1
OK (see Mellon (2024))

Failure of exogeneity
Studies of the impacts of income on conflict often instrument for income with
rainfall
Sarsons (2015) shows that exogeneity is violated
▶ Focuses on a subset of villages in India with a significant reduced-form
▶ But no first-stage because of... dams

Example 6: IV for structural equations
IV was developed to deal with simultaneity in a system of structural equations
▶ Wright (1928) foundational study of the demand and supply for flaxseed
IV in the supply equation: demand curve shifter (price of cottonseed, a substitute)
▶
▶ IV in the demand equation: supply curve shifter (flaxseed yield per acre)
IV exogeneity is about the error term, not the endogenous variable
Demand and supply have the same RHS variable (price) but require different IVs
▶
Q = τ P+ε , Q = τ P+ε
d d s s
▶ Demand and inverse demand have different RHS variables but the same IV
1 1
Q = τ P+ε ⇐⇒ P = Q− ε
d d d
τ τ
d d

Recap
Exclusion and independence are distinct conditions
Independence is guaranteed with random assignment, but exclusion may still fail
Theory or common sense may promise exclusion, but independence may still fail
Economically exogenous (e.g. historical and not strategically chosen) ̸=⇒
econometrically exogenous
If two studies use the same Z for different D but the same Y, exclusion likely fails
for both
Exogeneity requires thinking about ε (structural error or potential outcomes)

Outline
Setting and Examples
1
IV mechanics
2
3 IV for classical measurement error
4 Weak and Many (Weak) IVs

IV identification and estimation
−τD]
With constant effects, exogeneity implies moment condition: Cov[Z,Y = 0
i i i
Thus, if Cov[Z,D] ̸= 0,
i i
Cov[Z,Y] Cov[Z,Y]/Var[Z] Reduced-form
i i i i i
τ = = ≡
Cov[Z,D] Cov[Z,D]/Var[Z] First-stage
i i i i i
If Z is binary, IV = Wald estimand:
i
E[Y Z = 1]−E[Y Z = 0]
i i i i
τ =
E[D 1]−E[D
Z = Z = 0]
i i i i
Estimator = sample analog

Angrist and Krueger with single binary IV
(ReproducedfromMHE)

Two-stage least squares (2SLS)
Take first-stage fitted values D ˆ = πZ and regress Y on D ˆ (“second stage”):
i i i i
[ ] [ ]
Cov Y,D ˆ Cov Y,D ˆ
i i i i Cov[Y,Z]
[ ] [ ] i i
τ = = = = τ
2SLS Cov[D,Z] IV
Var D ˆ Cov D,D ˆ i i
i i i
Avoid doing 2SLS manually:
▶ SE are incorrect because they don’t account for estimation noise of π
Easy to make mistakes, e.g. with controls
▶

IV with included controls
Expand structural equation, first-stage, and reduced-form to:
′
Y = τD +κ X +ε
i i SE i i
′
D = πZ +κ X +u
i i FS i i
′
Y = ρZ +κ X +e
i i RF i i
Assume exogeneity E[Zε] = 0
i i
Without loss, we have E[Xε] = E[Xu] = E[Zu] = 0
i i i i i i
˜ ˜ ˜
Denote Z residuals from regressing Z on X; similar for Y, D
There are several equivalent ways to get the IV estimand/estimator...

IV with included controls (2)
′ ′ ′
1. Moment conditions: for D = (D,X), τ = (τ,κ ), and Z = (Z,X),
i i i SE i i i
E[Z(Y −D ′ τ)] = 0 =⇒ τ = E[ZD ′ ] −1E[ZY]
i i i i i i i
if E[ZD ′ ] is full-rank (relevance)
i i
2. Run first-stage and reduced-form regressions, take τˆ = ρˆ/πˆ
˜
3. By FWL, using Z as an IV
[ ] [ ] [ ]
˜ ˜ ˜
Cov Z,Y Cov Z,Y /Var Z
i i i i i Reduced-form with controls
τ = [ ] = [ ] [ ] ≡
˜ ˜ ˜ First-stage with controls
Cov Z,D Cov Z,D /Var Z
i i i i i

IV with included controls (3)
4. Also by FWL, regressing Y ˜ and D ˜ and IV’ing with Z or Z: ˜
[ ] [ ]
Cov Z,Y ˜ Cov Z,Y ˜ ˜
i i i i
[ ] [ ]
τ = =
Cov Z,D ˜ Cov Z,D ˜ ˜
i i i i
ˆ +κˆ′ ˆ
5. 2SLS: take first-stage fitted values D = πˆZ X and regress Y on D and X
i i FS i i i i

Multiple endogenous variables & IVs
Suppose we have dim(Z) = K instruments for dim(D) = J ≤ K endogenous
i i
variables
▶ Note: “included” controls are added to both lists
We have K moment conditions for J unknowns:
E[Z −D ′
(Y τ)] = 0
i i i
Π′Z K×J
Any J linear combinations of IVs (for matrix Π with full rank J) would
i
produce a consistent estimator:
′ ′ ′E[ZD ′ −1Π ′E[ZY]
E[Π Z (Y −D τ)] = 0 =⇒ τ = (Π ])
i i i i i i i
In the just-identified case K = J, Π cancels out
▶ There is a single IV estimator

Overidentified case
In the overidentified case K > J, we have many consistent estimators
2SLS uses the first-stage matrix as Π:
E[ZZ ′ −1E[ZD ′
Π = ] ]
i i i i
Π′Z
i.e. using as instruments the first-stage fitted values
i
▶ Note: there are J first-stages, each with all instruments on the RHS
Π′Z Π′Z =⇒
Instrumenting D with = regressing Y on 2SLS procedure
i i i
We can also test that all combinations of IVs yield the same estimate (up to noise)
Hansen’s J-statistic for overidentifying restrictions
▶
▶ If the test rejects, you don’t know which IVs violate exogeneity
And the test can reject because of heterogeneous effects
▶

2SLS as a control function estimator
We have two strategies for dealing with endogenous D: adding controls and IV
i
Are they related to each other?
▶
IV isolates “clean” variation in D
i
′ ′
▶ 2SLS estimates first-stage D = πˆ Z +uˆ and regresses Y on πˆ Z
i i i i i
What if we control for “dirty” variation in D instead (control function estimator)
i
Y = τD +µuˆ +error
i i i
▶ Exercise: the two estimators are numerically the same (even with covariates)
▶ Converse is also true: controlling for X = instrumenting D with its FWL residual
i i

Control function approach to IV
Is the control function approach to IV useful?
Equivalence breaks with nonlinearities: e.g. first-stage is probit or has square terms
▶
▶ Helpful when combining IVs with parametric restrictions: e.g. Heckman selection
model that imposes joint normality of ε i and latent first-stage error

Outline
Setting and Examples
1
IV mechanics
2
3 IV for classical measurement error
4 Weak and Many (Weak) IVs

IV for classical measurement error
Another use of IV is when your RHS variable has classical measurement error:
Y = βX ∗ +ε, X ∗ is what you’d like to measure
i i
∗
X = X +ξ, X is what you observe
i i i i
Classical measurement error: Cov[ξ,X∗] = 0
i i
Caveat: can only happen with continuous variables
∗ ∈ {0,1},
▶ Misclassification of discrete variables is never classical: e.g. when X ,X i
i
X ∗ = 0 =⇒ ξ ≥ 0
i i
∗ =⇒ ≤
X = 1 ξ 0
i i
∗
so Cov[ξ,X i ] < 0
i

Bias of OLS
Cov[X∗,ε]
Suppose OLS would have no bias absent measurement error: = 0
i
OLS with mismeasured X suffers from attenuation bias:
i
Cov[Y,X] Cov[βX∗ +ε,X∗ +ξ] Var[X∗]
β = = = β
OLS Var[X∗ Var[X∗]+Var[ξ]
Var[X] +ξ]
Var[X∗]
with ∈ (0,1) determined by the signal-to-noise ratio
Var[X∗]+Var[ξ]
Can also see this from
−ξ)+ε −βξ)
Y = β(X = βX +(ε
i i i i i i i
Cov[X∗ ̸=
where Cov[X,ξ] = +ξ,ξ] = Var[ξ] 0
i i i i i i

IV estimation is immune
Classical error in the RHS variable: if Cov[Z,ε] = 0 and Cov[Z,ξ] = 0,
Cov[βX∗
Cov[Y,Z] +ε,Z]
β = = = β
IV
Cov[X,Z] Cov[X∗ +ξ,Z]
Z∗
Can also have non-classical measurement error in the IV: if also Z = +ζ
i i i
Cov[βX∗ +ε,Z∗
Cov[Y,Z] +ζ]
β = = = β
IV Cov[X,Z] Cov[X∗ +ξ,Z∗ +ζ]
assuming Cov[Z∗,ε] = Cov[Z∗,ξ] = Cov[ε,ζ] = Cov[ξ,ζ] = Cov[X∗,ζ] = 0

Lessons
1. Do not need to worry about classical error if already using IVs
Measurement error is a possible reason why OLS estimates tend to be smaller than
▶
IV
2. When using OLS, can solve measurement error by using a second imperfect
measurement of X as an IV, as long as the errors are independent
i
▶ E.g. Chalfin and McCrary (2018) instrument police-per-capita from Uniform Crime
Reports data with the same from Annual Survey of Government
▶ And use the 2nd measure to quantify measurement error in the 1st
Exercise: We can use X as IV for X or the other way round. What is better? Is
▶ 1i 2i
there something better yet?

Outline
Setting and Examples
1
IV mechanics
2
3 IV for classical measurement error
4 Weak and Many (Weak) IVs

Weak IV: Overview
What is the weak IV situation?
Instruments do not provide enough variation in the endogenous variables
K = J = 1: low (partial) correlation of D and Z (even if πˆ is significant)
i i
K > J = 1: low (partial) correlation of D with all or most Z
i ki
J > 1:
▶ First-stage is weak for at least one endogenous variable
▶ Or all individual first stages are strong, yet the same combinations of instruments
predict multiple endog.vars
⇒ 2nd stage of 2SLS is close to perfect multicollinearity
▶ General condition: the 1st stage matrix Π is close to rank-deficient

Weak IV: Overview (2)
Problems:
Large sensitivity to violations of IV exogeneity
Large variance of IV estimates
Failure of the asymptotic approximation (and bootstrap, too):
▶ Finite-sample bias of IV estimates in the direction of OLS
▶ Non-Gaussian distributions of IV estimates and t-statistics
▶ Distorted coverage of tests and confidence intervals (both asymptotic and
bootstrap)

Weak IV: Overview (3)
Solutions:
Pre-screening: checking that IVs are strong enough (usually via first-stage F-stats)
▶
Using “weak-robust” tests and confidence intervals (e.g. Anderson-Rubin)
▶
With many (even strong) IVs: replacing 2SLS with more well-behaved estimators
▶
(LIML, JIVE)
Severity of the problem and available solutions vary by:
▶ Number of endogenous vars: J = 1 vs. J > 1
▶ Just-identified vs. overidentified case: K = J vs. K > J
▶ Few or many IV
See Andrews, Stock, Sun (ARE 2019) but the debate continues

Sensitivity to exogeneity violations
Recall Y = τD +ε and D = πZ +u with Cov[Z,u] = 0
i i i i i i i i
̸=
When Cov[Z,ε] 0, it is not guaranteed that IV is less biased than OLS,
i i
especially when the IV is weak: for a scalar IV,
Cov[ε,D] Cov[ε,Z] Cov[ε,πZ]
τ −τ = i i , τ −τ = i i = i i
OLS IV
Var[D] Cov[D,Z] Cov[D,πZ]
i i i i i
▶ Here Var[πZ ]/Var[D ] = R2 from the first-stage
i i FS
If R2 = 0.01, the covariance with the error term to go down by more > 100 times
▶
FS
to reduce bias

Large asymptotic variance of IV
For a scalar IV and under homoskedasticity Var[ε Z] = σ2,
i i
[√ ]
σ2 σ2
−τ) ≈
Var N(τˆ =
IV Var[πZ] Var[D]·R2
i i
FS
Compare with OLS when OLS is unbiased:
[√ ]
σ2
−τ) ≈
Var N(τˆ
OLS
Var[D]
i

F-statistics
First-stage F-statistics play a key role when J = 1
They test for π = 0 (and not also κ = 0!) in
FS
′ ′
D = π Z +κ X +u
i i FS i i
∑ ∑
−1
1πˆ′ · ˆ ·πˆ ˆ
F = where is the estimate of Var[πˆ]
K ππ ππ
∑
ˆ
▶ With homoskedastic : “Cragg–Donald F-statistic”
ππ
∑
With robust ˆ : “Kleibergen–Paap F-statistic”
▶ ππ
When K = 1, F = t2
▶

Finite-sample bias towards OLS
Bound et al. (1995): with scalar D and homoskedasticity, IV is biased towards
i
OLS in finite samples when the first-stage F-stat is small:
Cov[ε,u] 1
i i
E[τˆ −τ] ≈ · ,
IV
Var[u] F+1
i
where the first factor equals OLS bias when π = 0 (and so D = u)
i i
Intuition:
With many IVs, even if all of them are completely irrelevant, the first-stage overfits
▶
Dˆ
and produces fitted values approximating D
i i
▶ With few IVs, this will happen only a bit — but the F-stat still reflects that
E[τˆ
Note: In just-identified cases with Gaussian u, ] doesn’t exist (but think
i IV
median bias instead)

Monte Carlo: Single strong IV
Set N = 300, true effect τ = 0, OLS = 1. Strong IV: π = 1
Density of IV estimates: π = 1.0, K = 1
8.
6.
ytisneD
4.
2.
0
-4 -3 -2 -1 0 1 2 3 4
tau
Kernel density estimate Normal density
Median bias = 0.006. Avg F-stat = 78.198

Tests and coverage: Single strong IV
With single strong IV, distribution of t-stats ≈ N(0,1)
Density of t-statistics: π = 1.0, K = 1
4.
3.
ytisneD
2.
1.
0
-4 -2 0 2 4
t-statistic
Kernel density estimate Standard normal density
Coverage = 0.947

Monte Carlo: Weak IV
Now set π = 0.1 =⇒ Non-Gaussian distribution and bias
Density of IV estimates: π = 0.1, K = 1
51.
1.
ytisneD
50.
0
-4 -3 -2 -1 0 1 2 3 4
tau
Kernel density estimate Normal density
Median bias = 0.546. Avg F-stat = 1.782
(Thedistributioniswinsorizedat|τˆ|=4)

Tests and coverage: Weak IV
Angrist and Kolesár (2024): with K = J = 1, unless endogeneity is super strong, SE will
be very high and coverage is conservative
Density of t-statistics: π = 0.1, K = 1
6.
4.
ytisneD
2.
0
-2 -1 0 1 2
t-statistic
Kernel density estimate Standard normal density
Coverage = 0.998

Monte Carlo: Many IV
Now set π = 1 but add K−1 irrelevant IVs for K = 50 =⇒ Also bias
ytisneD
1
5.
0
Density of IV estimates: π = 1.0, K = 50
-4 -3 -2 -1 0 1 2 3 4
tau
Kernel density estimate Normal density
Median bias = 0.408. Avg F-stat = 2.565

Tests and coverage: Many IV
With many IV, first-stage overfits and appears strong =⇒ undercovered confidence
intervals
Density of t-statistics: π = 1.0, K = 50
4.
3.
ytisneD
2.
1.
0
-2 0 2 4 6
t-statistic
Kernel density estimate Standard normal density
Coverage = 0.774

Many IV bias in practice
Bound et al. (1995) reanalyze many-instrument 2SLS estimates of Angrist and
Krueger (1991)
▶ 30 IVs: QoB interacted with year of birth
180 IVs: additionally, QoB interacted with state of birth
▶
They use randomly generated QoB instead of actual ones
▶ Find coefs centered near OLS, possibly significant

What to do?
Report OLS as a reference point
Report and visualize first-stage estimates
Report the appropriate first-stage F-statistic on the instruments
Report and visualize reduced-form estimates: “if the reduced form estimates are
not significantly different from zero, ... the effect of interest is either absent or the
instruments are too weak to detect it” (Angrist and Krueger, 2001)
Report “weak-robust” confidence intervals
With K > J, try alternative estimators: just-identified IV; LIML or JIVE

Pre-testing for weak IVs
Test for weak IV for J = 1 (Staiger and Stock (1997), Stock and Yogo (2005))
▶ Understood as worst-case bias (in % of OLS bias) or worst-case distortion of Wald
test coverage
▶ Test: F > special critical value. Heuristic: F > 10. Requires homoskedasticity
Montiel Olea and Pflueger (2013) extend to heteroskedastic case:
▶ K = 1: use robust (a.k.a. Kleibergen–Paap) F-stat, with Stock & Yogo critical
values
▶ K > 1: use “effective F-stat” they propose (̸= homoskedastic or robust), with
different critical values (but not too different from Stock and Yogo)

Pre-testing for weak IVs (2)
Angrist and Kolesár (2024) for J = K = 1, no need to worry about F-stats
▶ The worst-case is too extreme for most practical situations
For K > 1, Sanderson and Windmeijer (2016) test for homoskedastic case
▶ Can correctly reject even if each first-stage has a high F-stat
▶ See Lewis and Mertens (2024) on the worst-case with K > 1 and heteroskedasticity

Weak-robust inference
Consider J = 1 but any K
Exogeneity implies ρ = τπ even with weak IVs
▶ (ρˆ,πˆ) are jointly asy. normal; can get robust variance estimate Σˆ
To test τ = b, use the Anderson-Rubin statistic
( )
(ρˆ−πˆb) ′ ˆ−1(b)(ρˆ−πˆb), ˆ ˆ −b ˆ ˆ ˆ
AR = V V (b) = Σ Σ +Σ +b2Σ
ρρ ρπ πρ ππ
∼ χ2 =⇒ χ2
▶ Under the null, AR Reject if AR > K,1−α
K
Construct confidence interval by test inversion: collect all b that are not rejected
▶
▶ With homoskedastic Σˆ or with K = 1, there is an analytical formula for the CI
(Mikusheva (2010))

Properties of AR confidence intervals
CI can be infinite (= R or, weirdly, R\[a ,a ])
1 2
▶ Not surprising: when π = 0 there is no information about τ
▶ Indeed, CI is infinite whenever can’t reject π = 0 by Wald test
With K = J = 1:
▶ CI ̸= ∅: τˆ = ρˆ/πˆ is always in it (since AR(τˆ) = 0), but needn’t be in the middle
Test is asymptotically eﬀicient (see Andrews, Stock, Sun, Section 5.1.1)
▶
With K > J = 1:
CI is empty if overidentifying restrictions are rejected (ρˆis far from τπˆ for all τ)
▶
▶ Since the test is sensitive to overid. restrictions, it’s ineﬀicient for testing τ = b
▶ Improvements have been proposed (see Andrews et al. Section 5.2)
With J > 1, test inversion produces inconvenient J-dimensional confidence sets
▶ See Andrews et al. (Section 5.3) on CIs for individual coeﬀicients

Alternative estimators with overidentification: LIML
Limited information maximum likelihood (LIML):
Proposed as joint MLE estimator for the structural equation + first-stage,
assuming homoskedastic normal errors
Minimizes (homoskedastic) AR(b) =⇒ lies within the AR conf. interval (whenever
non-empty)
Has much smaller median bias than 2SLS under weak IV
=⇒
But higher variance MSE comparison unclear (e.g. Blomquist and Dahlberg
(1999))
Doesn’t have moments =⇒ can have extreme outliers
Doesn’t work well with heterogeneous effects (Kolesar (2013))

Alternative estimators: JIVE
Jackknife IV estimator (JIVE; Angrist, Imbens, and Krueger (1999)):
Avoids overfitting in the first-stage by a leave-out procedure
For each i estimate the first-stage πˆ excluding observation i
−i
˜ πˆ′ ˜′D)−1D ˜
Obtain fitted values D = Z and set τˆ = (D Y
i −i i jackknife
There is a way to obtain τˆ without actually running the first-stage N times
jackknife
Small median bias but variance is typically even worse than LIML

Aside: Two-Sample IV
For simplicity, consider just-identified IV, perhaps with covariates
′ D)−1Z ′
Usual situation: observe (Z,D,Y), compute τˆ = (Z Y
Angrist (1990) Vietnam lottery paper:
→
1. Social Security data: earnings Y, date of birth lottery number Z, covariates
(race, year of birth) — but not veteran status D
2. Veteran records: Z, D, covariates — but not Y
▶ Note: Y and D never observed together
( )
−1
1 ′ 1 ′
Two-sample IV: τˆ = Z D Z Y
N 2 2 N1 1
(2 )
−1
ˆ ′ ˆ ˆ ′ ˆ ′ −1
Two-sample 2SLS: τˆ = D D D Y where D = Z (Z Z ) Z D are fitted
1 1 1 1 1 2 2 2 2
values from the 2nd-sample first-stage computed for the 1st sample
Inoue and Solon (2010): they differ; two-sample TSLS is more eﬀicient; derive SE

References I
Andrews, I., J. Stock, and L. Sun (2019): “Weak Instruments in Instrumental Variable
Regression: Theory and Practice,” Annual Review of Economics.
Angrist, J. and M. Kolesár (2024): “One Instrument to Rule Them All: The Bias and Coverage
of Just-ID IV,” Journal of Econometrics, arXiv:2110.10556 [econ, stat].
Angrist, J. D. (1990): “Lifetime earnings and the Vietnam era draft lottery: evidence from social
security administrative records,” American Economic Review, 80, 313–336.
Angrist, J. D. and W. N. Evans (1998): “Children and Their Parents ’ Labor Supply : Evidence
from Exogenous Variation in Family,” American Economic Association, 88, 450–477.
Angrist, J. D., G. W. Imbens, and A. Krueger (1999): “Jackknife instrumental variables
estimation,” Journal of Applied Econometrics, 67, 57–67.
Angrist, J. D. and A. B. Krueger (1991): “Does Compulsory School Attendance Affect
Schooling and Earnings?” Quarterly Journal of Economics.
——— (2001): “Instrumental Variables and the Search for Identification: From Supply and Demand to
Natural Experiments,” Journal of Economic Perspectives.

References II
Blomquist, S. and M. Dahlberg (1999): “Small sample properties of LIML and jackknife IV
estimators: experiments with weak instruments,” Journal of Applied Econometrics, 14, 69–88.
Bound, J., D. a. Jaeger, and R. M. Baker (1995): “Problems with Instrumental Variables
Estimation when the Correlation between the Instruments and the Endogenous Explanatory Variable
is Weak,” Journal of the American Statistical Association, 90, 443–450, iSBN: 01621459.
Buckles, K. S. and D. M. Hungerman (2013): “Season of Birth and Later Outcomes: Old
Questions, New Answers,” Review of Economics and Statistics, 95, 711–724.
Chalfin, A. and J. McCrary (2018): “Are U.S. Cities Underpoliced? Theory and Evidence,”
Review of Economics and Statistics, 100, 167–186.
Duranton, G. and M. A. Turner (2012): “Urban Growth and Transportation,” Review of
Economic Studies, 79, 1407–1440.
Gallen, T. and B. Raymond (2023): “Broken Instruments,” Working Paper.
Inoue, A. and G. Solon (2010): “Two-Sample Instrumental Variable Estimators,” Review of
Economics and Statistics, 92, 557–561.

References III
Kolesar, M. (2013): “Estimation in an Instrumental Variables Model With Treatment Effect
Heterogeneity,” 1–45.
Lewis, D. J. and K. Mertens (2024): “A Robust Test for Weak Instruments for 2SLS with
Multiple Endogenous Regressors,” Working Paper.
Mellon, J. (2024): “Rain, Rain, Go Away: 194 Potential Exclusion-Restriction Violations for Studies
Using Weather as an Instrumental Variable,” American Journal of Political Science.
Mikusheva, A. (2010): “Robust confidence sets in the presence of weak instruments,” Journal of
Econometrics, 157, 236–247, publisher: Elsevier B.V.
Montiel Olea, J. L. and C. Pflueger (2013): “A robust test for weak instruments in Stata,”
Journal of Business and Economic Statistics, 31, 358–369, arXiv: The Stata Journal ISBN:
0735-0015\r1537-2707.
Sanderson, E. and F. Windmeijer (2016): “A weak instrument F -test in linear IV models with
multiple endogenous variables,” Journal of Econometrics, 190, 212–221.
Sarsons, H. (2015): “Rainfall and Conflict: A Cautionary Tale,” Journal of Development Economics,
115, 62–72.

References IV
Staiger, D. and J. H. Stock (1997): “Instrumental Variables Regression with Weak Instruments,”
Econometrica, 65, 557–586.
Stock, J. H. and M. Yogo (2005): “Testing for Weak Instruments in Linear IV Regression,” in
Identification and Inference for Econometric Models, 80–108.
