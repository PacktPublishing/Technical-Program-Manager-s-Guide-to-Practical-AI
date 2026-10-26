---
name: zoom-meeting-assets
description: Runs as a subagent within start-day-prep to prepare assets for each Zoom meeting on today's calendar. Can also be invoked directly before a specific meeting. Trigger phrases include: "prep for my meetings today", "what do I need for my Zoom calls", "meeting assets for today", "prepare for [meeting name]". Returns agenda, relevant docs, participant list, and pre-read flags per meeting.
---
# /zoom-meeting-assets — Meeting Asset Prep

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** For each Zoom meeting on today's calendar, surface the agenda, relevant docs, key participants, and any pre-read needed — so you walk in prepared, not scrambling

---

## Overview

The 10 minutes before a meeting are the worst time to locate the agenda, find the relevant tracker, and remember who owns which workstream. This skill runs against today's calendar and prepares a concise asset card per meeting: agenda or purpose, linked docs, participant roster with roles, and a single "prep action" flag if something needs to be done before joining. Runs as a subagent inside `start-day-prep`; also available on-demand before a specific meeting.

## When to Use

- Automatically, as a subagent inside `start-day-prep`
- Before any specific meeting when you want a focused prep card
- When joining a meeting you didn't organize and need to orient fast

**When NOT to use:**
- For SteerCo or exec review prep — use `/tpm-steerco-prep` (deeper analysis)
- For intro meetings with new stakeholders — use `/intro-prep`
- For meetings that require a decision record — follow up with `/tpm-decision-record`

---

## Interaction Flow

```
Load today's calendar events (Zoom meetings only)
       |
       v
For each meeting:
  Match to program context + known participants
  Extract or infer: agenda, docs, participant roles
  Flag: pre-read needed / decision to drive / blocker to surface
       |
       v
Return one asset card per meeting, ordered by start time
```

**Step 1 — Load Calendar**

From start-day-prep state or direct input, identify all Zoom meetings today. Exclude:
- Recurring 1:1s with no agenda (flag as "No prep needed — standard 1:1")
- Blocked focus time
- Declined meetings

**Step 2 — Build Asset Card Per Meeting**

For each meeting, resolve:

| Field | Source |
|-------|--------|
| Agenda / Purpose | Calendar invite description → program master doc → infer from title |
| Relevant docs | Match meeting topic to `1-inputs-triggers/`, `3-memory-knowledge/layer3-programs/` |
| Participants | Invite list → match to `novagrid-org.csv` for roles |
| Pre-read | Flag if a doc link or tracker was shared in invite |
| Prep action | Flag if a decision must be driven, a blocker must be surfaced, or a stakeholder needs priming |

**Step 3 — Return**

Return cards ordered by meeting start time. If calendar is not accessible, ask: "List your Zoom meetings for today with start times."

---

## Output Format

```markdown
## Meeting Assets — [Today's Date]

---

### [Start Time] — [Meeting Title]
**Program:** [Program name or "General"]
**Purpose:** [One sentence: what this meeting is for]

**Participants:**
| Name | Role | Notes |
|------|------|-------|
| [Name] | [Title / team] | [Anything relevant: decision-maker, stakeholder, blocker owner] |

**Relevant Docs:**
- [Doc name] → [path or URL]

**Prep Action:** 🔴 Required / 🟡 Recommended / 🟢 None
[If Required or Recommended: one-line description of what to do before joining]

---

### [Start Time] — [Meeting Title]
[...repeat card format...]

---

### [Start Time] — [Meeting Title] *(No prep needed — standard 1:1)*
```

When calendar has no Zoom meetings:
```
No Zoom meetings on today's calendar. Have a focused day.
```

---

## Behavioral Notes

- One card per meeting — do not merge back-to-back meetings into one card
- "No prep needed" for standard 1:1s is an explicit signal, not a gap — include the line so it's clear it was checked
- If a meeting has no agenda and is not a known recurring sync, flag it: `[No agenda found — consider sending one or arriving with a goal statement]`
- Participant roles inferred from `novagrid-org.csv`; if a name isn't in the CSV, list role as "Unknown — check org chart"

---

## Verification

- [ ] One card per Zoom meeting on today's calendar
- [ ] Cards ordered by start time (not alphabetically)
- [ ] Recurring 1:1s with no agenda explicitly flagged as "No prep needed"
- [ ] Prep Action has exactly three options: 🔴 Required / 🟡 Recommended / 🟢 None
- [ ] No invented doc links — only from context or calendar invite

---

## Design Principles Applied

- **Delivery First:** Asset card per meeting — walk in prepared in under 60 seconds of reading
- **Cross-Team Alignment:** Participant roles surfaced so you know who owns what before the room opens
- **Context Aware:** Docs pulled from program context matched to meeting topic
