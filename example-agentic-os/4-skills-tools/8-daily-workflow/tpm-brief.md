---
name: tpm-brief
description: Runs as a subagent within start-day-prep to generate one portfolio brief DM per active program, incorporating the last 7 days of Slack context and learned patterns. Can also be invoked directly for an on-demand portfolio status pull. Trigger phrases include: "portfolio brief", "give me the brief", "status across programs", "what's happening across my programs". Returns one DM-ready brief per program with health, blockers, and next action.
---
# /tpm-brief — Portfolio Brief

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Generate a DM-ready brief per active program — health status, surfaced blockers, and one next action — so the day starts with program state already loaded

---

## Overview

The portfolio brief is the highest-value subagent in `start-day-prep`. For each active program, it walks the program master doc, applies patterns learned from prior runs (stored in `4-skills-tools/8-daily-workflow/patterns.md`), and drafts a brief that fits in a Slack DM. Each brief answers three questions: where does this program stand right now, what is the most important blocker or risk, and what is the one action I should take today for this program. Patterns.md accumulates observations across runs — known root causes, recurring signals, health indicators — and the brief gets smarter without prompt changes.

## When to Use

- Automatically, as a subagent inside `start-day-prep`
- Directly, for an on-demand portfolio status check at any time of day
- Before a portfolio review or SteerCo to verify the brief reflects current state

**When NOT to use:**
- For deep program health scoring with metrics — use `/tpm-program-health`
- For a single program's detailed status — open the program master doc directly
- For exec-level summaries — use `/tpm-execsummary`

---

## Interaction Flow

```
Load program-index.md (active programs + RAG status)
       |
       v
For each active program:
  Read program master doc (layer3-programs/)
  Read patterns.md for this program (if present)
  Check this-week.md for any open escalations
       |
       v
  Draft brief: health / key blocker / next action
       |
       v
Return one brief per program (DM-ready format)
       |
       v
Write any new patterns observed to patterns.md
```

**Step 1 — Load**

Read:
- `3-memory-knowledge/layer2-portfolio/program-index.md` — active programs and current RAG
- `3-memory-knowledge/layer4-weekly/this-week.md` — open escalations and SteerCo prep
- `4-skills-tools/8-daily-workflow/patterns.md` — accumulated observations (create if not present)

**Step 2 — Per-Program Brief**

For each active program (🔴 and 🟡 first, then 🟢):

Read `3-memory-knowledge/layer3-programs/[program]-master.md`. Extract:
- Current phase and key milestone status
- Any open blockers or dependency gaps
- RAG status and any change from last week

Apply patterns from `patterns.md` relevant to this program:
- Known recurring signals to watch for
- Root causes previously identified
- Health indicators the TPM has calibrated over time

Draft a brief that answers: status, top blocker/risk, one next action.

**Step 3 — Write Patterns**

After generating all briefs, review what was observed. If a new pattern is worth recording (recurring signal, confirmed root cause, calibrated health indicator), append it to `4-skills-tools/8-daily-workflow/patterns.md` with a date tag.

---

## Output Format

One brief per program, formatted for a Slack DM:

```markdown
**[Program Name]** [🔴/🟡/🟢]

**Status:** [1–2 sentences. Where this program stands right now, including phase and most recent milestone state.]

**Top blocker/risk:** [The single most important thing that could slow or derail progress. Named, not vague.]

**Next action:** [One specific action. Owner. Deadline or trigger if applicable.]

---
```

If patterns.md had a relevant entry that shaped the brief, append:
```
*Pattern applied: [brief note on what was learned from prior runs]*
```

Full output format (all programs):
```markdown
# Portfolio Brief — [Date]

**Programs:** [N active] · **🔴 [N]** · **🟡 [N]** · **🟢 [N]**

---

[One brief per program, ordered 🔴 → 🟡 → 🟢]

---

*Brief generated from program masters + patterns.md. Run /tpm-program-health for full scoring.*
```

---

## Patterns.md Format

Append observations in this format:
```markdown
## [Date] — [Program Name]

**Signal:** [What was observed]
**Pattern:** [What this indicates — root cause or health indicator]
**Applied:** [How this shaped today's brief]
```

---

## Red Flags

- Brief that says "on track" with no evidence from the master doc — verify against actual milestone dates
- "No blockers" on a 🟡 or 🔴 program — probe the master doc more carefully
- Next action that is vague ("monitor", "follow up") — replace with a specific owner and trigger
- Patterns.md not updated after 3+ runs — check if the file is being written

---

## Verification

- [ ] One brief per active program — none skipped
- [ ] 🔴 programs appear first in the output
- [ ] Next action is specific: one action, one owner
- [ ] patterns.md read before drafting each brief
- [ ] New patterns appended to patterns.md after run completes

---

## Design Principles Applied

- **Delivery First:** DM-ready brief per program — no reformatting needed before sending
- **Risk Visibility:** 🔴 programs first; top blocker always named, never buried
- **Context Aware:** patterns.md compounds intelligence across runs — brief improves without prompt changes
