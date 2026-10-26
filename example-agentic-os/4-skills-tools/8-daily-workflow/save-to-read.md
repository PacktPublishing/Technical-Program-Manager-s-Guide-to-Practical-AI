---
name: save-to-read
description: Use when you encounter an article, doc, or URL worth reading later but don't have time now. Trigger phrases include: "save this to read", "add to reading list", "I'll read this later", "bookmark this", "queue this article". Automatically summarizes, prioritizes, and tags the item so the reading backlog stays actionable rather than a dump.
---
# /save-to-read — Reading Backlog Capture

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Save an article or doc to the reading backlog with a summary, priority, and program tag — so future-you can scan and decide, not re-read to remember

---

## Overview

A reading list that accumulates without curation becomes a source of guilt, not value. This skill saves any article, URL, or pasted text to a structured backlog by generating a 3-sentence summary, assigning a priority, tagging the closest active program, and categorizing by type. The `/reading-recommendations` subagent then pools from this backlog each morning to surface the most relevant reads for the day.

## When to Use

- When you encounter an article, blog post, paper, or doc worth reading but can't read it now
- When someone shares a link in Slack and you want to queue it
- When saving internal docs, Confluence pages, or Google Drive files to revisit

**When NOT to use:**
- To track a Jira ticket or action item — use `/add-task`
- To save a doc that needs immediate review today — open it now

---

## Interaction Flow

```
URL or pasted text
       |
       v
Generate: 3-sentence summary, priority, category, program tag
       |
       v
Show entry for confirmation
       |
      YES
       |
       v
Append to reading backlog
```

**Step 1 — Intake**

Provide one of:
- A URL
- Pasted article text or excerpt
- A title + brief description if the content isn't available

**Step 2 — Generate Entry**

Generate the following fields:

| Field | Rules |
|-------|-------|
| Title | Extract from URL/content or use as provided |
| Summary | 3 sentences max — what it covers, why it matters, what's actionable |
| Priority | High = directly relevant to an active 🔴/🟡 program; Medium = relevant but not urgent; Low = background enrichment |
| Category | Technical / Strategy / Process / Industry / Research / Leadership |
| Program Tag | Closest active program from `program-index.md`, or "General" if none |
| Saved Date | Today's date |

**Step 3 — Confirm and Append**

Show the structured entry and ask: **Save this? (yes / edit / cancel)**

On confirmation, append to `1-inputs-triggers/reading-backlog.md`.

---

## Output Format

```markdown
## Pending Confirmation

**Title:** [Article or doc title]
**URL / Source:** [URL or source description]
**Summary:** [Sentence 1: what it covers.] [Sentence 2: why it matters.] [Sentence 3: what's actionable or worth noting.]
**Priority:** 🔴 High / 🟡 Medium / 🟢 Low
**Category:** Technical / Strategy / Process / Industry / Research / Leadership
**Program Tag:** [Program name or "General"]
**Saved:** [Today's date]

---

Save this? **yes** / edit / cancel
```

After confirmation:

```markdown
✓ Saved to reading backlog.

[Title] | [Category] | [Priority] | [Program Tag]
```

---

## Behavioral Notes

- If only a URL is provided and the content is not accessible, generate a placeholder summary and flag it: `[Summary pending — content not retrieved]`
- If the item already exists in the backlog (matched by URL or near-identical title), flag as duplicate before saving
- Priority defaults to Medium when program relevance is unclear
- "General" tag is acceptable — do not force-assign a program tag that doesn't fit

---

## Verification

- [ ] Summary is exactly 3 sentences — no more
- [ ] Priority is one of High / Medium / Low (not a number or custom label)
- [ ] Program tag is from `program-index.md` or "General"
- [ ] Confirmation shown before write
- [ ] Appended to `1-inputs-triggers/reading-backlog.md`

---

## Design Principles Applied

- **Delivery First:** One step from encounter to backlog — no tab switching or manual formatting
- **Context Aware:** Priority and program tag derived from current portfolio state in `program-index.md`
