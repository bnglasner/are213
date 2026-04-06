Part C: Instrumental Variables
C2: IV with Heterogeneous Effects
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

Questions when effects are heterogeneous
In Angrist (1990), does the draft lottery IV identify a causal parameter?
Is it the ATE or the affect for some subpopulation?
Is this subpopulation interesting and policy relevant?
How can we describe it theoretically?
What can we say about it in the data?

C2 Outline
1 Basic LATE result
Characterizing compliers
2
3 Extensions
Readings: MHE Chapters 4.4, 4.5; IW Lecture 5

Recap of general IV assumptions
Consider J = K = 1 and a causal first-stage with potential outcomes D(z):
Exclusion: in writing Y(d) rather than Y(d,z)
i i
Independence: Z ⊥⊥ Y(d) for all d and Z ⊥⊥ D(z) for all z
i i i i
̸= D(z′) z,z′
Relevance: D(z) for some with positive probability
i i

The four groups
Consider binary D and Z, e.g. Vietnam draft lottery
=⇒
D(0) and D(1) are binary (up to) four latent groups:
i i
D (0) = D (1) = 0: never-takers
▶ i i
▶ D (0) = 0 < D (1) = 1: compliers
i i
▶ D (0) = 1 > D (1) = 0: defiers
i i
D (0) = D (1) = 1: always-takers
▶ i i
E[D(1)−D(0)] Pr(Complier)−Pr(Defier)
First-stage: π = =
i i i i

Understanding the groups: True/False
“A defier is someone who gets the encouragement (Z = 1) but doesn’t take the
treatment (D = 0)”
“Someone who took the treatment but had the lowest possible outcome is a defier”

Reduced-form
Reduced-form (a.k.a. intent-to-treat effect, ITT):
E[Y 1]−E[Y
ρ = Z = Z = 0]
i i i i
= Pr(NT)·E[Y(0)−Y(0) NT]
i i i i
+Pr(Complier)·E[Y(1)−Y(0)
Complier]
i i i i
+Pr(Defier)·E[Y(0)−Y(1) Defier]
i i i i
+Pr(AT)·E[Y(1)−Y(1)
AT]
i i i i
= Pr(Complier)E[τ Complier]−Pr(Defier)E[τ Defier]
i i i i i i
Ratio
Pr(Complier)E[τ Complier]−Pr(Defier)E[τ Defier]
i i i i i i
τ =
IV Pr(Complier)−Pr(Defier)
i
doesn’t have an intuitive interpretation, except constant effects or...

Monotonicity assumption
Assume monotonicity: the instrument affects the treatment weakly in the same
direction for everyone
▶ Either no defiers (when π > 0) or no compliers (when π < 0)
▶ Without loss, consider positive first-stage
LATE theorem (Imbens and Angrist (1994)): Under exclusion, independence,
and monotonicity, IV identifies the (internally valid) average causal effect among
compliers:
τ = E[τ Complier] ≡ Local average treatment effect
IV i i

Is monotonicity plausible?
In the new pill example?
▶ Does the treated group = complier population?
▶ How does LATE relate to the ATT?
In Angrist (1990) Vietnam draft study?
In Angrist and Evans (1998) with same-sex IV?

Is LATE more useful than ITT?
Reduced-form (ITT) is always causal if independence holds
Always holds in RCTs, e.g. in encouragement designs
▶
▶ While LATE further requires exclusion and monotonicity
▶ So why ever do IV?
IV answers more interesting questions than ITT
▶ Wage effects of serving in the army vs. of low lottery numbers
▶ More interesting in part because hopefully more externally valid with respect to
alternative implementations...

Example: Angrist and Hull (2023)
Does screening for prostate & colorectal cancer improve health outcomes?
▶ A dozen of RCTs where screening is offered for free find very different ITTs

IV estimates of the effect of screening
Open question: but is this IV estimate policy relevant?

External validity: Is LATE useful?
Criticism: “The LATE may, or may not, be a parameter of interest... and in
general, there is no reason to suppose that it will be” (Deaton (2010))
▶ E.g. better to focus on ATE: report partially identified set (“Manski bounds”) or
use a structural model for point identification
Imbens (2010) “Better LATE than nothing”:
▶ You should first report what the data directly gives, i.e. LATE. Then do whatever
E.g. “I would prefer to keep [structural] assumptions separate and report both the
▶
LATE, with its high degree of internal but possibly limited external validity, and
possibly add a set of estimates for the overall average effect with the corresponding
additional assumptions”

External validity: Is LATE useful? (2)
Angrist and Pischke (2010):
▶ “A good structural model might tell us something about economic mechanisms as
well as causal effects. But if the information about mechanisms is to be worth
anything, the structural estimates should line up with those derived under weaker
assumptions”
LATE sometimes has economic and policy relevance (e.g., Imbens (2010)), Kline
and Walters (2016))
And we can learn a lot about the complier subpopulation...

Outline
1 Basic LATE result
2 Characterizing compliers
3 Extensions

Counting the three groups
Assume monotonicity (no defiers). Which groups occupy each cell?
D = 0 (didn’t serve) D = 1 (served)
i i
Z = 0 (high lottery #) NT + C AT
i
Z = 1 (low lottery #) NT AT + C
i
Counting the groups:
▶ n ≡ Pr(NT ) = Pr(D = 0 Z = 1)
i i i
▶ a = Pr(AT i ) = Pr(D i = 1 Z i = 0)
π = Pr(C ) = Pr(D = 1 | Z = 1)−Pr(D = 1 | Z = 0) = first stage
▶ i i i i i
E.g. in Angrist (1990), for white men born in 1950, the first-stage = 0.16
By Bayes rule, compliers are 32% of veterans and 10% of non-veterans
▶

Characterizing compliers
Do compliers have unusual...
▶ potential outcomes: Y (1) (relative to AT) and Y (0) (relative to NT)?
i i
▶ predetermined characteristics X i (relative to NT and AT)?
E[Y(1) E[Y(1)
Start with AT] and C]:
i i i i
D = 0 (didn’t serve) D = 1 (served)
i i
Z = 0 (high lottery #) NT + C AT
i
Z = 1 (low lottery #) NT AT + C
i
Thus, E[Y Z = 0,D = 1] = E[Y(1) AT] and...
i i i i i

Characterizing compliers (2)
E[Y Z = 1,D = 1] = E[Y(1) AT] a +E[Y(1) C] π =⇒
i i i i i i i
a+π a+π
E[Y 1]·(a+π)−E[Y 1]·a
Z = 1,D = Z = 0,D =
E[Y(1) C] = i i i i i i
i i
π
Given a+π = Pr(D = 1 Z = 1) and a = Pr(D = 1 Z = 0),
i i i i
E[YD Z = 1]−E[YD Z = 0]
i i i i i i
=
E[D 1]−E[D
Z = Z = 0]
i i i i
Implement by IV: YD on D, IVed with Z
i i i i
Intuition: think potential outcomes of YD and the causal effect on this outcome
i i

Characterizing compliers (3)
Similarly, for E[Y(0) | C]: run Y ·(1−D) on 1−D, instrumented with Z
i i i i i i
Can get entire distributions Y(0) and Y(1) for compliers (Abadie (2002))
i i
▶ See Kitagawa (2015) for a test of IV validity based on this
For predetermined characteristics X (that are ⊥⊥ Z), have multiple options:
i
X D on D , instrumented with Z
▶ i i i i
(1−D 1−D
▶ X i i ) on i , instrumented with Z i
▶ A combination of the two (see Angrist, Hull, and Walters (2023))
Note: this trick works with all design-based OLS and IV specifications, even with
▶
non-binary D and Z (Hull, 2025)

Characterizing compliers: Example
Angrist, Pathak, and Walters (2013) and Angrist, Hull, and Walters (2023):
D = studying in a charter school, Z = getting an offer in a lottery, Y = test scores
i i i

Extrapolation via reweighting
If compliers have different X than overall population or the treated group, we can
i
reweight the IV estimator to make them look similar
▶ If effect heterogeneity is fully explained by X , i.e. homogeneous effects given X ,
i i
this yields ATE and ATT
⇔
Aronow and Carnegie (2013): compliers have a higher female share females
have a higher complier share
▶ Estimate Pr(Complier X ) via first stage heterogeneity
i i
b
▶ Use 1/P r(Complier X ) as weights in IV
i i
Angrist and Fernandez-Val (2010): if two IVs give different answers (e.g., twin
births vs. same sex), is it because compliers have different covariates?
▶ Develop an overidentification-type test

Outline
1 Basic LATE result
2 Characterizing compliers
3 Extensions

Extensions
Non-binary treatments and instruments with linear heterogeneity
Single multi-valued or continuous instrument
Single multi-valued or continuous treatment
Multiple instruments
Multiple treatments
Including necessary covariates
Non-causal first stage

Linear heterogeneity
Consider arbitrary D and Z but assume linear heterogeneity of causal effects and
i i
first-stage coefs:
First-stage: D(z) = D(0)+πz (without loss if Z is binary)
i i i i
⇒ D = πZ +u for u = D(0)
i i i i i i
Structural equation: Y(d) = Y(0)+τd (without loss if D in binary)
i i i i
⇒ Y = τD +ε for ε = Y(0)
i i i i i i
Reduced-form: Y = τπZ +e for e = τu +ε
i i i i i i i i i
By independence, Z ⊥⊥ (τ,ε,π,u)
i i i i i
E[τiπi],
Claim: τ = i.e. a π-weighted average of τ if monotonicity holds (π have
IV E[πi] i i i
the same sign for all i)

Proof
E[π]; E[τπ]
We know first-stage identifies reduced-form identifies since
i i i
Y = τD +ε = τ (πZ +u)+ε = τπZ +e
i i i i i i i i i i i i i
In more detail, let E[Z] = µ. Consider the numerator of τ = Cov[Y,Z]/Cov[D,Z]:
i IV i i i i
E[Y −µ)]
Cov[Y,Z] = (Z
i i i i
= E[(τπZ +e)(Z −µ)]
i i i i i
E[τπ]Var[Z].
=
i i i
E[π]Var[Z]
Similarly, Cov[D,Z] = and thus
i i i i
E[τπ]
τ = i i .
IV
E[π]
i

Single multi-valued instrument
Suppose D is binary but Z takes values z ≤ ··· ≤ z
i i 0 P
▶ E.g. D i = attend college, Z i = number of colleges nearby
↑
Monotonicity: D(z) never switches from 1 to 0 as z
i
Option 1: select the sample of Z ∈ {z ,z } and compare groups Z = z vs.
i p−1 p i p
Z = z p−1
i
E[Y (1)−Y
▶ Yields τ = (0) D (z ) > D (z p−1 )]
p i i i p i
Non-overlapping complier groups for each p
▶

Single multi-valued instrument (2)
Option 2: Use linear IV with a single instrument Z
i
Yields a weighted average of τ :
▶ p
XP ))·Cov[1[Z ≥
Cov[Y ,Z ] Pr(D (z ) > D (z p−1 z ],Z ]
i i = ω τ , ω = P i p i i p i
p p p
Cov[D ,Z ] P Pr(D (z ) > D (z ))·Cov[1[Z ≥ z ],Z ]
i i p=1 ℓ=1 i ℓ i ℓ−1 i ℓ i
Weights can be computed; larger for big complier groups, around the median of Z
▶ i
Exercise: prove using result from part A1 of the course
▶

Single continuous instrument
Result on linear IV weights extends naturally to continuous Z
i
▶ E.g. Z = distance to nearest college (Card, 1993)
i
Can compare Z = z+ϵ to Z = z−ϵ (for small ϵ) to get marginal treatment
i i
effects (MTE)
If variation in Z is super rich, such that Pr(D = 1 | Z) takes all values ∈ [0,1],
i i i
weighted averages of MTEs identify the ATE, ATT, and other estimands
▶ Intuition: there are no always-takers or never-takers
▶ See e.g. Heckman and Vytlacil (2005) and Mogstad and Torgovitsky (2024)

Single multi-valued treatment (Angrist and Imbens (1995))
Conversely, suppose Z is binary but D takes values d ≤ ··· ≤ d
i i 0 Q
▶ E.g. Angrist and Krueger (1991): D i = years of schooling, Z i = born in 1st quarter
Monotonicity: D(1) ≥ D(0) for all i (compliers: D(1) > D(0))
i i i i
We can measure how Z shifts the CDF of D:
i i
Pr(D ≥ d | Z = 1)−Pr(D ≥ d | Z = 0) = Pr(D(1) ≥ d > D(0))
i q i i q i i q i
▶ Larger for values d q where the IV pushes more people from below to above
▶ Complier groups D i (1) ≥ d q > D i (0) can overlap across different q

Single multi-valued treatment (2)
IV (Wald) estimand:
<= >=
XQ )−Y(d
Cov[Y,Z] Y(d )
i i = ω E i q i q−1 D(1) ≥ d > D(0)
q i q i
Cov[D,Z] d −d
i i q q−1
q=1
with weights that can be computed:
≥
Pr(D(1) d > D(0))
P i q i
ω = .
q Q ≥
Pr(D(1) d > D(0))
ℓ=1 i ℓ i
Result generalizes immediately to continuous D
i
∈ {d }
We cannot isolate individual margins by conditioning on D q−1 ,d
i q

Weights in Angrist and Krueger (1991)
(FromAngristandImbens(1995),Figure3)

Multiple instruments
E.g. Angrist and Evans (1998): Z = two boys, Z = two girls
1 2
2SLS identifies a weighted average of individual IVs ρ /π
k k
▶ Weigh P t on Z = slope of regression of π Z on the first-stage fitted value
k k ki
Dˆ
i = π k Z ki ; typically convex but not guaranteed
k
▶ Lee (2018): conventional SE of 2SLS are wrong!
⋆ Moments E[(Y −τ D)Z]=0 do not hold with heterogeneous effects!
i 2SLS i i
⋆ But the correction tends to be small

Multiple instruments (2)
Joint monotonicity is trickier to define:
Imbens and Angrist (1994): same ranking of D(⃗z) across⃗z = (z ,...,z ) for all i
i 1 K
Very restrictive: essentially ⃗Z is one multi-valued instrument
▶
Can’t have one family respond to two boys only and another to two girls only
▶
Mogstad, Torgovitsky, and Walters (2021) “partial monotonicity”: holding z
−k
fixed, same ranking of D(z ;z ) across z for all i
i k −k k
=⇒
▶ Binary D,Z 1 ,Z 2 6 groups: e.g. “eager compliers”: D i = 1[Z 1i = 1 or Z 2i = 1]
2SLS = weighted average of LATEs but some weights can be negative
▶

Multiple treatments
Literature has focused on exclusive treatments
Kline and Walters (2016): D = early childhood education program (Head Start),
1i
D = alternative public programs, D = 1−D −D
2i 0i 1i 2i
▶ Only one IV: Z = randomized offer for the focal program
1i
▶ Monotonicity: no defiers & Z doesn’t affect choice between D and D
1i 2 0
Instrumenting D with Z identifies a weighted average of Y (1)−Y (0) and
▶ 1i 1i i i
Y(1)−Y(2) among compliers at these margins
i i
▶ Weights are identified: how many kids switch to D from each alternative
1i
∝ causal effects of D on D and D (estimated by IV)
⋆ 1i i0 i2
▶ But “subLATEs” are not identified

Multiple treatments (2)
Mountjoy (2022): D = enrolling in a community college, D = enrolling in a
1i 2i
4-year college
Z ,Z = distance from nearest community college and 4-year college
▶ 1i 2i
▶ IV with two endogenous vars does not produce causal estimands with
heterogeneous effects (Kirkeboen et al. (2016))
Mountjoy develops a nonparametric IV approach to separate LATEs at each margin
▶
See Bhuller and Sigstad (2024) for a different approach
▶

Including necessary covariates
Suppose Z is randomly assigned only conditionally on X
i i
E[Z |
If Z is scalar, pscore X] is linear (“rich controls,” e.g. X is saturated), and
i i i i
monotonicity holds unconditionally:
⇒
IV that controls for X identifies a convex average of conditional-on-X LATEs (see
i i
MHE Ch. 4.5.1)
Otherwise, the estimand need not be causal
E[Z
▶ Misspecified X ]: Blandhol, Bonney, Mogstad, and Torgovitsky (2025)
i i
▶ Multiple IVs (or OLS with multiple treatments): Goldsmith-Pinkham, Hull, and
Kolesár (2024) “contamination bias”

Non-causal first stage
We introduced monotonicity in a casual way but it needn’t be (Small et al. (2017))
E[Z λ′X
Independence + linear pscore: Y(0),Y(1),X] = (no D(z)!)
i i i i i i
Stochastic monotonicity: Pr(D = 1 | Z = z,Y(0),Y(1),X) weakly increases in z
i i i i i
Borusyak and Hull (2024) simplified to binary D: for IV with X controls,
i i
E[ϕ ·(Y(1)−Y(0))]
i i i
τ = for ϕ = Cov[Z,D Y(0),Y(1),X] ≥ 0
IV E[ϕ] i i i i i i
i
▶ “Negative weights are no concern in design-based specifications”
▶ But compliers should not be interpreted as those whose treatment causally
responds to the IV

References I
Abadie, A. (2002): “Bootstrap Tests for Distributional Treatment Effects in Instrumental Variable
Models,” Journal of the American Statistical Association, 97, 284–292.
Angrist, J. and I. Fernandez-Val (2010): “ExtrapoLATE-ing: External Validity and
Overidentification in the LATE Framework,” NBER Working Paper.
Angrist, J. and P. Hull (2023): “IV Methods Reconcile Intention-to-Screen Effects Across
Pragmatic Cancer Screening Trials,” Proceedings of the National Academy of Sciences, 120.
Angrist, J., P. Hull, and C. R. Walters (2023): “Methods for Measuring School
Effectiveness,” in Handbook of the Economics of Education.
Angrist, J. D. (1990): “Lifetime earnings and the Vietnam era draft lottery: evidence from social
security administrative records,” American Economic Review, 80, 313–336.
Angrist, J. D. and W. N. Evans (1998): “Children and Their Parents ’ Labor Supply : Evidence
from Exogenous Variation in Family,” American Economic Association, 88, 450–477.
Angrist, J. D. and G. W. Imbens (1995): “Two-Stage Least Squares Estimation of Average
Causal Effects in Models with Variable Treatment Intensity,” Journal of the American Statistical
Association, 90, 431–442.

References II
Angrist, J. D. and A. B. Krueger (1991): “Does Compulsory School Attendance Affect
Schooling and Earnings?” Quarterly Journal of Economics.
Angrist, J. D., P. a. Pathak, and C. R. Walters (2013): “Explaining charter school
effectiveness,” American Economic Journal: Applied Economics, 5, 1–27.
Angrist, J. D. and J.-S. Pischke (2010): “The Credibility Revolution in Empirical Economics:
How Better Research Design is Taking the Con out of Econometrics,” Journal of Economic
Perspectives, 24, 3–30.
Aronow, P. M. and A. Carnegie (2013): “Beyond LATE: Estimation of the Average Treatment
Effect with an Instrumental Variable,” Political Analysis, 21, 492–506.
Bhuller, M. and H. Sigstad (2024): “2SLS with Multiple Treatments,” Journal of Econometrics,
242, 105785.
Blandhol, C., J. Bonney, M. Mogstad, and A. Torgovitsky (2025): “When is TSLS
Actually LATE?” Working Paper.
Borusyak, K. and P. Hull (2024): “Negative weights are no concern in design-based
specifications,” AEA Papers and Proceedings, 114, 597–600.

References III
Card, D. (1993): “Using Geographic Variation in College Proximity to Estimate the Return to
Schooling,” NBER Working Paper.
Deaton, A. (2010): “Instruments, Randomization, and Learning about Development,” Journal of
Economic Literature, 48, 424–455, iSBN: 0022-0515.
Goldsmith-Pinkham, P., P. Hull, and M. Kolesár (2024): “Contamination Bias in Linear
Regressions,” American Economic Review, 114, 4015–4051.
Heckman, J. J. and E. Vytlacil (2005): “Structural equations, treatment effects, and
econometric policy evaluation,” Econometrica, 73, 669–738, iSBN: 4030008526.
Hull, P. (2025): “One Weird Trick to Characterize Effective Populations in Design-Based
Specifications,” Unpublished.
Imbens, G. W. (2010): “Better LATE Than Nothing: Some Comments on Deaton (2009) and
Heckman and Urzua (2009),” Journal of Economic Literature, 48, 399–423.
Imbens, G. W. and J. D. Angrist (1994): “Identification and Estimation of Local Average
Treatment Effects,” Econometrica, 62, 467–475, iSBN: 00129682.

References IV
Kirkeboen, L. J., E. Leuven, and M. Mogstad (2016): “Field of Study, Earnings, and
Self-Selection,” The Quarterly Journal of Economics, 131, 1057–1111.
Kitagawa, T. (2015): “A Test for Instrument Validity,” Econometrica, 83, 2043–2063.
Kline, P. and C. R. Walters (2016): “Evaluating Public Programs with Close Substitutes: The
Case of HeadStart*,” The Quarterly Journal of Economics, 131, 1795–1848.
Lee, S. (2018): “A Consistent Variance Estimator for 2SLS When Instruments Identify Different
LATEs,” Journal of Business & Economic Statistics, 36, 400–410.
Mogstad, M. and A. Torgovitsky (2024): “Instrumental variables with unobserved
heterogeneity in treatment effects,” in Handbook of Labor Economics, Elsevier, vol. 5, 1–114.
Mogstad, M., A. Torgovitsky, and C. R. Walters (2021): “The Causal Interpretation of
Two-Stage Least Squares with Multiple Instrumental Variables,” American Economic Review, 111,
3663–3698.
Mountjoy, J. (2022): “Community Colleges and Upward Mobility,” American Economic Review,
112, 2580–2630.
Small, D. S., Z. Tan, R. R. Ramsahai, S. A. Lorch, and M. A. Brookhart (2017):
“Instrumental Variable Estimation with a Stochastic Monotonicity Assumption,” Statistical Science,
32.
