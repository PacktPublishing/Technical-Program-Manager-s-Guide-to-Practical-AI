---
name: write-doc
description: Use when you need to produce a polished document — strategy doc, program brief, design narrative, workshop material, or any long-form deliverable — that meets a high quality bar. Trigger phrases include: "write a doc for", "draft a strategy document", "help me write", "author a brief on", "create a document about". Uses a Planner → Author → Reviewer subagent loop with a hard 9.5/10 quality gate. You review the converged result — not the intermediate drafts.
---
# /write-doc — Document Authoring

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Produce a polished, high-quality document through a Planner → Author → Reviewer loop with a hard quality gate — so you review a finished result, not four drafts

---

## Overview

Writing quality documents is time-consuming not because the writing is hard but because iteration is slow: draft, review, revise, repeat. This skill runs a three-subagent loop internally — Planner outlines, Author drafts, Reviewer scores against a hard quality bar — and only returns the output when it passes a 9.5/10 threshold. You describe what you need and review the converged result. The quality bar covers: prose clarity (no filler, no passive-voice hedging), precision (claims are specific and supported), structure (reader can navigate without rereading), and actionability (document has a clear purpose and a clear ask or next step). The same loop powers presentation material when the format shifts to slides.

## When to Use

- Any long-form deliverable: strategy doc, program brief, design narrative, executive update, workshop material
- When the document will be seen by leadership or external stakeholders
- When you have the substance but need the writing quality to match
- When producing a document type you've written before but want to compress the iteration cycle

**When NOT to use:**
- For short outputs (1–2 paragraphs) — just write it directly
- For structured TPM artifacts with fixed formats (e.g., RAID log, risk register) — use the dedicated skill
- For meeting notes — use `/tpm-meeting-notes`
- For exec summaries with a defined template — use `/tpm-execsummary`

---

## Gated Workflow

```
Intake: topic, audience, purpose, format
       |
       v
PLANNER: outline + key claims + argument structure
       |
       v
AUTHOR: full draft from outline
       |
       v
REVIEWER: score against quality bar
       |
  Score ≥ 9.5?
       |
      NO → AUTHOR revises → REVIEWER re-scores (repeat until ≥ 9.5 or 3 iterations)
       |
      YES
       |
       v
Return converged draft to user
```

### Step 1 — Intake

Provide:
- **Topic:** What the document is about
- **Audience:** Who will read it (e.g., "VP-level stakeholders", "cross-functional team", "new joiner")
- **Purpose:** What the document must accomplish (inform / align / decide / persuade / reference)
- **Format:** Doc / slide deck / brief / narrative / FAQ / memo
- **Length target:** (optional) Short (1–2 pages), Standard (3–5 pages), Long (5+)
- **Source material:** (optional) Paste notes, bullet points, ramp-up guide, meeting output — anything that should inform the content

### Step 2 — Planner Phase

Generate:
- Document outline with section headings and one-line purpose per section
- Key claims the document must make
- Argument structure: what must be established before each claim lands

Return the outline to the user for approval before drafting. This is the only checkpoint before the loop runs.

### Step 3 — Author → Reviewer Loop

**Author** writes the full draft from the approved outline. Then **Reviewer** scores it across four dimensions:

| Dimension | What it checks | Score (1–10) |
|-----------|---------------|--------------|
| Prose clarity | No filler ("in order to", "it is important to note"), no hedging, active voice | [score] |
| Precision | Claims are specific and supported — no vague assertions | [score] |
| Structure | Sections flow logically; reader doesn't need to re-read to follow | [score] |
| Actionability | Document has a clear purpose; reader knows what to do or decide after reading | [score] |

**Overall score** = average across four dimensions.

If score < 9.5: Author revises the lowest-scoring dimension(s). Reviewer re-scores. Maximum 3 revision cycles.

If score ≥ 9.5 after 3 cycles is not reached, return the best version with a note on which dimensions fell short.

### Step 4 — Return

Return the converged draft with the final score breakdown. Do not show intermediate drafts.

---

## Output Format

```markdown
# [Document Title]

**Audience:** [As specified]
**Purpose:** [As specified]
**Quality score:** [X.X / 10] — Clarity: [X] · Precision: [X] · Structure: [X] · Actionability: [X]

---

[Full document content]

---

*Drafted via write-doc quality gate. [N] revision cycles. Wordsmith as needed before publishing.*
```

**Outline approval format** (Step 2, before drafting):

```markdown
## Proposed Outline: [Document Title]

**Audience:** [X] | **Purpose:** [X] | **Format:** [X]

1. [Section heading] — [One-line: what this section establishes]
2. [Section heading] — [One-line]
3. [...]

**Key claims this document makes:**
- [Claim 1]
- [Claim 2]

Approve this outline to begin drafting? **yes** / edit / cancel
```

---

## Behavioral Notes

- The outline approval checkpoint is not optional — don't skip it even if the topic seems obvious
- "Wordsmith as needed" in the footer means the user's voice should still be applied — the quality gate produces clean prose, not the user's personal style
- If source material is provided, the Author must use it as the primary substance — do not invent claims not supported by the source
- Presentation format: when format = "slide deck", the Author produces slide titles + 3-bullet content per slide rather than paragraphs; the Reviewer uses the same quality bar applied to slide clarity and message density

---

## Verification

- [ ] Outline shown and approved before drafting begins
- [ ] Reviewer scores all four dimensions explicitly
- [ ] Final score ≥ 9.5 or best version flagged with shortfall explanation
- [ ] Intermediate drafts not shown to user — only converged result
- [ ] Source material used as substance (if provided)

---

## Design Principles Applied

- **Delivery First:** User reviews a finished result — not a draft, not a polishing task
- **Risk Visibility:** Quality score surfaced with dimension breakdown — user knows where the document is strong and where to wordsmith
- **Context Aware:** Audience and purpose drive outline structure and argument framing
