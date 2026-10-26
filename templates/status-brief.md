# Template: Status Brief

Referenced by: `/tpm-stakeholder-update`, `/tpm-execsummary`

Three audience-specific templates, plus the 3P Report for portfolio reporting (Templates D and E, from Chapter 8). Use the right one for the right reader — never send the same brief to execs and teams.

---

## Template A: Exec Brief (≤ 1 page)

**When to use:** Executive sponsors, SteerCo, board updates, C-suite communication
**Read time:** 2 minutes max
**Rule:** One ask per brief. No ask = the exec has no reason to act.

```
## [Program Name] — Executive Update

**Date:** [Date]
**Status:** 🔴 Red | 🟡 Amber | 🟢 Green

---

**Headline:**
[One sentence: program name + status + why in plain language]
> Example: "Platform Alpha is Amber — Backend API delay may slip Phase 2 by one sprint."

**What changed:**
- [Key progress or development since last update — 1–2 bullets]

**What needs attention:**
- [Top risk or concern — 1 bullet]

**Ask:**
> [One clear request: "We need X from Y by Z"]
> Example: "Confirm we deprioritize Feature X to hold the Phase 2 date, or approve a one-sprint slip."

**Next milestone:** [Name] — [Date] — [On track / At risk / Behind]
```

**Example (filled):**

```
## Platform Alpha — Executive Update

Date: March 15, 2024
Status: 🟡 Amber

Headline: Platform Alpha is Amber — Backend API contract is 2 weeks late, risking Phase 2 integration.

What changed:
- Phase 1 (Core Platform) shipped on March 10 as planned ✅
- Backend API v2 contract now targeting March 24 (was March 10)

What needs attention:
- If API contract slips past March 24, Phase 2 integration testing loses its buffer and Phase 2 ships April 22 (vs. April 8)

Ask: Confirm David Park (Backend EM) prioritizes the API contract by March 24, or approve Phase 2 target moving to April 22.

Next milestone: Phase 2 integration kick-off — March 25 — At risk pending API contract
```

---

## Template B: Team Brief (Operational)

**When to use:** Engineering teams, working team, core team members
**Read time:** 5 minutes
**Rule:** Actions must have owners and due dates. Blockers must have escalation status.

```
## [Program Name] — Team Update

**Date:** [Date] | **Period:** [Date range]
**Status:** 🔴🟡🟢 — [One line why]

---

### Last Period

**Shipped / completed:**
- [Workstream A]: [What was done]
- [Workstream B]: [What was done]

**Decided:**
- [Decision] — [Date] — [Forum]

---

### Blockers

| Blocker | Impact | Owner | Status | Escalated? |
|---------|--------|-------|--------|-----------|
| [Blocker] | [What can't proceed] | [Name] | [Active / Pending] | Yes / No |

---

### Action Items

| # | Action | Owner | Due | Priority |
|---|--------|-------|-----|---------|
| 1 | | | | 🔴🟡🟢 |

---

### Dependency Updates

| Dependency | Team | Was | Now | Change |
|-----------|------|-----|-----|--------|
| [Dep name] | [Team] | On track | At risk | API contract slipped 2 weeks |

---

### Next 2 Weeks

| Milestone | Target | Owner | Confidence |
|-----------|--------|-------|-----------|
| | | | High / Med / Low |
```

---

## Template C: Stakeholder Brief (Confidence + Clarity)

**When to use:** Broader stakeholders, partner teams, business leaders not in daily execution
**Read time:** 3 minutes
**Rule:** Confidence-building tone. No jargon. Clear next step.

```
## [Program Name] — Program Update

**Date:** [Date]
**Status:** [On track / Minor risk / At risk / Blocked]

---

**Where we are:**
[2–3 sentences: what the program has delivered, where we stand today, and what's coming next. Write for someone who doesn't track Jira.]

**Recent milestones:**
| Milestone | Status | Date |
|-----------|--------|------|
| [Completed milestone] | ✅ Done | [Date] |
| [In progress] | 🔄 In progress | Expected [Date] |
| [Upcoming] | 📅 Upcoming | [Date] |

**What to expect next:**
[1–2 sentences: the next major customer-facing or business-facing outcome and when.]

**Questions or concerns?**
Contact [TPM name] on Slack ([#channel]) or see the full program update at [link].
```

---

## Template D: 3P Report (Progress · Plans · Problems)

**When to use:** Portfolio reporting. Every program in a portfolio reports in this one shape, so the roll-up in Template E can be compiled from the parts without rewriting any of them.
**Book:** Chapter 8, *Portfolio Health and Reporting for Executives* (the 3P Report model, Figure 8.2)
**Rule:** Same three sections for every program, every cycle. Consistency across programs is the point; don't let teams add sections.

```
## [Program Name] — 3P Report

**Period:** [Date range] | **Status:** 🔴 Red | 🟡 Amber | 🟢 Green
**Owner:** [Program TPM] | **Data as of:** [Date of the newest source used]

### Progress — what moved this cycle
- [Outcome delivered or milestone reached, with date]
- [Outcome delivered or milestone reached, with date]

### Plans — what happens next cycle
- [Planned outcome] — [Owner] — [Target date]
- [Planned outcome] — [Owner] — [Target date]

### Problems — what needs attention
| Problem | Impact | Owner | Needs a decision from | By when |
|---------|--------|-------|-----------------------|---------|
| | | | [Name, or "none — team is handling it"] | |

**Cross-program effects:** [Other programs this problem touches, or "none known"]
```

**Example (filled):**

```
## PULSE — 3P Report

Period: [cycle dates] | Status: 🟡 Amber
Owner: Yuna Park | Data as of: [export date]

### Progress — what moved this cycle
- [Pipelines migrated this cycle, from the Jira export]

### Plans — what happens next cycle
- Airflow decommission (M6) — Yuna Park — Sep 30 2026

### Problems — what needs attention
| Problem | Impact | Owner | Needs a decision from | By when |
|---------|--------|-------|-----------------------|---------|
| FlowEngine migration velocity below the rate M6 requires | M6 date at risk; dual-run cost continues | Amara Osei | Yuki Tanaka, if the date moves | Before the next Executive SteerCo |

Cross-program effects: [e.g. programs that consume PULSE pipelines]
```

Fill the bracketed values from the current exports. The template never supplies numbers of its own.

---

## Template E: 3P Portfolio Roll-up (Executive)

**When to use:** The executive portfolio report compiled from each program's Template D.
**Rule:** The first page is the executive summary. Escalations say why, and why now. Recommendations appear only where one exists; otherwise the item is listed for visibility.

```
## [Portfolio Name] — Executive Summary

**Period:** [Date range] | **Company priorities considered:** [big bets list]

### Portfolio at a glance
| Program | Status | Top problem | Priority it affects |
|---------|--------|-------------|---------------------|
| | 🔴🟡🟢 | | [Big bet] |

### Escalations needing an executive decision
| Escalation | Why | Why now | Recommendation |
|------------|-----|---------|----------------|
| | | | [Recommendation, or "none yet — for visibility"] |

### Dependencies across programs
- [Program A] → [Program B]: [What breaks if A slips]

---

[One page per program: its Template D, unchanged]
```

**Where judgment stays yours (Chapter 8):** the report tells you a risk crossed a threshold. Whether raising it now costs more credibility than it buys, or whether the owning team is days from resolving it, is your call. Review the roll-up and clear open questions yourself before it goes out.

---

## Choosing the Right Template

| Situation | Template |
|-----------|---------|
| Weekly exec briefing | A — Exec Brief |
| Monthly board update | A — Exec Brief |
| Sprint team standup artifact | B — Team Brief |
| Cross-team working group update | B — Team Brief |
| Partner team who depends on this program | C — Stakeholder Brief |
| Company all-hands update | C — Stakeholder Brief |
| SteerCo presentation | A — Exec Brief (as the written backup to a deck) |
| Recurring status for one program in a portfolio | D — 3P Report |
| Executive portfolio report across programs | E — 3P Portfolio Roll-up |
