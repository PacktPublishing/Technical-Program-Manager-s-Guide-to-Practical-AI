---
name: tpm-execsummary
description: "Use when you need to generate a concise, SCQA-structured executive summary for any program milestone, launch, or decision."
---
# /tpm-execsummary — Exec Summary

**Lifecycle Stage:** Launch / Release
**Job-to-be-Done:** Generate a concise, SCQA-structured executive summary for any program milestone, launch, or decision

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use executive stakeholder preferences from `domain-context.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. What is this summary for? (launch / milestone / decision / escalation / quarterly review)
2. The core situation or achievement
3. The complication or challenge
4. The recommendation or decision needed (if any)
5. Key supporting facts (metrics, dates, impact)
6. Audience (CEO / CTO / Board / VP / all-hands)
7. Length constraint (half-page / 1 page / slide)

**Step 2 — Generate**

---

## Output Format

```markdown
# Executive Summary: [Title]

**Date:** [Date]
**Audience:** [Roles]
**Author:** [TPM name]
**Type:** Launch / Milestone / Decision / Escalation / Review

---

## Summary (SCQA Structure)

**Situation:**
[1–2 sentences: the context everyone agrees on — what's the program, where are we]

**Complication:**
[1–2 sentences: what's changed, what's at stake, what tension exists]

**Question:**
[The question this summary is answering]

**Answer:**
[The recommendation, decision, or outcome — lead with it]

---

## Key Facts

| Fact | Detail |
|------|--------|
| Status | 🔴🟡🟢 |
| [Key metric] | [Value vs target] |
| Timeline | [Milestone] on [Date] |
| Impact | [Business outcome] |

---

## What We're Asking For *(if applicable)*

> [Single clear ask: decision / resources / escalation / approval]

---

## What Happens Next

1. [Next action] — [Owner] — [Date]
2. [Next milestone] — [Date]
```

**Tone guidelines:**
- Lead with the answer, not the journey
- No jargon — write for the least technical reader in the room
- 3 sentences max per section
- One clear ask maximum

---

## Design Principles Applied
- Delivery First: SCQA structure leads with answer and impact
- Context Aware: Tone and length adapted from personal-context.md audience level
