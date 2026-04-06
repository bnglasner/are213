Part D: Panel Data Methods
D1: Linear Panel Data Methods
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

Panel data methods: Outline
1. Linear panel data methods with constant effects
2. Canonical DiD and event studies
3. DiD with staggered adoption
4. DiD extensions
5. Synthetic control methods and factor models

D1 outline
1 Estimation, eﬀiciency, inference
Extensions
2
3 Application: Mover designs and the AKM model
Readings: IW Lecture 3 (also CT Ch.21-22 and JW Ch. 10-11)

Motivation
Selection on observables is rarely convincing in cross-sectional data
▶ Self-selection is complex, too many unknown confounders
And we don’t always have a convincing instrument
To allow for selection on (some) unobservables, leverage repeated observations for
the same unit over time — panel data
▶ How do outcomes change when treatment changes?
This doesn’t resolve the fundamental problem of causal inference but helps control
▶
for unobserved confounders that are time-invariant
Panel data are also helpful to evaluate effect dynamics

Linear panel model
For i = 1,...,I and t = 1,...,T, consider a constant-effects model
′
Y = β X +α +ε
it it i it
where β is of interest; α is additive “unobserved heterogeneity”
i
Denote X = (X ,...,X ), Y = (Y ,...,Y ), ε = (ε ,...,ε )
i i1 iT i i1 iT i i1 iT
Every (i,t) is observed =⇒ balanced panel; with missing data: unbalanced panel

Asymptotic sequences
Conventional asymptotic (our focus): short panel
A growing sample of I units for a fixed number of periods, T
▶
Appropriate when I ≫ T
▶
Alternative asymptotic: long panel
▶ The sample grows by increasing both I and T (at the same or different rates)
≈
▶ More appropriate when I T

Notions of exogeneity
E[ε
Contemporaneous exogeneity: X ,α] = 0
it it i
Interpretation: no time-varying confounders
▶
▶ A natural assumption... but insuﬀicient to identify β
(Main focus) Strict exogeneity: E[ε X ,...,X ,α] = 0
it i1 iT i
▶ For h > 0, Cov[ε it ,X i,t−h ] = 0: precludes unmodeled dynamic effects (but solved
by including lags of RHS variables)
▶ Cov[ε ,X ] = 0: precludes “feedback effects” from Y to X
it i,t+h it i,t+h
⋆ Also precludes X ≡Y as one of the RHS variables — “dynamic panel” models
it i,t−1
(For later) Sequential exogeneity: E[ε X ,...,X ,α] = 0
it i1 it i
▶ Allows feedback effects and dynamic panels models

Random and fixed effects
If selection on α is allowed, E[α | X] ̸= const, α is called fixed effect
i i i i
E[α =⇒
▶ If i X i ] = const (no selection on unobservables) α i is a random effect
▶ These labels are not about whether α is stochastic (always think random sample of
i
(α,X,ε,Y)N
)
i i i i i=1
To estimate β in the FE model, remove α in different ways:
i
▶ “FE regression”: Dummy variable regression = within transformation
First differences
▶
▶ Long differences
Note: random effects model allows for more estimation methods
▶ “Pooled OLS” regression of Y on X across i,t identifies β
it it
“Random effects” Generalized Least Squares estimator
▶

Estimation by dummy variables (FE) regression
View {α} as a set of nuisance parameters multiplying dummies for each unit:
i
∑I
′ ≡ (∗)
Y = β X + αW +ε , W 1[i = j]
it it j ji it ji
j=1
∑
Note: don’t write e.g. Y = β ′ X + α +ε
▶ it it j it
j

Estimation by dummy variables (FE) regression
By FWL, OLS estimation of (∗) = simple OLS after “within transformation”:
∑T
1
Y ˙ = β ′ X ˙ +ε˙ , V ˙ ≡ V −V ¯ = V − V
it it it it it i it is
T
s=1
▶ Exercise: prove this
▶ This is much faster than using I dummies! Use reghdfe in Stata, fixest in R
ˆ
For consistency of β, we need
[( )( )]
[ ] ∑T ∑T
1 1
E X ˙ ε˙ = E X − X ε − ε = 0
it it it is it is
T T
s=1 s=1
▶ Holds under strict exogeneity but not contemporaneous/sequential exogeneity
▶ Question: why is strict exogeneity necessary for (∗)?

Estimation by first & long differencing
The FE model also implies the first-difference (FD) specification:
∆Y = β ′ ∆X +∆ε , ∆V ≡ V −V , t = 2,...,T
it it it it it i,t−1
▶ E[∆X it ·∆ε it ] = 0 under strict exogeneity (but not contemporaneous/sequential)
▶ Exercise: with T = 2, OLS estimators of FE and FD equations are identical (even in
unbalanced panels) — but not otherwise
And a long-difference specification: for h > 1,
Y −Y = β ′ (X −X )+(ε −ε ), t = h+1,...,T
it i,t−h it i,t−h it i,t−h
with E[(X −X )·(ε −ε )] = 0 under strict exogeneity
it i,t−h it i,t−h

Choosing between FE and FD estimators
FE and FD estimate β from the same model under the same assumption (strict
exogeneity). So how do we choose?
1. Eﬀiciency:
FE estimator is eﬀicient when ε are serially uncorrelated
▶ it
FD estimator is eﬀicient when ε follow a random walk (i.e., ∆ε are serially
▶ it it
uncorrelated)
▶ It’s not about persistence in the outcome (which could come from α ) but about
i
differential persistence of observations close in time
FD can lose a lot of data in unbalanced panels
▶

Choosing between FE and FD estimators (2)
2. Robustness to violations of assumptions:
▶ When contemporaneous or sequential exogeneity holds but strict exogeneity
bias(βˆ bias(βˆ
doesn’t, FE ) = O(1/T) while FD ) = O(1) (for weakly dependent data)
▶ Differencing can exacerbate measurement error in X
it
3. Fads: FE estimation is more popular; it appears that you’ve controlled for more
▶ False, plus FD & long-diffs are more transparent (especially in more complex
situations)
▶ If you use a FE specification, always rewrite it in FD

https://x.com/KhoaVuUmn/status/1630576551325495296

Inference
In short panels, always cluster SE by i
▶ See Bertrand, Duflo, and Mullainathan (2004) for an illustration
In FD regressions, non-clustered (heteroskedasticity-robust) SEs require
Cov[∆X ∆ε ,∆X ∆ε ] = 0
it it is is
Unless X or ε is a random walk, ∆X and ∆ε are serially correlated
▶ it it it it
[ ]
˙ ˙
In FE regressions, need Cov X ε˙ ,X ε˙ = 0
it it is is
▶ But X and ε are often serially correlated
it it
▶ And even if ε it are uncorrelated, ε˙ it are negatively serially correlated in short panels
(although DoF correction by IT can correct for that)
IT−I−dim(X)

Remarks
FE model cannot estimate the effects of time-invariant variables
▶ They get killed by both within transformation and differencing
There is no intercept in the FE model
( )
∑
−βˆ′
▶ But can estimate αˆ = 1 Y X : unbiased for α but not consistent in
i T t it it i
short panels
∑
And report 1 αˆ that is consistent for E[α ]
▶ i i i
I
R2
With FEs, is often very high and not very informative
Instead, can use “within R2”
▶
[ ] [ ]
R2 Y˙ X˙
▶ I.e., after within-transformation: % of Var i explained by Var i

Outline
1 Estimation, eﬀiciency, inference
2 Extensions
3 Application: Mover designs and the AKM model

Extensions
1. Random effects estimation
2. Two-way fixed effects
3. Models with random slopes
4. Modeling dynamic effects
5. Nonlinear panel models
6. Fixed effects beyond panel data

Random effects estimation
In addition to E[ε X,α] = 0, assume E[α X] = 0
it i i i i
Then Pooled OLS estimator is consistent:
Y = β ′ X +v , v = α +ε , Cov[v ,X ] = 0
it it it it i it it it
▶ But ineﬀicient: v it are correlated across all t
RE estimator: feasible GLS for Var[ε | X,α] = σ2I and Var[α | X] = σ2:
i i i ε T i i α
 
( ) ( )
−1 σˆ2 +σˆ2 σˆ2 ... σˆ2
∑ ∑
 α ε α α 
β ˆ = X ′ Ω ˆ−1X X ′ Ω ˆ−1Y , Ω ˆ = ...
RE i i
i i
σˆ2 σˆ2 ... σˆ2 +σˆ2
i i α α α ε

Random effects estimation (2)
Consistent even without homoskedastic and serially uncorrelated ε
it
Allows for time-invariant X
it
Can be obtained via quasi-differencing: OLS for
( ) ( ) ( )
Y −λ ˆ Y ¯ = β ′ X −λ ˆ X ¯ + v −λ ˆ¯v
it i it i it i
where λ ˆ = 1−(1+Tσˆ2/σˆ2) −1/2
α ε
▶ λˆ ≈ 1, so βˆ RE ≈ βˆ FE , when T is large or Var[α i ] ≫ Var[ε it ]

Two-way fixed effects (TWFE)
Besides α, we may want to include (additive) period effects γ to capture shocks
i t
that affect all units:
Y = β ′ X +α +γ +ε (#)
it it i t it
Unlike α, period FEs are non-stochastic parameters (on period dummies)
i
(#) requires an innocuous normalization on {α} or {γ }
i t
FE estimator: in balanced panels, OLS from double-differenced specification:
( ) ( )
¨ ′ ¨ ¨ ¯ ¯ ¯
Y = β X +ε¨ , V ≡ V −V − V −V
it it it it it i t
Follows from FWL, because unit and period dummies are in-sample orthogonal
▶
FD estimator: OLS from ∆Y = β′∆X +∆γ +∆ε where ∆γ are period FEs
it it t it t

Models with random slopes
+β′X +γ′Z
Consider Y = α +ε
it i it i it it
′ ′
▶ E.g. unit-specific linear trends: Y = α +β X +γ t+ε
it i it i it
Dummy variable representation and estimation:
∑I ∑I
Y = αW +β ′ X + γ ′ Z W +ε
it j ji it j jt ji it
j=1 j=1
FWL: for each i separately, residualize Y ,X on (1,Z ) in the time series
it it it

Modeling dynamic effects
Distributed lags model can be accommodated with no change:
Y = β ′ X +β ′ X +...β ′ X +α +ε
it it i,t−1 i,t−L i it
0 1 L
Lagged dependent variable on the RHS: dynamic panel model
′
Y = ρY +β X +α +ε
it i,t−1 it i it
▶ Violates strict exogeneity: ε can’t be mean-independent of Y for s = t+1
it i,s−1
▶ At best, we can hope for sequential exogeneity of Y :
i,t−1
E[ε Y ,...,Y ,X ,α ] = 0
it i1 i,t−1 i i
▶ FE estimator is not consistent in short panels: “Nickell bias” ∝ 1/T
▶ FD estimator has bias O(1). But FD specification can be estimated by IV...

Arellano-Bond estimator
FD specification: ∆Y = ρ∆Y +β′∆X +∆ε
it i,t−1 it i,t
−Y −ε ̸=
OLS doesn’t work: Cov[∆Y ,∆ε ] = Cov[Y ,ε ] 0
i,t−1 it i,t−1 i,t−2 it i,t−1
But can use Y ,...,Y as IVs for ∆Y ⇒ Arellano and Bond (1991)
i1 i,t−2 i,t−1
estimator: GMM for moment conditions collected across t
[ ]
E −ρ∆Y −β ′ )·(Y ′ ′
(∆Y i,t−1 ∆X ,...Y i,t−2 ,∆X ) = 0, t = 3,...,T
it it i1 it
These IVs can be weak, especially when ρ is close to 1
▶ Improvements are available, e.g. Blundell and Bond (1998)
Similar ideas can be applied with sequentially exogenous X other than Y (with
it i,t−1
feedback effects of ε on X )
i,t−1 it

Nonlinear panel data models
Nonlinear models with fixed effects are much more complicated. Consider binary choice
models:
′
Pr(Y = 1 X ,α) = F(β X +α), F = probit or logistic
it it i it i
Likelihood estimation of β along with {α} results in the incidental parameter
i
problem: β ˆ is inconsistent in short panels
The problem doesn’t arise with linear F because the within transformation kills α
▶ i
For logistic regression (but not probit), “conditional logit” estimator eliminates α
i
yielding consistent estimates for β:
But not for average partial effects which depend on α
▶ i
More progress with long panels; see Fernández-Val and Weidner (2018)

FEs beyond panel data
There are other types of data with repeated observations:
1. Twin studies = repeated observations in the same family
▶ E.g. Ashenfelter and Rouse (1998) estimate returns to schooling for twins
⋆ X i = years of schooling
⋆ Family FEs control for genetic differences
▶ Warning: why does education vary between twins?
⋆ Need to explain why confounders are the same between the twins while X is not
it
⋆ Bound and Solon (1999): first-borns have higher weight, IQ, schooling

FEs beyond panel data (2)
2. County-level cross-section = repeated observations for the same state
▶ State FEs control for additive state-level unobservables
▶ E.g. state-level policies with constant effects
3. In a county-level panel, can include state-by-year FEs:
′
Y = β X +α +γ +ε
it it i s(i),t it
Including γ removes state-year-specific means from Y and X
▶ s(i),t it it
∑
′ ]×1[t ′ ×δ
▶ Note: s′,t′ γ s′t′1[s(i) = s = t ] is correct notation; γ s(i) t is wrong

FEs beyond panel data (3)
4. Repeated cross-sections: in each year a new random sample from each state
Can’t control for individual heterogeneity
▶
▶ But state FEs control for additive state-level unobservables
▶ Cluster at the state-level if X only varies by state
it
5. Dyadic data: e.g. how does distance X between exporting country i and importing
ij
country j affect log trade flow Y ? (Gravity equation)
ij
Note: by construction, it’s like a long panel, I×I
▶
Exercise: Which FE would you include? How would you cluster SE?
▶

Outline
1 Estimation, eﬀiciency, inference
2 Extensions
3 Application: Mover designs and the AKM model

Application: Are there good firms?
Abowd, Kramarz, and Margolis (1999): Are there good firms that pay higher
wages to the same workers?
▶ How much variation in wages is explained by worker characteristics? By firm
characteristics?
▶ Do “better” workers tend to work for “better” firms?
Use 10 years of employer-employee matched data for France
▶ A panel of workers i: observe employer ID j(it), experience, wages

AKM model
Model of log-wages Y :
it
Y = β ′ X +α +γ +ε
it it i j(it) it
X are time-varying observables, e.g. experience — not of interest
it
{α} are worker FEs; {γ} are firm FEs
i j
ε captures match-specific wage premium
it

Identification
Relative firm FEs are identified by movers:
( )
′ −γ
∆Y = β ∆X + γ +∆ε
it it j(it) j(i,t−1) it
(actual estimation via dummy variable regression, not in first-differences)
▶
▶ Identification only within a connected component of the worker-firm graph
E[ε
Requires strict exogeneity: X ,...,X ,α,j(i1),...,j(iT)] = 0
it i1 iT i
▶ Matching of firms and workers can depend on FEs but not on match quality ε it
(“exogenous mobility”)

Testing exogenous mobility (Card, Heining, and Kline (2013))
Do movers from high-γ to low-γ firms lose less than movers from low-γ to high-γ gain?
(usequartilesofaveragewagespaidtootherworkers;Germanemployer-employeedata)

Estimation issues
Card et al. (2013) compute:
▶ Variances of αˆ i and γˆ as worker and firm contributions to wage inequality
j(it)
▶ Covariance of αˆ i and γˆ as a measure of sorting
j(it)
But FEs are not estimated consistently!
⇒ ↑
▶ For all workers, at most 8 wage observations Var[αˆ i ] biased
[ ]
⇒ ↑
▶ For m[any firm]s, there are only a few movers Var γˆ biased and
j(it)
Cov αˆ,γˆ biased ↓
i j(it)
Kline, Saggio, and Solvsten (2020) provide a bias correction
[ ] [ ]
Consistent estimates of Var[α ],Var γ ,Cov α ,γ without consistent
▶ i j(it) i j(it)
estimates of the FEs

Kline et al. (2020) findings (for Veneto region in Italy)

Extensions
See Kline (2024) for a modern treatment
Hull (2018) interprets mover designs under heterogeneous effects
Versions of the AKM model have been applied in other settings:
▶ Wages depend on worker FE and city FE (Glaeser and Mare (2001))
▶ Log healthcare utilization depends on person FE (“demand”) and location FE
(“supply”) (Finkelstein, Gentzkow, and Williams (2016))
▶ Changes in credit depends on client firm FE (demand) and bank FE (supply) (Amiti
and Weinstein (2018), in a cross-section)

References I
Abowd, J. M., F. Kramarz, and D. N. Margolis (1999): “High wage workers and high wage
firms,” Econometrica, 67, 251–333.
Amiti, M. and D. E. Weinstein (2018): “How Much Do Idiosyncratic Bank Shocks Affect
Investment? Evidence from Matched Bank-Firm Loan Data,” Journal of Political Economy, 126,
525–587.
Arellano, M. and S. Bond (1991): “Some Tests of Specification for Panel Data: Monte Carlo
Evidence and an Application to Employment Equations,” The Review of Economic Studies, 58, 277.
Ashenfelter, O. and C. Rouse (1998): “Income, Schoolig, and Ability: Evidence from a New
Sample of Identical Twins,” Quarterly Journal of Economics, 113, 253–284.
Bertrand, M., E. Duflo, and S. Mullainathan (2004): “How Much Should We Trust
Differences-in-Differences Estimates?” The Quarterly Journal of Economics, 119, 249–275.
Blundell, R. and S. Bond (1998): “Initial conditions and moment restrictions in dynamic panel
data models,” Journal of Econometrics, 87, 115–143.
Bound, J. and G. Solon (1999): “Double trouble: on the value of twins-based estimation of the
return to schooling,” Economics of Education Review, 18, 169–182.

References II
Card, D., J. Heining, and P. Kline (2013): “Workplace Heterogeneity and the Rise of West
German Wage Inequality,” Quarterly Journal of Economics, 128, 967–1015.
Fernández-Val, I. and M. Weidner (2018): “Fixed Effects Estimation of Large- T Panel Data
Models,” Annual Review of Economics, 10, 109–138.
Finkelstein, A., M. Gentzkow, and H. Williams (2016): “Sources of Geographic Variation in
Health Care: Evidence From Patient Migration,” The Quarterly Journal of Economics, 131,
1681–1726.
Glaeser, E. L. and D. C. Mare (2001): “Cities and Skills,” Journal of Labor Economics, 19,
316–342.
Hull, P. (2018): “Estimating Treatment Effects in Mover Designs,” Working Paper.
Kline, P. (2024): “Firm wage effects,” in Handbook of Labor Economics, Elsevier, vol. 5, 115–181.
Kline, P., R. Saggio, and M. Solvsten (2020): “Leave-Out Estimation of Variance
Components,” Econometrica, 88, 1859–1898.
