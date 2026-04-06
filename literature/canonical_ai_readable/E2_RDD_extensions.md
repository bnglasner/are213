Part E: Regression Discontinuity
E2: RDD Extensions
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

E2 Outline
Fuzzy RDD
1
2 Discrete running variables and RD in time
3 Adding covariates
4 Multiple cutoffs or running variables and Spatial RD
5 Local randomization approach
6 Extrapolating RD estimates
Reading: Cattaneo, Idrobo, and Titiunik (2023)

Fuzzy RDD
Think of fuzzy RDD as using Z = 1[X ≥ c] as an instrument:
i i
̸=
▶ D i Z i : treatment is not fully determined by X i
E[D =⇒
▶ But i X i ] jumps at the cutoff Z i is a relevant IV around X i = c
(IllustrationfromVanDerKlaauw(2002),Fig. 2)

Fuzzy RDD examples
Class size “first stage” Financial aid “first stage”
(MHE,Fig. 6.2.1a,basedonAngristandLavy(1999)) (VanDerKlaauw(2002),Fig. 4)

Identification and estimation
With binary treatment, need standard IV assumptions:
Exclusion: Y (d,z) ≡ Y (d)
▶ i i
E[D E[Y
▶ Independence: continuity of (z) X = x] and (d) X = x] at x = c
i i i i
Monotonicity: D (1) ≥ D (0)
▶ i i
With binary D, reduced form/first stage ≡ τ /τ identifies LATE:
Y D
τ
Y E[Y(1)−Y(0)
= D(1) > D(0), X = c]
i i i i i
τ
D
Report τˆ , τˆ and fuzzy RD estimate τˆ /τˆ from local polynomial estimation with
D Y Y D
the same bandwidth for Y and D
▶ rdrobust chooses bandwidth to minimize MSE for the IV
▶ Show RD plots for the first stage and reduced form (ITT)

Outline
Fuzzy RDD
1
Discrete running variables and RD in time
2
Adding covariates
3
Multiple cutoffs or running variables and Spatial RD
4
5 Local randomization approach
6 Extrapolating RD estimates

Discrete running variables
In many RDD applications X is discrete
i
▶ E.g. number of kids in a cohort (Angrist and Lavy (1999))
Does this matter conceptually?
E[Y =⇒
▶ lim x↓,↑c i X i = x] is not well-defined RD identification fails
As N → ∞, we can’t shrink bandwidth h → 0
▶
Does this matter in practice?
If there are many mass points of X around c, can probably ignore the issue
▶ i
▶ If X is sparse around c, it’s more salient
i

An “honest” (“bias-aware”) approach
Armstrong and Kolesár (2018) and Kolesár and Rothe (2018) develop an “honest”
approach to RDDs
Acknowledges that bias in local linear estimation is inevitable
▶
With discrete X we cannot consistently estimate bias
▶ i
E[Y |
Instead, it bounds worst-case bias by assuming that X] is suﬀiciently
i i
smooth on either side of c
▶ Choose bound M on the curvature of E[Y | X ] ⇒ get a partially identified set of τ
i i
▶ Reminds you of anything?
Choosing M is annoying but ignoring discreteness does the same implicitly
▶ A rule of thumb is available

An “honest” (“bias-aware”) approach (2)
rdhonest produces a “bias-aware” confidence interval
▶ Centered around the local linear estimator
With a different bandwidth (optimized for CI length); in practice, similar to the
⋆
Calonico et al. (2014) bandwidth
▶ ± worst-case bias (rather than subtracting estimated bias), in addition to SE
Approach applies even with continuous running variable
▶ And can have good finite-sample properties because doesn’t rely on h being small
See Imbens and Wager (2019) for an honest approach not based on local linear
estimation
▶ More complex (via numerical optimization) but more generalizable

RD in time
Related problems arise with “RD in time”
X = period; often no cross-sectional variation at all, just a time series
i
E.g. Anderson (2014): the effect of a public transit strike in LA on highway
congestion
(Anderson(2014),Fig. 2)
Similar situation: X = age
i

How to think about RD in time?
Theoretically, time is a continuous variable
▶ Could measure the outcome a second before and after the policy change — like
event studies in finance
▶ Asymptotic with data frequency growing
In practice, outcomes are measured at discrete intervals, and collecting more data
involves going further in time from c
→ ∞,
▶ As T the bandwidth can’t (and doesn’t) shrink
▶ Understanding check: is the McCrary test helpful here?

Outline
Fuzzy RDD
1
Discrete running variables and RD in time
2
Adding covariates
3
Multiple cutoffs or running variables and Spatial RD
4
5 Local randomization approach
6 Extrapolating RD estimates

Adding covariates
As usual, covariates W can be added to increase eﬀiciency or to avoid OVB
i
If W are predetermined, i.e. E[W | X] is continuous at the cutoff:
i i i
▶ Include W i in the regression implementation of local linear estimator without
interactions:
Y = τD +γ +γ (X −c)+γ (X −c)D +δ ′ W +error
i i 0 1 i 2 i i i
▶ This increases eﬀiciency without changing the estimand (Calonico et al. (2019))
▶ See Noack, Olma, and Rothe (2023) on flexible covariate adjustment
If W jumps at the cutoff, the effects of D and W cannot be separated without
i i i
further assumptions
▶ Frölich and Huber (2019) make a selection-on-observables assumption; see also
Peng and Ning (2021)

Outline
Fuzzy RDD
1
Discrete running variables and RD in time
2
Adding covariates
3
Multiple cutoffs or running variables and Spatial RD
4
5 Local randomization approach
6 Extrapolating RD estimates

Multiple cutoffs or running variables
Four scenarios:
1. Scalar running variable, single heterogeneous cutoff
2. Scalar running variable, multiple cutoffs
3. Multiple running variables, single discontinuity — including spatial RD
(see Cattaneo, Titiunik, and Yu (2025d) for a review)
4. Aggregating multiple discontinuities (Borusyak and Kolerman-Shemer (2024))
Note: package rdmulti provides commands for estimation and plotting in #1–3

#1: Scalar running variable, single heterogeneous cutoff
E.g. states have different income cutoffs for a means-tested program:
≥ ∈ {c }
D = 1[X C] for C ,...,c
i i i i 1 K
Obviously, we can RD by subgroup C = c:
i
τ = E[Y(1)−Y(0) X = c,C = c]
c i i i i
˜ −C
Can also pool them by using “normalized” X = X with a cutoff of zero
i i i
▶ Pooled RDD identifies a weighted average of group-specific ones:
∑
ω τ
∑c c c
τ = , ω = f (c,c)
pooled ω c X C
c

#2: Scalar running variable, multiple cutoffs
E.g. rounding of Yelp stars (Anderson and Magruder (2012)) generates cutoffs at
X = 3.25,3.75,4.25,4.75
i
Or federal subsidies determined by local population, with several discontinuities

  d , if X < c
 0 i 1

d , if c ≤ X < c
1 1 i 2
Consider a sharp design with multi-valued D =
i 
... 

d , if c ≤ X
K K i
∈ {d } E[Y(d )−Y(d
RDD on subsample with D k−1 ,d identifies k−1 ) X = c ]
i k i k i i k
Mostly similar to the previous case
Except same observation can be used twice (unless bandwidth is small enough)
▶

#3: Multiple running variables, single discontinuity
E.g. scholarship awarded to students scoring above a cutoff in both math and English:
X = (Math,English), D = 1[Math ≥ c ]×1[English ≥ c ]
i i i i i Math i English
(Cattaneoetal.(2023),Fig. 5.5a)
Note that a student needn’t be close to the border on both running variables to be
near the boundary

Special case: Spatial discontinuity designs
X = (Longitude,Latitude); border is often complex
i i i
(Cattaneoetal.(2023),Fig. 5.5b)
E.g. Dell (2010) compares today’s outcomes across the boundary of a forced
mining labor system in Peru and Bolivia “mita”

Effects at a single boundary point

Effects at a single boundary point: Identification
Let D = a(X), A = {x: a(x) = 0}, A = {x: a(x) = 1}, and B = boundary
i i 0 1
between A and A
0 1
Assume E[Y(d) X = x] is continuous at x ∈ B
i i
▶ Violated when multiple outcome-relevant treatments jump at the same boundary
▶ Or when location X or the boundary can be manipulated
i
∈
Average causal effect at point b B, τ(b), is identified by
E[Y x]− E[Y
τ(b) = lim X = lim X = x]
i i i i
x→b, x∈A1 x→b, x∈A0

Effects at a single boundary point: Estimation
1. Let d(X,b) denote some distance metric (e.g. Euclidean)
i
{
X˜ d(X,b), i D i = 1
▶ Use “signed distance” as the running variable: =
i −d(
X,b), D = 0
i i
(with a cutoff of zero)
X˜ X˜
▶ Use local linear estimation, controlling for and D
i i i
But Cattaneo et al. (2025b) show poor behavior near irregular points of the
▶
boundary (e.g., kinks)
≤
2. Location-based approach (Cattaneo et al. (2025c)): within d(X,b) h, regress Y
i i
on D controlling for a polynomial of X −b and its interaction with D
i i i
▶ Does not suffer from problems of the distance-based approach

Problems of distance-based estimation
Cattaneoetal.(2025b),Fig.1

Pooled effect
How can we estimate the average effect pooling across boundary points,
E[Y(1)−Y(0) X ∈ B]?
i i i
Naive “pre-aggregation” approach: Compute distance d (X) to the closest
min i
boundary point
{
d m in (X), i D i = 1
▶ Use signed distance X˜ = and a cutoff of zero, controlling for
i −
d ( X), D = 0
min i i
X˜ X˜
and D
i i i
But in finite samples this may not be enough
▶ Observations on the two sides of the border may be geographically imbalanced

Pooled effect: better estimators
Better pre-aggregation:
▶ Black (1999) further controls for FEs of boundary segments to improve geographic
balance
▶ Dell (2010) further controls for polynomials in X i (better: interacted with D i !)
Imbens and Zajonc (2009) and Cattaneo et al. (2025a) “post-aggregation”:
∈
manually average estimated τˆ(b) over the boundary b B
The honest approach of Imbens and Wager (2019)
▶ Directly chooses the optimal estimator (via numerical optimization), accounting for
worst-case bias under a bound on two-dimensional curvature of E[Y(d) | X]
i i

Outline
Fuzzy RDD
1
Discrete running variables and RD in time
2
Adding covariates
3
Multiple cutoffs or running variables and Spatial RD
4
5 Local randomization approach
6 Extrapolating RD estimates

Local randomization approach to RDDs
Lee (2008) title: “Randomized experiments from non-random selection in U.S.
House elections”
In the continuity approach this idea is a heuristic
▶ D is only approximately independent from Y (d) =⇒ local polynomial adjustments
i i
Local randomization approach (Cattaneo et al. (2015)) takes this idea seriously
⊥⊥ ∈ X X [c−h,c+h]
▶ Assume X i Y i (d) X i in a (potentially unknown) window =
∈ X) X
▶ And that F(X i X i is known, e.g. uniform in or across permutations
For no good reason!
▶
Under these assumptions, can use all RCT machinery
▶ E.g. randomization inference that is valid in finite-samples

Choosing the window
Cattaneo et al. (2015) propose to start from smallest h and increase it until you reject
balance of some predetermined W
i
(Cattaneoetal.(2023),Figure2.4)

Outline
Fuzzy RDD
1
Discrete running variables and RD in time
2
Adding covariates
3
Multiple cutoffs or running variables and Spatial RD
4
5 Local randomization approach
6 Extrapolating RD estimates

Extrapolating RD estimates
A key limitation of RDDs is the local nature of τ = E[Y(1)−Y(0) | X = c]
i i i
Kids who barely receive financial aid and politicians who barely win may be unusual
When can we identify effects away from the cutoff to improve external validity?
Idea #1 (Dong and Lewbel (2015)): local linear estimation automatically yields
∂E[Y(1)−Y(0) X = x]
i i i
ϕ =
x=c
∂x
= Difference in regression slopes on the right and left
E[Y(1)−Y(0) ≈ +ϕ(x−c) ≈
Thus, X = x] τ for x c
i i i

Extrapolating RD estimates (2)
Idea #2 (Angrist and Rokkanen (2015)): suppose X is a noisy version of observable W
i i
E.g. D = offer for a selective school in Boston, X = admission test score
i i
▶ Assume X i is random noise conditionally on pre-application test score
Conditional independence assumption:
E[Y(d) X,W] = E[Y(d) W] =⇒ E[Y(d) D,W] = E[Y(d) W]
i i i i i i i i i i
▶ Given W , we can compare treated and untreated, as long as there is overlap
i
▶ Can use standard CIA methods to get the ATE (on everyone — nothing local)
Note: we used that D is a deterministic function of X , but not its discontinuity
▶ i i

Extrapolating RD estimates (3)
Angrist and Rokkanen’s CIA assumption is falsifiable: it implies
E[Y E[Y
X,D,W] = D,W]
i i i i i i i
Among the treated, X should not predict Y given W; same for the untreated
i i i
Exercise: prove this!

References I
Anderson, M. and J. Magruder (2012): “Learning from the Crowd: Regression Discontinuity
Estimates of the Effects of an Online Review Database,” The Economic Journal, 122, 957–989.
Anderson, M. L. (2014): “Subways, Strikes, and Slowdowns: The Impacts of Public Transit on
Traﬀic Congestion,” American Economic Review, 104, 2763–2796.
Angrist, J. D. and V. Lavy (1999): “Using Maimonides’ Rule to Estimate the Effect of Class Size
on Scholastic Achievement,” The Quarterly Journal of Economics, 114, 533–575.
Angrist, J. D. and M. Rokkanen (2015): “Wanna Get Away? Regression Discontinuity
Estimation of Exam School Effects Away From the Cutoff,” Journal of the American Statistical
Association, 110, 1331–1344.
Armstrong, T. B. and M. Kolesár (2018): “Optimal Inference in a Class of Regression
Models,” Econometrica, 86, 655–683.
Black, S. E. (1999): “Do Better Schools Matter? Parental Valuation of Elementary Education,”
The Quarterly Journal of Economics, 114, 577–599.
Borusyak, K. and M. Kolerman-Shemer (2024): “Regression Discontinuity Aggregation, with
an Application to the Union Effects on Inequality,” Mimeo.

References II
Calonico, S., M. D. Cattaneo, M. H. Farrell, and R. Titiunik (2019): “Regression
Discontinuity Designs Using Covariates,” The Review of Economics and Statistics, 101, 442–451.
Calonico, S., M. D. Cattaneo, and R. Titiunik (2014): “Robust Nonparametric Confidence
Intervals for Regression-Discontinuity Designs: Robust Nonparametric Confidence Intervals,”
Econometrica, 82, 2295–2326.
Cattaneo, M. D., B. R. Frandsen, and R. Titiunik (2015): “Randomization Inference in the
Regression Discontinuity Design: An Application to Party Advantages in the U.S. Senate,” Journal
of Causal Inference, 3, 1–24.
Cattaneo, M. D., N. Idrobo, and R. Titiunik (2023): “A Practical Introduction to Regression
Discontinuity Designs: Extensions,” arXiv preprint, arXiv:2301.08958 [econ, stat].
Cattaneo, M. D., R. Titiunik, and R. Yu (2025a): “Causal Treatment Effect Aggregation in
Boundary Discontinuity Designs,” Working Paper.
——— (2025b): “Estimation and Inference in Boundary Discontinuity Designs: Distance-Based
Methods,” Working Paper.

References III
——— (2025c): “Estimation and Inference in Boundary Discontinuity Designs: Location-Based
Methods,” Working Paper.
Cattaneo, M. D., R. Titiunik, and R. R. Yu (2025d): “Boundary Discontinuity Designs:
Theory and Practice,” Working Paper, arXiv:2511.06474 [econ].
Dell, M. (2010): “The Persistent Effects of Peru’s Mining Mita,” Econometrica, 78, 1863–1903.
Dong, Y. and A. Lewbel (2015): “Identifying the Effect of Changing the Policy Threshold in
Regression Discontinuity Models,” Review of Economics and Statistics, 97, 1081–1092.
Frölich, M. and M. Huber (2019): “Including Covariates in the Regression Discontinuity Design,”
Journal of Business & Economic Statistics, 37, 736–748.
Imbens, G. and S. Wager (2019): “Optimized Regression Discontinuity Designs,” The Review of
Economics and Statistics, 101, 264–278.
Imbens, G. and T. Zajonc (2009): “Regression Discontinuity Design with Vector-Argument
Assignment Rules,” .
Kolesár, M. and C. Rothe (2018): “Inference in Regression Discontinuity Designs with a Discrete
Running Variable,” American Economic Review, 108, 2277–2304.

References IV
Lee, D. S. (2008): “Randomized experiments from non-random selection in U.S. House elections,”
Journal of Econometrics, 142, 675–697, iSBN: 03044076.
Noack, C., T. Olma, and C. Rothe (2023): “Flexible Covariate Adjustments in Regression
Discontinuity Designs,” ArXiv:2107.07942 [econ, stat].
Peng, S. and Y. Ning (2021): “Regression Discontinuity Design under Self-selection,” International
Conference on Artificial Intelligence and Statistics, 118–126.
Van Der Klaauw, W.(2002): “EstimatingtheEffectofFinancialAidOffersonCollegeEnrollment:
A Regression–Discontinuity Approach*,” International Economic Review, 43, 1249–1287.
