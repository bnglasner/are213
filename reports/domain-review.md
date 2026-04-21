# Domain Review: ARE213 AI-Readable Econometrics Notes

**Reviewer role:** Domain Reviewer agent
**Review date:** 2026-03-08
**Scope:** AI-readable companion markdown notes for UC Berkeley ARE213 (PhD Applied Econometrics, 2025)
**Files reviewed:** `ECONOMETRICS_MAP.md`, `00_syllabus.md`; lecture notes A1–E1; concept stubs for Parallel_trends, LATE, Weak_instruments, Staggered_adoption_DiD

---

## Executive Summary

The notes are generally well-structured, internally consistent on core formulas, and pedagogically sound. The most significant issues are: (1) the LATE concept stub omits two of the four required assumptions; (2) the RD estimand equality to a conditional LATE is presented without foregrounding the two-sided continuity requirement; (3) concept stubs are too sparse to function as the "canonical anchors" promised by the map; (4) the multi-instrument IV negative-weight risk is understated relative to how clearly negative weights are discussed in the staggered DiD module. Optional issues include missing forward links to the spillovers module, no provenance caveat at the map level, and notation inconsistencies that the concept stubs were supposed to resolve but do not.

---

## Findings (Critical → Medium → Optional)

---

### FINDING 1 — Critical / High Confidence

**Issue:** The LATE concept stub omits independence and exclusion from the theorem's requirements.

**Evidence:** `concepts/LATE.md` defines LATE as "IV estimand under monotonicity identifying average effect for compliers." `C2_LATE.md` correctly states all four assumptions (independence, exclusion, relevance, monotonicity) and its Appendix B records: "LATE theorem under independence, exclusion, monotonicity: tau_IV = E[tau_i | Complier_i]."

**Risk:** An AI agent retrieving the concept stub as its canonical anchor — the stated design purpose — would omit exclusion and independence when describing LATE requirements, propagating a critically incomplete characterization into student outputs.

**Recommended fix:** Expand the definition: "IV estimand identifying the average treatment effect for compliers, under four joint assumptions: (1) instrument independence/exogeneity, (2) exclusion restriction (no direct Z→Y path), (3) relevance (non-zero first stage), and (4) monotonicity (no defiers: D(1) ≥ D(0))."

**Verification step:** Confirm against the four-assumption block in `C2_LATE.md` p4–p14 and Appendix B p8.

---

### FINDING 2 — Critical / High Confidence

**Issue:** The sharp RD estimand equality `tau_RD = E[Y(1)-Y(0)|X=c]` requires continuity of *both* potential-outcome regressions at the cutoff, but this two-sided requirement is only mentioned in a proof-sketch block and is not foregrounded where students first encounter the estimand formula.

**Evidence:** `E1_RDD_basics.md` Coverage Map states "identified if both potential-outcome regressions are continuous at c" but the Definitions/Key results section presents the estimand formula without restating this condition. The Appendix B equation asserts equality to `E[Y_i(1)-Y_i(0)|X_i=c]` under the vague phrase "continuity assumptions."

**Risk:** Students may treat the limit-contrast formula as equivalent to a conditional LATE without recognizing that continuity of `E[Y(1)|X=x]` — non-trivial in a sharp design where only treated units appear above the cutoff — is also required.

**Recommended fix:** In the Definitions block, state explicitly: "The equality `tau_RD = E[Y(1)-Y(0)|X=c]` requires continuity of both `E[Y(d)|X=x]` at `c` for `d ∈ {0,1}`. Continuity of `E[Y(1)|X=x]` is a substantive assumption, not a direct testable implication."

**Verification step:** Cross-reference Hahn-Todd-Van der Klaauw (2001) identification conditions to confirm the two-sided requirement.

---

### FINDING 3 — Medium / High Confidence

**Issue:** `concepts/Parallel_trends.md` is too sparse for its stated role as a canonical anchor. It omits the potential-outcomes formulation of PTA, the untestability caveat (PTA applies to counterfactual post-treatment trends), the conditional-on-covariates variant, and any mention that pre-trend tests are weak evidence.

**Evidence:** The stub's entire definition is one sentence. `D2_Canonical_DiD.md` devotes twelve slides (p20–p32) to PTA caveats and provides the formal potential-outcomes statement `E[Y_t(0)-Y_{t-1}(0)|treated] = E[Y_t(0)-Y_{t-1}(0)|control]`. The concept stub contains none of this.

**Risk:** An agent retrieving the concept stub to answer questions about DiD validity would omit the untestability caveat and potentially suggest that passing pre-trend tests validates PTA.

**Recommended fix:** Expand to include: (1) the formal potential-outcomes statement; (2) the note that PTA is untestable post-treatment; (3) the distinction between unconditional and conditional-on-X PTA; (4) a one-sentence caveat on pre-trend test limitations.

**Verification step:** Confirm consistency with `D2_Canonical_DiD.md` p7 and the staggered extension in `D3_Staggered_adoption.md` p5.

---

### FINDING 4 — Medium / High Confidence

**Issue:** `C2_LATE.md` states that in multi-instrument settings "weights may be non-convex" but does not say weights can be *negative* — a materially stronger claim. `D3_Staggered_adoption.md` discusses negative weights explicitly and at length, creating an inconsistency in how clearly this risk is communicated across structurally analogous problems.

**Evidence:** `C2_LATE.md` Appendix B (p32–p33): "2SLS is a weighted average of local effects and weights may be non-convex in general designs." `D3_Staggered_adoption.md` p15–p16 discusses "negative weights" explicitly and describes sign-reversal consequences.

**Risk:** "Non-convex" is technically correct but pedagogically insufficient; students familiar with the DiD negative-weight literature will recognize the issue, but others will not. The inconsistency between modules on the same structural problem is a cross-referencing failure.

**Recommended fix:** In `C2_LATE.md` Extensions, add: "In designs with multiple instruments, 2SLS weights on instrument-specific LATEs can be negative when instruments have opposite-signed projections onto the endogenous regressor — analogous to the negative-weight problem in staggered DiD (see D3)." Add a cross-reference to `D3_Staggered_adoption.md`.

**Verification step:** Confirm the weight formula in C2 Appendix B p32–p33 is consistent with the negative-weight claim and that the cross-reference is reciprocated in D3.

---

### FINDING 5 — Medium / High Confidence

**Issue:** `B_covariate_adjustment.md` recommends trimming extreme propensity scores as a diagnostic step without stating that trimming changes the target estimand from ATE over the full population to ATE over the trimmed-support subpopulation.

**Evidence:** Implementation Checklist step 6: "Diagnose influence of extreme weights and trim/restrict support if justified." No statement that trimming redefines the target population.

**Risk:** Students may treat trimming as a robustness exercise rather than an estimand-redefining choice. In policy contexts, the untrimmed high- or low-propensity units may be precisely the population of interest.

**Recommended fix:** Add to step 6: "Trimming extreme propensity scores converts the estimand from ATE over the full covariate distribution to ATE over the trimmed-support subpopulation. Document this change and assess whether the restricted estimand remains policy-relevant."

**Verification step:** Check `D4_DiD_extensions.md` and `E2_RDD_extensions.md` for consistency on this point in their covariate-adjustment extensions.

---

### FINDING 6 — Medium / Medium Confidence

**Issue:** `D2_Canonical_DiD.md` flags anticipation as a failure mode but does not explain the mechanism: pre-treatment behavioral changes contaminate the lead coefficients used as pre-trend diagnostics, making anticipation and genuine pre-trends observationally conflated. The formal no-anticipation condition appears only in the staggered module (D3).

**Evidence:** `D2_Canonical_DiD.md` Diagnostics: "Anticipation/spillovers violating canonical assumptions" — no further development. `D3_Staggered_adoption.md` p6: formal no-anticipation condition `Y_it(e) = Y_it(infinity)` for `e > t`.

**Risk:** Students may not understand that anticipation can *generate* spurious pre-trend patterns (making a bad design look good or vice versa), undermining the pre-trend diagnostic logic.

**Recommended fix:** In `D2_Canonical_DiD.md`, add under the anticipation failure mode: "Anticipation causes treated units to adjust behavior before the formal treatment date, contaminating pre-treatment lead coefficients. Pre-trend leads cannot distinguish anticipation from genuine pre-existing trend differences. See the formal no-anticipation condition in `D3_Staggered_adoption.md`."

**Verification step:** Confirm the formal no-anticipation condition in D3 p6 is consistent with the mechanism described.

---

### FINDING 7 — Medium / Medium Confidence

**Issue:** `A1_regression.md` presents the OVB formula `delta_1 = beta_1 + beta_2 * rho` without cautioning that this two-variable decomposition does not generalize directly to settings with multiple mutually correlated omitted variables.

**Evidence:** `A1_regression.md` p42 block presents the two-variable formula. The note warns against causal interpretation but not against misapplication with multiple omitted variables. The Gelbach decomposition is mentioned in passing in the Diagnostics block.

**Risk:** Students commonly apply the two-variable sign-of-bias reasoning to multi-confounder settings and arrive at incorrect conclusions about the direction of omitted-variable bias when the omitted variables are themselves correlated.

**Recommended fix:** Add: "With multiple omitted variables, each `beta_j * rho_j` term cannot be summed independently — cross-correlations among omitted variables must be accounted for jointly. The Gelbach decomposition (referenced in these notes) provides the correct multi-covariate generalization."

**Verification step:** Confirm the Gelbach decomposition description in A1 handles the multi-variable case correctly.

---

### FINDING 8 — Medium / Medium Confidence

**Issue:** `C1_IV_basics.md` mentions first-stage F-statistics as the primary weak-IV diagnostic without specifying a threshold or noting that the conventional F > 10 rule (Stock-Yogo) assumes homoskedastic errors and does not apply under heteroskedasticity or clustering. The more robust effective F-statistic (Montiel Olea-Pflueger) is not mentioned.

**Evidence:** `C1_IV_basics.md` Structured Extract: "First-stage F and related weak-IV diagnostics." `concepts/Weak_instruments.md`: no mention of heteroskedasticity-valid alternatives.

**Risk:** Students in applied empirical work — where clustering is standard — may use the F > 10 rule-of-thumb as a validity threshold without recognizing it was derived for a different setting.

**Recommended fix:** Add: "The conventional F > 10 threshold (Stock-Yogo 2005) was derived assuming homoskedastic errors. Under heteroskedasticity or clustering, report the effective F-statistic (Montiel Olea-Pflueger 2022), which provides valid size-control thresholds for a wider class of settings." Update `concepts/Weak_instruments.md` accordingly.

**Verification step:** Check whether `C3_judge_IV.md` discusses the effective F, given that judge designs routinely involve clustering.

---

### FINDING 9 — Optional / High Confidence

**Issue:** All four concept stubs follow an identical, minimally populated template. The "Agent Notes" field is boilerplate across all files. No stub contains any actual notation disambiguation, despite the ECONOMETRICS_MAP explicitly describing concept notes as "canonical notation anchors when symbols vary across modules."

**Evidence:** All four reviewed concept files (`Parallel_trends.md`, `LATE.md`, `Weak_instruments.md`, `Staggered_adoption_DiD.md`) have identical Agent Notes: "Use this note as canonical notation anchor when symbols differ across lecture files." No symbol tables exist. Known notation variants across modules include: `e(X)` vs `p(X)` (propensity score within B), `E_i` vs `G_i` (cohort timing across D2/D3), `R` vs `X_i` (running variable within E1).

**Risk:** Agents expecting canonical notation will get only redirect links. Notation inconsistencies across modules will not be resolved.

**Recommended fix:** For each concept stub, add a "Notation" subsection listing the canonical symbol and known alternatives with their source modules. Source material for this exists in Appendix C (Symbol-Level Reconciliation) of each lecture note.

**Verification step:** Compare symbol tables against Appendix C sections in lecture notes to ensure consistency.

---

### FINDING 10 — Optional / High Confidence

**Issue:** No upstream module (A2, D2, D3, or C1) carries a forward cross-reference to `F_Spillovers_Formula_IV` when interference or spillovers are flagged as a validity threat. The dependency exists in `ECONOMETRICS_MAP.md` but is not reflected in individual lecture files.

**Evidence:** `A2_causality.md` discusses SUTVA/interference extensively (p24) but concept links do not include F. `D2_Canonical_DiD.md` Diagnostics: "spillovers" — no link. `D3_Staggered_adoption.md` Structured Extract: "No anticipation/interference unless modeled" — no link.

**Risk:** Students encountering spillover threats in IV or DiD modules would not be directed to the formal toolkit in module F.

**Recommended fix:** Add a `see_also` or inline link in `A2_causality.md`, `D2_Canonical_DiD.md`, and `D3_Staggered_adoption.md` pointing to `F_Spillovers_Formula_IV` wherever interference is flagged.

**Verification step:** Confirm that `F_Spillovers_Formula_IV.md` covers interference/exposure-mapping formalism as referenced in the map.

---

### FINDING 11 — Optional / Medium Confidence

**Issue:** `A2_causality.md` Section 5 (causality vs prediction) is included with a note that "lecture labels this block as skipped" but the content carries no caveat distinguishing it from core material. An agent would treat it as equally authoritative.

**Evidence:** Section 5 heading: "Causality vs prediction (lecture labels this block as skipped, but slides include it)." Content is substantively correct but non-canonical status is buried in the section heading rather than flagged prominently.

**Recommended fix:** Add a tag at the section top: "Supplementary — marked as skipped in lecture. Treat as contextual background, not core curriculum."

**Verification step:** Cross-check whether the decision-theoretic framing here is consistent with how prediction vs causality is handled elsewhere in the notes.

---

### FINDING 12 — Optional / Medium Confidence

**Issue:** `ECONOMETRICS_MAP.md` contains no system-level provenance caveat, despite `00_syllabus.md` noting that text extraction was unreliable due to font encoding. Each lecture note has an Extraction Gaps appendix, but an agent entering through the map would have no forewarning.

**Evidence:** `00_syllabus.md`: "reliable text extraction from the original PDF was not available due to font encoding." Each lecture note has Extraction Gaps and Equation Fidelity appendices.

**Risk:** Agents may treat extracted formulas as verbatim transcripts rather than best-effort reconstructions.

**Recommended fix:** Add a `## Provenance and Reliability` section to `ECONOMETRICS_MAP.md` noting that all content is PDF-extracted and reconstructed, that formulas have been normalized where possible, and that original PDFs remain authoritative. Instruct agents to flag uncertainty on formulas not verified against the Equation Fidelity appendix.

---

## Summary Table

| # | Severity | Confidence | Module(s) | Issue |
|---|----------|------------|-----------|-------|
| 1 | Critical | High | `concepts/LATE.md`, `C2_LATE.md` | LATE stub omits independence and exclusion — monotonicity alone presented as sufficient |
| 2 | Critical | High | `E1_RDD_basics.md` | RD estimand equality to conditional LATE requires both-sided continuity; only one side foregrounded |
| 3 | Medium | High | `concepts/Parallel_trends.md` | Stub too sparse; omits potential-outcomes formulation, untestability, pre-test caveats |
| 4 | Medium | High | `C2_LATE.md`, `D3_Staggered_adoption.md` | Multi-instrument negative weights described only as "non-convex"; inconsistent with explicit D3 treatment |
| 5 | Medium | High | `B_covariate_adjustment.md` | Overlap trimming changes the estimand; not stated |
| 6 | Medium | Medium | `D2_Canonical_DiD.md`, `D3` | Anticipation mechanism unexplained in D2; formal condition only in staggered context |
| 7 | Medium | Medium | `A1_regression.md` | Two-variable OVB formula not caveated for multiple correlated omitted variables |
| 8 | Medium | Medium | `C1_IV_basics.md`, `concepts/Weak_instruments.md` | F > 10 rule not caveated for heteroskedastic/clustered settings; effective F not mentioned |
| 9 | Optional | High | All four concept stubs | Stubs are empty wrappers; promised notation anchoring not implemented |
| 10 | Optional | High | `A2_causality.md`, `D2`, `D3` | No forward links to `F_Spillovers_Formula_IV` when interference flagged as threat |
| 11 | Optional | Medium | `A2_causality.md` | "Skipped" section included without caveat about non-canonical status |
| 12 | Optional | Medium | `ECONOMETRICS_MAP.md` | No system-level provenance caveat about PDF-extraction reconstruction |

---

## Cross-Module Consistency Notes

**Consistent (positive findings):** Estimand-first framing is consistent A1→E1. Potential outcomes notation (`Y_i(d)`) is uniform across all modules. Robust SE defaults and cluster-count adequacy caveats are correctly propagated. TWFE-as-problematic framing in D3 is cleanly distinguished from canonical DiD in D2. Implementation checklists are substantively correct throughout.

**Notation inconsistencies (minor, undocumented in concept stubs):** `e(X)` vs `p(X)` for propensity score within B; `E_i` vs `G_i` for cohort timing across D2/D3; `R` vs `X_i` for running variable within E1.

---

*Review produced by Domain Reviewer agent. Severity/confidence framework adapted from RSAA REVIEW_RUBRIC.md for educational context.*
