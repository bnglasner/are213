Part D: Panel Data Methods
D5: Synthetic Control Methods and Factor Models
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

D5 outline
1 Synthetic control methods
Factor models
2
Recommended reading: Abadie (2021)

Setting
Consider a complete panel with a non-staggered binary treatment again
t = 1 ... t = T t = T +1 ... t = T +T ≡ T
0 0 0 1
i = 1
...
i = N
0
i = N +1
0
...
i = N +N ≡ N
0 1

Setting (2)
For now, assume N = T = 1:
1 1
t = 1 ... t = T t = T
0
i = 1
...
i = N
0
i = N
\
We just need to impute Y (0) to get τˆ = Y −Y (0)
NT NT NT NT
We’ll come back to inference later

Motivating example: Abadie et al. (2010)
Abadie, Diamond, and Hainmueller (2010) study the effect of California’s 1988 tobacco
control program (Proposition 99) on cigarette sales per capita
They try DiD but it clearly fails:

Motivating example: Abadie et al. (2010)
Abadie, Diamond, and Hainmueller (2010) study the effect of California’s 1988 tobacco
control program (Proposition 99) on cigarette sales per capita
How about this?

DiD vs. Synthetic control method (SCM)
DiD uses the simple average of untreated units (“donors”) as the control:
!
XN0 XT0 XN0
\ \ 1 1 1
−Y ≡ −
τˆ = Y (0), Y (0) Y + Y Y
NT NT NT NT N iT T Nt N it
0 0 0
i=1 t=1 i=1
What if we found a weighted average of donors that closely traced the
pre-treatment path of Y : a “synthetic control” unit?
Nt
P
\ N
▶ If the same relationship continues into t = T, can use Y NT (0) = 0 ω iT Y iT
i= 1
▶ Avoid manually picking comparable states (think Card and Krueger (1994))

How does it work?
{v },
For some we choose weights ω on donors to solve
t i
!
XT0 XN0 2 XN0
· − ≥
min v Y ωY s.t. ω 0, ω = 1
t Nt i it i i
ω1,...,ω
N0 t=1 i=1 i=1
“Simplex constraints” produce a well-defined average and avoid extrapolation
They are also a form of regularization
▶ Otherwise, a “vertical” regression of Y on Y ,...,Y across t = 1,...,T
Nt 1t N0t 0
∞
⋆ With N 0 >T 0 there would be ways to fit Y Nt in pre-periods perfectly
\
▶ And no reason to get good Y NT (0) — overfitting
▶ With the constraints, typically get a unique, sparse solution: few non-zero weights
Sparsity makes the counterfactual transparent

Synthetic California (Abadie et al., 2010)
State Weight
Utah 0.334
Nevada 0.234
Montana 0.199
Colorado 0.164
Connecticut 0.069
Other 33 states 0

Details
1. Besides pre-period outcomes, can match on any predetermined predictors:
X = (Y ,...,Y ,Z)
i i1 iT0 i
2. How to pick weights on predictors, v?
▶ Inverse variance of the predictor across all units
Or cross-validation:
▶
⋆ Choose t 0 <T 0 training periods: t=1,...,t 0
⋆ Search for v to minimize out-of-sample MSE on the validation period t +1,...,T
0 0
⋆ For estimation, limit the sample to the last t pre-periods & treated period
0

Details (2)
{ω}
3. are not unique if the treated unit is in the convex hull of many donors
i
Abadie and L’Hour (2021): try to match with donors that are more similar to the
▶
treated unit
8 9
!
X< XN0 2 XN0 =
)2
min Y − ωY +λ ω (Y −Y
: Nt i it i Nt it ;
ω1,...,ω N0
t i=1 i=1
P
≥ N0
s.t. ω 0, ω = 1, with penalty λ > 0
i i=1 i
⋆ Restores uniqueness and reduces interpolation bias
▶ Robbins et al. (2017): pick weights that minimize the distance from equal weights

Abadie et al. (2010) example (cont.)
As predictors, use several observables (averaged in 1980–88) and outcome in three
pre-periods
Note: Drop states that adopted other tobacco restrictions during the sample period

Inference
Inference is diﬀicult with only 1 treated unit
Abadie et al. (2010) “spaghetti plot”: randomization inference
Under the null of zero effect, the treated unit is no different than others
▶
▶ For each i (in cluding i = N ), construct synthetic i and compute prediction error:
( )
P 2
−Y \
R = Y (0)
i t>T0 it it
▶ Re ject the null if R is extreme in the set of R ,...,R ; p-value =
P N 1 N
1 N ≥
1[R R]
N i=1 N i

Inference in Abadie et al. (2010): “Spaghetti plot”

Inference details
Complication 1: for some i, synthetic control may not match the pre-treatment
trajectory well
Can drop spaghettis with high pre-treatment MSE
▶
▶ Or use R = post-treatment MSE divided by pre-treatment MSE
i
Complication 2: how can we get a confidence interval?
▶ Test inversion: for each τ test τ = τ ; collect all τ that are not rejected
0 0 0
To test τ = τ , replace Y with Y −τ and test τ = 0
▶ 0 NT NT 0

Inference details (2)
Problem: randomization inference is not valid without randomization
Test has a 5% significance level in the sense that for 5% of units if they were
▶
treated the correct null would be rejected
⋆ Not very useful since the treated unit was not chosen randomly with equal
probabilities
▶ Abadie, Diamond, and Hainmueller (2015) study the economic impacts of German
reunification on West Germany
⋆ What does assigning this treatment to another country mean?
One alternative (Chernozhukov et al. (2021)): “conformal inference” based on
permuting periods instead of units

Diagnostic testing and robustness
Placebo test: “backdating”
(FromAbadie(2021))
Robustness check: dropping each contributing donor at a time

Some extensions
Everything works with multiple treated periods
Multiple treated units:
Create a synthetic control for each treated unit and estimate the effects, then
▶
average (Abadie and L’Hour (2021))
Or a single synthetic control for the average of treated units (Robbins et al. (2017))
▶
Sun, Ben-Michael, and Feller (2025): construct a single synthetic control for
multiple outcome variables
Ben-Michael, Feller, and Rothstein (2021): Augmented SCM estimators, augsynth
▶ Adjust the estimator for mismatches in the pre-periods for double-robustness

SCM: When and why?
In which contexts should one use synthetic controls?
Abadie (2021):
No anticipation, no spillovers
▶
Donor units shouldn’t experience large idiosyncratic shocks in the post-periods
▶
Big effects and low-volatility outcomes (when few treated units)
▶
When a good synthetic control exists
▶
But which outcome models imply existence of good synthetic controls?
▶ And is SCM the best for those models?
▶ SCM is usually motivated by factor models (although see Arkhangelsky and
Hirshberg (2023))

Outline
1 Synthetic control methods
2 Factor models

Factor model
Factor (a.k.a. latent factor, interactive fixed-effect) model:
XR
′ ≡ E[ε
Y (0) = α +β +L +ε , L = S F S F , ] = 0
it i t it it it i t ir tr it
r=1
with an unknown small number R of unobserved time-varying factors F and unobserved
t
unit sensitivities (factor loadings) S
i
α = α ·1; β = 1·β ; unit-specific trend = γ ·t
i i t t i
E.g. F = (National minimum wage, Dummy of Democratic administration),
t
S = (Share of min.wage occupations in state i, Democratic majority)
i
Viewing S and F as unknown parameters, this is a nonlinear model
ir tr
Treatment D can be correlated with L (but not with ε )
it it it

Factor models vs. SCM
XR
Y (0) = α +β +L +ε , L = S F , E[ε ] = 0
it i t it it it ir tr it
r=1
Why synthetic controls if you have a factor model?
P P
≈ N0 ≈ N0
Y ωY for many pre-periods t if S ωS for each factor r (and
Nt i=1 i it rN i=1 i ri
for α)
i
\
ˆ ˆ ≡
Then can recover αˆ +β +L Y (0) with SCM... but there are other methods
i t NT NT

Strategy #1: Synthetic DiD (Arkhangelsky et al. (2021))
Consider a non-staggered case
DiD puts equal weight on all untreated units and all pre-periods
But control units similar to the treated ones in the pre-periods are more useful
Must have factor loadings similar to i = N (or to average of N +1,...,N)
▶ 0
Pre-periods similar to the post-period on untreated outcomes are more useful
▶ Must have factors similar to t = T (or to average of T +1,...,T)
0

Strategy #1: Synthetic DiD (Arkhangelsky et al. (2021))
Obtain weights v ,...,v and ω ,...ω that add up to one; then
1 T0 1 N0
!
XN0 XT0 XN0
d
ATT = Y − ωˆ Y − ˆv Y − ωˆ Y
treated,post i i,post t treated,t i it
i=1 t=1 i=1
▶ Estimate via TWFE regression weighted by ˆv ·ωˆ
t i
(with ˆv = ... =ˆv = 1 and ωˆ = ... = ωˆ = 1)
T0+1 T N0+1 N
▶ How to choose ˆv t and ωˆ i ?

Choosing ˆv and ωˆ
t i
P
Choose ˆv to make Y close to β + T0 v Y across untreated units
t i,post post t=1 t it
▶ β post captures period FEs
▶ P Horizontal regression of Y i,post on a constant and Y i1 ,...,Y iT0 with restrictions
T0 v = 1 and v ≥ 0
t=1 t t
P
Choose ωˆ to make Y close to α + N0 ωY across periods
i treated,t treated i=1 i it
▶ α treated captures unit FEs
▶ Vertical regression; because N 0 > T 0 , regularize (using ridge)
!
1
XT0 XN0 2 XN0
min Y −α − ωY +λ ω2
α treated ,{ωi } T 0 t=1 treated,t treated i=1 i it i=1 i
P
s.t. N0 ω = 1, ω ≥ 0 (See paper for choice of penalty λ)
i=1 i i

Strategy #2: Imputation with factor models
P
R
Recall Y (0) = α +β +L +ε , L = S F
it i t it it it r=1 ir tr
SCM and SDiD balance out latent factors without estimating them
\
Alternatively, can estimate L from untreated observations and use them for Y (0)
it it
Can estimate factors, loadings, and R using principle component analysis (Bai and
Ng (2002))
Another idea: estimate the L matrix directly
Key property: rank(L) = R is small
▶

Athey et al. (2021) matrix completion approach
Athey, Bayati, Doudchenko, Imbens, and Khosravi (2021): matrix completion
≡
L t = 1 ... t = T t = T +1 ... t = T +T T
it 0 0 0 1
i = 1
...
i = N
0
i = N +1 ? ? ?
0
... ? ? ?
≡
i = N +N N ? ? ?
0 1
Recover L from:
▶ observing Y for untreated observations = noisy version of α +β +L
it i t it
knowing that L has low rank
▶

Athey et al. (2021) matrix completion approach
Athey et al. (2021) solve:
X
−α −β −L )2 +λ∥L∥
min (Y
{αi },{βt },L it i t it ∗
it:Dit=0
∥L∥
is the “nuclear” norm of matrix L: small when L is close to some low-rank
∗
matrix
Computationally eﬀicient (unlike searching among low-rank matrices)
−αˆ −β ˆ −L ˆ
Then take average of Y among treated observations
it i t it
No results on inference

References I
Abadie, A. (2021): “Using Synthetic Controls: Feasibility, Data Requirements, and Methodological
Aspects,” Journal of Economic Literature, 59, 391–425.
Abadie, A., A. Diamond, and J. Hainmueller (2010): “Synthetic control methods for
comparative case studies: Estimating the effect of California’s Tobacco control program,” Journal of
the American Statistical Association, 105, 493–505, arXiv: 1011.1669v3 ISBN: 0162-1459.
——— (2015): “Comparative Politics and the Synthetic Control Method,” American Journal of
Political Science, 59, 495–510, iSBN: 1540-5907.
Abadie, A. and J. L’Hour (2021): “A Penalized Synthetic Control Estimator for Disaggregated
Data,” Journal of the American Statistical Association, 116, 1817–1834.
Arkhangelsky, D., S. Athey, D. A. Hirshberg, G. W. Imbens, and S. Wager (2021):
“Synthetic Difference-in-Differences,” American Economic Review, 111, 4088–4118.
Arkhangelsky, D. and D. Hirshberg (2023): “Large-Sample Properties of the Synthetic
Control Method under Selection on Unobservables,” ArXiv:2311.13575 [econ].

References II
Athey, S., M. Bayati, N. Doudchenko, G. W. Imbens, and K. Khosravi (2021): “Matrix
Completion Methods for Causal Panel Data Models,” Journal of the American Statistical
Association, 116, 1716–1730, arXiv: 1710.10251.
Bai, J. and S. Ng (2002): “Determining the Number of Factors in Approximate Factor Models,”
Econometrica, 70, 191–221.
Ben-Michael, E., A. Feller, and J. Rothstein (2021): “The Augmented Synthetic Control
Method,” Journal of the American Statistical Association, 116, 1789–1803.
Card, D. and A. Krueger (1994): “Minimum Wages and Employment: A Case Study of the
Fast-Food Industry in New Jersry and Pennsylvania,” The American Economic Review, 84, 772–793.
Chernozhukov, V., K. Wüthrich, and Y. Zhu (2021): “An Exact and Robust Conformal
Inference Method for Counterfactual and Synthetic Controls,” Journal of the American Statistical
Association, 116, 1849–1864.
Robbins, M. W., J. Saunders, and B. Kilmer (2017): “A Framework for Synthetic Control
Methods With High-Dimensional, Micro-Level Data: Evaluating a Neighborhood-Specific Crime
Intervention,” Journal of the American Statistical Association, 112, 109–126.

References III
Sun, L., E. Ben-Michael, and A. Feller (2025): “Using Multiple Outcomes to Improve the
Synthetic Control Method,” Review of Economics and Statistics.
