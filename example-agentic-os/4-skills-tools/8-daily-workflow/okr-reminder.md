---
name: okr-reminder
description: Use to run the OKR escalation cycle — identify owners with overdue or empty status cells in the OKR sheet, draft personalized emails with direct cell links, and compute the correct escalation tier. Trigger phrases include: "run okr reminders", "okr nudge cycle", "who hasn't updated their OKRs", "send okr reminders", "escalate OKR updates". Invoked as part of the start-day weekly schedule or directly when OKR hygiene has lapsed.
---
# /okr-reminder — OKR Escalation Cycle

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Walk the OKR sheet, identify owners with stale or missing status cells, draft personalized emails with direct cell links and pre-computed escalation tiers — so OKR updates take under a minute for each owner

---

## Overview

OKR updates fail not because owners don't care, but because the friction to update is higher than it looks: find the sheet, find your row, remember the format, update the cell, close the tab. This skill eliminates all of that friction on the owner's side. It drafts a personalized email to each owner containing a direct link to their exact cell, the escalation tier already computed, and a fixed CC chain across all four reminder steps. The owner clicks the link, lands in the cell, types 1–2 sentences, and is done. Cycle spacing is 7 days from the prior step's actual run date — not a fixed calendar — so a missed week doesn't cascade into wrong escalation dates.

## When to Use

- Weekly, as part of the `start-day` scheduled task cycle
- When OKR hygiene has lapsed and updates are overdue
- At the start of a new OKR review period to kick off the cycle

**When NOT to use:**
- To update OKRs yourself on behalf of owners — the owner must make the update
- To score or analyze OKR progress — use `/tpm-annual-goal-check`
- To generate an OKR summary for SteerCo — use `/tpm-execsummary`

---

## Gated Workflow

```
Phase 1: Walk OKR sheet        →    Phase 2: Compute tiers    →    Phase 3: Draft + Preview
     │                                     │                              │
     ▼                                     ▼                              ▼
Identify stale/empty cells           R1–R4 per owner              One email per owner
Match to owners                      7-day spacing rule           CC chain applied
Note last run date per step          Skip if updated since        Preview in Obsidian
```

### Phase 1 — Walk OKR Sheet

Read the OKR sheet from context or ask the user to paste relevant rows. Identify cells that are:
- **Empty** — no status update has ever been entered
- **Stale** — last update is older than 7 days from today

For each owner with empty or stale cells, collect:
- Owner name and email
- Manager name and email (from `1-inputs-triggers/org/novagrid-org.csv`)
- Skip-level (manager's manager) name and email
- Which OKR objectives have stale/empty cells
- Direct cell link (paste or infer from sheet URL + row/column reference)

### Phase 2 — Compute Escalation Tiers

For each owner, determine the current step in the escalation cycle based on the last run date recorded for that owner:

| Step | Trigger | Recipients |
|------|---------|-----------|
| R1 — First Reminder | No prior reminder sent, or > 7 days since last run | Owner only |
| R2 — Second Reminder | 7 days after R1 actual send date | Owner only |
| R3 — Manager Added | 7 days after R2 actual send date | Owner + Manager |
| R4 — Skip-Level Added | 7 days after R3 actual send date | Owner + Manager + Skip-Level |

**Spacing rule:** 7 days from the **actual send date** of the prior step, not the calendar date it was due. If a step was skipped (e.g., R1 was never sent), start at R1 regardless of how much time has elapsed.

The CC chain across all steps also includes: [fixed org-wide CC list from `domain-context.md`].

### Phase 3 — Draft and Preview

Draft one personalized email per owner. Show all drafts in a preview before sending. Ask for confirmation.

---

## Output Format

**Preview (before send):**

```markdown
# OKR Reminder Draft — [Date]

**Owners to contact:** [N]
**Escalation breakdown:** R1: [N] · R2: [N] · R3: [N] · R4: [N]

---

### [Owner Name] — [Step: R1/R2/R3/R4]

**To:** [owner@novagrid.com]
**CC:** [escalation chain per tier] + [fixed CC list]
**Subject:** OKR Update Needed — [Owner Name] — [Step label]

---

Hi [First name],

[1–2 sentences specific to this owner: which OKR objective(s) are missing an update, and how long it's been since the last update.]

Please update your status here: **[Direct cell link]**

The update takes under a minute — 1–2 sentences on where things stand is all that's needed.

[R3/R4 only: "I'm copying [Manager Name] / [Skip-level Name] as this is the [third/fourth] reminder."]

Thank you,
[TPM name from personal-context.md]

---

[Repeat for each owner...]

---

Send all [N] emails? **yes** / edit / cancel
```

**After send:**

```markdown
✓ OKR reminders sent — [Date]

| Owner | Step | Sent to |
|-------|------|---------|
| [Name] | R[N] | [To + CC list] |

Next run: 7 days from today ([Date]).
Update cycle log: 1-inputs-triggers/okr-cycle-log.md
```

---

## Behavioral Notes

- Spacing is computed from the actual send date, stored in `1-inputs-triggers/okr-cycle-log.md`
- An owner who updates their cell between reminder cycles should be removed from the next run's contact list — re-check the sheet on each run
- R4 is the final step — if an owner has not updated after R4, flag for TPM escalation via `/tpm-escalation-brief` rather than continuing the automated cycle
- Never send without preview and explicit confirmation
- Email tone remains professional and low-friction across all four steps — R3/R4 adds recipients, not harshness

---

## Verification

- [ ] All stale/empty cells identified before drafting (not a subset)
- [ ] Escalation tier computed from actual prior send date in cycle log, not calendar assumption
- [ ] Direct cell link included in every email (not a generic sheet link)
- [ ] CC chain correct per tier (R1–R2: owner only; R3: +manager; R4: +skip-level; all: +fixed CC)
- [ ] Preview shown before send — no silent sends
- [ ] Cycle log updated after confirmed send

---

## Design Principles Applied

- **Delivery First:** Owner friction reduced to one click — cell link lands them exactly where they need to update
- **Risk Visibility:** Escalation tier surfaced explicitly — stakeholders know where they are in the cycle
- **Cross-Team Alignment:** Fixed CC chain ensures org-level visibility without per-email judgment calls
- **Context Aware:** 7-day spacing from actual send date prevents cascading errors from missed weeks
