Part G: Models with Multiplicative Effects
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

G Outline
1 Modeling multiplicative effects
Multiplicative effects and potential outcomes
2
Reading: Chen and Roth (2024)

Multiplicative effects
With non-negative outcomes, it’s often more natural to think that the effects are
multiplicative, rather than additive
▶ E.g. X = regional trade agreement between countries, Y = import value
i i
▶ E.g. X i = log price, Y i = demand
How should we deal with this case? Models? Estimands? Estimators?
Start with homogeneous effects; then add heterogeneity
▶
Common practice: use logY as outcome, logY = β′X +ε
i i i i
▶ Assuming E[ε | X ] = 0 (i.e., E[logY | X ] = β ′ X ), OLS in logs is consistent for
i i i i i
(constant effect) β

Issue of zeros
If there are zeros (Pr(Y = 0) > 0), logY is not well-defined
i i
Common to use lo(g-like t ransform)ations: log(1+Y ) or inverse hyperbolic sine
p i
≡
arcsinh(Y) log Y + 1+Y2 (well-defined for Y < 0 and symmetric)
i i i i
3
2
1
0
1-
2-
0 2 4 6 8 10
log(x) log(1+x) asinh(x)
With and without zeros, are these good ideas? Are there other options?

Modeling multiplicative effects
Compare three models:
1. logY = β ′ X +ε, E[ε X] = 0
i i i i i
′
2. Y = exp(β X)U, E[U X] = 1
i i i i i
′
3. Y = exp(β X)+ε, E[ε X] = 0
i i i i i
Are #1 and #2 equivalent? No! (Santos Silva and Tenreyro (2006))
Are #2 and #3 equivalent? Yes! Define ε = exp(β′X)(U −1)
i i i
E[Y ′
▶ Both models impose i X i ] = exp(β X i )
(or equivalently logE[Y | X] = β ′ X instead of E[logY | X] = β ′ X in #1)
i i i i i i

Estimating the exponential model
How would we estimate the model E[Y | X] = exp(β′X) ≡ µ(X,β)?
i i i i
E[g(X)·(Y −exp(β′X))] g(·)
Could use moment conditions = 0 for any vector
i i i
∝ ∂µ (X ,β) ex p ( β ′ X )
▶ Most eﬀicient g(X ) i /Var[Y X ] = i X
i ∂ β ′ i i V a r [Y X ] i
i i
Nonlinear least squares (NLLS): g(X) = exp(β′X)·X
i i i
▶ Eﬀicient when Var[Y | X ] = const (usually very wrong in practice)
i i
Poisson Pseudo Maximum Likelihood (PPML): g(X) = X
i i
∝
▶ Eﬀicient when Var[Y i X i ] µ(X i ,β)
1
Gamma-PML: g(X) = X
i exp(β′Xi) i
∝ ,β)2
▶ Eﬀicient when Var[Y X ] µ(X
i i i

Nonlinear least squares (NLLS)
X
β ˆ = argmin (Y −exp(b ′ X))2
NLLS i i
b
X( i ( )) ( )
FOC: 0 = Y −exp β ˆ′ X ·exp β ˆ′ X X
i NLLS i NLLS i i
| {z }
i
ˆg(Xi)
This is MLE under Y | X ∼ N(exp(β′X),σ2)
i i i
▶ But consistent under E[Y i | X i ] = exp(β ′ X i ) without normality and
homoskedasticity
▶ And eﬀicient if additionally Var[Y i | X i ] = const, without normality

PPML
∈ {0,1,2,...}:
Originates as MLE for count data, Y
i
µ(X,β)kexp(−µ(X,β))
Y X ∼ Poisson(µ(X,β)), i.e. Pr(Y = k X) = i i
i i i i i
k!
P
L ·β ′ −exp(β ′
▶ Log-likelih ood: = (Y )i) X i X i ))+const
( ( i
P
−exp βˆX
▶ FOC: Y X = 0
i i i i
ˆ ≥
But this β is well-defined for any data Y 0 — Poisson pseudo-maximum
PPML i
likelihood (PPML) estimator
Consistency only requires E[Y X ] = exp(β ′ X )
▶ i i i
▶ Eﬀicient if Var[Y | X ] = σ2E[Y | X ] (not limited to “equi-dispersion,” σ2 = 1, as
i i i i
under actual Poisson model)

PPML with fixed effects
We mentioned in part D1 that most estimators for nonlinear models with FE suffer
from an incidental parameters problem
▶ PPML is quite special
E[Y +β′X
Wooldridge (1999) considers a short panel with X,α] = exp(α )
it i i i it
with strictly exogenous X
it
PPML is consistent for β
▶
Fernandez-Val and Weidner (2016) consider a long panel (N,T → ∞) with
E[Y +β′X
two-way fixed effects: X,α] = exp(α +γ )
it i i i t it
▶ An equivalent setting: gravity model for Y
ij
▶ Various estimators are consistent (because many observations per FE) but PPML
doesn’t suffer from bias of order O(1/N+1/T)
Correia et al. (2020): fast implementation (in Stata) with multi-dimensional FEs

Application
Santos Silva and Tenreyro (2006) estimate the gravity equation of international trade
across country pairs, assuming:
E[Exports ′
X ,α,γ] = exp(β X +α +γ)
ij ij i j ij i j
(SantosSilvaandTenreyro(2006),Table5)

Outline
Modeling multiplicative effects
1
2 Multiplicative effects and potential outcomes

A causal interpretation and heterogeneous effects
We now have several models + estimators:
▶ E[logY i | X i ] = β ′ X i or E[log(1+Y i ) | X i ] = β ′ X i + OLS
▶ E[Y i | X i ] = exp(β ′ X i ) + NLLS, PPML, Gamma-PML
But for causal questions all of this is a wrong starting point
▶ Potential outcomes is our model!
▶ We’d like to use randomization of D i or parallel trends, etc.
▶ What are the estimands of different estimators? And what do we want?
▶ Assume for now random assignment of binary treatment D i

Case without zeros
OLS of logY on D: τ = E[logY(1)−logY(0)]
i i OLS i i
PPML of Y on D: FOC E[(Y −exp(β +τD))·(1,D)′] = 0
i i i 0 i i
▶ E[Y (0)] = exp(β ), E[Y (1)] = exp(β +τ) =⇒
i 0 i 0
E[Y(1)−Y(0)]
i i
τ = logE[Y(1)]−logE[Y(0)]; exp(τ )−1 =
PPML i i PPML E[Y(0)]
i
What are the differences? (Cf. Chen and Roth (2024))
Poisson identifies the ATE in levels, rescaled by the control mean
The effect may be dominated by the right tail of Y (0)
▶ i
▶ That may be what the policymaker cares about

Case with zeros
Additional issue with zero: there are two types of responses
▶ Extensive margin: Pr(Y (1) = 0)−Pr(Y (0) = 0)
i i
▶ Intensive margin: E[Y (1)−Y (0) Y (0) > 0,Y (1) > 0]
i i i i
Log-like transformations are very dependent on measurement units of Y (Chen and
i
Roth (2024)):
If extensive margin ̸= 0, by rescaling Y any real number can become the estimand!
▶ i
Pros and cons of other methods depend on the goal
Case 1: you don’t care about separating extensive and intensive margins
▶ E.g. Y = # of publications in a year: 0 has no special meaning
i
E[Y (1)−Y (0)]/E[Y
▶ PPML still yields (0)], a mix of the two margins
i i i

Case with zeros (2)
Case 2: you want to isolate the two margins
▶ E.g. Y = # of hours worked per week; extensive margin = non-employment
i
▶ For extensive margin, can regress 1[Y > 0] on D
i i
Intensive margin is not point identified because of selection: can’t just drop zeros
▶
⋆ But “Lee bounds” are available (Lee (2009), Semenova (2025))
Case 3: you can take a stand on how to combine the two margins: e.g.
(
logY, Y > 0
i i
U(Y) =
i −c,
Y = 0
i
▶ Then give up on scale invariance and regress U(Y ) on D
i i

PPML diff-in-diff
Wooldridge (2023) extends DiD imputation and its regression implementation to
the multiplicative model with staggered adoption
Assume multiplicative parallel trends at the cohort level:
E[Y
(0) E = e] = exp(α +β )
it i e t
Use untreated data to estimate α and β by TWFE PPML, then estimate CATT
t e
(in levels) ( )
¯ −exp ˆ
CATT = Y t Ei=e αˆ +β
et e t
As in Wooldridge (2025), can implement in a single step: PPML regression on
TWFE and dummies for each treated cohort-period
▶ Coeﬀicients are interpreted as logE[Y (1) | E = e]−logE[Y (0) | E = e]
it i it i
▶ Can convert ATT as % of untreated mean or ATT in levels

Thanks!
Please fill in the evaluations NOW!
If you suspect a typo or mistake, send me an email

References I
Chen, J. and J. Roth (2024): “Logs with Zeros? Some Problems and Solutions,” Quarterly
Journal of Economics, 139, 891–936.
Correia, S., P. Guimarães, and T. Z. Zylkin (2020): “Fast Poisson estimation with
high-dimensional fixed effects,” Stata Journal, 20, 95–115.
Fernandez-Val, I. and M. Weidner (2016): “Individual and time effects in nonlinear panel
models with large N, T,” Journal of Econometrics, 192, 291–312, arXiv: 1311.7065 Publisher:
Elsevier B.V.
Lee, D. S. (2009): “Training, wages, and sample selection: Estimating sharp bounds on treatment
effects,” Review of Economic Studies, 76, 1071–1102.
Santos Silva, J. and S. Tenreyro (2006): “The log of gravity,” Review of Economics and
Statistics, 88, 641–658.
Semenova, V. (2025): “Generalized Lee Bounds,” Journal of Econometrics, arXiv: 2008.12720.
Wooldridge, J. M. (1999): “Distribution-free estimation of some nonlinear panel data models,”
Journal of Econometrics, 90, 77–97.

References II
——— (2023): “Simple Approaches to Nonlinear Difference-in-Differences with Panel Data,”
Econometrics Journal.
——— (2025): “Two-Way Fixed Effects, the Two-Way Mundlak Regression, and
Difference-in-Differences Estimators,” Empirical Economics.
