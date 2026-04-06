Part B: Covariate Adjustment. Selection on Observables
Summary of Main Ideas
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

Outline
1 The concept of control variables
Regression adjustment
2
3 Propensity score methods
4 Doubly-robust methods

What if treatment is not randomly assigned?
One basic approach for causal inference with observational data is to control for
observables
Unconfoundedness: Violation of unconfoundedness:

Illustration: Returns to College Degree
i X (urban) D (college) Y (earnings) Y Y
i i 0 1
1 1 1 51 ? 51
2 1 1 50 ? 50
3 1 1 49 ? 49
4 1 0 40 40 ?
5 0 1 15 ? 15
6 0 0 11 11 ?
7 0 0 9 9 ?
Treated minus control (not causal!) 21.25

Identification assumptions
Unconfoundedness = Ignorability = Conditional independence assumption (CIA) =
Selection on observables: (Y(0),Y(1)) ⊥⊥ D X
i i i i
Sometimes viewed as defining that X is a control variable
▶ i
Overlap: 0 < P(D = 1 X) < 1 on the support of X
i i i
P(D = 1 X ) is called the propensity score
▶ i i

Identification under CIA + overlap
≡ E[Y(1)−Y(0)
Conditional average treatment effect: CATE(x) X = x]
i i i
Let h (x) = E[Y | D = 1,X = x] and h (x) = E[Y | D = 0,X = x]
▶ 1 0
(x)−h
▶ CATE can be identified as CATE(x) = h 1 0 (x) (prove this!)
E[CATE(X)] E[h (X)−h
ATE = = (X)], with expectation taken across X (in
i 1 i 0 i i
both treatment and control groups)
And ATT = E[CATE(X) | D = 1], with expectation taken across X in the
i i i
treated group

Imputation representation
We also have
ATT = E[Y −h (X) D = 1]
i 0 i i
[
▶ For treated i, we impute Y (0) = h (X )and
i 0 i
And
E[(Y −h (X)−Y)(1−D)]
ATE = (X))D +(h
i 0 i i 1 i i
[
▶ For untreated i, also impute Y (1) = h (X )
i 1 i

Matching / Imputation
ˆ ˆ ˆ −Y ˆ
i X (urban) D (college) Y (earnings) Y Y Y
i i 0 1 1 0
1 1 1 51 40 51 11
2 1 1 50 40 50 10
3 1 1 49 40 49 9
51+50+49
4 1 0 40 40 10
3
Urban averages & CATE 40 50 10
5 0 1 15 11+9 15 5
2
6 0 0 11 11 15 4
7 0 0 9 9 15 6
Rural averages and CATE 10 15 5
Overall averages and ATE: 27.1 35 7.9

Regression adjustment
b
Regress Y on X in the subsample D = 1; take fitted values as h (X); repeat for D = 0
i i i 1 i i
ˆ ˆ ˆ ˆ
i X (urban) D (college) Y (earnings) Y Y Y −Y
i i 0 1 1 0
1 1 1 51 40 50 10
2 1 1 50 40 50 10
3 1 1 49 40 50 10
4 1 0 40 40 50 10
5 0 1 15 10 15 5
6 0 0 11 10 15 5
7 0 0 9 10 15 5
Overall averages and ATE: 27.1 35 7.9
Treatment group averages and ATT: 32.5 41.3 8.8

Pscore reweighting (for ATE)
i X (urban) D (college) Y (earnings) Y ˆ Y ˆ Y ˆ −Y ˆ
i i 0 1 1 0
1 1 1 51 0 51· 1 51· 1
3/4 3/4
50· 1 50· 1
2 1 1 50 0
3/4 3/4
49· 49·
3 1 1 49 0 1 1
3/4 3/4
4 1 0 40 40· 1 0 −40· 1
1/4 1/4
5 0 1 15 0 15· 1 15· 1
1/3 1/3
6 0 0 11 11· 1 0 −11· 1
2/3 2/3
9· 1 −9· 1
7 0 0 9 0
2/3 2/3
Overall averages and ATE: 27.1 35 7.9

Continuous covariates
With continuous or high-dimensional covariates, can’t do any of this
▶ Approximate matching (skipped)
Regression adjustment
▶
▶ Propensity score methods
▶ Doubly-robust methods; double machine learning
Note: Different methods are no longer equivalent
▶
Also, do simpler strategies, like regressing Y on D and X, recover anything useful?
i i i

Outline
1 The concept of control variables
Regression adjustment
2
3 Propensity score methods
4 Doubly-robust methods

Regression adjustment
Recall that, under CIA, we have for d = 0,1
E[Y(d) | X] = E[Y(d) | D = d,X] = E[Y | D = d,X] ≡ h (X)
d
If we estimate h (·) and h (·), we get
0 1
X( ) X( )
A d TE = 1 h ˆ (X)−h ˆ (X) , A d TT = 1 h ˆ (X)−h ˆ (X) D
1 i 0 i 1 i 0 i i
N N
1
i i
or via imputation:
X( )
A d TT = 1 Y −h ˆ (X) D
i 0 i i
N
1
X i n( ) ( ) o
A d TE = 1 Y −h ˆ (X) D + h ˆ (X)−Y (1−D)
i 0 i i 1 i i i
N
i

· ·
How to estimate h ( ),h ( )?
0 1
h (·) is the CEF of Y given X for D = d
d i i i
Can use nonparametric regression, e.g. local linear regression
For each x, estimate h (x) by an intercept from a regression of Y on (X −x),
▶ d i i
keeping observations in the neighborhood of x (and with D = d) only
i
If E[Y(d) | X] = γ′X is linear in X (e.g. X is saturated): Oaxaca-Blinder estimator
d
▶ Run linear regressions of Y on X within treated/control groups separately
▶ Or a single fully-interacted regression (for X i including an intercept)
′ ′ d βˆ+τˆ ′ X¯
Y i = γ 0 +γ X i +βD i +τ XD i i +error, i A TE =
1
▶ Or its convenient reformulation
- *
d
Y = γ +γ ′ X +βD +τ ′ X −X¯ D +error, A TE = βˆ
i 0 i i i i i
1
Note: interactions are helpful even if you are not interested in effect heterogeneity
▶

Uninteracted regression
What about regression of Y on D and X without interactions?
i i i
Suppose causal effects are homogeneous, Y = βD +Y(0)
i i i
And E[Y(0) X] = γ′X is linear,
Y = βD +γ ′ X +ε, E[ε D,X] = 0
i i i i i i i
γ′X +γ′X
where h (X) = and h (X) = β
0 1
⇒
Regression that linearly controls for X identifies the causal effect
i
But Mostly Harmless Econometrics advocates for uninteracted regressions even
when the effects are heterogeneous. Why?

Uninteracted regression with heterogeneous effects
≡ E[D
Assume the propensity score p(X) X] = P(D = 1 X) is linear in X
i i i i i i
=⇒
▶ Angrist (1998) focused on saturated controls X trivially satisfied
i
Then
E[CATE(X)·ω(X)]
i i
β = , ω(X) = Var[D X] = p(X)(1−p(X))
OLS E[ω(X)] i i i i i
i
▶ Groups with p(X ) ≈ 1/2 get the most weight (relative to their size)
i
≈ ≈
▶ Groups where overlap is limited (p(X ) 0 or p(X ) 1) get little weight
i i
β = ATE if CATE(X ) is constant, ω(X ) is constant, or they are uncorrelated
▶ OLS i i
with each other
Note: linearity of E[Y(0) X] is not needed
i i

Variance weighting: Proof
By linearity of the pscore, partialling out X from D yields residuals
i i
D ˜ = D −E[D | X]
i i i i
h i h i h i h i
By Frisch-Waugh-Lovell, β = E D ˜ Y /E D ˜ D (where E D ˜ D = Var D ˜ )
OLS i i i i i i i
h i
Using CIA and E D ˜ | X = 0,
i i
h i h h ii
E D ˜ Y = E E D ˜ (Y(0)+(Y(1)−Y(0))D) | X
i i i i i i i i
h h ii
= E CATE(X)·E D ˜ D | X = E[CATE(X)·Var[D | X]]
i i i i i i i
h i
Analogously, E D ˜ D = E[Var[D | X]]
i i i i

Outline
1 The concept of control variables
Regression adjustment
2
3 Propensity score methods
4 Doubly-robust methods

Propensity score theorems (Rosenbaum and Rubin, 1983)
Consider binary D. Recall p(X) ≡ P(D = 1 X)
⊥⊥
Proposition 1: D X p(X)
▶ i.e. propensity score balances X between treated and control groups
▶ Proof: P(D = 1 X,p(X)) = P(D = 1 X) = p(X)
⊥⊥ =⇒ ⊥⊥
Proposition 2: D (Y ,Y ) X D (Y ,Y ) p(X)
0 1 0 1
▶ i.e., under CIA, controlling for scalar p(X) is enough
⋆ A stronger version of the OVB idea
Proof: P(D = 1 | p(X),Y ,Y ) = E[E[D | p(X),X,Y ,Y ] | p(X),Y ,Y ] = p(X),
▶ 0 1 0 1 0 1
doesn’t depend on (Y ,Y )
0 1

P-score methods: Steps
1. Obtain/estimate p(X)
Known in complex RCTs
▶
▶ Parametric estimation, e.g. logit of D on X
▶ Non-parametric regression of D on X
2. Verify balance
▶ Within bins of pˆ(X) compare X among treated and controls
If balance fails (with suﬀiciently many bins), make the p-score model richer
▶
3. Assess overlap
▶ Compare p-score distributions in treated & control groups
4. Adjust for pscore differences between treated and control groups
▶ Regression, matching, blocking, reweighting

P-score adjustment methods: Regression
With constant effects, enough to control linearly
Y = βD +γp(X)+error
i i i
▶ Exercise: Why?
Exercise: if p(X) is estimated from a linear probability model, both ways are
▶
numerically the same as linearly controlling for X
With heterogeneous effects, this yields the variance-weighted average of effects
(Exercise: Why?)

P-score adjustment methods: Blocking/Matching
Blocking (stratifying) = exact matching on binned pscore
▶ Split data into bins of p(X )
i
▶ Estimate difference-in-means within bins
Average across bins weighting by # obs. (ATE) or # treated obs. (ATT)
▶
Approximate matching: For each treated obs., compare the outcome with the
untreated one with the closest p(X); and the other way round
i
▶ Discard observations with the pscore outside the range for the other group, such
that the nearest match is very far

P-score adjustment methods: Reweighting (IPW)
In the bin with p(X) = π we have fraction π of observed Y(1) (for treated) and
i i
fraction 1−π of comparable but missing Y(1) (for controls)
i
Horvitz-Thompson (1952) “inverse probability weighting” (IPW): reweighting
by 1/π makes the sample of Y(1) representative
i
<= >= <= >= <= <= >=>=
YD Y D Y D
E = E 1 = E E 1 | X = E[Y ]
1
p(X) p(X) p(X)
h i
Similarly for Y : E Y(1−D) = E[Y ]. Thus, under CIA+overlap:
0 1−p(X) 0
<=< > >= <= >=
D 1−D D−p(X)
ATE = E − Y = E ·Y
p(X) 1−p(X) p(X)(1−p(X))
Exercise: derive the reweighting expression for ATT

P-score adjustment methods: Reweighting (2)
( )
P
d Di − 1−Di
Plug-in (Horvitz-Thompson) estimator: A TE = 1 Y
HT N i pˆ(Xi) 1−pˆ(Xi) i
(1 1 (1 1
Issue: weights on treated ) and control ) do not exactly sum to 1
Npˆ(Xi) N1−pˆ(Xi)
▶ So adding a constant to Y changes the estimator
i
Normalizing the weights improves performance: the Hajek estimator
P P
DiYi (1−Di)Yi
d Pi pˆ(Xi) − Pi 1−pˆ(Xi)
A TE =
Hajek Di 1−Di
i pˆ(Xi) i 1−pˆ(Xi)

Outline
1 The concept of control variables
Regression adjustment
2
3 Propensity score methods
4 Doubly-robust methods

Idea of double robustness
Regression adjustment methods require estimates of h (X),h (X)
0 1
▶ No need for p(X) = E[D X]
Propensity score methods are the opposite
Doubly robust methods take estimates of both h (X) and p(X) as inputs
d
▶ But validity requires only one of those estimates to be correct

Automatic double robustness
Some methods already possess some double robustness
Under constant effects, regression Y = βD +γ′X +error is causal if:
i i i i
▶ h 0 (X) is linear in X or p(X) is linear in X
Kline (2011): the Oaxaca-Blinder estimator for ATT is consistent if:
p(X)
▶ h (X),h (X) are linear in X or is linear in X
0 1 1−p(X)

Augmented IPW (AIPW)
But double-robustness can be achieved for arbitrary estimators of h (·) and p(·)
d
Augmented IPW (AIPW) idea:
<= >= <= >=
D D
i i
E[Y ] = E[h (X)] = E Y = E h (X)+ (Y −h (X))
1i 1 i i 1 i i 1 i
p(X) p(X)
<= ( i ) >= i
D
E ˜ i −h ˜ p(·) p˜(·) (·) ˜ (·)
= h (X)+ Y (X) if = or h = h
1 i p˜(X) i 1 i 1 1
i
▶ If the model of h (·) is correct, IPW adjustment doesn’t change the estimand
1
▶ If the model of p(·) is correct, the adjustment fixes mistakes in h (·)
1

Augmented IPW (2)
Combining with a similar expression for Y ,
0i
<= >=
D 1−D
E i −h (X))−h (X)− i −h
ATE = h (X)+ (Y (Y (X))
1 i p(X) i 1 i 0 i 1−p(X) i 0 i
i i
if (h (·),h (·)) or p(·) are correctly specified
0 1
▶ The sample analog based on preliminary estimates of h ,h ,p yields the estimator
0 1

Double robustness and Neyman orthogonality
The usefulness of double robustness is not obvious
But a closely related concept is very helpful when X are high-dimensional:
i
(·),h (·),p(·),
▶ Estimation of nuisance functions h 0 1 e.g. via machine learning
methods, is inevitably imprecise
▶ So we want to use moments that have low sensitivity to such mistakes around the
true values — Neyman-orthogonal moments
⋆ Optional exercise: verify that the “derivative” of the IAPW moment w.r.t. nuisance
functions is zero at the true values
Covariate adjustment by Double Machine Learning (Chernozhukov et al., 2018)
▶
uses this idea

References I
Angrist, J. (1998): “Estimating the labor market impact of voluntary military service using social
security data on military applicants,” Econometrica, 66, 249–288.
Chernozhukov, V., D. Chetverikov, M. Demirer, E. Duflo, C. Hansen, W. Newey,
and J. Robins (2018): “Double/debiased machine learning for treatment and structural
parameters,” Econometrics Journal, 21, C1–C68.
Horvitz, D. G. and D. J. Thompson (1952): “A generalization of sampling without replacement
from a finite universe,” Journal of the American statistical Association, 47, 663–685.
Kline, P. (2011): “Oaxaca-Blinder as a reweighting estimator,” American Economic Review, 101,
532–537.
Rosenbaum, P. R. and D. B. Rubin (1983): “The Central Role of the Propensity Score in
Observational Studies for Causal Effects,” Biometrika, 70, 41–55.
