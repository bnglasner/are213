Part C: Instrumental Variables
C3: Judge IV Design
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

C3 Outline
Readings:
Scott Cunnigham’s “Mixtape” textbook, Ch. 7.8.2
Goldsmith-Pinkham, Hull, Kolesar (in progress)

Setting
There are many situations where:
1. the treatment (usually binary) is decided by one of K “judges” (examiners,
caseworkers, ...)
2. judge’s decision is discretionary
3. judges are assigned to cases randomly (perhaps within strata, e.g. location-period)
Examples of treatments:
Incarceration (Kling 2006, Mueller-Smith 2015), bail (Arnold, Dobbie, Yang 2018)
▶
▶ Patent granting (Sampat and Williams 2019)
▶ Credit ratings (Rieber and Schechinger 2019)
Psychotherapy treatment (Blæhr and Søgaard 2021)
▶
▶ Several types of job training programs for the unemployed (Humlum, Munch,
Rasmussen 2024)

Idea
Judges typically vary by leniency
(Gaudet,HarrisandJohn1933,reproducedfromScottCunningham’s“Mixtape”)
Can use this heterogeneity to instrument for treatment
Leniency is unobserved =⇒ what should we do?
▶
Under which assumptions is the answer causal?
▶

Estimated leniency?
∈ {1,...,K};
Notation: judge assignment Q = k Z = 1[Q = k]
i ki i
Consider binary treatment. Popular naïve idea:
∑
Lˆ ∑i Z Di
▶ Measure judge leniency as % of lenient decisions: = ki
k Z
i ki
▶ Then instrument D with Lˆ
i Qi
▶ If assignment is random only within strata, control for strata FE
ˆ
Problem: L is noisy if there are many judges (and not so many cases per judge)
k
Lˆ =⇒
▶ is influenced by D , which correlates with ε bias
Qi i i
Conventional inference doesn’t take into account estimation noise
▶

Correct IV framework
ˆ
Note that L = OLS estimates of L from a first-stage
k k
∑
D = L Z +u
i k ik i
k
⇒ Using fitted values Lˆ as IV ⇐⇒ 2SLS with Z ,...,Z instruments
Qi 1 K
ˆ
Problem of noisy L is the standard many weak IV problem
k
∑
1 [Q j= Q i] D
Without covariates, JIVE is natural: uses leave-out leniency Lˆ = ∑j̸= i j
▶ i
j̸= i 1 [Q j= Q i ]
▶ With (many) covariates (e.g., strata FEs with few cases per strata), better to use
UJIVE (“unbiased JIVE”; Kolesar (2013)): a version of JIVE that is consistent with
many controls

Underlying assumptions
With judge assignment dummies Z ,...,Z as IVs, what about:
i1 iK
Independence?
Exclusion?
Monotonicity?

Underlying assumptions
With judge assignment dummies Z ,...,Z as IVs, what about:
i1 iK
Independence?
Guaranteed by random assignment, as long as strata FEs are controlled for
▶
Exclusion?
▶ Does the judge directly make only one decision D ?
i
▶ Can the judge indirectly affect others treatments, e.g. by affecting who will be
making those decisions?
Joint monotonicity: very strong (as usual with multiple IVs)
▶ A judge who is more lenient on average should be weakly more lenient on everyone
▶ Violated if judges put different weights on different characteristics of the case

Tests for monotonicity and exclusion
1. Reject joint monotonicity if the ranking of judges by leniency varies by subgroup of
cases based on observables (see Dobbie, Goldin, and Yang (2018))
2. Frandsen, Lefgren, and Leslie (2023):
▶ Under all LATE assumptions, comparing any two judges gives causal effects for
some complier population
▶ Causal effects cannot be too large: e.g. bounded by the range of possible outcomes
Reject exclusion or monotonicity if there is a pair of judges with similar E[D | Q ]
▶ i i
but very different E[Y | Q] (like Sarsons (2015) and Kitagawa (2015))
i i
Should we panic if monotonicity doesn’t hold?
Not with homogeneous effects (or in De Chaisemartin (2017) “Tolerating defiance”)
▶
▶ Frandsen et al. (2023): 2SLS identifies a convex average of causal effects under
“average monotonicity”: for all i, D(k) is positively correlated with L across k
i k

References I
De Chaisemartin, C. (2017): “Tolerating defiance? Local average treatment effects without
monotonicity: Tolerating defiance?” Quantitative Economics, 8, 367–396.
Dobbie, W., J. Goldin, and C. S. Yang (2018): “The Effects of Pre-Trial Detention on
Conviction, Future Crime, and Employment: Evidence from Randomly Assigned Judges,” American
Economic Review, 108, 201–240.
Frandsen, B., L. Lefgren, and E. Leslie (2023): “Judging Judge Fixed Effects,” American
Economic Review, 113, 253–277.
Kitagawa, T. (2015): “A Test for Instrument Validity,” Econometrica, 83, 2043–2063.
Kolesar, M. (2013): “Estimation in an Instrumental Variables Model With Treatment Effect
Heterogeneity,” 1–45.
Sarsons, H. (2015): “Rainfall and Conflict: A Cautionary Tale,” Journal of Development Economics,
115, 62–72.
