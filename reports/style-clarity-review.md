# ARE213 AI-Readable Companion Files: Style and Clarity Review

**Reviewer framework:** EIG publication standards adapted for PhD-level academic econometrics content.
**Files reviewed:** README.md, ECONOMETRICS_MAP.md, A1_regression.md, A2_causality.md, B_covariate_adjustment.md, C1_IV_basics.md, D2_Canonical_DiD.md, E1_RDD_basics.md, concepts/Parallel_trends.md, concepts/LATE.md
**Review date:** 2026-03-08

> **Note on scope:** EIG style rules governing numbers, percentages, and publication tone are not applied to mathematical notation or formal econometric statements, which appropriately follow academic conventions. Review focuses on prose clarity, structural consistency, terminology, and cross-reference quality.

---

## 1. Structural Consistency Across Notes

**ERROR 1.1** — `concepts/Parallel_trends.md` and `concepts/LATE.md`: Concept notes follow a four-section skeleton while lecture notes follow a 12+ section template. The structural divergence is so large that cross-file graph traversal breaks down. Neither the README nor the concept notes explain whether the thin design is intentional.
**Fix:** Either expand concept notes to include notation, formal statement, and a caveat block, or explicitly document in the README that concept notes are intentionally thin anchors only.

**SUGGESTION 1.2** — All lecture files, references block subsections: Five "Not applicable" sub-fields repeated in every references block add noise without value.
**Fix:** Collapse to one summary line per file.

**SUGGESTION 1.3** — `D2_Canonical_DiD.md`, Appendix A p30–p31: OCR artifact "now" → "not" in slide titles not flagged in Extraction Gaps.
**Fix:** Add a note in the Extraction Gaps section.

**SUGGESTION 1.4** — All files except A1: Missing `course: "ARE213"` YAML field breaks filter-by-course consistency.
**Fix:** Add field uniformly across all files.

---

## 2. Clarity of Prose Explanations

**ERROR 2.1** — `C1_IV_basics.md`: Exogeneity and exclusion listed as co-equal, distinct assumptions without explaining they are equivalent in the constant-effect linear model, creating potential confusion for readers arriving from the potential-outcomes framework.
**Fix:** Add a clarifying sentence distinguishing the two framings.

**ERROR 2.2** — `B_covariate_adjustment.md`: Double robustness stated without the qualifier that it requires both CIA and overlap, and that both models being misspecified destroys consistency.
**Fix:** Add qualifier explicitly.

**ERROR 2.3** — `D2_Canonical_DiD.md`: TWFE/staggered-adoption heterogeneous-effects failure is mentioned only as "weighting assumptions" without explaining the negative-weighting problem or pointing clearly to D3.
**Fix:** Add a two-sentence forward reference.

**SUGGESTION 2.4** — `A2_causality.md`: Parenthetical "(lecture labels this block as skipped, but slides include it)" embedded in a section heading breaks the heading format convention.
**Fix:** Move to the Core Ideas block body text.

**SUGGESTION 2.5** — `E1_RDD_basics.md`: "Comparable in latent characteristics" is imprecise; continuity is an assumption about conditional expectations, not about latent characteristics directly.
**Fix:** Revise to state the assumption in terms of `E[Y(d)|X=x]` continuity.

**SUGGESTION 2.6** — `A1_regression.md`: "Cluster formula degenerates" at G=1 does not state the direction of failure (anti-conservative, not conservative).
**Fix:** Add that G=1 yields zero between-cluster variance, causing over-rejection.

---

## 3. Terminology Consistency

**ERROR 3.1** — `B_covariate_adjustment.md`: Propensity score is written as both `p(X)` and `e(X)` within the same file, which is designated the canonical notation anchor.
**Fix:** Choose one symbol, use it consistently throughout, and note the alternative in Appendix C.

**ERROR 3.2** — `C1_IV_basics.md`: Endogenous regressor listed as "`D` (or `X`)" in the orientation, while Appendix C correctly distinguishes `D` (endogenous) from `X` (controls). The 2SLS matrix formula uses `X` for the full regressor matrix without disambiguation.
**Fix:** Remove the "or `X`" parenthetical and clarify matrix notation explicitly.

**ERROR 3.3** — `E1_RDD_basics.md`: Running variable is `R` in the Comprehensive Translation but `X_i` in Appendices B and C.
**Fix:** Standardize to one symbol throughout; add a cross-notation note if source slides use a different convention.

**SUGGESTION 3.4** — `A2_causality.md`: `Y_1`/`Y_0` notation used in the distributional estimands section despite Appendix C normalizing to `Y(1)`/`Y(0)`.
**Fix:** Apply parenthesis notation consistently.

**SUGGESTION 3.5** — `D2_Canonical_DiD.md` and `concepts/Parallel_trends.md`: "PTA" abbreviation defined in D2 but absent from the concept note, breaking abbreviation lookup.
**Fix:** Add "Abbreviated 'PTA'" to the concept note definition.

---

## 4. Assumption and Caveat Communication

**ERROR 4.1** — `B_covariate_adjustment.md`: CIA is presented as an identification assumption without communicating that it is fundamentally unverifiable from observed data.
**Fix:** Add a sentence making the epistemic status explicit in the proof sketch block.

**ERROR 4.2** — `C1_IV_basics.md`: The exclusion restriction is untestable in just-identified settings. The file advises institutional defense without explaining why such defense is the only option.
**Fix:** Add a caveat sentence stating that untestability is the reason institutional justification is required.

**ERROR 4.3** — `E1_RDD_basics.md`: External validity limitation stated as "not necessarily global treatment effect" — understated given that cutoff-local populations may differ substantially from policy-relevant populations.
**Fix:** Expand to note that cutoff-local representativeness should be discussed in every applied write-up.

**SUGGESTION 4.4** — `D2_Canonical_DiD.md`: Pre-trend critique bullets have no severity weighting; low-power failure (Roth 2022) is the most consequential but is not distinguished from minor critiques.
**Fix:** Reorder or tag bullets by severity.

**SUGGESTION 4.5** — `A1_regression.md`: OVB causal interpretation caveat ("not automatically a causal claim") is underexplored; mediators vs. confounders distinction is not drawn.
**Fix:** Add one to two sentences on what additional causal model assumptions are required.

---

## 5. Cross-Reference Completeness

**ERROR 5.1** — `concepts/LATE.md`: Missing `[[C1_IV_basics]]` in "Used In Lectures." C1's encouragement-design example is a LATE-generating setup.
**Fix:** Add C1 to the list.

**ERROR 5.2** — `C1_IV_basics.md`: Missing `[[concepts/LATE]]` in Concept Links core concepts.
**Fix:** Add the link.

**ERROR 5.3** — `D2_Canonical_DiD.md`: No-anticipation assumption is absent from the Structured Extract `identification_assumptions`, the Diagnostics section, and Concept Links. This is a standard canonical DiD assumption.
**Fix:** Add it explicitly in all three locations.

**SUGGESTION 5.4** — `B_covariate_adjustment.md`: Prerequisite `A2_causality` is listed in YAML frontmatter but not in the Connected lectures list in Concept Links; the distinction between these two link types is never explained.
**Fix:** Clarify in README or include prerequisite lectures in Connected lectures.

**SUGGESTION 5.5** — `ECONOMETRICS_MAP.md`: No reading route for the selection-on-observables track (B → D4 → E2).
**Fix:** Add a fifth reading route.

---

## 6. Summary

The corpus is structurally coherent and substantively accurate. The consistent use of YAML frontmatter, Appendices A–C, Structured Extract YAML, and Retrieval Tags reflects well-executed systematic design.

**Priority fixes (13 ERRORs total):**
- Concept-note structural depth (1.1) is the highest-impact change — the concept stubs do not fulfill their stated role as canonical anchors
- Three notation inconsistencies (3.1, 3.2, 3.3) undermine the canonical-anchor function of the files designated for that purpose
- No-anticipation assumption missing from D2 (5.3) is a substantive identification gap
- CIA and exclusion-restriction untestability caveats (4.1, 4.2) are the most important epistemic gaps for a PhD audience

**Style improvements (12 SUGGESTIONs total):** Mostly boilerplate cleanup, heading format fixes, minor terminology standardization, and reading-route additions.

---

*Review produced by EIG Reviewer agent, adapted for academic content. EIG publication style rules applied only where relevant to prose clarity and structural quality.*
