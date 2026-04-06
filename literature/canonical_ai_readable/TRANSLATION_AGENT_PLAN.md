# ARE213 PDF-to-Markdown Translation Plan (Agent Standard)

## Purpose
This document defines a repeatable, high-completeness workflow for translating one ARE213 course PDF into one comprehensive, AI-readable Markdown file.

Use this as the sole execution spec for an AI agent.

## Scope
- Input: one source PDF in repo root (example: `A2_causality.pdf`).
- Output: one markdown companion in `AI_READABLE/` (example: `AI_READABLE/A2_causality.md`).
- Requirement: comprehensive coverage of the full PDF, not summary-only.

## Invocation Pattern
Use this exact instruction pattern with an agent:

"Implement `AI_READABLE/TRANSLATION_AGENT_PLAN.md` for `<SOURCE_PDF>`, and write/update `<TARGET_MD>`."

Example:
- Source: `A2_causality.pdf`
- Target: `AI_READABLE/A2_causality.md`
- Prompt: "Implement `AI_READABLE/TRANSLATION_AGENT_PLAN.md` for `A2_causality.pdf`, and write/update `AI_READABLE/A2_causality.md`."

## Non-Negotiable Standards
1. Full coverage: every major section/slide block in the PDF must appear in output.
2. Source traceability: each markdown section must include source page references.
3. Formula fidelity: preserve definitions/equations exactly when readable.
4. Separation of content types:
- What the slide states (facts, definitions, theorem statements)
- Interpretation/explanation
- Implementation guidance
5. No silent omissions: if text is unreadable, mark explicitly as `Extraction Gap` with page numbers.

## Required Workflow
1. Extract PDF text page-by-page.
- Preferred method in this repo: Swift + PDFKit `page.string` extraction.
- Save raw extraction to `/tmp/<pdf_stem>_extracted.txt` for working comparison.

2. Build a source map.
- Identify:
  - title page
  - outline pages
  - content sections
  - exercises/examples
  - references
- Create a quick internal map: `Section -> page range`.

3. Draft markdown using the required schema below.
- Follow source order.
- Do not jump directly to high-level summary.
- Include theorem/proof/result statements when present.

4. Run completeness audit before finalizing.
- Compare section map against markdown headings.
- Confirm all major formulas/results are represented.
- Confirm every section has page citations.

5. Write/update target markdown.

## Required Markdown Schema
Use this structure in order:

1. `# <Lecture Title> Translation`
2. `## Source`
- PDF filename
- Generated markdown filename
- Extraction date

3. `## Coverage Map`
- Bullet list of source section names with page ranges.

4. `## Comprehensive Translation`
- One subsection per source section in source order.
- Each subsection must include:
  - `Source pages: pX–pY`
  - `Core ideas`
  - `Definitions and notation`
  - `Key results/formulas`
  - `Proof sketch / logic` (if relevant)
  - `Examples or exercises` (if present)
  - `Interpretation for applied work`

5. `## Diagnostics, Pitfalls, and Failure Modes`
- Explicitly list design/estimation/inference risks mentioned or implied by lecture content.

6. `## Implementation Checklist`
- Concrete steps an applied researcher/agent would execute.

7. `## Structured Extract (for agents)`
- YAML block with keys:
  - `module`
  - `source_pdf`
  - `source_pages`
  - `estimands`
  - `identification_assumptions`
  - `estimators`
  - `inference_methods`
  - `diagnostics`
  - `failure_modes`
  - `open_questions`

8. `## Extraction Gaps`
- If none: write `None`.
- If any: list pages and missing items.

9. `## Retrieval Tags`
- Flat list of concise tags.

## Fidelity Rules
- Keep variable names and symbols consistent with source slides.
- Do not invent claims not supported by slide content.
- If adding interpretation, label it clearly as interpretation.
- Keep references/citations that appear in the slides.

## Completeness Gate (Must Pass)
Before finishing, verify all are true:
- [ ] Every outline item appears in markdown.
- [ ] Every major theorem/result/formula in the deck is represented.
- [ ] Every major example/exercise appears at least briefly.
- [ ] Inference content (SEs, assumptions, robustness) is captured when present.
- [ ] Each major section has page references.
- [ ] `Extraction Gaps` section is present.

## Optional Appendix Pattern
If lecture is long, add:
- `## Appendix A: Formula Sheet`
- `## Appendix B: Exercise Prompts`
- `## Appendix C: Citation List`

## Minimal Execution Commands (Reference)
Example extraction command for one PDF:

```bash
SWIFT_MODULECACHE_PATH=/tmp/swift-module-cache CLANG_MODULE_CACHE_PATH=/tmp/swift-module-cache swift /tmp/pdfkit_text.swift A2_causality.pdf > /tmp/A2_causality_extracted.txt
```

Then draft/update:
- `AI_READABLE/A2_causality.md`

## Output Quality Target
The produced markdown should be detailed enough that a downstream agent can:
1. recover the lecture's conceptual flow,
2. identify all assumptions and estimands,
3. reproduce core derivations at a high level,
4. execute applied implementation and diagnostics without reopening slides except for edge notation checks.
