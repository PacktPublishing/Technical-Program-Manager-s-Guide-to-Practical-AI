---
name: reading-recommendations
description: Runs as a subagent within start-day-prep to surface the most relevant reads for today from the reading backlog. Can also be invoked directly when you want a curated reading suggestion without running the full morning routine. Trigger phrases include: "what should I read today", "reading recommendations", "pull from my backlog", "suggest something to read".
---
# /reading-recommendations — Daily Reading Pool

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Surface 2–3 reads from the backlog that are most relevant to today's active programs and calendar — so reading time is spent on signal, not scanning

---

## Overview

The reading backlog (`1-inputs-triggers/reading-backlog.md`) accumulates items saved via `/save-to-read`. Without curation, it becomes a graveyard of good intentions. This skill reads the backlog, cross-references today's calendar and the most active programs from `program-index.md`, and surfaces 2–3 high-relevance reads with a one-line "why now" rationale. It runs as a subagent inside `start-day-prep` and delivers its output as a section of the morning Slack DM.

## When to Use

- Automatically, as a subagent inside `start-day-prep`
- Directly, when you have 15 minutes and want to pick the highest-value read from the backlog
- On Fridays, when you're winding down and want to catch up on queued reading

**When NOT to use:**
- To save a new item to the backlog — use `/save-to-read`
- To get podcast recommendations — use `/podcast`

---

## Interaction Flow

```
Load reading-backlog.md
       |
       v
Load program-index.md (active programs + RAG status)
       |
       v
Load today's calendar context (from start-day-prep state or ask)
       |
       v
Score: relevance to active programs × priority × recency
       |
       v
Return top 2–3 with "why now" rationale
```

**Step 1 — Load**

Read:
- `1-inputs-triggers/reading-backlog.md` — all unread items with priority, category, and program tag
- `3-memory-knowledge/layer2-portfolio/program-index.md` — active programs, current RAG status
- Today's calendar (from start-day-prep state if available; skip calendar cross-reference if not)

**Step 2 — Score**

Score each backlog item on:

| Factor | Weight | Rule |
|--------|--------|------|
| Program match | High | Item's program tag matches a 🔴/🟡 program today |
| Priority | High | High-priority items score above Medium/Low |
| Meeting relevance | Medium | Item's topic matches a meeting on today's calendar |
| Recency saved | Low | Newer saves score slightly higher than older ones |

**Step 3 — Return**

Return the top 2–3 items. Never return more than 3 — the goal is decision, not a new list to scan.

---

## Output Format

```markdown
## Recommended Reads

**[Title]**
*[Category] · [Program Tag] · Saved [N] days ago*
[One-line "why now" rationale — e.g., "Shield planning call today — this covers the API tradeoffs you'll discuss."]
→ [URL or path]

**[Title]**
*[Category] · [Program Tag] · Saved [N] days ago*
[Why now rationale]
→ [URL or path]
```

When backlog is empty:
```
No unread items in reading backlog. Use /save-to-read to queue articles.
```

When no strong matches exist:
```
## Recommended Reads

No high-relevance matches for today's programs. Showing highest-priority items instead:

[Top 2 by priority, with standard format]
```

---

## Behavioral Notes

- Return exactly 2–3 items — never 1 (too thin), never 4+ (defeats the purpose)
- "Why now" must reference today's calendar or current program state — not just "this is a good article"
- Backlog items marked as read should be excluded (check for a "Read" status field if present)
- If the backlog has fewer than 3 items total, return all of them without the scoring step

---

## Verification

- [ ] 2–3 items returned (not 1, not 4+)
- [ ] Each item has a "why now" rationale tied to a program or today's calendar
- [ ] Items sorted by score (program match + priority first)
- [ ] Backlog file read — results are not fabricated
- [ ] Items marked as read are excluded

---

## Design Principles Applied

- **Delivery First:** 2–3 reads with rationale — decision-ready, not a list to re-triage
- **Context Aware:** Relevance scored against today's calendar and active program RAG status
