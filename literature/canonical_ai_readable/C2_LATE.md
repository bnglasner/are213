# C2: IV with Heterogeneous Effects Translation

## Source

- PDF: `literature/raw_pdf/C2_LATE.pdf` (Kirill Borusyak, ARE 213, UC Berkeley, Fall 2025)
- Generated markdown: `literature/canonical_ai_readable/C2_LATE.md`
- Extraction date: 2026-09-30
- Method: the slide text and inline math come from the PDF's own text layer by script (no model): math by font, sub- and superscripts by glyph size and baseline, symbols by a fixed map. Pages whose layout the text layer cannot express (tables, fractions, big-operator limits, matrices, figures) also carry a layout reconstruction by a local vision model (`gemma3:12b`). That block is unverified: trust the text-layer lines, and check the block against the PDF page before relying on it.
- Text-layer check: 41/41 pages, word recall 0.989, words not in the text layer 0.015.
- Scope: a faithful transcription. The interpretive sections of `TRANSLATION_AGENT_PLAN.md` (core ideas, interpretation, diagnostics, implementation checklist, structured extract, retrieval tags) are intentionally omitted.

## Coverage Map

- p. 1: Part C: Instrumental Variables
- p. 2: Questions when effects are heterogeneous
- p. 3: C2 Outline
- p. 4: Recap of general IV assumptions
- p. 5: The four groups
- p. 6: Understanding the groups: True/False
- p. 7: Reduced-form
- p. 8: Monotonicity assumption
- p. 9: Is monotonicity plausible?
- p. 10: Is LATE more useful than ITT?
- p. 11: Example: Angrist and Hull (2023)
- p. 12: IV estimates of the effect of screening
- p. 13: External validity: Is LATE useful?
- p. 14: External validity: Is LATE useful? (2)
- p. 15: Outline
- p. 16: Counting the three groups
- p. 17: Characterizing compliers
- p. 18: Characterizing compliers (2)
- p. 19: Characterizing compliers (3)
- p. 20: Characterizing compliers: Example
- p. 21: Extrapolation via reweighting
- p. 22: Outline
- p. 23: Extensions
- p. 24: Linear heterogeneity
- p. 25: Proof
- p. 26: Single multi-valued instrument
- p. 27: Single multi-valued instrument (2)
- p. 28: Single continuous instrument
- p. 29: Single multi-valued treatment (Angrist and Imbens (1995))
- p. 30: Single multi-valued treatment (2)
- p. 31: Weights in Angrist and Krueger (1991)
- p. 32: Multiple instruments
- p. 33: Multiple instruments (2)
- p. 34: Multiple treatments
- p. 35: Multiple treatments (2)
- p. 36: Including necessary covariates
- p. 37: Non-causal first stage
- p. 38: References I
- p. 39: References II
- p. 40: References III
- p. 41: References IV

## Comprehensive Translation

### p. 1 — Part C: Instrumental Variables

C2: IV with Heterogeneous Effects
Kirill Borusyak
ARE 213 Applied Econometrics
UC Berkeley, Fall 2025

### p. 2 — Questions when effects are heterogeneous

In Angrist (1990), does the draft lottery IV identify $a$ causal parameter?
Is it the ATE or the affect for some subpopulation?
Is this subpopulation interesting and policy relevant?
How can we describe it theoretically?
What can we say about it in the data?

### p. 3 — C2 Outline

1
Basic LATE result
2
Characterizing compliers
3
Extensions
Readings: MHE Chapters 4.4, 4.5; IW Lecture 5

### p. 4 — Recap of general IV assumptions

Consider $J = K = 1$ and a causal first-stage with potential outcomes $D(z)$:
Exclusion: in writing $Y_{i}(d)$ rather than $Y_{i}(d, z)$
Independence: $Z_{i}\perp \perp Y_{i}(d)$ for all $d$ and $Z_{i}\perp \perp D_{i}(z)$ for all $z$
Relevance: $D_{i}(z)\neq  D_{i}(z')$ for some $z, z'$ with positive probability

#### p. 4 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: connecting, epsilon._

Consider $J = K = 1$ and a causal first-stage potential outcomes $D(z)$:

[Figure: z -> Ø -> y, with epsilon connecting y and Ø]

- Exclusion: in writing $Y_i(d)$ rather than $Y_i(d, z)$
- Independence: $Z_i \perp Y_i(d)$ for all $d$ and $Z_i \perp D_i(z)$ for all $z$
- Relevance: $D_i(z) \neq D_i(z')$ for some $z, z'$ with positive probability

### p. 5 — The four groups

Consider binary $D$ and $Z$, e.g. Vietnam draft lottery
$D_{i}(0)$ and $D_{i}(1)$ are binary =$\Rightarrow$ (up to) four latent groups:
- $D_{i}(0) = D_{i}(1) = 0$: never-takers
- $D_{i}(0) = 0 < D_{i}(1) = 1$: compliers
- $D_{i}(0) = 1 > D_{i}(1) = 0$: defiers
- $D_{i}(0) = D_{i}(1) = 1$: always-takers
First-stage: $\pi =\mathbb{E} [D_{i}(1) -D_{i}(0)] = Pr($ Complier $_{i}) -Pr ($ Defier $_{i})$

### p. 6 — Understanding the groups: True/False

“A defier is someone who gets the encouragement ($Z = 1$) but doesn’t take the
treatment ($D = 0$)”
“Someone who took the treatment but had the lowest possible outcome is a defier”

### p. 7 — Reduced-form

Reduced-form (a.k.a. intent-to-treat effect, ITT):
$$\rho =\mathbb{E} [Y_{i}\mid Z_{i}= 1] -\mathbb{E} [Y_{i}\mid Z_{i}= 0]$$
$$= Pr(NT_{i}) \cdot \mathbb{E} [Y_{i}(0) -Y_{i}(0) \mid NT_{i}]$$
$+ Pr($ Complier $_{i}) \cdot \mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid$  Complier $_{i}]$
$+ Pr($ Defier $_{i}) \cdot \mathbb{E} [Y_{i}(0) -Y_{i}(1) \mid$  Defier $_{i}]$
$$+ Pr(AT_{i}) \cdot \mathbb{E} [Y_{i}(1) -Y_{i}(1) \mid AT_{i}]$$
$= Pr($ Complier $_{i})\mathbb{E} [\tau_{i}\mid$  Complier $_{i}] -Pr ($ Defier $_{i})\mathbb{E} [\tau_{i}\mid$  Defier $_{i}]$
Ratio
$\tau_{IV}= Pr($ Complier $^{i})\mathbb{E} [\tau^{i}\mid$  Complier $^{i}] -Pr ($ Defier $^{i})\mathbb{E} [\tau^{i}\mid$  Defier $^{i}]$
$Pr($ Complier $_{i}) -Pr ($ Defier $_{i})$
doesn’t have an intuitive interpretation, except constant effects or...

#### p. 7 layout reconstruction (local model, unverified)

_Cross-check: words not on the page, usually a figure description: complier, defier, equations._

- Reduced-form (a.k.a. intent-to-treat effect, ITT):
  $$
  \rho = \mathbb{E}[Y_i | Z_i = 1] - \mathbb{E}[Y_i | Z_i = 0]
  $$
  $$
  = Pr(NT) \cdot \mathbb{E}[Y_i(0) - Y_i(0) | NT_i]
  $$
  $$
  + Pr(Complier) \cdot \mathbb{E}[Y_i(1) - Y_i(0) | Complier_i]
  $$
  $$
  + Pr(Defier) \cdot \mathbb{E}[Y_i(0) - Y_i(1) | Defier_i]
  $$
  $$
  + Pr(AT) \cdot \mathbb{E}[Y_i(1) - Y_i(1) | AT_i]
  $$
  $$
  = Pr(Complier) \mathbb{E}[\tau_i | Complier_i] - Pr(Defier) \mathbb{E}[\tau_i | Defier_i]
  $$

Ratio
$$
\tau_{IT} = \frac{Pr(Complier) \mathbb{E}[\tau_i | Complier_i] - Pr(Defier) \mathbb{E}[\tau_i | Defier_i]}{Pr(Complier) - Pr(Defier)}
$$
doesn't have an intuitive interpretation, except constant effects or...

[Figure: Reduced-form equations]

### p. 8 — Monotonicity assumption

Assume monotonicity: the instrument affects the treatment weakly in the same
direction for everyone
- Either no defiers (when $\pi > 0$) or no compliers (when $\pi < 0$)
- Without loss, consider positive first-stage
LATE theorem (Imbens and Angrist (1994)): Under exclusion, independence,
and monotonicity, IV identifies the (internally valid) average causal effect among
compliers:
$\tau_{IV}=\mathbb{E} [\tau_{i}\mid$  Complier $_{i}] \equiv$ Local average treatment effect

### p. 9 — Is monotonicity plausible?

In the new pill example?
- Does the treated group = complier population?
- How does LATE relate to the ATT?
In Angrist (1990) Vietnam draft study?
In Angrist and Evans (1998) with same-sex IV?

### p. 10 — Is LATE more useful than ITT?

Reduced-form (ITT) is always causal if independence holds
- Always holds in RCTs, e.g. in encouragement designs
- While LATE further requires exclusion and monotonicity
- So why ever do IV?
IV answers more interesting questions than ITT
- Wage effects of serving in the army vs. of low lottery numbers
- More interesting in part because hopefully more externally valid with respect to alternative implementations...

### p. 11 — Example: Angrist and Hull (2023)

Does screening for prostate & colorectal cancer improve health outcomes?
- A dozen of RCTs where screening is offered for free find very different ITTs

#### p. 11 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- Does screening for prostate & colorectal cancer improve health outcomes?
- A dozen of RCTs where screening is offered for free find very different ITTs

[Figure: Reduced form effect on colorectal cancer incidence vs. First stage effect on screening participation. The x-axis ranges from 3 to 9. The y-axis ranges from -0.15 to 0.05. There are multiple data points, each represented by a horizontal line segment with error bars. The weighted slope is -0.0047 with a standard error of 0.0017.]

### p. 12 — IV estimates of the effect of screening

Open question: but is this IV estimate policy relevant?

#### p. 12 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: IV estimate plot with x-axis labeled "First stage effect on screening participation" ranging from 0.3 to 0.9, y-axis labeled "IV estimate" ranging from -0.2 to 0.2. Several data points are plotted with error bars. A weighted slope line is shown with the equation "Weighted slope = -0.0030" and standard error "SE = 0.0039".]

Open question: but is this IV estimate policy relevant?

11

### p. 13 — External validity: Is LATE useful?

Criticism: $“The$ LATE may, $or$ may not, $be a$ parameter $of$ interest... and $in$
general, there $is no$ reason $to$ suppose that $it$ will $be”$ (Deaton (2010))
- E.g. better to focus on ATE: report partially identified set (“Manski bounds”) or use a structural model for point identification
Imbens (2010) “Better LATE than nothing”:
- You should first report what the data directly gives, i.e. LATE. Then do whatever
- E.g. $“I$ would prefer $to$ keep [structural] assumptions separate and report both the LATE, with its high degree $of$ internal but possibly limited external validity, and possibly add $a$ set $of$ estimates for the overall average effect with the corresponding additional $assumptions”$

### p. 14 — External validity: Is LATE useful? (2)

Angrist and Pischke (2010):
- $“A$ good structural model might tell $us$ something about economic mechanisms $as$ well $as$ causal effects. But $if$ the information about mechanisms $is to be$ worth anything, the structural estimates should line $up$ with those derived under weaker
$assumptions”$
LATE sometimes has economic and policy relevance (e.g., Imbens (2010)), Kline
and Walters (2016))
And we can learn a lot about the complier subpopulation...

### p. 15 — Outline

1
Basic LATE result
2
Characterizing compliers
Extensions

### p. 16 — Counting the three groups

Assume monotonicity (no defiers). Which groups occupy each cell?
$D_{i}= 0$ (didn’t serve)
$D_{i}= 1$ (served)
$Z_{i}= 0$ (high lottery #)
NT + C
AT
$Z_{i}= 1$ (low lottery #)
NT
AT + C
Counting the groups:
- $n \equiv Pr(NT_{i}) = Pr(D_{i}= 0 \mid Z_{i}= 1)$
- $a = Pr(AT_{i}) = Pr(D_{i}= 1 \mid Z_{i}= 0)$
- $\pi = Pr(C_{i}) = Pr(D_{i}= 1 \mid Z_{i}= 1) -Pr(D_{i}= 1 \mid Z_{i}= 0)$ = first stage
E.g. in Angrist (1990), for white men born in 1950, the first-stage = 0.16
- By Bayes rule, compliers are 32% of veterans and 10% of non-veterans

### p. 17 — Characterizing compliers

Do compliers have unusual...
- potential outcomes: $Y_{i}(1)$ (relative to AT) and $Y_{i}(0)$ (relative to NT)?
- predetermined characteristics $X_{i}$(relative to NT and AT)?
Start with $\mathbb{E} [Y_{i}(1) \mid AT_{i}]$ and $\mathbb{E} [Y_{i}(1) \mid C_{i}]$:
$D_{i}= 0$ (didn’t serve)
$D_{i}= 1$ (served)
$Z_{i}= 0$ (high lottery #)
NT + C
AT
$Z_{i}= 1$ (low lottery #)
NT
AT + C
Thus, $\mathbb{E} [Y_{i}\mid Z_{i}= 0, D_{i}= 1] =\mathbb{E} [Y_{i}(1) \mid AT_{i}]$ and...

### p. 18 — Characterizing compliers (2)

$\mathbb{E} [Y_{i}\mid Z_{i}= 1, D_{i}= 1] =\mathbb{E} [Y_{i}(1) \mid AT_{i}]$
$$a$$
$$a+\pi +\mathbb{E} [Y^{i}(1) \mid C^{i}]$$
$\pi$
$a+\pi$ =$\Rightarrow$
$$\mathbb{E} [Y_{i}(1) \mid C_{i}] = \mathbb{E} [Y^{i}\mid Z^{i}= 1, D^{i}= 1] \cdot (a + \pi ) -\mathbb{E} [Y^{i}\mid Z^{i}= 0, D^{i}= 1] \cdot a$$
$$\pi$$
Given $a + \pi = Pr(D_{i}= 1 \mid Z_{i}= 1)$ and $a = Pr(D_{i}= 1 \mid Z_{i}= 0)$,
$$= \mathbb{E} [Y^{i}D^{i}\mid Z^{i}= 1] -\mathbb{E} [Y^{i}D^{i}\mid Z^{i}= 0]$$
$$\mathbb{E} [D_{i}\mid Z_{i}= 1] -\mathbb{E} [D_{i}\mid Z_{i}= 0]$$
Implement by IV: $Y_{i}D_{i}$ on $D_{i}$, IVed with $Z_{i}$
Intuition: think potential outcomes of $Y_{i}D_{i}$ and the causal effect on this outcome

#### p. 18 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

$$E[Y_i | Z_i = 1, D_i = 1] = E[Y_i | A_T] \frac{a}{a + \pi} + E[Y_i | C_i] \frac{\pi}{a + \pi}$$
$$\implies$$
$$E[Y_i(1) | C_i] = \frac{E[Y_i | Z_i = 1, D_i = 1] \cdot (a + \pi) - E[Y_i | Z_i = 0, D_i = 1]}{\pi} \cdot a$$

Given $a + \pi = Pr(D_i = 1 | Z_i = 1)$ and $a = Pr(D_i = 1 | Z_i = 0)$,

$$= \frac{E[Y_i D_i | Z_i = 1] - E[Y_i D_i | Z_i = 0]}{E[D_i | Z_i = 1] - E[D_i | Z_i = 0]}$$

Implement by IV: $Y_i D_i$ on $D_i$ Ived with $Z_i$

- Intuition: think potential outcomes of $Y_i D_i$ and the causal effect on this outcome

[Figure: 16]

### p. 19 — Characterizing compliers (3)

Similarly, for $\mathbb{E} [Y_{i}(0) \mid C_{i}]$: run $Y_{i} \cdot (1 -D_{i})$ on $1 -D_{i}$, instrumented with $Z_{i}$
Can get entire distributions $Y_{i}(0)$ and $Y_{i}(1)$ for compliers (Abadie (2002))
- See Kitagawa (2015) for a test of IV validity based on this
For predetermined characteristics $X_{i}$(that are $\perp \perp Z$), have multiple options:
- $X_{i}D_{i}$ on $D_{i}$, instrumented with $Z_{i}$
- $X_{i}(1 -D_{i})$ on $1 -D_{i}$, instrumented with $Z_{i}$
- A combination of the two (see Angrist, Hull, and Walters (2023))
- Note: this trick works with all design-based OLS and IV specifications, even with non-binary $D$ and $Z$ (Hull, 2025)

### p. 20 — Characterizing compliers: Example

Angrist, Pathak, and Walters (2013) and Angrist, Hull, and Walters (2023):
$D_{i}$= studying in a charter school, $Z_{i}$= getting an offer in a lottery, $Y_{i}$= test scores

#### p. 20 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

- Angrist, Pathak, and Walters (2013) and Angrist, Hull, and Walters (2023):
- $D_{i}$ = studying in a charter school, $Z_{i}$ = getting an offer in a lottery, $Y_{it}$ = test scores

[Figure: Table 3. Characteristics of Lottery Compliers at Massachusetts Urban Charter Schools]

| | | | | |
|---|---|---|---|---|
|  | Untreated (1) | Treated (2) | Pooled (3) | Always-takers (4) | Never-takers (5) |
| Female | 0.506 (0.402) | 0.510 (0.401) | 0.508 (0.401) | 0.529 (0.391) | 0.463 (0.437) |
| Black | 0.381 (0.403) | 0.380 (0.403) | 0.380 (0.403) | 0.623 (0.388) | 0.090 (0.097) |
| Hispanic | 0.293 (0.262) | 0.283 (0.262) | 0.287 (0.262) | 0.162 (0.153) | 0.228 (0.228) |
| Asian | 0.022 (0.007) | 0.024 (0.007) | 0.023 (0.006) | 0.084 (0.008) | 0.021 (0.006) |
| White | 0.299 (0.151) | 0.216 (0.106) | 0.223 (0.101) | 0.154 (0.090) | 0.215 (0.104) |
| Special education | 0.190 (0.151) | 0.181 (0.151) | 0.183 (0.151) | 0.158 (0.127) | 0.177 (0.133) |
| English language learner | 0.143 (0.015) | 0.148 (0.015) | 0.145 (0.015) | 0.054 (0.011) | 0.088 (0.010) |
| Subscribed lunch | 0.609 (0.099) | 0.609 (0.099) | 0.609 (0.099) | 0.698 (0.088) | 0.396 (0.101) |
| Baseline math score | -27.4 (0.047) | -31.2 (0.041) | -29.4 (0.043) | -32.2 (0.045) | -20.0 (0.067) |
| Baseline English score | -19.2 (0.037) | -20.7 (0.032) | -19.5 (0.035) | -20.9 (0.036) | -16.0 (0.057) |
| Share of sample | 0.223 (0.050) | 0.175 (0.050) | 0.148 (0.050) | 0.148 (0.050) | 0.166 (0.050) |

18

### p. 21 — Extrapolation via reweighting

If compliers have different $X_{i}$ than overall population or the treated group, we can
reweight the IV estimator to make them look similar
- If effect heterogeneity is fully explained by $X_{i}$, i.e. homogeneous effects given $X_{i}$, this yields ATE and ATT
Aronow and Carnegie (2013): compliers have a higher female share $\Leftrightarrow$ females
have a higher complier share
- Estimate $Pr($ Complier $_{i}\mid X_{i})$ via first stage heterogeneity
- Use $1/ bPr($ Complier $_{i}\mid X_{i})$ as weights in IV
Angrist and Fernandez-Val (2010): if two IVs give different answers (e.g., twin
births vs. same sex), is it because compliers have different covariates?
- Develop an overidentification-type test

### p. 22 — Outline

1
Basic LATE result
2
Characterizing compliers
Extensions

### p. 23 — Extensions

Non-binary treatments and instruments with linear heterogeneity
Single multi-valued or continuous instrument
Single multi-valued or continuous treatment
Multiple instruments
Multiple treatments
Including necessary covariates
Non-causal first stage

### p. 24 — Linear heterogeneity

Consider arbitrary $D_{i}$ and $Z_{i}$ but assume linear heterogeneity of causal effects and
first-stage coefs:
First-stage: $D_{i}(z) = D_{i}(0) + \pi_{i}z$ (without loss if $Z_{i}$ is binary)
$\Rightarrow$
$D_{i}= \pi_{i}Z_{i} + u_{i}$ for $u_{i}= D_{i}(0)$
Structural equation: $Y_{i}(d) = Y_{i}(0) + \tau_{i}d$ (without loss if $D_{i}$ in binary)
$\Rightarrow$
$Y_{i}= \tau_{i}D_{i} + \epsilon_{i}$ for $\epsilon_{i}= Y_{i}(0)$
Reduced-form: $Y_{i}= \tau_{i}\pi_{i}Z_{i} + e_{i}$ for $e_{i}= \tau_{i}u_{i} + \epsilon_{i}$
By independence, $Z_{i}\perp \perp (\tau_{i}, \epsilon_{i}, \pi_{i}, u_{i})$
Claim: $\tau_{IV}=^{\mathbb{E}[\taui\pii]}$
$\mathbb{E}[\pi_{i}]$ , i.e. a $\pi^{i}$-weighted average of $\tau^{i}$ if monotonicity holds ($\pi^{i}$ have
the same sign for all $i$)

### p. 25 — Proof

We know first-stage identifies $\mathbb{E} [\pi_{i}]$; reduced-form identifies $\mathbb{E} [\tau_{i}\pi_{i}]$ since
$$Y_{i}= \tau_{i}D_{i} + \epsilon_{i}= \tau_{i} (\pi_{i}Z_{i} + u_{i}) + \epsilon_{i}= \tau_{i}\pi_{i}Z_{i} + e_{i}$$
In more detail, let $\mathbb{E} [Z_{i}] = \mu$ . Consider the numerator of $\tau_{IV}=$ Cov $[Y_{i}, Z_{i}] /$ Cov $[D_{i}, Z_{i}]$:
Cov $[Y_{i}, Z_{i}] =\mathbb{E} [Y_{i} (Z_{i} -\mu )]$
$$=\mathbb{E} [(\tau_{i}\pi_{i}Z_{i} + e_{i}) (Z_{i} -\mu )]$$
$=\mathbb{E} [\tau_{i}\pi_{i}]$ Var $[Z_{i}] .$
Similarly, Cov $[D_{i}, Z_{i}] =\mathbb{E} [\pi_{i}]$ Var $[Z_{i}]$ and thus
$$\tau_{IV}= \mathbb{E} [\tau^{i}\pi^{i}]$$
$$\mathbb{E} [\pi_{i}] .$$

#### p. 25 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

We know first-stage $\mathbb{E}[\pi_i]$; reduced-form identifies $\mathbb{E}[\tau_i\pi_i]$ since

$Y_{it} = \tau_i D_i + \epsilon_i = \tau_i (\pi_i Z_i + u_i) + \epsilon_i = \tau_i \pi_i Z_i + \epsilon_i$

In more detail, let $\mathbb{E}[Z_i] = \mu$. Consider the numerator of $\tau_{IV} = \text{Cov}[Y_{it}, Z_i] / \text{Cov}[D_i, Z_i]$:

$\text{Cov}[Y_{it}, Z_i] = \mathbb{E}[Y_i (Z_i - \mu)] = \mathbb{E}[(\tau_i \pi_i Z_i + \epsilon_i) (Z_i - \mu)] = \mathbb{E}[\tau_i \pi_i] \text{Var}[Z_i]$.

Similarly, $\text{Cov}[D_i, Z_i] = \mathbb{E}[\tau_i] \text{Var}[Z_i]$ and thus

$\tau_{IV} = \frac{\mathbb{E}[\tau_i \pi_i]}{\mathbb{E}[\tau_i]}$.

### p. 26 — Single multi-valued instrument

Suppose $D_{i}$ is binary but $Z_{i}$ takes values $z_{0}\leq \cdot \cdot \cdot \leq z_{P}$
- E.g. $D_{i}$= attend college, $Z_{i}$= number of colleges nearby
Monotonicity: $D_{i}(z)$ never switches from 1 to 0 as $z \uparrow$
Option 1: select the sample of $Z_{i}\in \{z_{p-1}, z_{p}\}$ and compare groups $Z_{i}= z_{p}$ vs.
$Z_{i}= z_{p-1}$
- Yields $\tau_{p}=\mathbb{E} [Y_{i}(1) -Y_{i}(0) \mid D_{i}(z_{p}) > D_{i}(z_{p-1})]$
- Non-overlapping complier groups for each $p$

### p. 27 — Single multi-valued instrument (2)

Option 2: Use linear IV with a single instrument $Z_{i}$
- Yields a weighted average of $\tau_{p}$: Cov $[Y_{i}, Z_{i}]$ Cov $[D_{i}, Z_{i}] =$
$P$
$X$
$p=1$
$\omega_{p}\tau_{p},$
$$\omega_{p}=$$
$Pr (D_{i}(z_{p}) > D_{i}(z_{p-1})) \cdot$  Cov $[1 [Z_{i}\geq z_{p}] , Z_{i}]$
$$PP$$
$\ell =1 Pr (D^{i}(z^{\ell}) > D^{i}(z^{\ell-1})) \cdot$  Cov $[1 [Z^{i}\geq z^{\ell}] , Z^{i}]$
- Weights can be computed; larger for big complier groups, around the median of $Z_{i}$
- Exercise: prove using result from part A1 of the course

#### p. 27 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Option 2: Use linear IV with a single instrument $Z_i$

- Yields a weighted average of $\tau_p$:
$$ \frac{Cov[Y_i, Z_i]}{\text{Cov}[D_i, Z_i]} = \sum_{p=1}^P \omega_p \tau_p, \quad \omega_p = \frac{Pr(D_i(z_{p-1}) > D_i(z_p)) \cdot Cov[1[Z_i \geq z_p], Z_i]}{\sum_{p=1}^P Pr(D_i(z_{p-1}) > D_i(z_p)) \cdot Cov[1[Z_i < z_p], Z_i]} $$

- Weights can be computed; larger for big complier groups, around the median of $Z_i$

- Exercise: prove using result from part A1 of the course

24

### p. 28 — Single continuous instrument

Result on linear IV weights extends naturally to continuous $Z_{i}$
- E.g. $Z_{i}$= distance to nearest college (Card, 1993)
Can compare $Z_{i}= z + \symbol$ to $Z_{i}= z -\symbol$ (for small $\symbol$ ) to get marginal treatment
effects (MTE)
If variation in $Z_{i}$ is super rich, such that $Pr(D_{i}= 1 \mid Z_{i})$ takes all values $\in [0, 1]$,
weighted averages of MTEs identify the ATE, ATT, and other estimands
- Intuition: there are no always-takers or never-takers
- See e.g. Heckman and Vytlacil (2005) and Mogstad and Torgovitsky (2024)

### p. 29 — Single multi-valued treatment (Angrist and Imbens (1995))

Conversely, suppose $Z_{i}$ is binary but $D_{i}$ takes values $d_{0}\leq \cdot \cdot \cdot \leq d_{Q}$
- E.g. Angrist and Krueger (1991): $D_{i}$= years of schooling, $Z_{i}$= born in 1st quarter
Monotonicity: $D_{i}(1) \geq D_{i}(0)$ for all $i$ (compliers: $D_{i}(1) > D_{i}(0)$)
We can measure how $Z_{i}$ shifts the CDF of $D_{i}$:
$$Pr (D_{i}\geq d_{q}\mid Z_{i}= 1) -Pr (D_{i}\geq d_{q}\mid Z_{i}= 0) = Pr(D_{i}(1) \geq d_{q}> D_{i}(0))$$
- Larger for values $d_{q}$ where the IV pushes more people from below to above
- Complier groups $D_{i}(1) \geq d_{q}> D_{i}(0)$ can overlap across different $q$

#### p. 29 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- Conversely, suppose $Z_i$ is binary but $D_i$ takes values $d_0 \le \dots \le d_q$
-  - E.g. Angrist and Krueger (1991): $D_i$ = years of schooling, $Z_i$ = born in 1st quarter
- Monotonicity: $D_i(1) \ge D_i(0)$ for all $i$ (compliers: $D_i(1) > D_i(0))$
- We can measure how $Z_i$ shifts the CDF of $D_i$:
  - $Pr(D_i \ge d_q | Z_i = 1) - Pr(D_i \ge d_q | Z_i = 0) = Pr(D_i(1) \ge d_q > D_i(0))$
  -  - Larger for values $d_q$ where the IV pushes more people from below to above
  -  - Complier groups $D_i(1) \ge d_q > D_i(0)$ can overlap across different $q$

[Figure: 26]

### p. 30 — Single multi-valued treatment (2)

IV (Wald) estimand:
Cov $[Y_{i}, Z_{i}]$
Cov $[D_{i}, Z_{i}] =$
$Q$
$X$
$q=1$
$$\omega_{q}\mathbb{E}$$
$$Y_{i}(d_{q}) -Y_{i}(d_{q-1})$$
$$d_{q} -d_{q-1}$$
$\mid D_{i}(1) \geq d_{q}> D_{i}(0)$
with weights that can be computed:
$\omega_{q}=$
$$Pr (D_{i}(1) \geq d_{q}> D_{i}(0))$$
$$PQ$$
$$\ell =1 Pr (D^{i}(1) \geq d^{\ell}> D^{i}(0))$$
$.$
Result generalizes immediately to continuous $D_{i}$
We cannot isolate individual margins by conditioning on $D_{i}\in \{d_{q-1}, d_{q}\}$

#### p. 30 layout reconstruction (local model, unverified)

_Cross-check: no symbol, number, or word absent from the text layer (omissions are not detected)._

- IV (Wald) estimand:
$$
\frac{Cov[Y_{i}, Z_{i}]}{Cov[D_{i}, Z_{i}]} = \sum_{q=1}^{Q} \omega_{q}E \left[ Y_{i}(d_{q}) - Y_{i}(d_{q-1}) \mid D_{i}(1) \geq d_{q} > D_{i}(0) \right]
$$
  - $d_{q} - d_{q-1}$
  - with weights that can be computed:
$$
\omega_{q} = \frac{Pr(D_{i}(1) \geq d_{q} > D_{i}(0))}{\sum_{\ell=1}^{Q} Pr(D_{i}(1) \geq d_{q} > D_{i}(0))}
$$
- Result generalizes immediately to continuous $D_{i}$
- We cannot isolate individual margins by conditioning on $D_{i} \in \{d_{q-1}, d_{q}\}$
[Figure: 27]

### p. 31 — Weights in Angrist and Krueger (1991)

(From Angrist and Imbens (1995), Figure 3)

#### p. 31 layout reconstruction (local model, unverified)

_Cross-check: part of this page is an embedded image, so the block cannot be checked against the text layer; compare with the PDF._

[Figure: 15th-4th Quarter CDF Difference vs. Years of Schooling. Several curves are plotted, labeled with different line styles. The x-axis is labeled "YEARS OF SCHOOLING" ranging from 0 to 20. The y-axis is labeled "15th-4th QUARTER CDF DIFFERENCE" ranging from -0.001 to 0.024. The bottom right corner includes the text "(From Angrist and Imbens (1995), Figure 3)"]

28

### p. 32 — Multiple instruments

E.g. Angrist and Evans (1998): $Z_{1}$= two boys, $Z_{2}$= two girls
2SLS identifies a weighted average of individual IVs $\rho_{k}/\pi_{k}$
- Weight on $Z_{k}$= slope of regression of $\pi_{k}Z_{ki}$ on the first-stage fitted value
$\hat{D}_{i}= P$
$k \pi^{k}Z^{ki}$; typically convex but not guaranteed
- Lee (2018): conventional SE of 2SLS are wrong!
$^{\star}$ Moments $\mathbb{E} [(Y_{i} -\tau_{2SLS}D_{i}) Z_{i}] = 0$ do not hold with heterogeneous effects!
$^{\star}$ But the correction tends to be small

### p. 33 — Multiple instruments (2)

Joint monotonicity is trickier to define:
Imbens and Angrist (1994): same ranking of $D_{i}(\vec{z})$ across $\vec{z} = (z_{1}, \ldots , z_{K})$ for all $i$
- Very restrictive: essentially $\vec{Z}$ is one multi-valued instrument
- Can’t have one family respond to two boys only and another to two girls only
Mogstad, Torgovitsky, and Walters (2021) “partial monotonicity”: holding $z_{-k}$
fixed, same ranking of $D_{i}(z_{k}; z_{-k})$ across $z_{k}$ for all $i$
- Binary $D, Z_{1}, Z_{2}$=$\Rightarrow$ 6 groups: e.g. “eager compliers”: $D_{i}= 1 [Z_{1i}= 1$ or $Z_{2i}= 1]$
- 2SLS = weighted average of LATEs but some weights can be negative

### p. 34 — Multiple treatments

Literature has focused on exclusive treatments
Kline and Walters (2016): $D_{1i}$= early childhood education program (Head Start),
$D_{2i}$= alternative public programs, $D_{0i}= 1 -D_{1i} -D_{2i}$
- Only one IV: $Z_{1i}$= randomized offer for the focal program
- Monotonicity: no defiers & $Z_{1i}$ doesn’t affect choice between $D_{2}$ and $D_{0}$
- Instrumenting $D_{1i}$ with $Z_{1i}$ identifies a weighted average of $Y_{i}(1) -Y_{i}(0)$ and
$Y_{i}(1) -Y_{i}(2)$ among compliers at these margins
- Weights are identified: how many kids switch to $D_{1i}$ from each alternative
$^{\star}\propto$ causal effects of $D_{1i}$ on $D_{i0}$ and $D_{i2}$(estimated by IV)
- But “subLATEs” are not identified

### p. 35 — Multiple treatments (2)

Mountjoy (2022): $D_{1i}$= enrolling in a community college, $D_{2i}$= enrolling in a
4-year college
- $Z_{1i}, Z_{2i}$= distance from nearest community college and 4-year college
- IV with two endogenous vars does not produce causal estimands with heterogeneous effects (Kirkeboen et al. (2016))
- Mountjoy develops a nonparametric IV approach to separate LATEs at each margin
- See Bhuller and Sigstad (2024) for a different approach

### p. 36 — Including necessary covariates

Suppose $Z_{i}$ is randomly assigned only conditionally on $X_{i}$
If $Z_{i}$ is scalar, pscore $\mathbb{E} [Z_{i}\mid X_{i}]$ is linear (“rich controls,” e.g. $X_{i}$ is saturated), and
monotonicity holds unconditionally:
$\Rightarrow$ IV that controls for $X_{i}$ identifies a convex average of conditional-on-$X_{i}$ LATEs (see
MHE Ch. 4.5.1)
Otherwise, the estimand need not be causal
- Misspecified $\mathbb{E} [Z_{i}\mid X_{i}]$: Blandhol, Bonney, Mogstad, and Torgovitsky (2025)
- Multiple IVs (or OLS with multiple treatments): Goldsmith-Pinkham, Hull, and Kolesár (2024) “contamination bias”

### p. 37 — Non-causal first stage

We introduced monotonicity in a casual way but it needn’t be (Small et al. (2017))
Independence + linear pscore: $\mathbb{E} [Z_{i}\mid Y_{i}(0), Y_{i}(1), X_{i}] = \lambda 'X_{i}$
(no $D_{i}(z)$!)
Stochastic monotonicity: $Pr(D_{i}= 1 \mid Z_{i}= z, Y_{i}(0), Y_{i}(1), X_{i})$ weakly increases in $z$
Borusyak and Hull (2024) simplified to binary $D_{i}$: for IV with $X_{i}$ controls,
$\tau_{IV}= \mathbb{E} [\symbol^{i} \cdot (Y^{i}(1) -Y^{i}(0))]$
$\mathbb{E} [\symbol_{i}]$
for $\symbol_{i}=$ Cov $[Z_{i}, D_{i}\mid Y_{i}(0), Y_{i}(1), X_{i}] \geq 0$
- “Negative weights are no concern in design-based specifications”
- But compliers should not be interpreted as those whose treatment causally responds to the IV

### p. 38 — References I

Abadie, A. (2002): “Bootstrap Tests for Distributional Treatment Effects in Instrumental Variable
Models,” Journal $of$ the American Statistical Association, 97, 284–292.
Angrist, J. and I. Fernandez-Val (2010): “ExtrapoLATE-ing: External Validity and
Overidentification in the LATE Framework,” NBER Working Paper.
Angrist, J. and P. Hull (2023): “IV Methods Reconcile Intention-to-Screen Effects Across
Pragmatic Cancer Screening Trials,” Proceedings $of$ the National Academy $of$ Sciences, 120.
Angrist, J., P. Hull, and C. R. Walters (2023): “Methods for Measuring School
Effectiveness,” in Handbook $of$ the Economics $of$ Education.
Angrist, J. D. (1990): “Lifetime earnings and the Vietnam era draft lottery: evidence from social
security administrative records,” American Economic Review, 80, 313–336.
Angrist, J. D. and W. N. Evans (1998): “Children and Their Parents ’ Labor Supply : Evidence
from Exogenous Variation in Family,” American Economic Association, 88, 450–477.
Angrist, J. D. and G. W. Imbens (1995): “Two-Stage Least Squares Estimation of Average
Causal Effects in Models with Variable Treatment Intensity,” Journal $of$ the American Statistical
Association, 90, 431–442.

### p. 39 — References II

Angrist, J. D. and A. B. Krueger (1991): “Does Compulsory School Attendance Affect
Schooling and Earnings?” Quarterly Journal $of$ Economics.
Angrist, J. D., P. a. Pathak, and C. R. Walters (2013): “Explaining charter school
effectiveness,” American Economic Journal: Applied Economics, 5, 1–27.
Angrist, J. D. and J.-S. Pischke (2010): “The Credibility Revolution in Empirical Economics:
How Better Research Design is Taking the Con out of Econometrics,” Journal $of$ Economic
Perspectives, 24, 3–30.
Aronow, P. M. and A. Carnegie (2013): “Beyond LATE: Estimation of the Average Treatment
Effect with an Instrumental Variable,” Political Analysis, 21, 492–506.
Bhuller, M. and H. Sigstad (2024): “2SLS with Multiple Treatments,” Journal $of$ Econometrics,
242, 105785.
Blandhol, C., J. Bonney, M. Mogstad, and A. Torgovitsky (2025): “When is TSLS
Actually LATE?” Working Paper.
Borusyak, K. and P. Hull (2024): “Negative weights are no concern in design-based
specifications,” AEA Papers and Proceedings, 114, 597–600.

### p. 40 — References III

Card, D. (1993): “Using Geographic Variation in College Proximity to Estimate the Return to
Schooling,” NBER Working Paper.
Deaton, A. (2010): “Instruments, Randomization, and Learning about Development,” Journal $of$
Economic Literature, 48, 424–455, iSBN: 0022-0515.
Goldsmith-Pinkham, P., P. Hull, and M. Kolesár (2024): “Contamination Bias in Linear
Regressions,” American Economic Review, 114, 4015–4051.
Heckman, J. J. and E. Vytlacil (2005): “Structural equations, treatment effects, and
econometric policy evaluation,” Econometrica, 73, 669–738, iSBN: 4030008526.
Hull, P. (2025): “One Weird Trick to Characterize Effective Populations in Design-Based
Specifications,” Unpublished.
Imbens, G. W. (2010): “Better LATE Than Nothing: Some Comments on Deaton (2009) and
Heckman and Urzua (2009),” Journal $of$ Economic Literature, 48, 399–423.
Imbens, G. W. and J. D. Angrist (1994): “Identification and Estimation of Local Average
Treatment Effects,” Econometrica, 62, 467–475, iSBN: 00129682.

### p. 41 — References IV

Kirkeboen, L. J., E. Leuven, and M. Mogstad (2016): “Field of Study, Earnings, and
Self-Selection,” The Quarterly Journal $of$ Economics, 131, 1057–1111.
Kitagawa, T. (2015): “A Test for Instrument Validity,” Econometrica, 83, 2043–2063.
Kline, P. and C. R. Walters (2016): “Evaluating Public Programs with Close Substitutes: The
Case of HeadStart*,” The Quarterly Journal $of$ Economics, 131, 1795–1848.
Lee, S. (2018): “A Consistent Variance Estimator for 2SLS When Instruments Identify Different
LATEs,” Journal $of$ Business $&$ Economic Statistics, 36, 400–410.
Mogstad, M. and A. Torgovitsky (2024): “Instrumental variables with unobserved
heterogeneity in treatment effects,” in Handbook $of$ Labor Economics, Elsevier, vol. 5, 1–114.
Mogstad, M., A. Torgovitsky, and C. R. Walters (2021): “The Causal Interpretation of
Two-Stage Least Squares with Multiple Instrumental Variables,” American Economic Review, 111,
3663–3698.
Mountjoy, J. (2022): “Community Colleges and Upward Mobility,” American Economic Review,
112, 2580–2630.
Small, D. S., Z. Tan, R. R. Ramsahai, S. A. Lorch, and M. A. Brookhart (2017):
“Instrumental Variable Estimation with a Stochastic Monotonicity Assumption,” Statistical Science,
32.

## Extraction Gaps

- p. 4: figure or diagram present
- p. 7: display math with drawn rules
- p. 11: figure or diagram present
- p. 12: figure or diagram present
- p. 18: display math with drawn rules
- p. 20: figure or diagram present
- p. 25: display math with drawn rules
- p. 27: display math with drawn rules
- p. 29: display math with drawn rules
- p. 30: display math with drawn rules; large delimiter (matrix or cases)
- p. 31: figure or diagram present
