Part D: Panel Data Methods
D2: Canonical Difference-in-Differences
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

It’s everywhere
FractionofNBERworkingpapersmentioningDiD(Goldsmith-Pinkham(2024),Fig.5a)

D2 outline
1 2x2 DiD
2 DiD and event studies with multiple units and periods
3 Discussion of conventional event studies

Difference-in-differences: Idea
We are interested in causal effects of some binary treatment
But treatment is not randomly assigned across units
“Quasi-experimental” contrasts are easier to find in panel data
Card and Krueger (1994): effect of minimum wages on employment
▶ On April 1, 1992, NJ raised the min.wage from $4.25 to $5.05
▶ Min.wage in PA stayed at $4.25
▶ Measure average employment at fast food restaurants after (Nov 1992) minus
before (Feb 1992), in NJ minus PA

Card and Krueger (1994)
(Card-KruegerTable3,reproducedfromMHETable5.2.1)

Is this causal?
Define potential outcomes Y (d) for d = 0,1 (low/high min.wage), with
it
τ = Y (1)−Y (0) and Y = Y (D )
it it it it it it
D i = PA i = NJ
it
t = 1 0 0
t = 2 0 1
Estimand: ATT = τ
NJ,2
Assumptions for this potential outcomes formulation:
▶ No spillovers
▶ No anticipation effects: Y does not depend on D
i1 i2
▶ Parallel trends...

Parallel trends (PTA)
(MHEFigure5.2.1,correctedbyPeterHull)
E[Y (0)−Y E[Y (0)−Y
Parallel trends: (0)] = (0)]
NJ,2 {z NJ,1 } PA,2 {z PA,1 }
unobserved observed
E[Y
Note: notation for a fixed sample, (0)] depends on i,t. Expectations taken with
it
respect to other determinants of the outcome

PTA = TWFE for Y(0)
E[Y (0)−Y (0)] = E[Y (0)−Y (0)]
NJ,2 NJ,1 PA,2 PA,1
is equivalent to
E[Y (0)] = α +β for i = NJ,PA; t = 1,2
it i t
⇐: Obvious
⇒: Let α = E[Y (0)], β = 0,
i i,1 1
β = E[Y (0)−Y (0)] = E[Y (0)−Y (0)]
2 NJ,2 NJ,1 PA,2 PA,1

2x2 DiD estimator
- *
τˆ = Y −Y −(Y −Y ) is unbiased for ATT
NJ,2 NJ,1 PA,2 PA,1
τˆ can be obtained as OLS from the TWFE specification
Y = α˜ +β ˜ +τD +ε
it i t it it
▶ Proof: with 2 periods, the first-differenced equation gives the same τˆ,
−Y β˜+τ −D −ε
Y i2 i1 = (D i2{z i1} )+(ε i2 i1 )
=1[i=NJ]

Problems with 2x2 designs (1)
1. Effectively 4 observations: can’t separate τ from other shocks in NJ relative to PA
These SE are not clustered, and cannot be!

Problems with 2x2 designs (2)
Clustering is necessary: there are state-level fluctuations all the time
(CardandKrueger(2000)foranextendedtimeperiod)

Problems with 2x2 designs (2)
1. Effectively 4 observations: can’t separate τ from other shocks in NJ relative to PA
2. Can’t falsify parallel trends
Solution: have more (pre-)periods and more units
i = A i = B i = C i = D
t = 1
t = 2
t = 3
t = 4
t = E = 5
t = 6

Outline
1 2x2 DiD
2 DiD and event studies with multiple units and periods
3 Discussion of conventional event studies

Causal structure with multiple periods
We continue to write Y = Y (D ) but have in mind three distinct scenarios:
it it it
1. Policy switches on at t = 5 and stays on; has no lagged effects
2. Same but with lagged effects: Y = Y (D ,D )
i6 i6 i5 i6
≡
▶ But in the data, D i5 D i6
⇒
Can’t separate contemporaneous effects of D from delayed effects of D
i6 i5
⇒ Simplify notation to Y (D ), with Y (1)−Y (0) ≡ Y (1,1)−Y (0,0)
i6 i6 i6 i6 i6 i6
3. A single event happens at t = 5 but can have lagged effects: Y = Y (D )
i6 i6 i5
Since D ≡ D , again simplify notation to Y (D )
▶ i5 i6 i6 i6
D = having ever been exposed to the event
▶ it

PTA with multiple units and periods
PTA at the unit level (in a fixed sample):
E[Y (0)−Y (0)] = E[Y (0)−Y (0)] ∀i,j,t
it i,t−1 jt j,t−1
⇐⇒ E[Y ∀i,t
(0)] = α +β
it i t
Or impose PTA at the treatment/control group level (in a random sample):
E[Y (0)−Y E[Y (0)−Y ∀t
i,t−1 (0) G = 1] = i,t−1 (0) G = 0],
it i it i
where G = 1[treatment group]
i i

Static TWFE specification
Assume a balanced panel. Static TWFE specification:
Y = α˜ +β ˜ +τD +ε , D = G × Post
it i t it it it i {z}t
=1[t≥E]
¯ ¯ ¯ ¯
τˆ = (Y −Y )−(Y −Y )
treated,post treated,pre control,post control,pre
Under PTA,
- *
E[τˆ] ¯ +ATT−α¯ −β ¯
= α¯ +β
treated post tre-ated pre *
− α¯ +β ¯ −α¯ −β ¯ = ATT
control post controls pre
which is the avg τ across all treated units and “post” periods
it
This result doesn’t require constant or static effects but it is not very useful with
strong dynamics

Dynamic event study specification
“Event study” dynamic specification:
TX−E
˜ 1[t−E h]×G
Y = α˜ +β + τ = +ε , τ −1 = 0
it i t h i it
h=−(E−1)
τˆ = (Y ¯ −Y ¯ )−(Y ¯ −Y ¯ )
h treated,E+h treated,E−1 control,E+h control,E−1
For h ≥ 0, unbiased for ATT h periods after the event
−1,
For h < unbiased for zero under PTA: yields a “pre-trends” test

Example event study plot
(MixtapeFig. 9.6basedonMilleretal.(2021,Fig. I.E))

Outline
1 2x2 DiD
2 DiD and event studies with multiple units and periods
3 Discussion of conventional event studies

#1: Pre-trend tests are at best suggestive
We imposed parallel trends in Y (0) both pre- and post-treatment
it
Parallel trends after t = E−1 are key and untestable
▶
Parallel trends before t = E−1 are not necessary but make pre-trend tests useful
▶
Never say:
▶ “My identification assumption is parallel pre-trends”
▶ “The pre-trend test passes, which implies that my diff-in-diff strategy is solid”

#2: Justifying PTA ex ante
Design-based approach: assignment into treatment vs control group is random
Balance on levels in addition to trends =⇒ have better tools than DiD! (Roth and
▶
Sant’Anna (2023a))
▶ No need for DiD in RCTs!
Model-based approach: stability of the environment, i.e. unobserved factors
No balance on levels, only on trends
▶
Better with large shocks and in the short-run
▶
Levels vs logs matters (Roth and Sant’Anna (2023b))
▶

PTA in levels vs. logs

Justifying PTA is important
Common bad practice: don’t justify PTA, just check for pre-trends
From David McKenzie’s 2022 blog post (link):
[Three recent QJE] papers all use a variety of statistical methods to assess and
assert the validity of their DiD estimates [...] But I found all three lacking in
providing a discussion of why parallel trends should hold
It is commonplace in papers that use IV to spend a lot of time arguing for the
plausibility of the ultimately untestable exclusion restriction, but I think DiD papers
have not done the same for the untestable assumption about future trends

Example: Yagan (2015)
Studies the effects of the 2003 dividend tax cut from 38.6% to 15%
Treatment group: C-corporations; control group: S-corporations
S-corporations don’t pay dividend tax; otherwise similar taxation
“The identifying assumption is not random assignment of C- versus S-status; it is
that C- and S-corporation outcomes would have trended similarly in the absence of
the tax cut”
Justifications:
1. “C- and S-corporations of the same ages operate in the same narrow industries and
at the same scale”
2. “Contemporaneous stimulative tax provisions applied almost identically”
3. “Key outcomes empirically trended similarly for C- and S-corporations before 2003”

Yagan (2015): Plotting raw data
What would you ask the author?

#3: Pre-testing problems (Roth, 2022)
Estimators of causal effects and pre-trends are correlated, e.g. by using the same
reference period
(Y ¯ −Y ¯ )−(Y ¯ −Y ¯ )
treated,E+h control,E+h treated,E−1 control,E−1
¯ −Y ¯ )−(Y ¯ −Y ¯
vs. (Y )
treated,E−ℓ control,E−ℓ treated,E−1 control,E−1
Suppose you only report the results if some pre-trend test doesn’t reject
(“pre-testing”)
If PTA holds, you are distorting inference for causal effects
If PTA doesn’t hold, you are changing the bias; under some conditions increase it

#4: Event studies conflate estimation and testing
Borusyak et al. (2024):
If PTA holds, why not use all pre-periods for more eﬀicient estimation?
X
˜ 1[t−E h]×G
Y = α˜ +β + τ = +ε
it i t h i it
h≥0
with all t < E as reference periods (τˆ = (Y ¯ −Y ¯ )−(Y ¯ −Y ¯ ))
h tr,E+h tr,pre co,E+h co,pre
Testing PTA is a separate exercise: using untreated data only,
X−1
˜
Y = α˜ +β + τ 1[t−E = h]×G +ε
it i t h i it
h=−L
E−L ¯ −Y ¯ )−(Y ¯ −Y ¯
with t < reference periods (τˆ = (Y tr,t<E−L co,t<E−L ))
h tr,E+h co,E+h

#5: Pre-trend tests are not always conceptually informative
Mann and Pozzoli (2024) study the effects of low-skill immigration into Danish
municipalities on industrial robot adoption by firms in 1995-2019
How informative are their regressions of pre-period (1993-95) changes in robot
adoption and other variables on the 1995-2019 change in low-skill immigration?

#6: Pre-trend tests are not always powerful (Roth, 2022)
E.g. He and Wang (2017) study the effects of college-graduated bureaucrats placed to
Chinese villages on a measure of poverty
(FromJonathanRoth’sMixtapeSessionslides)

#6: Pre-trend tests are now always powerful (Roth, 2022)
(FromJonathanRoth’sMixtapeSessionslides)
“The estimated coeﬀicients on the leads of treatment ... are statistically indifferent
from 0. ... We conclude that the pretreatment trends in the outcomes in both
groups of villages are similar, and villages without [treatment] can serve as a
suitable control group for villages with [treatment] in the treatment period.”

#6: Pre-trend tests are now always powerful (Roth, 2022)
(FromJonathanRoth’sMixtapeSessionslides)

The “Straight line test”
The more nonlinearity is needed to kill the effects, the more robust the results are
See Stata and R package pretrends accompanying Roth (2022)
Having many pre-periods is also important

References I
Borusyak, K., X. Jaravel, and J. Spiess (2024): “Revisiting Event Study Designs: Robust and
Eﬀicient Estimation,” Review of Economic Studies, 91, 3253–3285.
Card, D. and A. Krueger (1994): “Minimum Wages and Employment: A Case Study of the
Fast-Food Industry in New Jersry and Pennsylvania,” The American Economic Review, 84, 772–793.
——— (2000): “Minimum Wages and Employment: A Case Study of the Fast-Food Industry in New
Jersey and Pennsylvania: Reply,” American Economic Review, 90, 1397–1420.
Goldsmith-Pinkham, P. (2024): “Tracking the Credibility Revolution across Fields,” Working
Paper.
He, G. and S. Wang (2017): “Do College Graduates Serving as Village Oﬀicials Help Rural China?”
American Economic Journal: Applied Economics, 9, 186–215.
Mann, K. and D. Pozzoli (2024): “Robots and immigration,” Journal of Economic Behavior &
Organization, 227, 106708.
Miller, S., N. Johnson, and L. R. Wherry (2021): “Medicaid and Mortality: New Evidence
From Linked Survey and Administrative Data,” The Quarterly Journal of Economics, 136,
1783–1829.

References II
Roth, J. (2022): “Pre-test with Caution: Event-study Estimates After Testing for Parallel Trends,”
American Economic Review: Insights, 4, 305–322.
Roth, J. and P. H. Sant’Anna (2023a): “Eﬀicient Estimation for Staggered Rollout Designs,”
JPE: Micro, arXiv: 2102.01291.
——— (2023b): “When Is Parallel Trends Sensitive to Functional Form?” Econometrica, 91.
Yagan, D. (2015): “Capital Tax Reform and the Real Economy: The Effects of the 2003 Dividend
Tax Cut,” American Economic Review, 105, 3531–3563.
