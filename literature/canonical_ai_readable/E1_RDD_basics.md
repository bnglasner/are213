Part E: Regression Discontinuity
E1: RDD Basics
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

E1 Outline
RDD idea and identification
1
Visualization, estimation, and inference
2
Falsification tests
3
A cautionary tale
4
Reading: Cattaneo, Idrobo, and Titiunik (2019)
For code in Stata, R, and Python, see https://rdpackages.github.io/

Setting
Sharp regression discontinuity design involves:
Scalar continuous score (a.k.a. running variable, forcing variable) X
i
Scalar cutoff c (with non-zero density of X on both sides)
i
Binary treatment D = 1[X ≥ c]
i i
▶ Fully determined by the score, no discretion
▶ Rule is discontinuous in X i at c
E[Y(0) X],E[Y(1)
Continuity of (expected) potential outcomes X] at
i i i i
X = c
i
1. No other determinant of Y jumps at X = c
i i
2. Score cannot be precisely (and endogenously) manipulated

Identification
Then lim E[Y | X = x]−lim E[Y | X = x] = E[Y(1)−Y(0) | X = c]
x↓c i i x↑c i i i i i
Discontinuity of regression E[Y | X] at c identifies a local causal parameter
i i
(Calonicoetal.(2019),Figure2)

Examples
Effects of financial aid on college enrollment (Van Der Klaauw, 2002)
▶ Score X = GPA +SAT
i i i
Effects of class size on educational achievement (Angrist and Lavy, 1999)
▶ X = number of students in a school cohort
i
▶ “Maimonides rule”: max class size in Israel = 40; with X i = 41 classes are small

Examples (2)
Incumbency advantage in a two-party system (Lee, 2008)
X = vote share of Democratic candidate to U.S. House in district i; c = 0.5
▶ i
▶ D = Democrat is incumbent in next election
i
▶ Y = Democratic candidate wins next election; E[Y (1)−Y (0)]: incumbency
i i i
advantage
Effect of displayed Yelp rating on restaurant sales (Anderson and Magruder, 2012)
X = actual restaurant rating, e.g. 3.24 or 3.26
▶ i
D = displayed rating which is rounded to the nearest 0.5
▶ i

Is RDD a special case of something?
Is RDD like selection on observables, with X as a control variable?
i
Is RDD like IV, with X as instrument?
i
Is RDD like a RCT in the neighborhood of X = c?
i

Answer key
Is RDD like selection on observables, with X as a control?
i
No. By construction, there is no overlap: no value of X where both D = 0 and D = 1
i i i
are observed
Is RDD like IV, with X as instrument?
i
t−1
No. Exogeneity of X is not assumed, e.g. higher vote share in election correlates
i
with higher vote share in t
Is RDD like a RCT in the neighborhood of X = c?
i
Yes. Continuity of potential outcomes implies their balance around X = c
i
No. This only holds in an infinitesimal neighborhood. So we need to be careful with
estimation

Checklist for sharp RD
Visualization: “RD plot”
Estimation and inference
Falsification tests
Balance tests: RD plots and estimates for covariates and placebo outcomes
▶
McCrary test for continuous density of X around the cutoff
▶ i

Outline
1 RDD idea and identification
Visualization, estimation, and inference
2
3 Falsification tests
4 A cautionary tale

RD plot
(Cattaneoetal.(2019),Figure11, (Lee(2008),Figure2a)
Meyersson(2014)data)

RD plot: Details
E[Y
Shows discontinuity in regression X] in two ways:
i i
Parametric fit: shows the global shape and nonlinearity of the regression
▶ Separately on the left and right of c, fitted values from
Y = α +α (X −c)+···+α (X −c)p+error
i 0 1 i p i
e.g. with quartic polynomial (p = 4)
Binscatter: a local/nonparametric estimator of the regression
▶ Separately on each side, for some bins of X i : average Y i against bin’s midpoint
▶ Bins with similar numbers of observations (splitting by quantile) are more
informative. But equal width is also common
▶ Calonico, Cattaneo, and Titiunik (2015) propose data-driven optimal number of
bins...

Binscatter vs. scatterplot
Few bins =⇒ doesn’t trace E[Y | X] (bias); many bins (e.g. scatterplot) =⇒ noisy
i i
(Figure8,integratedMSE-optimalnumberofbins) (Figure5: Scatterplot)

Estimation
RD plots yield two estimates of the causal effect τ = E[Y(1)−Y(0) | X = c]:
i i i
(Figure8again)

Estimation (2)
Are these estimators good?
Global extrapolation using higher-order polynomials has bad properties at the
border (Gelman and Imbens, 2019):
▶ Noisy and highly sensitive to the order of the polynomial
Difference in outcome means between the nearest bin on the right vs. on the left?
▶ This “local constant regression” is too biased
Instead, use local polynomial regression, e.g. local linear (p = 1)
▶

Local linear regression
(Figure15. Notemorenarrowrangeofscores)

Local linear regression (2)
E[Y
Estimate lim X = x] by αˆ from
x↓c i i +
( )
∑ −c
X
ˆ −α −β −c))2κ i
(αˆ ,β ) = arg min (Y (X
+ + i + + i h
α+,β+ +
i: c≤Xi ≤c+h+
where h > 0 is some bandwidth and κ(·) is a kernel function, e.g.
+
1[ x ≤
▶ Uniform kernel: κ(x) = 1] (uses all obs. in the neighborhood)
Triangular kernel: κ(x) = max{1−|x|,0} (weights obs. closer to c more)
▶

Local linear regression (3)
E[Y
Estimate lim x↑c X = x] by αˆ − from
i i
( )
∑ −c
X
(αˆ ,β ˆ ) = arg min (Y −α −β (X −c))2κ i
− − i − − i
h
α−,β− −
i: c−h− ≤Xi<c
(with h = h or h ̸= h )
− + − +
Estimate τ by τˆ = αˆ −αˆ
+ −
▶ Can implement by a single regression (on X ∈ [c−h−,c+h ] and with kernel
i +
weights):
−c)+γ −c)D
Y i = τD i +γ 0 +γ 1 (X i 2 (X i i +error
(but don’t treat it like a true model, and be careful with SE!)

Bandwidth choice
Bandwidth choice (given kernel) is much more important the choice of kernel:
(Figure14)

Optimal bandwidth choice
For local polynomial of order p,
V
bias(τˆ) ≈ B·hp+1, Var[τˆ] ≈
Nh
▶ B is determined by the curvatures dp+1E[Y | X = x]/dxp+1 | on each side
x=c
▶ V is determined by the variance of Y X = c and density of X
i i i
( )
−1/(2p+3)
2(p+1)B2
Thus, MSE ≈ (Bhp+1)2 + V is minimized at h∗ = N
Nh V
E.g. ∝ N −1/5 when p = 1
▶
h ∗ ↑ when bias is smaller: B ↓, p ↑
▶
∗
▶ h ↓ when variance is smaller: V ↓, N ↑

Estimating optimal bandwidth
h∗
If we can estimate B and V, we can compute
Calonico, Cattaneo, and Titiunik (2014): to estimate B, run local polynomial
estimation with order q ≥ p+1 (with a larger “pilot” bandwidth)
Yields estimates for (p+1)’st derivatives of E[Y | X] on each side of X = c
▶
▶ Default pilot bandwidth based on a global polynomial regression of order > q

Estimating optimal bandwidth (2)
For Var[τˆ] ∝ Var[Y | X = c], can we use errors from local linear regression?
Y = τD +γ +γ (X −c)+γ (X −c)D +error
i i 0 1 i 2 i i
E[Y(d) =⇒
The error includes nonlinearity of X] (d = 0,1) upward bias for V
One solution: nearest neighbor approach
Estimate errors ε = Y −E[Y | X ] from variation of Y among J neighbors, nearest
▶ i i i i
in terms of the score and on the same side:
√
( )
J −Y¯
εˆ = Y
i i neighbors(i)
J+1

Intermediate summary
B·hp+1
Local linear regression estimator τˆ has asymptotic bias
▶ Estimate B by local quadratic regression
Asymptotic Variance of τˆ is V
Nh
Estimate V by the nearest neighbor approach
▶
( )
−1/(2p+3)
h∗ 2(p+1)B2
Pick MSE-optimal bandwidth = N
V
Run local linear regression to obtain τˆ
√
Vˆ
What about the confidence interval? Can we use τˆ±1.96 ?
Nh

Bias-corrected inference
Problem: h∗ minimizes MSE by trading off bias2 and variance
At h ∗ , bias and SE of the same order =⇒ conventional CI has incorrect coverage!
▶
√
Nh∗(τˆ−τ) →d N ∗ ∗ ∗ ̸=
(B ,V ), B 0
One solution: “undersmoothing”
Use bandwidth h much smaller than h ∗ . Then inference is fine (bias ≪ SE)
▶
▶ But unclear how to choose h, and would yield a higher-MSE estimator
Another solution: “robust bias correction” (Calonico et al. (2014), rdrobust)
=⇒ τˆ−Bˆ∗
▶ We already estimated the bias center CI at
▶ Adjust SE for noise in bias estimation =⇒ “Robust bias-corrected CI”
▶ Why not debias τˆ, too? Higher MSE because of bias estimation

rdrobust with default options
(Cattaneoetal.(2019),Codesnippet21)

If you insist to report bias-corrected estimate
(Cattaneoetal.(2019),Codesnippet22)

Robustness to bandwidth choice
While we know the optimal bandwidth, checking sensitivity to this choice is also useful:
(ImbensandKalyanaraman(2012),Figure3)

Outline
1 RDD idea and identification
Visualization, estimation, and inference
2
3 Falsification tests
4 A cautionary tale

Falsification tests
The assumption of continuity of potential outcomes is not testable
But a slightly stronger assumption — “that X is influenced partially by random
i
chance” (Lee (2008)) — has two testable implications:
1. Balance: distribution of predetermined variables W (lagged covariates or outcomes)
i
should be continuous at the cutoff
2. Density of X i should be continuous at the cutoff
Note: contextual knowledge, e.g. on how easy it is to manipulate X, is still
i
indispensable

Placebo RD plots and estimates
(Lee(2008),Figure5bandTable2)

Discontinuity of density (“bunching”) test
McCrary (2008): Discontinuity of density of X around X = c suggests manipulation
i i
(IllustrationfromCalonicoetal.(2019),Fig. 18)

Discontinuity of density in practice
A real issue in the literature on the effect of unionization, using close elections RDD:
(Frandsen(2021),Fig. 1)

Convenient implementation
Cattaneo, Jansson, and Ma (2020), rddensity package:
Density is the slope of CDF, which is easy to estimate =⇒ estimate from a local
polynomial approximation to the CDF
(Cattaneoetal.(2019),Fig. 19)

Outline
1 RDD idea and identification
Visualization, estimation, and inference
2
3 Falsification tests
4 A cautionary tale

A cautionary tale
We have discussed an algorithm for estimating causal effects in RDDs
▶ Plots, estimators, inference methods, tests
But blindly following the algorithm is not enough to get to the truth
▶ Illustration following Andrew Gelman’s blog posts in 2019 and 2020 in the RDD
context but the lesson is broader

Gilraine (2025): Effect of air filters on student achievement
Filters installed in all schools within 5 miles of a big gas leak in Los Angeles
“Once the distance to the gas leak exceeds five miles, we see a substantial drop in
test score growth in both math and English. This provides clear and convincing
evidence that air filters substantially raised test scores.”

Gilraine (2025): Effect of air filters on student achievement
(Gilraine(2025),Figure3a)
It’d be easy to draw the lines differently — try removing the lines and drawing them
yourself

Barfort, Klemmensen, and Larsen (2021)
Study the effects of a candidate winning gubernatiorial election on life expectancy
Significant local linear regression estimates τˆ ≈ 2000–3000 days
▶ Report placebo outcomes, robustness to bandwidth and polynomial order, etc.

Lessons from Barfort et al. (2021)?
Gelman tries to replicate it from scratch and finds it diﬀicult
▶ Many choices during data cleaning not be captured by robustness checks
▶ “The garden of forking paths”
The effect magnitude is entirely implausible
▶ But how should we use our priors?
Raw data is noisy
▶ Different models can fit them in different ways. “No smoking gun” (see next slide)
▶ But should we just give up?

Lessons from Barfort et al. (2021)?
(Gelman’sreanalysisoftherawdata)

References I
Anderson, M. and J. Magruder (2012): “Learning from the Crowd: Regression Discontinuity
Estimates of the Effects of an Online Review Database,” The Economic Journal, 122, 957–989.
Angrist, J. D. and V. Lavy (1999): “Using Maimonides’ Rule to Estimate the Effect of Class Size
on Scholastic Achievement,” The Quarterly Journal of Economics, 114, 533–575.
Barfort, S., R. Klemmensen, and E. G. Larsen (2021): “Longevity returns to political
oﬀice,” Political Science Research and Methods, 9, 658–664.
Calonico, S., M. D. Cattaneo, M. H. Farrell, and R. Titiunik (2019): “Regression
Discontinuity Designs Using Covariates,” The Review of Economics and Statistics, 101, 442–451.
Calonico, S., M. D. Cattaneo, and R. Titiunik (2014): “Robust Nonparametric Confidence
Intervals for Regression-Discontinuity Designs: Robust Nonparametric Confidence Intervals,”
Econometrica, 82, 2295–2326.
——— (2015): “Optimal Data-Driven Regression Discontinuity Plots,” Journal of the American
Statistical Association, 110, 1753–1769.
Cattaneo, M. D., N. Idrobo, and R. Titiunik (2019): A Practical Introduction to Regression
Discontinuity Designs: Foundations, arXiv:1911.09511 [econ, stat].

References II
Cattaneo, M. D., M. Jansson, and X. Ma (2020): “Simple Local Polynomial Density
Estimators,” Journal of the American Statistical Association, 115, 1449–1455.
Frandsen, B. R. (2021): “The Surprising Impacts of Unionization: Evidence from Matched
Employer-Employee Data,” Journal of Labor Economics, 39, 861–894.
Gelman, A. and G. Imbens (2019): “Why High-Order Polynomials Should Not Be Used in
Regression Discontinuity Designs,” Journal of Business & Economic Statistics, 37, 447–456.
Gilraine, M. (2025): “Air Filters, Pollution, and Student Achievement,” Journal of Human
Resources, 60, 1469–1506.
Imbens, G. W. and K. Kalyanaraman (2012): “Optimal Bandwidth Choice for the Regression
Discontinuity Estimator,” Review of Economic Studies, 79, 933–959.
Lee, D. S. (2008): “Randomized experiments from non-random selection in U.S. House elections,”
Journal of Econometrics, 142, 675–697, iSBN: 03044076.
McCrary, J. (2008): “Manipulation of the running variable in the regression discontinuity design: A
density test,” Journal of Econometrics, 142, 698–714.

References III
Meyersson, E. (2014): “Islamic Rule and the Empowerment of the Poor and Pious,” Econometrica,
82, 229–269.
Van Der Klaauw, W.(2002): “EstimatingtheEffectofFinancialAidOffersonCollegeEnrollment:
A Regression–Discontinuity Approach*,” International Economic Review, 43, 1249–1287.
