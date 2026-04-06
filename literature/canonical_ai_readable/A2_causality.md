Part A: Regression and causality
A2: Potential outcomes and RCTs
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

Outline
1 The basics: Potential outcomes, average causal effects, and RCTs
Other estimands
2
Conceptual issues with the potential outcome framework. Alternative frameworks
3
4 Complex RCTs
5 (Skipped) Causality or prediction?

(Neyman-)Rubin causal model
Consider some population of units i
Each unit is observed one of several treatment conditions D 2 D
i
E.g. 2 f0,1g: untreated and treated
▶ D
Suppose we can imagine each unit under all possible conditions
(in the same period)
Causality always requires specifying alternatives
▶
fY 2 Dg
▶ Corresponding potential outcomes are i (d): d
e.g. (Y(0),Y(1)) (equivalently written as (Y ,Y ))
⋆ i i 0i 1i
⋆ e.g. demand function Q(p)
i
′ )-Y
▶ Causal effects Y i (d i (d) are defined by this abstraction
▶ Writing Y (d) encodes a possibility that D impacts Y
i i i

Rubin causal model (2)
fY(d): 2 Dg
Unobserved vars: Y(0),Y(1) (or d in general)
i i i
Observed vars: treatment status D; realized outcome Y
i i
Restriction: {
Y(0) if D = 0
i i
Y =
i
Y(1) if D = 1
i i
(1)-Y (0))*D )
▶ Can write it as Y = Y (0)+(Y Y (0)+τ D with
i i i i i i i i
Y(1)-Y(0)
τ = (causal effect)
i i i
▶ Or as Y i = Y i (D i ) in general
(More restrictions will come from experimental design, theory/contextual
▶
knowledge, or out of the blue)

Fundamental problem of causal inference
We cannot learn the causal effect Y(1)-Y(0) for any particular unit without
i i
strong assumptions
“Fundamental problem of causal inference”: multiple potential outcomes are never
▶
observed at once
i D Y Y(0) Y(1) Y(1)-Y(0)
1 1 Y ? Y ?
1 1
2 0 Y 2 Y 2 ? ?
3 0 Y Y ? ?
3 3
...
N 1 Y N ? Y N ?

Good news
... But we can sometimes learn some averages
E.g. Average structural function d 7! E[Y(d)]
i
E[Y (0)]: what if nobody was treated
▶ i
E[Y (1)]: what if everyone was treated
▶ i
Causal inference can be understood as a missing data problem:
) E[Y j E[Y j
▶ Y i (1) is observed for treated units we know i (1) D i = 1] = i D i = 1]
E[Y j
▶ ... but not for untreated units. We need to impute (1) D = 0]
i i

Weakly causal estimands
Averages of causal effects: E[ω *(Y(1)-Y(0))]/E[ω]
i i i i
for observed or unobserved weights ω
i
>=
▶ A weakly causal estimand when ω 0 for all i
i
(see Blandhol et al. (2025) for non-binary D)
i
>=
▶ This precludes sign reversals: when Y i (1) Y i (0) for all i but estimand < 0
▶ (See pset for an estimator that can produce a non-convex average of effects)

Most common causal estimands
Average treatment/causal effect: ATE = E[Y(1)-Y(0)] = E[Y(1)]-E[Y(0)]
i i i i
▶ The effect of treating everyone relative to not treating anyone
▶ ATE is the same regardless of how D is actually determined
i
Average effect on the treated: ATT = E[Y(1)-Y(0) j D = 1], a.k.a. TOT, TT
i i i
▶ ATT depends on how selection into treatment happened (e.g. RCT vs
self-selection)
The effect of treating those who were treated relative to not treating anyone:
▶
E[Y -Y(0)] = E[(Y(1)-Y(0))*D] = ATT*P(D = 1)
i i i i i i
E[Y(1)-Y(0) j
Average effect on the untreated: ATU = D = 0]
i i i

When is “correlation” causal?
All these estimands follow from the distribution of (Y(1),Y(0),D). But are they
identified from observed (Y,D)?
β = E[Y j D = 1]-E[Y j D = 0] (Difference in means)
OLS
= E[Y j D = 1]-E[Y j D = 0]
1 0
= E[Y -Y j D = 1] (ATT)
1 0
+(E[Y j D = 1]-E[Y j D = 0]) (Selection bias)
0 0
Selection bias = 0 and β = ATT iff Y is mean-independent of D:
OLS 0
E[Y j D = 1] = E[Y j D = 0] = E[Y ]
0 0 0
ATE = ATT iff (Y -Y ) is mean-independent of D:
1 0
E[Y -Y j D = 1] = E[Y -Y j D = 0] = E[Y -Y ]
1 0 1 0 1 0

What an RCT does
In a randomized control trial (RCT), (Y ,Y ) ?? D by design
0 1
▶ Both mean-independence assumptions follow
Consider two causal diagrams (“directed acyclic graphs”, DAGs):
RCT: Y = y(D,ξ ) for ξ ?? D
Y Y
Potential outcomes Y(d) ) y(d,ξ ) ?? D
▶ Y
Observational data: D = d(U,ξ ), Y = y(D,U,ξ )
D Y
Potential outcomes Y(d) ) y(d,U,ξ ) 6?? D because of confounders U
▶ Y

External vs. internal validity
If you run an RCT on a selected subpopulation P, e.g. those who signed up to a
clinical trial, you’d get
E[Y -Y j P]
1 0
E[Y -Y
This may not equal to ATE = ] in the full population — external
1 0
validity problem
But selection bias in observational studies is worse
▶ Even if this pill has no effect on anyone, can have
E[Y j 1]-E[Y j 6=
D = D = 0] 0 — internal validity problem
0 0

Connecting to linear models
With a binary treatment,
-Y
Y = Y +(Y )D = β +τD +ε
i 0i 1i 0i i 0 i i i
where β = E[Y ], τ = Y -Y and ε = Y -E[Y ]
0 0 i 1i 0i i 0i 0
With homogeneous effects, Y = β +β D +ε becomes a causal model where
i 0 1 i i
Y -Y ) β
1i 0i 1
▶ Regardless of whether ε ?? D (think IV). But if D ?? Y , OLS yields β
i i i 0i 1
With heterogeneous effects, can rederive that OLS identifies ATE in RCTs: if
?? E[D],
(ε,τ) D and denoting µ =
i i i i
E[(D -µ)Y] E[D -µ)β
Cov[D,ε] (D ]
β = i i = i i + i i i 1i = E[β] ) ATE
OLS i
Var[D] Var[D] Var[D]
i i i

RCT with ordered or continuous treatments
Consider a RCT where D takes more than two values (e.g. different dosages)
D ?? fY(d)g =) E[Y j D = d] = E[Y(d) j D = d] = E[Y(d)]
d∈D
A saturated regression of Y on dummies for all values of D (or a nonparametric
regression with continuous D) traces the average structural function E[Y(d)]
A simple regression of Y on D identifies a convexly-weighted average of
∂E[Y(d)]/∂d (or its discrete version):
[ ] [ [ ] ]
∫
∞ ∂E Y(d ˜ ) Cov 1 D >= d ˜ ,D
˜ ˜ ˜
β = ω(d) dd, ω(d) =
OLS −∞ ∂d ˜ Var[D]
∑K
E[Y(d )-Y(d )] (d -d )Cov[1[D >= d ],D]
k k−1 k k−1 k
or β = ω , ω =
OLS k d -d k Var[D]
k k−1
k=1

Outline
1 The basics: Potential outcomes, average causal effects, and RCTs
Other estimands
2
Conceptual issues with the potential outcome framework. Alternative frameworks
3
4 Complex RCTs
5 (Skipped) Causality or prediction?

Distribution of gains
Some other interesting parameters (cf. Heckman et al. (1999)):
1. How widely are the gains distributed?
a. The proportion of people taking the program who benefit from it: P(Y > Y )
1 0
b. Median gains: Med(Y -Y )
1 0
2. Does the program help the lower tail?
E[Y -Y j
a. Distribution of gains by untreated value: e.g. 1 0 Y 0 =¯y]
>¯y)-P(Y
b. Increase in % above a threshold due to a policy: P(Y >¯y)
1 0

Identification
Does an RCT identify these other parameters, e.g. median gains?
Not without extra restrictions!
E.g. imagine an RCT where Y takes values 0, 1, 2 with equal prob. in both treated
and control groups
This is consistent with (Y ,Y ) taking values (0,0),(1,1),(2,2) with equal prob.
0 1
No casual effect for anyone. Median gain = 0
▶
Or with (Y ,Y ) taking values (0,1),(1,2),(2,0) with equal prob.
0 1
▶ Median gain = 1
Exception: P(Y > ¯y)-P(Y > ¯y) is identified — how?
1 0

Other Parameters: Individual causal effects
What if we want to identify Y(0),Y(1), and τ for each i?
i i i
▶ Possible under very strong effect homogeneity restrictions
E.g. if τ ) β, we can learn β from an RCT (or relax to τ = β(X ))
▶ i i i
▶ Then Y (0) = Y -τ for treated, Y (1) = Y +τ for untreated
i i i i i i
International trade: the effect of NAFTA on wages in Mexico
Industrial organization: the effect of a merger between Northwest and Republic
Airlines on fares from Minneapolis
Berry and Haile (2021): “Suppose a researcher is able to randomly assign price vectors.
It may be natural to imagine that identification of demand would be trivial in this case.
It is not. The observed variation in quantities will reveal certain averages of demand
responses. But such averages are of very limited value, as they do not reveal any
elasticity of demand — not at the observed prices or any other known point” (abridged)

Outline
1 The basics: Potential outcomes, average causal effects, and RCTs
Other estimands
2
Conceptual issues with the potential outcome framework. Alternative frameworks
3
4 Complex RCTs
5 (Skipped) Causality or prediction?

What can be a cause/treatment?
Is it meaningful to say “She did not get this position because she is a woman”
(example from Imbens (2020))?

Attributes as treatments
Imagining each unit under all possible conditions is non-trivial:
“No causation without [imagining] manipulation” (Holland & Rubin)
7
“She did not get this position because she is a woman”
▶ Gender is an attribute, not a cause; same for race
3
“She got an orchestra job because of a gender-blind audition”
(cf. Goldin and Rouse (2000))
▶ Resume studies (e.g., Bertrand and Mullainathan (2004)) similarly manipulate
perceived gender

Poorly defined treatments
“Attending college increases average earnings by $X” — what does Y(1) mean?
i
How could you force someone to attend college?
Not realistic ) less useful or even (in the strict sense) ill-defined
▶
Meaningful causal effects are tightly linked to policy relevance
▶
And which college?
▶ A matter of defining Y (1), not heterogeneous effects
i
▶ “Attending a 4-year public university” or “Attending college of the person’s choice”
would be better

SUTVA (1): Poorly defined treatments
This is a violation of SUTVA (“stable unit treatment value assumption”)
▶ D should summarize everything outcome-relevant about the intervention
Defining treatment variables is imposing a causal model. Don’t take it lightly!
▶
Note: Perhaps it’s easier to imagine forcing people out of the college they attended
▶ So Y (0) and ATT are more well-defined
i
Note 2: current practice seems more permissive
▶ E.g. Orefice et al. (2025) study causal effects of migrant diversity, measured as
Herfindahl index of migrant origins
This measure can’t be manipulated without changing anything else
▶

SUTVA (2): Interference
More common meaning of SUTVA: no unmodeled interference
▶ I.e., treatment statuses of other units d−i do not affect Y
i
▶ Frequently violated: e.g. vaccines and infectious disease; information and
technology adoption; equilibrium effects via prices
Allowing for interference, we could start from a different model: Y(d ,...,d ) for
i 1 N
the population of size N
′ )-Y
▶ We may be interested in own-treatment effects Y i (d ,d−i i (d i ,d−i ) and various
i
spillover effects, e.g. Y(d,1,...,1)-Y(d,0,...,0)
i i i i
′
▶ No interference is an exclusion restriction: Y (d ,d−i ) = Y (d ,d ) ) Y (d ),
i i i i − i i i
8d ′
,d−i ,d
i − i
∑
-! -!
Intermediate model: Y(d ) for exposure mapping d = (d, d )
i i i i k∈Friends(i) k

Effects of causes vs. causes of effects
Statistical analysis focuses on effects of causes (treatments) rather than causes of
effects (outcomes)
Causes are not clearly defined
Holland (1986, p.959)
But asking questions about causes is helpful: observing an anomaly in the data
motivates us to ask statistical questions about effects (Gelman and Imbens, 2013)

Criticisms by Heckman and Vytlacil (2007)
1. Estimated effects cannot be transferred to new environments (limited external
validity) and to new programs never previously implemented
▶ Interventions are black boxes, with little attempt to unbundle their components
▶ Mechanisms are not possible to pin down
▶ Knowledge does not cumulate across studies (contrast with estimates of a labor
supply elasticity — a structural parameter)
⋆ Counterpoint from Angrist and Pischke (2010): “Empirical evidence on any given
causal effect is always local, derived from a particular time, place, and research
design. Invocation of a superficially general structural framework does not make the
underlying variation more representative. Economic theory often suggests general
principles, but extrapolation to new settings is always speculative. A constructive
response to the specificity of a given research design is to look for more evidence, so
that a more general picture begins to emerge.”

Criticisms by Heckman and Vytlacil (2007) (cont.)
2. Estimands need not be relevant even to analyze the observed policy
▶ Informative on whether to throw out the program entirely (ATT) and whether to
extend it forcing it on everyone not covered yet (ATU)
▶ But not whether to extend/shrink it on the margin (Heckman et al. (1999), Sec.3.4)
▶ Or a policy change that affects the assignment mechanism, e.g. available options
▶ No analysis from the social planner’s point of view, e.g. accounting for externalities
▶ No analysis of causal parameters other than means, e.g. median gains
Optional exercise: read Heckman-Vytlacil’s Sec. 4.4. Do you agree with
everything?

Roy model
Alternative “structural” approach: to model self-selection explicitly
Original Roy (1951) model: self-selection based on outcome comparison
▶ D = choice of occupation (e.g. agriculture vs not) or education level
▶ Y(d) = earnings for a given occupation/education
▶ People vary by occupational productivities/returns to education, known to them
▶ They choose based on them: D = argmax d∈D Y i (d), perhaps with homogeneous
costs C(d)
Extended Roy model: costs are heterogeneous but fully determined by observables
▶ which may or may not affect the outcome at the same time
Generalized Roy model: self-selection based on unobserved preferences
▶ D = argmax d∈D R i (d) where e.g. R i (d) = Y i (d)-C i (d) for costs C i (d)

Roy model: Identification
What does this structure buy us?
No free lunch: “for general skill distributions [i.e., without parametric restrictions],
the [original Roy] model is not identified [from a single cross-section] and has no
empirical content” (Heckman and Honore, 1990)
But with more data and restrictions can identify the ATE and even the distribution
-R =)
of (Y ,Y ,R ) distribution of gains
0 1 1 0
Assumptions are often parametric: e.g. Heckman correction via normality of
potential outcomes
▶ Not living up to the goal of using economic theory for identification?
Can do better with cost shifters that shift selection but not outcomes
▶ Value over traditional IV methods is not so clear?

Another alternative: Directed acyclic graphs (DAGs)
Directed acyclic graphs of Judea Pearl represent causal relationships graphically: e.g.
X = soil treatment (fumigation)
Y = crop yield
Z = eelworm population before the treatment
1
Z = eelworm population after the treatment
2
Z = eelworm population at the end of season
3
Z = eelworm population last season (unobserved)
0
B = bird population (unobserved)
“Do-calculus” allows to verify whether the average total effect of X on Y is
identified from observing (X,Y,Z ,Z ,Z )
1 2 3
Popular in epidemiology but not in economics. Why?

Some limitations of DAGs
Imbens (2020) lists some pitfalls of DAGs relative to potential outcomes:
1. Economists avoid complex models with many variables
2. Randomization and manipulability have no special value in DAGs
3. Too nonparametric:
a. Not possible to incorporate additional assumptions, such as continuity (important
in regression discontinuity designs)
b. Too much focus on identification, relative to estimation and inference
4. Diﬀicult to model interference
5. Clunky to model simultaneity, e.g. demand and supply

Outline
1 The basics: Potential outcomes, average causal effects, and RCTs
Other estimands
2
Conceptual issues with the potential outcome framework. Alternative frameworks
3
4 Complex RCTs
5 (Skipped) Causality or prediction?

What’s special about RCTs
Simplest RCT with a binary treatment:
1. A large population of subjects
2. Treatment status is assigned by the researcher
3. Treatment status is assigned according to a known protocol
4. The protocol involves randomization
5. All units have the same probability of being assigned to the treatment group
6. Treatment status is assigned independently across units
Which of these is most important? Which can be relaxed?

Complex RCTs
Abdulkadiroglu et al. (2017) study the effects of charter school attendance D on grades
i
Y in Denver (see also Borusyak and Hull (2021), Appx D.6)
i
Centralized assignment mechanism run by the city
Families submit preferences, they are processed by some algorithm that gives offers
The algorithm involves lotteries to tie breaks for oversubscribed schools
Lotteries can have knock on effects on other kids
Difference-in-means is no longer causal:
Treatment and control groups are not balanced on geography and other inputs

Identifying causal effects in complex RCTs
Suppose the researcher has access to the algorithm and its inputs
▶ No self-selection is possible here
Running the algorithm many times, can measure the propensity score of each kid:
p ) P(D = 1 j preferences of all families), separately across i
i i
E.g. lower p in more competitive areas
▶ i
Assume there is enough randomness so 0 < p < 1
▶ i
Adjusting for p as a covariate is feasible and suﬀicient to get ATE and other causal
i
estimands
▶ Regression adjustment or reweighting (coming soon)
Note: RCT not run by the researcher; p varies across i; D can be interdependent
i i
▶ Interdependence of D affects eﬀiciency and SE but doesn’t generate bias
i

What’s special about RCTs
Simplest RCT with a binary treatment:
1. A large population of subjects
2. Treatment status is assigned by the researcher
3. Treatment status is assigned according to a known protocol
4. The protocol involves randomization
5. Unit are assigned to the treatment group with equal probabilities
6. Treatment status is assigned independently across units

RCT with one subject
Can we learn something about causal effects if we have N = 1? Yes!
Randomize treatment with P(D = 1) = p
i
{
[ Y /p, D = 1
Estimate Y(1) = i i
i
0, D = 0
i
This estimate is unbiased:
[ ] [ ] [ ]
[ [ [
E Y(1) = E Y(1) j D = 1 *P(D = 1)+E Y(1) j D = 0 *P(D = 0)
i i i i i i i
Y(1)
= i *p+0 = Y(1)
i
p

RCT with one subject (2)
{
0, D = 1
[ i
Similarly, Y(0) = is unbiased for Y(0)
i Y/(1-p), i
D = 0
i i
{
Y /p, D = 1
[ (1)-Y [ i i
So τˆ = Y (0) = is unbiased for the causal effect
i i i -Y/(1-p),
D = 0
i i
Of course, a single τˆ is very noisy
i
▶ A real RCT essentially combines τˆ across i = 1,...,N to consistently estimate
∑ i
1
ATE = τ i
N i
)
▶ Different propensity scores are fine Horvitz-Thompson pscore adjustment

RCT in a small sample: Randomization inference
In a small sample, randomization inference yields exact tests for the sharp null
) )
τ 0 or any other constant effect, e.g. τ 3
i i
▶ No asymptotic approximation needed
Idea: D and Y are independent under the null but not under the alternative
i i
fD ∗ g
▶ Random permutation is independent from Y i in both cases
i
)
▶ Reject τ 0 if Cov[D ,Y ] (or any other statistic of dependence) is in the tail of
i i i
∗ fD ∗g
the distribution of Cov[D ,Y] i over many permutations
i i
Collecting all effects that are not rejected (“test inversion”) gives a confidence
interval for the effect
But only under constant effects
▶

RCT without randomization?
Bernoulli randomization: randomize treatment independently, e.g. with p = 1/2
More eﬀicient: “complete randomization,” i.e. treat exactly N/2 units
) Better not to randomize the number of treated units
Even more eﬀicient: stratified randomization
▶ For each discrete strata X = x, treat exactly half units — ensures better balance
i
) Better not to randomize the number of treated units per strata
Kasy (2016): with a continuous X, best not to randomize at all!
i
Intuition: ordering units by X and treated every other one ensures better balance
▶ i
▶ It’s essentially by chance whether i is even or odd on the list

References I
Abdulkadiroglu, A., J. D. Angrist, Y. Narita, and P. A. Pathak (2017): “Research
Design Meets Market Design: Using Centralized Assignment for Impact Evaluation,” Econometrica,
85, 1373–1432.
Angrist, J. D. and J.-S. Pischke (2010): “The Credibility Revolution in Empirical Economics:
How Better Research Design is Taking the Con out of Econometrics,” Journal of Economic
Perspectives, 24, 3–30.
Berry, S. T. and P. A. Haile (2021): Foundations of demand estimation, vol. 4, Elsevier B.V.,
publication Title: Handbook of Industrial Organization Issue: 1 ISSN: 1573448X.
Bertrand, M. and S. Mullainathan (2004): “Are Emily and Greg more employable than
Lakisha and Jamal? A field experiment on labor market discrimination,” The American Economic
Review, 94, 991–1013.
Blandhol, C., J. Bonney, M. Mogstad, and A. Torgovitsky (2025): “When is TSLS
Actually LATE?” Working Paper.
Borusyak, K. and P. Hull (2021): “Non-Random Exposure to Exogenous Shocks: Theory and
Applications,” Mimeo.

References II
Gelman, A. and G. Imbens (2013): “Why ask Why? Forward Causal Inference and Reverse Causal
Questions,” Tech. Rep. w19614, National Bureau of Economic Research, Cambridge, MA.
Goldin, C. and C. Rouse (2000): “Orchestrating Impartiality: The Impact of “Blind” Auditions on
Female Musicians,” American Economic Review, 90, 715–741.
Heckman, J. J. and B. E. Honore (1990): “The Empirical Content of the Roy Model,” .
Heckman, J. J., R. J. Lalonde, and J. A. Smith (1999): “The Economics and Econometrics of
Active Labor Market Programs,” in Handbook of Labor Economics, Elsevier, vol. 3, 1865–2097.
Heckman, J. J. and E. J. Vytlacil (2007): “Chapter 70 Econometric Evaluation of Social
Programs, Part I: Causal Models, Structural Models and Econometric Policy Evaluation,” in
Handbook of Econometrics, Elsevier, vol. 6, 4779–4874.
Holland, P. (1986): “Statistics and causal inference,” Journal of the American Statistical
Association, 81, 945–960.
Imbens, G. W. (2020): “Potential Outcome and Directed Acyclic Graph Approaches to Causality:
Relevance for Empirical Practice in Economics,” Journal of Economic Literature, 58, 1129–1179.

References III
Kasy, M. (2016): “Why Experimenters Might Not Always Want to Randomize, and What They
Could Do Instead,” Political Analysis, 24, 324–339.
Orefice, G., H. Rapoport, and G. Santoni (2025): “How Do Immigrants Promote Exports?”
Journal of Development Economics, 174, 103443.

Outline
1 The basics: Potential outcomes, average causal effects, and RCTs
Other estimands
2
Conceptual issues with the potential outcome framework. Alternative frameworks
3
4 Complex RCTs
5 (Skipped) Causality or prediction?

Causality vs. prediction
Economists obsess with causality but sometimes prediction is the relevant goal
The choice should be guided by the ultimate goal: decision making
Two scenarios (see Kleinberg et al., 2015):
2 f0,1g
1. The action/policy D affects the outcome Y, and the payoff (i.e., utility) π
depends on Y
▶ E.g. D = rain dance in a drought, Y = it rains
π(d) = aY(d)-bd =) E[π(1)-π(0)] = aE[Y(1)-Y(0)]-b
▶ Optimal decision: D = 1[E[Y(1)-Y(0)] >= b/a]
This is a causal problem. Running an RCT is very helpful
▶
E[Y(1)-Y(0) j
▶ Better knowledge of heterogeneous causal effects X] based on
observed covariates X also yields better decisions D(X)

Causality vs. prediction (2)
2. Y is unaffected by D but the marginal payoff of actions, ∂π/∂D, depends on Y
▶ E.g. D = take an umbrella, Y = it rains
aY*d-bd =) E[π(1)-π(0)] aE[Y]-b
π(d) = =
Optimal decision: D = 1[E[Y] >= b/a]
▶
▶ This is a prediction problem. Running an RCT is not helpful
E[Y j
▶ Better prediction X] yields better decisions D(X)
Note: This scenario can also be recast as a causal problem:
Y˜(D)
▶ D affects = you get wet = Y*(1-D)
Y˜(1)
▶ But we know potential outcome = 0
And we have data on Y˜(0) = Y to make a prediction of Y˜(1)-Y˜(0)
▶

Policy-relevant prediction problems: Examples
1. Eliminating futile hip and knee replacement surgeries
Surgery has costs: monetary + painful recovery
▶
▶ Benefits depend on life expectancy
Kleinberg et al. (2015) show 10% (1%) of patients have predictable probability of
▶
dying within a year of 24% (44%) for reasons unrelated to this surgery
2. Improving admissions by predicting college success
▶ Geiser and Santelices (2007) show that high-school GPA is a better predictor of
performance at UC colleges than SAT
▶ If UC had to reduce admissions, rejecting applicants with marginal GPAs would
result in losing fewer good students than rejecting marginal SAT applicants
3. See Kleinberg et al. “Human Decisions and Machine Predictions” (2018) for a
more subtle example on bail decisions by judges
