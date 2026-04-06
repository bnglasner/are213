Part F: Spillovers Effects.
Shift-Share and Other Formula Instruments
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

F Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs
Readings: Borusyak and Hull (2023, BH), Borusyak, Hull, and Jaravel (2022)
See also reviews by Borusyak, Hull, and Jaravel (2025b,a)

Recap of interference
With interference/spillover effects, potential outcomes are Y(d ,...,d )
i 1 N
⇒ There are many types of causal estimands
Direct effects: Y(1,d )−Y(0,d ) for fixed d , e.g. Y(1,0 )−Y(0,0 )
i −i i −i −i i −i i −i
)−Y
▶ or Y (1,D−i (0,D−i ) for realized D−i
i i
′
Indirect effects: Y(d,d )−Y(d,d ), e.g. Y(0,1 )−Y(0,0 )
i i −i i i −i i −i i −i
Aggregate effects:
∑
E.g. realized vs none: 1 (Y (D)−Y (0))
▶ i i
N i
∑
Global treatment effect: 1 (Y (1)−Y (0))
▶ i i i
N

Example: Munro (2025)
Effect of randomly giving information about good schools to low-income families in
Chile on their enrollment in good schools (from Allende et al. (2019))
Munro(2025),Fig.2

Bipartite interference
We can also have treatments assigned to intervention units k = 1,...,K
different from outcome units i
d = training for Uber driver k; Y = revenue from customer i
▶ k i
▶ d = installing filters at manuf. plant k; Y = pollution at location i
k i
▶ d = import tariff in industry k; Y i = employment in region i
k
d = dummy of railway line k opening; Y = employment in region i
▶ k i
Potential outcomes Y(d ,...,d ) (No direct effects here)
i 1 K

What can we do?
If all outcome can be arbitrarily affected by all treatments, we can’t learn anything
We’ll use a network: which i and k are connected, how far they are
▶
▶ And put some structure or limits on interference
▶ (One alternative: interference through markets; Munro et al. (2025); Munro (2025))
Approach #1: local interference
▶ Assume Y can only depend on d if dist(i,k) < M (but dependence can be complex
i k
and unknown)
E.g. only my friends’ treatments affects my outcome
▶

Example: Estimating local geographic spillovers with DiD
E.g. treat some buildings, allow and estimate average effects within 200m and 400m via
DiD imputation

Example 2: Estimating direct effects in spatial RD
In some spatial RDs spillovers are very important
▶ Comparing places just around the boundary is a terrible idea
One approach: “donut” RD (see Noack and Rothe (2023), Auerbach et al. (2025))
▶ What do you think of this idea?
X = signed distance from the boundary
i (figurefromDowd(2021))

What can we do? (2)
Approach #2: interference through suﬀicient statistics, “exposure mappings”
Y depends on d via a small number of known statistics
i
∑
E.g. d and number of treated friends, d
i k∈neighbors(i) k
Or more complex: network distance to the nearest treated person
Linear version:
∑
Y(d) = β d +β d +Y(0)
i 1 i 2 k i
k∈neighbors(i)

What can we do? (3)
Approach #3: interference through outcomes
E.g. linear-in-means model of endogenous peer effects:
¯
Y = τD +θY +ε
i i neighbors(i) i
Not a coherent potential outcome formulation: can’t have cyclical causal effects
▶ But the solution yields a reduced-form Y i (d)
Rather, a game, e.g. with simultaneous moves
OLS estimation of Y = βD +θY ¯ +ε does not work
i i neighbors(i) i
▶ Correlation of ε among neighbors creates endogeneity (reflection problem) even if
i
neighbors are randomly assigned

Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

Constructed (“Formula”) treatments and instruments
Many treatments (in OLS) and instruments (in IV) are:
▶ constructed from multiple sources of variation using a formula/algorithm
▶ with some as-good-as-random sources of variation, while others are not

Example: Miguel and Kremer (2004)
Spillover effects of deworming kids in Kenya
∈ I
▶ Y i = educational achievement of student i
D = the number of i’s neighbors (students who go to school within a certain
▶ i
distance from i) within I who have been dewormed
Implicitly constructed from two sources of variation:
▶ Who neighbors whom: w = 1[k is a neighbor of i]
ik
▶ Who got dewormed: g k = 1[k was dewormed]
∑
▶ We can express as a “formula”: D = N w g
i k=1 ik k
Deworming is randomized
▶ Is it correct to consider D as-good-as-random and estimate Y = τD +ε by OLS?
i i i i
▶ What can we do to avoid OVB?

Variation 1: Nonlinear spillovers
Now suppose D = dummy of having at least one dewormed neighbor
i
Can we represent it as a formula in terms of the same w and g ? D = max w g
▶ ik k i k ik k
Suppose girls were dewormed with prob. 50%, while boys with prob. 25%
What could cause OVB here?
What should we control for?

Variation 2: Imperfect takeup
Suppose again D = number of dewormed friends
i
▶ But only offer g was randomized, while some kids didn’t take up
k
Can we represent D as a formula in terms of w and new g ?
i ik k
What would you do?

Answer key: Miguel and Kremer
In this RCT, is it correct to estimate Y = τD +ε by OLS?
i i i
̸⇒
▶ No! Randomizing deworming randomizing the number of dewormed neighbors
▶ Kids in denser areas will systematically have more dewormed neighbors (higher D )
i
They may also have systematically different ε , leaving to OVB
▶ i
How to fix this? Control for the total number of neighbors
With that control, randomization of g implies as-good-as-random D
▶ k i
Alternatively, instrument D with D −Total # of neighbors ×Prob of deworming
i i i

Answer key: Nonlinear spillovers
We can represent the treatment as an explicit formula, D = max w g
i k ik k
▶ But it is not necessary: any algorithm f i (w,g) is already a “formula”
Two reasons for OVB:
⇒
▶ More neighbors higher probability of having a dewormed neighbor
More girls among neighbors ⇒ same
▶
Suﬀicient to control for the probability of having a dewormed neighbor
Computed analytically as a function of neighbors of each sex
▶
▶ Or just by simulating the randomization protocol many times

Answer key: Incomplete takeup
D is no longer fully determined by {w } and {g }
i ik k
▶ But we can construct a candidate IV for D i that is a formula: the number of
neighbors invited for deworming
Reduced-form & first-stage are not causal yet: would compare kids with more vs.
fewer neighbors
▶ Controlling for the total number of neighbors does the job

Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

Non-random exposure to exogenous shocks
Borusyak and Hull (2023, BH) setup: Y = τD +ε, constant linear effects
i i i
▶ Extensions to heterogeneous effects, other controls, multiple treatments, panel data
Consider a candidate instrument Z = f(g;w), where g = (g ,...,g ) are shocks,
i i 1 K
w collects predetermined variables, f are known formulas
i
▶ Nests reduced-form regressions when D = Z
i i
⊥⊥ ⊥⊥
Assumption 1: Shock exogeneity, g ε w (or g (ε,w))
{w }
▶ E.g. g = deworming assignment; w = ik ,gender
k
⋆ Note w enters the formula and gender enters the DGP of g
ik k
▶ Exclusion: shocks g don’t causally affect Y other than through D
i i
▶ Independence: g is assigned independently of potential outcomes, conditionally on w
⊥⊥
Importantly, we do not assume ε w

Formal results
Define the expected instrument µ = E[f(g;w) w]
i i
Theorem: µ is the sole confounder generating OVB under Assumption 1,
i
[ ] [ ]
∑ ∑
1 1
E Zε ̸= 0 in general but = E µε
i i i i
N i N i
▶ Exercise: Prove it!
˜
⇒ The recentered instrument Z = Z −µ is a valid instrument for D:
i i i i
[ ]
∑
1
E Z ˜ ε = 0.
i i
N
i

Formal results (2)
Instrumenting D with Z and controlling for µ also identifies τ
i i i
Because numerically equivalent to IVing with Z˜ while controlling for µ
▶ i i
▶ Given recentering, control for µ does not matter in large samples
i
Recentered fn’s of (g,w) are the only IVs guaranteed to be valid by Assumption 1
▶ Otherwise, need to restrict ε, like in DiD
∫
E[f(g;w) ≡
To recenter, need to measure µ = w] f(g;w)dG(g w)
i i i
▶ If the shock DGP G(g w)) is known (e.g., randomization protocol), just simulate it
▶ In observational data, can use appropriate permutations of g (example below)
˜
Consistency: with many shocks and weak dependence of Z across i
i
Robustness to heterogeneous effects: identify a convex average of ∂Y/∂D under
i i
non-causal first-stage monotonicity

Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

Application: Effects of railway upgrades
BH study the employment effects of the Chinese high-speed railway system
Observe 83 lines open by 2016 (also 66 planned but not yet opened lines)

First task: Specifying exposure mapping(s) D
i
A dummy of (at least one) line passing through city i?
▶ Wouldn’t capture the effects on neighboring cities
Distance to the nearest line, computed from line locations and location of city i?
BH choose a version suggested by models of economic geography:
▶ Railways reduce travel time to big cities and thus increase regional “market access”
∆Y = τ∆logMA +ε
i i i
∑
N
where MA = TravelTime(loc,loc ,g ) −1Pop , t = 0,1
it i k t k
k=1
▶ g t is transportation network
▶ loc is region’s location on the map
k
▶ Pop is time-invariant regional population [what if it changes endogenously?]
k
▶ ε is effects of unobserved local shocks (e.g. productivity)
i

Realized 2016 network and MA growth

OVB problems & recentering solution
Lines are not randomly placed: e.g. tend to connect big cities
▶ And even if they were randomly placed, MA would still grow more near big cities!
=⇒
▶ Big cities and cities nearby can be on different trends from rest of country OVB
Conventional strategy: throw ad hoc covariates
Recentering approach: view one component of MA growth as a natural experiment
▶ BH assume exogenous timing of lines: it’s random which lines get built first, within
groups of lines of similar length
▶ g = opening status of 149 planned lines by 2016
▶ w = city locations and populations, set and grouping of planned lines, pre-HSR
transportation

Actual vs. counterfactual MA growth
Actual 2016 network Example counterfactual 2016 network
Draw 1,000 simulated HSR networks by permuting opening statuses of lines
randomly within groups
▶ Recompute MA growth of each city; then take the average across simulations

Expected and recentered MA growth
Expected MA growth Recentered MA growth
Treated/control group: regions with MA growth higher/lower than expected
Valid comparison if realized and counterfactual networks are equally likely

Testing the specification of counterfactuals
Recentered instrument should be uncorrelated with predetermined observables

Employment effects of HSR
Column 2 instruments realized MA with recentered MA
Column 3 is OLS controlling for expected MA

Inference
Complication: recentered MA is correlated across all regions
▶ A long line affects many regions across the country
˜
Approach 1: restrict dependence of ε and thus Zε
i i i
Spatially-clustered SE
▶
Approach 2: leverage randomness of shocks, allowing unrestricted dependence of ε
i
▶ Randomization inference [for any recentered IV with constant causal effects, not
only spatial]
(Later: Asymptotic solution when Z takes the shift-share form)
▶ i

Randomization inference leveraging shock randomness
To test the sharp null τ = b (assuming constant effects), compute statistic
∑
1
−bD)(f(g;w)−µ(w))
T(g) = (Y
N i i i i
i
g(s),
For many simulated counterfactual shock vectors compute
∑ ( )
1
T(g(s)) −bD) f(g(s);w)−µ(w)
= (Y
N i i i i
i
T(g(s))
Check that T(g) is not in the tails of the distribution of
(g(s),w)
▶ If τ = b holds, no reason for ε to correlate with more f (g,w) than f
i i i
▶ But if τ ̸= b, T(g(s)) are centered around 0 while T(g) is not
Tests and confidence intervals (by test inversion) are valid in finite samples, with
no assumptions on ε
T(g;Y−bD,w)
This statistic is natural but any statistic would work, too

Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

Example: Simulated instruments
Currie and Gruber (1996a,b) study the effects of Medicaid eligibility on health
▶ OLS is surely biased because richer households are less likely to be eligible
Assume variation in eligibility policy across states is exogenous
▶ But policy is a complicated object: set of eligibility rules
▶ Construct a scalar measure of policy generosity as IV
▶ “Simulated instrument”: % of population nationally that would be eligible under
policy of i’s state

Simulated instruments
What do you think of the simulated instrument: Exogeneity? Relevance?
How can we recast household i’s Medicaid eligibility D as a formula treatment?
i
What is a household’s expected eligibility? How can we control for it?
What is the benefit of this approach over simulated IV?
What if D = Medicaid takeup, rather than eligibility?
i

Application to Obamacare
Borusyak and Hull (2025) estimate crowding-out effects of Medicaid takeup (D)
i
on private health insurance (Y)
i
Leverage eligibility expansions to 146% of the federal poverty line under the
Affordable Care Act
▶ 11 of 13 states with Democratic governor, 8 of 30 states with Republican governor
▶ View expansion decisions as random across states with same-party governors, but
not household demographics or pre-2014 policy
Compare two IVs:
▶ Simulated IV: expansion dummy (controlling for governor’s party)
▶ Recentered IV: predict eligibility from expansion decisions & non-random
demographics, and recenter
By not fearing non-random exposure, recentered IV has much better first-stage
~2x smaller standard errors
▶

More examples
Number of days of extreme heat measured from the local crop composition, their
temperature thresholds, and local weather
(Hsiao, Moscona, and Sastry (2025), Zappala (2025))
Radio signal strength, predicted from country’s topography and location of
transmitters (Olken (2009), Yanagizawa-Drott (2014))
IVs from partially-randomized assignment mechanisms, e.g. for charter schools
(Abdulkadiroglu et al. (2017), Narita and Yata (2023))
Linear [and nonlinear] shift-share instruments...

Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

Shift-share IV
General structure of shift-share IV (SSIV):
∑K
Z = S g
i ik k
k=1
g ,...,g are a set of common shifts not specific to i
▶ 1 K
∑
▶ S ik are exposure “shares” (weights), often with S ik = 1 for all i
k

Example 0: Linear spillovers
Cai, De Janvry, and Sadoulet (2015): spillover effects of randomized information
about an insurance product
▶ Y i = person i takes up the insurance product
D = the fraction of i’s friends who were given the information
▶ i
▶ Use OLS: Z = D
i i
Not usually understood as a shift-share design, but it is:
∑N
1[i and k are friends]
Z = ·Treated
i # of i’s friends k
k=1

Example 1: Labor supply
Consider the (inverse) regional labor supply equation: ∆w = τ∆L +ε
i i i
▶ ∆w = log-change in region i’s average wage over some period
i
▶ ∆L = log-change in i’s employment
i
ε = labor supply shocks (e.g. migration, UI benefits)
▶ i
Need a regional labor demand shock as IV
Regional labor demand combines demand for different industries k:
∑
▶ ∆L ≈ S ∆L
i k ik ik
▶ ∆L = log-change of k-specific employment in i
ik
S = initia l share of k in i’s employment
▶ ik
∑
Consider Z = S g , replacing ∆L with national industry shifts g
i k ik k ik k
▶ E.g. g k = randomized subsidy
▶ Bartik (1991): g = observed growth rate of industry employment
k

Example 2: Enclave instrument for migration
Consider the (inverse) elasticity of substitution between native and immigrant
workers
Immigrantwage Immigrantemployment
▶ ∆log i = τ∆log i +ε i
Nativewage Nativeemployment
i i
ε = change in relative labor demand in region i
▶ i
Need a relative labor supply shock as IV
▶ New immigrants from country k tend to go where there are historic enclaves of k’s
immigrants
Z = migration intensity prediction from historic enclaves & some “push shocks”
i
▶ g k = dummy of war in k (Llull (2017)) or observed national migration rate from k
(Card (2009))
▶ S = initial share of origin k in i’s population
ik

The SSIV exogeneity challenge
How should we think about SSIV exogeneity, E[Zε] = 0?
i i
▶ Which properties of the shifts and/or shares can make Z i exogenous?
▶ Do we need exogeneity of both shifts and shares, or just one?
▶ What is exogeneity of shifts, which don’t vary across i?
▶ What is exogeneity of shares, which are measured in a pre-period?
Two narratives + sets of suﬀicient conditions (plausible in different applications):
▶ “Many exogenous shifts” (Borusyak, Hull, and Jaravel (2022); BHJ):
leveraging a shift-level natural experiment, translated to the observation level
▶ “Exogenous shares” (Goldsmith-Pinkham, Sorkin, and Swift (2020); GPSS):
pooling diff-in-diffs based on heterogeneous exposure shares

Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

Identification from many exogenous shifts
Suppose the shifts are as-good-as-random: E[g | all errors and all shares] = α
k
∑ ∑
Then the expected instrument is µ = E[ S g S,...,S ] = α S
i ik k i iK ik
k k
▶ If the shares add up to one, µ = const =⇒ no corrections are needed
i
▶ Note: No need to run 1,000 simulations, or to know the joint CDF of shifts
Intuition: A weighted average of as-good-as-random shifts is as-good-as-random
▶ If industries with high vs. low g are comparable, regions specializing in those
k
industries are comparable
True whatever the initial shares are: we don’t require Cov[S ,ε]=0
⋆ ik i
▶ The SSIV allows to translate random variation across k into random variation
across i (under appropriate exclusion)

Consistency
∑
Proposition: 1 Zε → 0 if
i i
N i
∑ ∑
1. Weaker notion of shift exogeneity: g k are uncorrelated with ε¯ k = S ik ε/ i S ik
i i
∑ ∑
2. The effective number of shifts is large: N = 1/ s2 → ∞ for s = 1 S
eff k k k N i ik
3. Shares add up to one for each observation
∑ ∑ ∑
1 1
Holds because Zε = S g ε = s g ε¯ , by changing the order of
N i i i N i,k ik k i k k k k
summation

“Incomplete shares” case
∑
What if S ̸= 1, so Z is a weighted sum, not weighted average?
ik i
k
Then randomization of subsidies does not make Z as-good-as-random
▶ i
E.g. subsidies are only in manufacturing industries k
▶ Regions with more manufacturing will mechanically get higher Z , potentially
i
creating bias
∑
But recall that the expected instrument is µ = α· S
i ik
k
∑
Thus, controlling for S avoids OVB
▶ k ik

Shift-level controls
What if shifts are as-good-as-random only after controlling for some q ?
k
In an industry-level regression you’d control for q . But what about a SSIV
▶ k
regression?
∑
Expected instrument is µ = S (α +α q )
i k ik 0 1 k
∑ ∑
▶ To avoid OVB, it’s suﬀicient to control for S and S q
k ik k ik k
E.g. industry subsidies are random only controlling the dummy of hi-tech industries
▶ Control for the total local share of hi-tech industries
Then you leverage variation between regions with similar composition of hi- and
▶
low-tech industries but different exposure to subsidies within each group

Shift-level (“exposure-robust”) standard errors
Unusual clustering problem: observations with similar shares are exposed to the
same shocks, both g and unobserved ν
k k
▶ Conventional clustering of SE (e.g. by state) wouldn’t capture that
∗
▶ Adao, Kolesar, and Morales (2019) generate placebo shifts g and find a significant
k
reduced-form in ~50% simulations
If each region was exposed to just one industry, we’d cluster by industry
▶ But how to do it in a “fuzzy” case?
Adao et al. derive a formula that leverages mutual independence of g , regardless
k
of clustering of ε
i

Shift-level (“exposure-robust”) standard errors (2)
BHJ propose a convenient solution:
▶ SSIV estimate is exactly equal to the estimate from a special shift-level regression
with g as the IV
k
Y¯⊥ τD¯⊥ ′
= +γ q +ε¯ ,
k k k k
∑ ∑ ∑
V¯⊥ ⊥ ⊥
weighted by s = 1 S , where = S V / S and V is residual from
k N i ik k i ik i ik i
the regression of V i on included i-level controls
▶ In Stata and R, package ssaggregate helps run this special IV regression
▶ Then use robust or clustered SE in the way you’d do it for any other regression
leveraging these shifts

Application: “China shock” (Autor et al. (2013), ADH)
ADH study the effects of import competition on local labor market outcomes
Region i = commuting zone (N = 722)
Industry k = SIC4 manufacturing industry (K = 397)
Two periods t: 1991–2000 and 2000–2007
Y = local change in manufacturing employment rate
it
D = local growth of exposure to Chinese imports:
it
∑
∆US imports from China
D = Initial emp share · kt
it ikt
Initial employment
kt
manuf. ind. k
Control for period FE and some initial regional characteristics, including total
manufacturing share of employment

ADH’s shift-share approach
OLS can be biased: imports grow in industries and regions where US productivity
growth is slow
Idea: use industry productivity growth in China as shifts
▶ Construct a proxy: import growth from China in other countries (e.g. Europe)
▶ Requires (1) China productivity to be exogenous and (2) productivity growth in the
US and Europe to be uncorrelated
∑
SSIV: Z = S g where
it ikt kt
k
∑
▶ S ikt = 10-year lagged share of k in total employment of i; S ikt = lagged total
k
share of manufacturing in employment
▶ g = growth of Chinese imports in eight non-US countries in $1,000/US worker
kt
The shifts are the IV in the industry-level analysis in Acemoglu et al. (2016)

BHJ revisit ADH
Step 1: Picking controls
Hypothesize that shifts g are as-good-as-random controlling for period FEs q
kt t
Regional regression should thus control for
( )
∑ ∑
S q = S ×q
ikt t ikt t
k k
i.e. lagged total share of manufacturing interacted with period dummies
Also consider the industry controls from Acemoglu et al., e.g. initial skill intensity
of the industry

BHJ revisit ADH
Step 2: Balance tests to falsify conditional as-good-as-random shift assignment:
Shifts are uncorrelated with industry observables, controlling for period FE
SSIV is uncorrelated with regional observables, controlling for period FE × lagged
total manuf. share

BHJ revisit ADH
Step 3: Obtain the estimates, including the necessary controls and with SE from the
equivalent industry-by-year level IV regression
Controls are important: China shock g is larger in the 2000s (post WTO entry)
kt
when overall manuf. decline is stronger for other reasons

Shift-share meets RD
“RD aggregation”: D = fraction of women in the state House
i
An aggregate across seat-specific elections
▶
▶ Can instrument with Z = fraction of women who won in close races against men
i
“RD spillovers”: D = number of neighboring states with Democratic governor
i
▶ An aggregate across elections in neighboring states
▶ Can instrument with Z i = number of neighbors where Democrat won in a close race
Z = shift-share IV with RD dummies as shifts
i
▶ Borusyak and Kolerman-Shemer (2024) extend local linear estimation
(key: shifts are only approximately random)
▶ See also Borusyak and Hull (2023) and Narita and Yata (2023) via recentering

Outline
1 Modeling and estimating spillover effects
2 Formula treatments/instruments and recentering
Example: parametric spillover effects
General setting
Application: Chinese high-speed railways
Other examples
3 Shift-share treatments/instruments
SSIV as leveraging a shift-level natural experiment
SSIV as combining diff-in-diffs

Motivating example: Mariel Boatlift (following Card (1990))
Consider the substitution elasticity between demand for migrant and native labor
D = ∆ relative immigrant/native employment, Y = ∆ relative wage
▶ i i
Many Cubans arrive in the US in 1980 for exogenous reasons
⇒ Local arrival rate of Cubans is relevant
But violates exogeneity if they settle in areas with growing demand for their labor
▶
Consider instrumenting local immigration rate with the initial share of Cubans
▶ Relevance: new Cubans tend to go to places with a lot of Cubans
▶ Exogeneity: parallel outcome trends in places with high vs. low initial Cuban share
⋆ Violated if factors that attracted Cubans in the past are correlated with today’s trends
∑
·1+ ·0
This is a simple shift-share IV: Z = S S
i i,Cubans k̸=Cubans ik
▶ Justified by parallel trends in outcomes, not a natural experiment in shifts

Exogenous shares approach: Pooling diff-in-diffs
This logic generalizes to having multiple shocked countries
▶ Goldsmith-Pinkham, Sorkin, and Swift (2020) develop this view
Assume exogenous shares: Cov[ε,S ] = 0 for every k
i ik
▶ With Y i measured in differences, this is K parallel trends assumptions
▶ Strong assumption even though shares are measured in the pre-period
▶ Wrong interpretation of exogeneity: “shares are not affected by ε i ” (they can’t be)
▶ Correct: “all unobservables are uncorrelated with everything about local shares”
▶ Rules out any unobserved ν k shocks that affect regions based on S ik
Then we have K valid IVs: S ,...,S
i1 iK
∑
▶ SSIV Z i = k S ik g k is one reasonable way to combine them
▶ 2SLS (for small K) and LIML are other reasonable ways
▶ Or just use your favorite share (e.g. of Cubans)

Rotemberg weights
If you insist on using SSIV (and not LIML), GPSS recommend computing the
importance of each share: Rotemberg weights αˆ
k
∑
▶ τˆ = αˆ τˆ for τˆ that uses S as IV one at a time
k k k k ik
▶ αˆ are higher for k with more extreme shifts and larger first stages
k
▶ αˆ add up to one but need not be positive
k
Then scrutinize validity of the share IVs with highest Rotemberg weights

Summary of two approaches to shift-share IV
Two sets of narratives & suﬀicient conditions for SSIV validity
▶ Pick one ex ante, then validate ex post
Many exogenous shifts is appropriate when you could imagine using your shifts
as IV in a shift-level analysis
Exogenous shares is appropriate when you would be OK using any other
combination of shares as the IV

More shift-share IV examples (Borusyak et al. (2025b))

Conclusion: Formula and shift-share IV
The goal is for you to have an instinct to:
Identify settings with formula and shift-share treatments/instruments
Ask which determinants are as-good-as-random and which are non-random
Understand what it means to call your shocks as-good-as-random, by thinking of
counterfactuals shocks
Recognize that OVB is possible even with as-good-as-random shocks
Know how to fix OVB, via “recentering” (or simpler controls with shift-shares)

References I
Abdulkadiroglu, A., J. D. Angrist, Y. Narita, and P. A. Pathak (2017): “Research
Design Meets Market Design: Using Centralized Assignment for Impact Evaluation,” Econometrica,
85, 1373–1432.
Acemoglu, D., D. H. Autor, D. Dorn, G. H. Hanson, and B. Price (2016): “Import
Competition and the Great U.S. Employment Sag of the 2000s,” Journal of Labor Economics, 34,
S141–S198.
Adao, R., M. Kolesar, and E. Morales (2019): “Shift-Share Designs: Theory and Inference,”
Quarterly Journal of Economics, 134, 1949–2010.
Allende, C., F. Gallego, and C. Nielson (2019): “Approximating the Equilibrium Effects of
Informed School Choice,” Working Paper.
Auerbach, E., Y. Cai, and A. Rafi (2025): “Regression Discontinuity Design with Spillovers,”
Working Paper, arXiv:2404.06471 [econ].
Autor, D. H., D. Dorn, and G. H. Hanson (2013): “The China Syndrome: Local Labor Market
Impacts of Import Competition in the United States,” American Economic Review, 103, 2121–2168.

References II
Bartik, T. J. (1991): Who Benefits from State and Local Economic Development Policies?, W. E.
Upjohn Institute for Employment Research.
Borusyak, K. and P. Hull (2023): “Non-Random Exposure to Exogenous Shocks,”
Econometrica, 91, 2155–2185.
——— (2025): “Optimal Formula Instruments,” Working Paper.
Borusyak, K., P. Hull, and X. Jaravel (2022): “Quasi-Experimental Shift-Share Research
Designs,” Review of Economic Studies, 89, 181–213.
——— (2025a): “Design-Based Identification with Formula Instruments: A Review,” Econometrics
Journal, 83–108.
———(2025b): “APracticalGuidetoShift-ShareInstruments,” JournalofEconomicPerspectives, 39.
Borusyak, K. and M. Kolerman-Shemer (2024): “Regression Discontinuity Aggregation, with
an Application to the Union Effects on Inequality,” Mimeo.
Cai, J., A. De Janvry, and E. Sadoulet (2015): “Social Networks and the Decision to Insure,”
American Economic Journal: Applied Economics, 7, 81–108.

References III
Card, D. (1990): “The Impact of the Mariel Boatlift on the Miami Labor Market,” ILR Review, 43,
245–257.
——— (2009): “Immigration and Inequality,” American Economic Review: Papers & Proceedings, 99,
1–21.
Currie, J. and J. Gruber (1996a): “Health Insurance Eligibility, Utilization of Medical Care, and
Child Health,” The Quarterly Journal of Economics, 111, 431–466, iSBN: 00335533.
——— (1996b): “Saving Babies: The Eﬀicacy and Cost of Recent Changes in the Medicaid Eligibility
of Pregnant Women,” Journal of Political Economy, 104, 1263–1296.
Goldsmith-Pinkham, P., I. Sorkin, and H. Swift (2020): “Bartik Instruments: What, When,
Why, and How,” American Economic Review, 110, 2586–2624.
Hsiao, A., J. Moscona, and K. A. Sastry (2025): “Food Policy in a Warming World,” Working
Paper.
Llull, J. (2017): “The effect of immigration on wages: Exploiting exogenous variation at the
national level,” Journal of Human Resources, 53, 608–662.

References IV
Miguel, E. and M. Kremer (2004): “Worms: Identifying impacts on education and health in the
presence of treatment externalities,” Econometrica, 72, 159–217.
Munro, E. (2025): “Causal Inference under Interference through Designed Markets,”
ArXiv:2504.07217 [econ].
Munro, E., X. Kuang, and S. Wager (2025): “Treatment Effects in Market Equilibrium,”
American Economic Review, 115, 3273–3321.
Narita, Y. and K. Yata (2023): “Algorithm as Experiment: Machine Learning, Market Design,
and Policy Eligibility Rules,” Working Paper, arXiv:2104.12909 [econ].
Noack, C. and C. Rothe (2023): “Donut Regression Discontinuity Designs,” Working Paper,
arXiv:2308.14464 [econ].
Olken, B. A. (2009): “Do television and radio destroy social capital? Evidence from indonesian
villages,” American Economic Journal: Applied Economics, 1, 1–33.
Yanagizawa-Drott, D. (2014): “Propaganda and conflict: Evidence from the Rwandan genocide,”
Quarterly Journal of Economics, 129, 1947–1994.
Zappala, G. (2025): “Propagation of extreme heat in agriculture across sectors and space,” Working
Paper.
