---
name: tpm-raid-log
description: "Use when you need to build and maintain a structured RAID log — Risks, Actions, Issues, Decisions — as the single source of truth for program operational state."
---
# /tpm-raid-log — RAID Log Generator

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Build and maintain a structured RAID log — Risks, Actions, Issues, Decisions — as the single source of truth for program operational state

---

## TPM Context

RAID logs are how TPMs track what's in motion between program syncs. Without a RAID log, risks live in meeting notes, actions scatter across Slack, issues get re-raised every week, and decisions get re-debated because nobody wrote them down.

The RAID log is not a status document — it's an operational instrument. It answers "what is happening right now that I need to act on?" It's the diff between program master docs: where the master doc captures the plan, the RAID log captures the deviation from the plan.

The critical distinction TPMs miss: a Risk is something that *might* happen. An Issue is something that *is* happening. Conflating them produces a log that doesn't tell you what needs action today vs. what needs monitoring.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use the program master doc and any recent meeting notes or blocker updates as input.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and current phase
2. Source documents available (master doc, meeting notes, Jira export, previous RAID log)
3. Time period this RAID covers (sprint, week, or since last update)
4. Any known high-priority items to ensure are captured

**Step 2 — Populate RAID**

Extract and categorize all items from input documents. Distinguish risks (might happen) from issues (currently happening).

---

## Output Format

```markdown
# RAID Log: [Program Name]

**Date:** [Date]
**Period:** [e.g. Week of Mar 11, 2026]
**TPM:** [Name]
**Program phase:** [Phase]

---

## Risks — Things that might happen

| ID | Risk | Likelihood | Impact | Owner | Mitigation | Review date | Status |
|----|------|-----------|--------|-------|-----------|-------------|--------|
| R-001 | [Risk description] | High / Med / Low | Critical / High / Med / Low | [Name] | [What's being done] | [Date] | 🔴 Unmitigated / 🟡 In progress / 🟢 Mitigated |

*Risk = potential future event. If it's already happening, it's an Issue.*

---

## Actions — Tasks that need to be completed

| ID | Action | Owner | Due | Priority | Status |
|----|--------|-------|-----|----------|--------|
| A-001 | [What needs to be done] | [Name] | [Date] | 🔴 / 🟡 / 🟢 | Not started / In progress / Done |

*Action items must have owners and due dates. Ownerless actions don't get done.*

---

## Issues — Things currently blocking or impacting progress

| ID | Issue | Impact | Owner | Resolution plan | Escalated? | Status |
|----|-------|--------|-------|----------------|------------|--------|
| I-001 | [What is currently blocked or broken] | [What can't proceed / cost] | [Name] | [Specific resolution steps] | Yes / No | 🔴 Active / 🟡 In progress / 🟢 Resolved |

*Issue = currently happening and impacting the program. Needs resolution, not just monitoring.*

---

## Decisions — Choices made or pending

| ID | Decision | Status | Made by | Date | Rationale | Consequences |
|----|---------|--------|---------|------|-----------|-------------|
| D-001 | [What was decided or needs to be decided] | Made / Pending / Escalated | [Name] | [Date or "TBD"] | [Why] | [What this commits us to] |

*Pending decisions are blockers in disguise. If a decision is in limbo for >5 days, escalate.*

---

## RAID Health

| Dimension | Count | Trend | Action needed |
|-----------|-------|-------|--------------|
| Critical risks unmitigated | [N] | ↑↓→ | |
| Overdue actions | [N] | ↑↓→ | |
| Active issues | [N] | ↑↓→ | |
| Pending decisions >5 days | [N] | ↑↓→ | |

**Overall RAID health:** 🔴 / 🟡 / 🟢
```

---

## Key Concepts

- **Risk vs Issue:** Risk = might happen, needs monitoring + mitigation. Issue = is happening, needs resolution. Mixing them makes the log unactionable.
- **Owner is mandatory:** Every row needs a named owner. "TBD" is not an owner. Unowned items don't get resolved.
- **Due dates on actions:** An action without a due date is a wish. Due dates create accountability.
- **Pending decisions are the most dangerous RAID items:** They block without looking like blockers. Surface them explicitly.
- **RAID ≠ meeting notes:** RAID is the living state. Meeting notes are the historical record. They feed each other but are not the same document.

---

## Anti-Patterns

- **Mixing risks and issues** — "The API contract might slip" (risk) and "The API contract slipped" (issue) need different responses; conflating them obscures urgency
- **Ownerless rows** — a risk with no owner is noise; an issue with no owner is a guarantee it won't be resolved
- **RAID as status theater** — if your RAID has 40 items and nothing ever closes, it's a list, not a tool
- **Forgetting to close items** — closed risks and resolved issues should be marked done and moved to an archive section, not deleted; they're evidence of program management
- **Decision entries without consequences** — decisions commit the program to something; capturing "we decided X" without "which means Y cannot happen" loses the value

---

## Composes With

- `/tpm-meeting-notes` — meeting notes are the primary input for new RAID items
- `/tpm-extract-blockers` — blocker extraction feeds the Issues quadrant
- `/tpm-decision-record` — decisions that need full ADR-format documentation
- `/tpm-program-health` — RAID health feeds the Risks and Dependencies dimensions
- `/tpm-steerco-prep` — high-priority RAID items become SteerCo agenda items

---

## Design Principles Applied
- Delivery First: RAID is organized around what blocks delivery, not what's interesting
- Risk Visibility: Risks, Issues, and pending Decisions all explicitly tracked
- Cross-Team Alignment: Owner field forces cross-team accountability to be named
