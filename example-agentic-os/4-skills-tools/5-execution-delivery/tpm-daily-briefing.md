---
name: tpm-daily-briefing
description: "Use when you need to generate a focused daily operating brief — active risks, decisions needed today, blockers to unblock, and calendar prep — across all programs the TPM is managing."
---
# /tpm-daily-briefing — Daily TPM Briefing

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Generate a focused daily operating brief — active risks, decisions needed today, blockers to unblock, and calendar prep — across all programs the TPM is managing

---

## TPM Context

A TPM's morning problem is not lack of information — it's too much of it scattered across Jira, Slack, Aha!, and their own memory. The daily briefing compresses program state into a 60-second scan: what is on fire right now, what decision cannot wait, what is on the calendar today that needs prep, and what is the one thing that most improves program health if it gets done today.

The failure mode this prevents: spending the first two hours of the day in reactive email and Slack mode instead of deliberate, prioritized execution — and discovering a critical blocker at 4pm that was knowable at 9am.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Load `3-memory-knowledge/layer4-weekly/this-week.md` for the current week's operating state, open escalations, and SteerCo prep.

Load program master docs for any programs flagged 🔴 in the weekly context.

---

## Interaction Flow

**Step 1 — Intake**

1. Today's date and day of week
2. Any new information since yesterday — paste Slack updates, overnight emails, Jira comments, or describe what changed
3. What's on the calendar today? (meetings, syncs, SteerCo, stakeholder calls)
4. Any decisions the TPM is waiting on or needs to drive today?

If no new information is provided, generate the briefing from loaded context (weekly state + program masters).

**Step 2 — Generate**

Scan across all active programs. Surface:
- Any program that moved from Amber → Red overnight or has an unresolved blocker from yesterday
- Decisions that have a same-day or next-24-hour deadline
- Calendar items that require prep or pre-read
- The single highest-leverage unblocking action available today

---

## Output Format

```markdown
# TPM Daily Briefing — [Day, Date]

**Programs tracked:** [N] · **On fire:** [N 🔴] · **At risk:** [N 🟡] · **On track:** [N 🟢]

---

## 🔴 Needs Attention Now

[Programs or blockers that cannot wait — list only what is genuinely urgent]

### [Program]: [Blocker title]
**Since:** [When this became critical]
**Impact if not resolved today:** [Specific deadline or consequence]
**Action needed:** [What the TPM does — not what they monitor]
**Who to contact:** [Name / Slack channel]

---

## Decisions Needed Today

| Decision | Context | From Whom | By When | Consequence if Delayed |
|----------|---------|-----------|---------|----------------------|
| [Decision] | [1-line context] | [Name] | [Time] | [What slips] |

---

## Calendar Prep

| Time | Meeting | Program | What's Needed |
|------|---------|---------|--------------|
| [Time] | [Meeting name] | [Program] | [Specific prep: bring data point X, answer question Y, drive decision Z] |

---

## Today's Priority Stack

[Maximum 5 items. The things that, if done today, most improve program health. Ordered by impact.]

1. 🔴 [Highest-impact action] — [Program] — [Expected outcome]
2. 🟡 [Second priority] — [Program] — [Expected outcome]
3. [...]

---

## Watch List (No Action Today, But Don't Forget)

- **[Program]:** [What to watch — the thing that could flip to red by EOD]
- **[Dependency]:** [Status check due by end of week]

---

## This Week's Remaining Milestones

| Milestone | Program | Due | Owner | Confidence |
|-----------|---------|-----|-------|-----------|
| [M#] | [Program] | [Day] | [Name] | 🔴🟡🟢 |

---

## End-of-Day Checkpoint

[What the TPM should confirm is done before signing off today]
- [ ] [Decision X resolved or escalated]
- [ ] [Blocker Y owner confirmed next step]
- [ ] [Aha! updated for milestone Z]
```

---

## Behavioral Notes

- If today is **Friday**: include SteerCo agenda prep and flag any programs that need a status update before the weekend
- If today is **Monday**: include weekly operating state reset — what changed over the weekend, what's the week's critical path
- If a program is in **launch window**: escalate it to the top of the priority stack regardless of current RAG status
- **Do not include** routine status that isn't actionable — this is not a status report, it's a decision and action tool
- **Maximum 5 items** in the priority stack — if everything is urgent, nothing is

---

## Composes With

- `/tpm-program-health` — daily briefing is the condensed daily version of the weekly health check
- `/tpm-extract-blockers` — blockers surfaced in the daily briefing feed the formal blocker report
- `/tpm-steerco-prep` — Friday briefing feeds directly into SteerCo agenda
- `/tpm-escalation-brief` — decisions that can't be resolved today escalate to a formal brief
- `3-memory-knowledge/layer4-weekly/this-week.md` — primary context source for weekly state

---

## Design Principles Applied

- **Delivery First:** Briefing is organized around actions and decisions, not status descriptions
- **Risk Visibility:** Amber → Red transitions and same-day decision deadlines surfaced at the top, not buried
- **Cross-Team Alignment:** Dependencies that need a nudge today are explicit in the priority stack
- **Context Aware:** Briefing adapts to day of week, program phase, and launch windows
