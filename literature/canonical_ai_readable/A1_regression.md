Part A: Regression and causality
A1: Key facts about regression. Statistical inference
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

Outline
Course intro
1
Some econometric vocabulary
2
3 What is regression and why do we use it?
4 Why linear regression?
5 Linear regression mechanics
6 Statistical inference

Acknowledgments
These lecture slides draw on the materials by Michael Anderson, Peter Hull, Paul
Goldsmith-Pinkham, and Michal Kolesar
All errors are mine — please let me know if you spot them!

What is this course about (1)
Goal: help researchers in economics and related fields do rigorous empirical work
▶ Requires understanding the underlying econometrics and how it links to economic
theory and applied questions
Attention to intuition, not regularity conditions
▶
But we will go much beyond a black-box toolkit, study key proofs
▶
Bonus: students interested in methodological work may get some inspiration: lots
of open problems!

What is this course about (2)
Focus on causal inference / program evaluation / treatment effects
What is shared by [the causal] literature is [...] an explicit emphasis on credibly
estimating causal effects, a recognition of the heterogeneity in these effects, clarity in the
identifying assumptions, and a concern about endogeneity of choices and the role study
design plays. (Imbens, 2010)

What is this course about (3)
Focus on most common research designs / identification strategies
The econometrics literature has developed a small number of canonical settings where
researchers view the specific causal models and associated statistical methods as well
established and understood. [They are] referred to as identification strategies. [These]
include unconfoundedness, IV, DiD, RDD, and synthetic control methods and are
familiar to most empirical researchers in economics. The [associated] methods associated
are commonly used in empirical work and are constantly being refined, and new
identification strategies are occasionally added to the canon. Empirical strategies not
currently in this canon, rightly or wrongly, are viewed with much more suspicion until
they reach the critical momentum to be added. (Imbens, 2020)

You should be able to
Pick the empirical strategy that best suits your application
Understand its assumptions/limitations
Identify problems in the papers you read

Course outline (1)
A. Recap of regression and causality
▶ Key facts about regression; statistical inference; potential outcomes and RCTs
B. Unconfoundedness (a.k.a. Selection on observables)
C. Instrumental variables (IVs)
Linear IV; IV with treatment effect heterogeneity; Examiner designs (“judge IV”)
▶
D. Panel data methods
Linear panel data methods; Dynamic panels
▶
▶ Diff-in-diffs and event studies; synthetic controls and factor models

Course outline (2)
E. Regression discontinuity (RD) designs
▶ Sharp and fuzzy RD designs and various extensions
F. Spillovers and equilibrium effects
Peer effects
▶
▶ Formula instruments and recentering; Shift-share IV designs
G. Miscellaneous topics: some of...
▶ Uncovering causal mechanisms
Nonlinear methods: Poisson regression, multinomial choice, quantile regression
▶
▶ Machine learning and causality
▶ Topics of your interest (email me in advance!)

The course in brief

Readings
See link in syllabus for up-to-date readings for each topic. Useful textbooks:
MHE Angrist and Pischke (2009) “Mostly Harmless Econometrics”
JW Wooldridge (2002/2010) “Econometric Analysis of Cross Section and Panel Data”
IW Imbens and Wooldridge (2009) “New developments in econometrics: Lecture
notes”
CT Cameron and Trivedi (2005) “Microeconometrics: Methods and Applications”
SW Wager (2024) “Causal Inference: A Statistical Learning Approach”
PD Ding (2024) “Linear Models and Extensions”
SC Cunningham (2021) “Causal Inference: The Mixtape”

Check your background: True/False
Let X,Y be some random variables
1. Cov[Y,X] = E[Y*(X-E[X])]
2. If Y is continuous and X is discrete, E[Y j X] is a continuous random variable
3. If X 2 f0,1g is binary, E[E[Y j X = 1] j X = 0] is a well-defined constant

Outline
Course intro
1
Some econometric vocabulary
2
3 What is regression and why do we use it?
4 Why linear regression?
5 Linear regression mechanics
6 Statistical inference

Econometric vocabulary: Model
An economic or statistical model:
▶ Defines the relevant observed and unobserved variables
▶ Imposes restrictions on their joint distribution (e.g., relationships between vars),
sometimes via parameters
Example 1: Y = β +β X+ε
0 1
E[ε j
▶ Not useful without restrictions. Useful when adding X] = 0
X2 E[ε j
Example 2: Y = β +β X+β +ε, X] = 0
0 1 2
Example 3 (RCT w/ heterogeneous effects): Y = τX +ε, X ?? (τ,ε)
i i i i i i i
Example 4 (demand and supply):
Q = -β P+ε , Q = β P +ε , Cov[ε ,ε ] = 0
d d s s d s

Econometric vocabulary: Estimands and Identification
Estimand is a non-stochastic population object within a model, property of the
joint distribution of observed and unobserved variables and parameters
▶ Example 1: in the model Y = β +β X+ε, besides individual parameters,
0 1
we may be interested in β +2β : prediction of Y at X = 2
0 1
Example 2: in the heterogeneous effects model Y = τ X +ε , X ?? (τ ,ε ),
▶ i i i i i i i
we may be interested in E[τ]
i
A model parameter or estimand is (point-)identified if it is uniquely determined by
the joint distribution of observed variables
▶ (Partially identified if a strict subset of values is consistent with data)
▶ Example 1 (cont.): β is not identified without extra restrictions
1
E[εjX]=0,
⋆ But under β 1 =Cov[Y,X]/Var[X]
Example 2 (cont.): E[τ ] = Cov[Y,X]/Var[X] (prove this!)
▶ i

Econometric vocabulary: Estimators
Estimator is a function of observed variables in the sample () a random variable)
( ) ( )
- * P −1 P
βˆ= ′ −1 ′ N ′ N
▶ OLS estimator: X X X Y ) 1 X X 1 X Y
N i=1 i i N i=1 i i
ˆ β′X
β corresponds to a linear specification Y = +error
i i
▶ Just notational convention for reg Y X, not [necessarily] a model
Assuming a random sample, as N ! 1, most reasonable estimators converge to
some population object
▶ This is the estimand corresponding to the estimator
−1E[XY] −1E[XY]
E.g. OLS estimand: β = E[XX′] ) E[XX′]
OLS i i i i
βˆ!p
I.e., β in a random sample under weak regularity conditions
▶ OLS
′ E[ε j
▶ This does not require imposing a model Y = β X+ε or assuming X] = 0
OLS
▶ But OLS estimand can be interpreted under any given model...

Examples: OLS estimand in different models
β′X+ε,
1. Model Y = E[ε j X] = 0 =) β = β
OLS
2. Heterogeneous effects: Regressing Y on X and a constant yields β = E[τ]
i i OLS i
3. Demand and supply: Regressing Q on P (and a constant) yields (prove this!)
i i
Var[ε ] Var[ε ]
s *(-β d *β
β = )+
OLS d s
Var[ε ]+Var[ε ] Var[ε ]+Var[ε ]
d s d s
We will analyze the estimands of simple estimators (e.g. OLS, IV) under different
assumptions, usually in the potential outcomes model
Search for other estimators when simple ones do not yield what we want

Outline
Course intro
1
Some econometric vocabulary
2
3 What is regression and why do we use it?
4 Why linear regression?
5 Linear regression mechanics
6 Statistical inference

Regression and its uses
)
Regression of Y on X conditional expectation function (CEF):
h(*): 7! ) E[Y j
x h(x) X = x]
i i
E[Y j
X] = h(X) is a random variable because a function of X
i i i i
Uses of regression:
Descriptive: how Y on average covaries with X — by definition
Prediction: if we know X, our best guess for Y is h(X) — prove next
i i i
Causal inference: what happens to Y if we manipulate X — sometimes
i i

Regression as optimal prediction
What is the best guess depends on the loss function
Proposition: CEF is the best predictor with quadratic loss:
[ ]
h(*) = argminE (Y -g(X))2
i i
g(·)
-E[Y j
Lemma: the CEF residual Y X] is mean-zero and uncorrelated with any
i i i
g(X).
i
▶ Proof by the law of iterated expectations (LIE)
E[Y -E[Y j E[E[Y -E[Y j j
▶ i i X i ]] = i i X i ] X i ]] = 0
E[(Y -h(X E[E[(Y -h(X j
▶ i i ))g(X i )] = i i ))g(X i ) X i ]] =
E[E[Y -h(X) j X]*g(X)] = 0
i i i i

Proposition proof
Proposition: CEF is the best predictor with quadratic loss:
[ ]
h(*) = argminE (Y -g(X))2
i i
g(·)
Proof:
h i h i
E (Y -g(X))2 = E f(Y -h(X))+(h(X)-g(X))g2
i i i i i i
h i h i
= E (Y -h(X))2 +2E[(Y -h(X))(h(X)-g(X))]+E (h(X)-g(X))2
i i i i i i i i
h i h i h i
E -h(X))2 +E (h(X)-g(X))2 >= E -h(X))2
= (Y (Y
i i i i i i

Regression as optimal prediction: Exercise
jY -g(X)j,
Show that conditional median is the best predictor with loss i.e.
i i
j argminE[jY -g(X)j]
median(Y X) =
i i i i
g(·)
▶ Hint: solve it first assuming X i takes only one value
2 q-1
What about the “check” loss function (slope q (0,1) on the right, on the
left)?

Outline
Course intro
1
Some econometric vocabulary
2
3 What is regression and why do we use it?
4 Why linear regression?
5 Linear regression mechanics
6 Statistical inference

Definition
In the population, [ ]
argminE (Y-X ′ b)2
β =
OLS
b
Interpretation: Xβ ′ is the best linear predictor of Y with quadratic loss
▶ OLS
FOC: E[X(Y-X′β )] = 0
OLS
▶ Interpretation: residuals are mean-zero (when X includes an intercept) and
uncorrelated with X (a property of OLS, not an assumption)
Sample analog also holds
▶
E[XX′] −1E[XY]
Solution: β =
OLS

Five reasons for linear regression
How is linear regression (OLS) related to regression (CEF)? Why do we often prefer
OLS?
1. Curse of dimensionality: E[Y j X] is hard to estimate when X is high-dimensional
2. OLS and CEF solve similar problems: X′β is the best linear predictor of Y
OLS
3. OLS is also the best linear approximation to the CEF:
h i
argminE (E[Y j X]-X ′ b)2
β =
OLS
b
′
▶ Proof: by FOC, E[X(E[Y j X]-X b)] = 0 =)
E[XX ′ −1E[XE[Y j E[XX ′ −1E[XY]
b = ] X]] = ] = β
OLS

Five reasons for linear regression (cont.)
E[Y j
1. Curse of dimensionality: X] is hard to estimate when X is high-dimensional
X′β
2. OLS and CEF solve similar problems: is the best linear predictor of Y
OLS
3. OLS is also the best linear approximation to the CEF
4. With scalar X (in addition to an intercept), β is a convexly-weighted average of
OLS
dE[Y j X = x]/dx (or its discrete analog)

What does #4 mean?
Consider discrete X taking values x < *** < x
0 K
We have scalar (X,Y), with no assumptions imposed on them (no linear model!)
By definition,
Y = h(X)+ε, E[ε j X] = 0
We want to show that population regression of Y on X yields
XK
h(x )-h(x )
k k−1
β = ω
OLS k x -x
k k−1
k=1
for some ω ,...,ω >= 0 that do not depend on h(*), with ω +***+ω = 1
1 K 1 K
Gives interpretation of OLS as an average slope even when CEF is nonlinear

Proof of #4: Discrete X
P
K )-h(x >=
Rewrite h(X) = h(x )+ (h(x ))1[X x ]
0 k=1 k k−1 k
P
Thus Cov[Y,X] = Cov[h(X),X] = K (h(x )-h(x ))Cov[1[X >= x ],X] and
k k−1 k
k=1
XK
Cov[Y,X] h(x )-h(x ) (x -x )Cov[1[X >= x ],X]
k k−1 k k−1 k
β = = ω , ω =
OLS Var[X] k x -x k Var[X]
k k−1
k=1
Here ω >= 0 because 1[X >= x ] is monotone. Specifically (prove it!):
k k
>= (E[X j >= ]-E[X j >=
Cov[1[X x ],X] = X x X < x ])P(X x )P(X < x )
k k k k k
P P
K K
And ω = 1 because X = x + (x -x )1[X >= x ]
k=1 k 0 k=1 k k−1 k

Proof of #4: Continuous X
Similarly for continuous scalar X:
Z
∞ >=
Cov[1[X x],X]
β = ω(x)h(x)dx, ′ ω(x) =
OLS
Var[X]
−∞
R
∞
with ω(x) >= 0 and ω(x) = 1
−∞
Exercise: if X is Gaussian, β = E[h′(X)] (prove it!)
OLS
E[Z j >= φ(a) ~ N(0,1)
▶ Hint: use Z a] = for Z
1−Φ(a)

Five reasons for linear regression (cont.)
E[Y j
1. Curse of dimensionality: X] is hard to estimate when X is high-dimensional
X′β
2. OLS and CEF solve similar problems: is the best linear predictor of Y
OLS
3. OLS is also the best linear approximation to the CEF
4. With scalar X, β is a convexly-weighted average of dE[Y j X = x]/dx
OLS
5. If E[Y j X] happens to be linear, E[Y j X] = X′β
OLS
Linearity is guaranteed when (X,Y) are jointly normally distributed
▶
▶ or when X is “saturated”: dummies for all values of a discrete variable. E.g. for
binary D and X = (1,D),
E[Y j E[Y j E[Y j 0]*1+(E[Y j 1]-E[Y j 0])*D
X] = D] = D = D = D =
{z } {z }
intercept slope

Outline
Course intro
1
Some econometric vocabulary
2
3 What is regression and why do we use it?
4 Why linear regression?
5 Linear regression mechanics
6 Statistical inference

(Linear) regression mechanics: Key results
1. What happens under linear transformations of RHS variables
2. Regressing Y = X on X ,...,X produces coeﬀicients (0,...,0,1,0,...0)
k 1 K
3. β ˆ is a linear estimator
4. What happens under linear transformations of the LHS variable
5. Frisch-Waugh-Lovell (FWL) theorem
6. Omitted variable bias (OVB) formula

#1: Linear transformations of RHS variables
Consider OLS estimation of two specifications:
Y = β X +β X +error;
1 1 2 2
Y = γ X +γ (X +X )+error.
1 1 2 1 2
Then γ +γ = β , γ = β ; fitted values/residuals are the same (prove it!)
1 2 1 2 2
Application: for binary X, it doesn’t matter whether to run
▶
Y = β +β X+error vs. Y = γ (1-X)+γ X+error
0 1 0 1

#2: Regressing Y = X on X ,...,X
k 1 K
Regressing Y = X on X ,...,X produces coeﬀicients (0,...,0,1,0,...0)
k 1 K
▶ Prove it using one of key OLS properties (min squared loss among linear predictors;
residuals uncorrelated with X; β formula)
OLS

#3: OLS is a linear estimator
ˆ
Given regressors X, each β is linear in the outcomes, i.e.
k
X
ˆ
β = ω Y
k ki i
i
for some weights ω ) ω (X) that do not depend on Y (prove it!)
ki ki
Moreover, weights ω add up to zero (for X 6= intercept)
ki k
▶ I.e., adding 1 to the outcome doesn’t change βˆ k
▶ βˆ k is a contrast between outcomes of different groups of observations
P
Weights are orthogonal to non-X regressors ( ω X = 0, ℓ 6= k)
k i ki ℓi
▶ I.e., adding X ℓ to the outcome doesn’t change βˆ k
P
ˆ
And ω X = 1: adding X to the outcome adds 1 to β
i ki ki k k

#3: Proof
ˆ ′ −1 ′
β = ΩY for an K[N matrix Ω = (X X) X
P
βˆ )
▶ Thus k = Ω k Y ω ki Y i for Ω k being kth row of Ω
i
The weights don’t depend on Y so let’s consider Y ) 1. Regression yields β ˆ = 0
i k
for X 6= intercept
k
P P
βˆ
▶ But 0 = = ω Y i = ω
k i ki i ki
Now let’s consider Y ) X for ℓ 6= k. Again, we get β ˆ = 0
i iℓ k
P P
▶ So 0 = ω Y = ω X : weights for X are orthogonal to other regressions
i ki i i ki ℓi k
ˆ
Finally consider Y = X , which implies β = 1
i ik k
P P
So 1 = ω Y = ω X
▶ ki i ki ki
i i

A note on weights
We now have two weight representations of OLS:
Average dE[Y j X = x]/dx with non-negative weights adding up to 1
▶
▶ E[ω(X)*Y] for E[ω(X)] = 0 (some positive and some negative weights)
Both of these reflect that OLS makes outcome contrasts and aggregates them
Later we will have more weighting results linking OLS to averages of causal effects

#4: Linear transformations of the LHS variable
+***+Y
If Y = Y , regressing each Y on X and adding up the coeﬀicient
i 1i Pi pi i
estimates is numerically the same as regressing Y on X (prove it!)
i i
This yields a popular decomposition of regression coeﬀicients
▶ E.g. regress total deaths on PM2.5 pollution, then decompose into different causes
(cf. Deryugina et al. (2019, Table A2))

#5: Partialling out: Frisch-Waugh-Lovell (FWL) theorem
Theorem: Let X ˜ be the residual from regressing X on all other regressors X ; and Y ˜
k k −k
be the residual from regressing Y on X . Then k’th element of β can be obtained in
−k OLS
two ways: h i h i
˜ ˜ ˜
Cov X ,Y Cov X ,Y
h k i h k i
β = =
k
Var X ˜ Var X ˜
k k
Importance: characterizes the estimand of each coef in multiple regression without
matrix algebra
h i
Y-β′ β′ ˜
Proof idea: Define ε = X. Plug in Y = X+ε to Cov X ,Y or
h i OLSh i OLS k
Cov X ˜ ,Y ˜ ; verify you get β Var X ˜
k k k

#5: Proof
We have by definition: Y = β′ X+ε with E[Xε] = 0
OLSh i
▶ And X k = γ ′ X−k +X˜ k with E X−k X˜ k = 0
h i
▶ And Y = δ ′ X−k +Y˜ with E X−k Y˜ = 0
Then
h i h i
˜ ˜ ′
Cov X ,Y = Cov X ,β X +β X +ε
k k −k −k k k
h i h i
= Cov X ˜ ,β ′ X +β Cov X ˜ ,γ ′ X +X ˜ +Cov[X -γ ′ X ,ε]
k −k −k k k −k k k −k
h i
˜
= 0+β Var X +0
k k
Moreover, h i h i h i
Cov X ˜ ,Y ˜ = Cov X ˜ ,Y-δ ′ X = Cov X ˜ ,Y
k k −k k

Implications of FWL
1. If Cov[X ,X ] = 0 (e.g. X = randomized treatment, X = predetermined
1 2 1 2
covariate), the “long” and “short” specifications have the same estimand β = δ :
1 1
′ ′ ′
Y = β +β X +β X +error; Y = δ +δ X +error
0 1 1 2 2 0 1 1
2. Explicit characterization of the weights ω in any regression:
ki
P
˜ X ˜
X Y X
β ˆ = Pi ki i = ω Y for ω = P ki .
k X ˜2 ki i ki N X ˜2
i ki i j=1 kj
▶ Exercise: which observations are weighted positively by a regression on scalar X i
and an intercept?

#6: Omitted variable “bias”
OVB formula is a mechanical relationship between β from a “long” specification and δ
1 1
from a short specification:
Y = β +β X +β X +error, Y = δ +δ X +error
0 1 1 2 2 0 1 1
Claim: δ = β +β ρ, where ρ = Cov[X ,X ]/Var[X ] is the auxiliary regression slope
1 1 2 1 2 1
of X (“omitted”) on X (“included”)
2 1
Proof: δ = Cov[X1,Y] = Cov[X1,β0+β1X1+β2X2+ε] = β +β Cov[X1,X2].
1 Var[X1] Var[X1] 1 2 Var[X1]
Generalizes to multiple omitted variables (with OVB = β′ρ)
2
▶ Gelbach (2016) uses it to measure contributions of each extra group of variables to
βˆ -δˆ , i.e. how much the coef changes from including them
1 1
Applies with extra controls X included in long, short, and auxiliary regression
3

Outline
Course intro
1
Some econometric vocabulary
2
3 What is regression and why do we use it?
4 Why linear regression?
5 Linear regression mechanics
6 Statistical inference

As seen on the BART...
(FromKarthikTadepalli’sTwitter)

Asymptotic distribution of the OLS estimator
! ! ! !
X −1 X X −1 X
1 1 1 1
ˆ ′ ′
β = XX XY = β + XX Xε
N i i N i i OLS N i i N i i
i i i i
where by definition ε = Y -X′β with E[Xε] = 0. Thus,
i i i OLS i i
! !
p ( ) X −1 X
1 1
N β ˆ-β = XX ′ p Xε
OLS N i i N i i
i i
P
By LLN, 1 XX′ !p E[XX′] (assumed non-singular)
N i i i P
In a random sample, by CLT (using E[Xε] = 0), √1 Xε !D N (0,Var[Xε])
N i i i
By the continuous mapping theorem,
p ( )
N β ˆ-β !D N (0,V), V = E[XX ′ ] −1Var[Xε]E[XX ′ ] −1
OLS

Heteroskedasticity-robust standard errors
We estimate V by its sample analog (“sandwich formula”) :
! ! !
X −1 X X −1
N 1 1 1
V ˆ = XX ′ * XX ′ εˆ2 * XX ′
N-dim(X) N i i N i i i N i i
i i i
where N = degree-of-freedom correction for small-sample downward bias
N−dim(X)
Heteroskedasticity-robust (Eicker-Huber-White, “robust”) standard error is
( ) q
ˆ ˆ
SE β = V /N
k kk
Never use homoskedastic standard errors in practice!
Note: this only works when dim(X) << N
▶ We’ll discuss this issue for panel regressions with fixed effects

FWL for standard errors
Theorem: robust standard errors for a subset of coeﬀicients β ˆ from specification
1
Y = β ′ X +β ′ X +error
1 2
are numerically the same as from the FWL version (residualized on X ):
2
˜ ′˜
Y = β X +error.
1 1
▶ Note: LHS has to be residualized, too
▶ Same holds for homoskedastic standard errors

Beyond random samples
We assumed (X,ε,Y) are independent and identically distributed (iid) across
i i i
i = 1,...,N — not always the case
E.g. you sampled villages, then surveyed all adults in selected villages
=)
(“clustered sampling”) ε likely correlated within village
i
Or you sampled people but randomly assigned treatment by state
(“clustered assignment”) =) X is perfectly correlated within state
i
Or dataset consists of all counties in a country
=) ε likely correlated in nearby counties
i

Statistical inference beyond random samples
( ) ( )
p - P * P
Recall N β ˆ-β = 1 XX′ −1 √1 Xε
OLS N i i i N i i i
P [ P ]
LLN 1 XX′ !p E 1 XX′ applies much beyond random samples
N i i i N i i i
But CLT for “sandwich meat” relies on Cov[Xε,Xε] = 0 for i 6= j:
i i j j
" #
X X X X
1 1 1 1
Var p Xε = Var[Xε]+ Cov[Xε,Xε] = Var[Xε]
i i i i i i j j i i
N N N N
i i i̸=j i
▶ Let’s consider three relaxations: clustering, multi-way clustering, and spatial
clustering

Cluster-robust inference
Suppose units belong to clusters g(i) 2 f1,...,Gg , and we believe
6=
Cov[Xε,Xε] = 0 if g(i) g(j)
i i j j
While arbitrary correlations are allowed within clusters
▶
Then we can use cluster-robust (“clustered”) inference (cf. MacKinnon et al.
(2023))
▶ Two equivalent derivations...

Derivation #1
Rewrite the estimator as
! ! !! !!
X −1 X XG X −1 XG X
β
ˆ-β
= XX
′
Xε = XX
′
Xε
OLS i i i i i i i i
i i g=1 i∈g g=1 i∈g
P
Denoting R = Xε, apply CLT at the cluster level:
g i∈g i i
XG
p 1 R !D N (0,V), V ) Var[R ]
g g
G
g=1
Plug in sample analogs, provided G is large (not enough to have large N!):
! ! !! !
X −1 X X X ′ X −1
1 1 1
V ˆ = XX ′ * Xεˆ Xεˆ * XX ′
G i i G i i i i G i i
i g i∈g i∈g i
q
ˆ ˆ
and set SE(β ) = V /G
k kk

Derivation #2
Sandwich meat satisfies
" #
X X X
Var Xε = Cov[Xε,Xε] = Cov[Xε,Xε]
i i i i j j i i j j
i i,j i,j: g(i)=g(j)
which can be estimated by
! !
X X X X ′
′
XεˆXεˆ = Xεˆ Xεˆ
i i j j i i j j
i,j: g(i)=g(j) g i∈g j∈g

More on clustering
G * N−1
DoF correction is more of an art. Stata uses
G−1 N−dim(X)
Having many clusters is important. In the extreme of G = 1,
! !
′
X X X
XεˆXεˆ ′ = Xεˆ Xεˆ = 0
i i j i i j j
j
i,j i j
P
(and so SE = 0) which obviously does not approximate Var[ Xε] well
i i i
P
And √1 X ε may not even converge if all observations are strongly correlated
▶ i i
N i
With few clusters, see guide by MacKinnon et al. (2023); with few treated clusters,
see Alvarez et al. (2025)

At what level to cluster?
With individual-level data, when should you cluster by village? state? not at all?
[ ]
XεεX′
General principle: if you believe E = 0 for g(i) 6= g(j), it’s enough to
i i j j
cluster by g
If treatment assignment is independent across g, enough to cluster by g
h i
E X˜ X˜ j 6= X˜
▶ If i j ε = 0 for g(i) g(j) where are residuals on the intercept and (at
most a small number of) included covariates,
h i h h ii
εεX˜′ X˜′
E X˜ = E E X˜ j ε,ε = 0, for g(i) 6= g(j)
i i j j i j i j
even if ε have correlations across clusters
E[εε j 6=
If X] = 0 for g(i) g(j), enough to cluster by g even if X is correlated
i j i
across clusters

At what level to cluster? (2)
If you are not sure, picking larger (“more conservative”) clusters relaxes the
clustering assumption
▶ Note: overclustering does not necessarily increase SE
▶ E.g. if clustering by county is correct, clustering by state will give very similar SE:
both approximate the true variance
But avoid too large/few clusters which makes SE downward biased

Exercises
1. In a sample of twin siblings, you do a pair-randomization experiment, treating
exactly one of each twins
▶ Do you have to cluster SE in an individual-level regression of the outcome on the
treatment?
Is it worth clustering by city in which they live if unobserved city factors can affect
▶
all residents?
2. To trace the demand curve for strawberries, you randomize prices across stores into
50 distinct values: $1.10, 1.20, ..., 6.00 per pound
▶ Y i = quantity sold in a week, X i = 50 price dummies
▶ Should you cluster SE by the price level?

Regressions with pair fixed effects: It’s complicated
(De Chaisemartin and Ramirez-Cuellar, 2024, Fig. 1B)
PCVE = Randomization pair-clustered; UCVE = Randomization unit-clustered

Multi-way clustering
Assume each unit belongs to group g(i) 2 f1,...,Gg and also to non-nested group
h(i) 2 f1,...,Hg
▶ E.g. workers i belong to state g(i) and industry h(i)
▶ Or bilateral trade flows: i = (g,h) corresponds to exporter g(i) and importer h(i)
Two-way (a.k.a. double) clustering assumption (cf. Cameron et al. (2011)):
[ ]
E XεεX ′ = 0 unless g(i) = g(j) or h(i) = h(j), or both
i i j j
▶ Allows correlation of X i ε i between unit pairs that share at least one cluster

Multi-way clustering (2)
! 1,
Variance estimator: for G,H
XN
d ˆ ′ −1 ′ −1 ′
V ar(β ) = (X X) Ω(X X) , Ω = XεˆεˆX *1[g(i) = g(j) or h(i) = h(j)]
i i j j
i,j=1
[ ]
XεεX′
with E = 0 plugged in for pairs that do not share any cluster
i i j j
Simple implementation:
-Ω
Ω = Ω +Ω
g h gh
where Ω is g-clustered, Ω is h-clustered, and Ω is clustered by (g,h) pair
g h gh

Multi-way clustering (3)
Warning: do not confuse it with one-way clustering by (g(i),h(i)) pair:
XN
′
Ω = XεˆεˆX *1[g(i) = g(j) and h(i) = h(j)]
i i j j
i,j=1
6=
E.g. two-way clustering by state and by industry clustering by state-industry
▶ The former is more conservative than clustering by state; the latter is less
conservative
▶ Avoid ambiguous “I cluster by state and industry”
Exercise: how would you cluster when units belong to counties, which belong to
states, and you think Xε are correlated within counties and within states?
i i

Spatially-clustered standard errors
Suppose units are located in space (e.g., villages)
And we believe nearby units may have correlated X ε
▶ i i
Clustering by geographic areas (e.g., states) would ignore correlations between
places across area borders
Spatially-clustered standard errors (Conley, 1999) use
!
< >
X X
d(i,j)
d ′
V ar Xε = κ *XεˆεˆX
i i i i j j
d
i max
i,j: d(i,j)<dmax
▶ d(i,j) is geographic distance
d is the distance cutoff such that Cov[X ε ,X ε ] = 0 if d(i,j) > d
▶ max i i j j max
▶ κ(*) is a kernel function: e.g. uniform kernel κ(x) = 1[jxj <= 1]
⋆ Or Bartlett kernel: κ(x)=maxf1-jxj,0g

Spatially-clustered standard errors: Notes
The structure of spatial correlation for units closer than d is not restricted
max
▶ E.g. doesn’t have to be constant even if uniform kernel is used
d should be small enough, such that d > d for most i,j pairs
max ij max
Similar to having many clusters with cluster-robust SE
▶
▶ If spatial correlation is too wide-ranging, see Conley and Kelly (2025) for other
inference methods
The issue solved here is spatial correlation that biases SE
Not spatial spillovers (i.e., nearby X affects Y ) that bias estimates
▶ j i

References I
Alvarez, L., B. Ferman, and K. Wüthrich (2025): “Inference with few treated units,” arXiv
preprint.
Cameron, A. C., J. B. Gelbach, and D. L. Miller (2011): “Robust Inference With Multiway
Clustering,” Journal of Business & Economic Statistics, 29, 238–249.
Conley, T. G. (1999): “GMM estimation with cross sectional dependence,” Journal of
Econometrics, 92, 1–45.
Conley, T. G. and M. Kelly (2025): “The Standard Errors of Persistence,” Journal of
International Economics, 153, 104027.
De Chaisemartin, C. and J. Ramirez-Cuellar (2024): “At What Level Should One Cluster
Standard Errors in Paired and Small-Strata Experiments?” American Economic Journal: Applied
Economics, 16, 193–212.
Deryugina, T., G. Heutel, N. H. Miller, D. Molitor, and J. Reif (2019): “The Mortality
and Medical Costs of Air Pollution: Evidence from Changes in Wind Direction,” American Economic
Review, 109, 4178–4219.

References II
Gelbach, J. B. (2016): “When Do Covariates Matter? And Which Ones, and How Much?” Journal
of Labor Economics, 34, 509–543.
Imbens, G. W. (2010): “Better LATE Than Nothing: Some Comments on Deaton (2009) and
Heckman and Urzua (2009),” Journal of Economic Literature, 48, 399–423.
——— (2020): “Potential Outcome and Directed Acyclic Graph Approaches to Causality: Relevance
for Empirical Practice in Economics,” Journal of Economic Literature, 58, 1129–1179.
MacKinnon, J. G., M. O. Nielsen, and M. D. Webb (2023): “Cluster-robust inference: A
guide to empirical practice,” Journal of Econometrics, 232, 272–299.
