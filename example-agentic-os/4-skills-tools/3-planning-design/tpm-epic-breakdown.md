---
name: tpm-epic-breakdown
description: "Use when you need to decompose an epic into well-defined tasks with acceptance criteria, owners, and sizing — or generate cross-team dependency tickets that make handoff accountability traceable in Jira."
---
# /tpm-epic-breakdown — Epic Breakdown & Cross-Team Ticket Generator

**Lifecycle Stage:** Planning & Design
**Job-to-be-Done:** Decompose an epic into well-defined tasks with acceptance criteria, owners, and sizing — or generate cross-team dependency tickets that make handoff accountability traceable in Jira

---

## TPM Context

A TPM works with two types of ticket problems: an epic that needs to be broken into executable work, and a cross-team dependency that exists only as a verbal agreement or a row in a dependency matrix. Verbal dependencies fail. They slip silently because nobody is accountable in a tracker.

**Breakdown mode** decomposes an epic into scoped stories with clear acceptance criteria and sizing. The TPM drives this when engineering hasn't started decomposition and the sprint is approaching, or when the epic scope is ambiguous and needs structure before estimation.

**Dependency ticket mode** generates the tickets that make cross-team commitments explicit and trackable: what Team A needs from Team B, by when, with what acceptance criteria, with what escalation if it slips. These are not engineering tasks — they are accountability artifacts. They belong in Jira so they can be tracked, blocked, and escalated through normal program mechanisms.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use the Jira project keys and story point conventions from `domain-context.md` when generating output.

For Dependency ticket mode: load `3-memory-knowledge/layer3-programs/[program]-master.md` and `3-memory-knowledge/layer2-portfolio/dependency-matrix.md` for cross-program dependency context.

---

## Interaction Flow

**Step 1 — Intake**

1. Mode: **Breakdown** (decompose an epic into stories) or **Dependency tickets** (generate cross-team accountability tickets)
2. For Breakdown: epic name and description, owning team and squad, target sprint or quarter, known sub-tasks, definition of done, linked PRD or design doc
3. For Dependency tickets: the dependency to formalize (what program/team needs what from which program/team, by when), the milestone or deliverable at risk if it's late, and the current state (verbal agreement / risk register entry / nothing)

**Step 2 — Generate**

---

## Output Format

```markdown
# Epic Breakdown: [Epic Name]

**Epic key:** [e.g., PLAT-123]
**Owning squad:** [Squad name]
**Target:** [Q/Sprint]
**Estimated total:** [X story points / Y eng-weeks]

---

## Stories

### Story 1: [Story title]
**Type:** Feature / Bug / Tech Debt / Spike
**Points:** [Fibonacci: 1/2/3/5/8/13]
**Owner:** [Squad/Person]
**Dependencies:** [None / Story X / External team Y]

**Description:**
As a [role], I want to [action] so that [outcome].

**Acceptance Criteria:**
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

**Definition of Done:**
- [ ] Code reviewed and merged
- [ ] Tests written and passing
- [ ] Documentation updated
- [ ] Deployed to staging

---

### Story 2: [Story title]
[same format]

---

## Epic Summary

| Story | Points | Owner | Sprint | Dependencies |
|-------|--------|-------|--------|--------------|
| Story 1 | | | | |
| Story 2 | | | | |
| **Total** | | | | |

---

## Open Questions / Spikes Needed

1. [Question that requires investigation before estimation is confident]
2. [...]

---

## Risks

| Risk | Impact | Mitigation |
|------|--------|-----------|
| | | |
```

---

---

## Dependency Ticket Mode Output Format

```markdown
# Cross-Team Dependency Tickets: [Program] → [Program / Team]

**Generated:** [Date] · **TPM:** [Name]
**Dependency source:** [Dependency matrix / Risk register / Verbal agreement]
**Milestone at risk:** [M# — description — date]

---

## Dependency Overview

| Field | Value |
|-------|-------|
| **Requesting program** | [Program / Team] |
| **Delivering program** | [Program / Team] |
| **What is needed** | [Specific deliverable — not vague] |
| **Needed by** | [Date] |
| **Risk if late** | [Specific downstream impact] |
| **Escalation owner** | [Name — per domain-context.md escalation path] |

---

## Ticket 1 — Delivery Commitment (Filed with Delivering Team)

**Jira project:** [Delivering team's project key]
**Type:** Dependency / Task
**Title:** [PROGRAM] Deliver [specific deliverable] for [Requesting Program] by [Date]
**Priority:** High / Critical
**Labels:** cross-team-dependency, [requesting-program], [delivering-program]
**Assignee:** [Delivering team lead / TPM]
**Due date:** [Date]
**Epic link:** [Relevant epic in delivering team's backlog]

**Description:**
[Requesting Program] requires [specific deliverable] to complete [milestone / control / capability].

**What must be delivered:**
- [Specific interface, endpoint, data format, capability — no ambiguity]
- [Performance requirement if applicable]
- [Environment: staging / production / both]

**Acceptance criteria:**
- [ ] [Criterion 1 — verifiable by requesting team]
- [ ] [Criterion 2]
- [ ] [Sign-off from: requesting team TPM — [Name]]

**If this ticket cannot be delivered by [Date]:**
Notify [Requesting TPM name] in [#slack-channel] immediately. Do not wait until the due date. Escalation path: [per domain-context.md]

---

## Ticket 2 — Dependency Tracker (Filed with Requesting Team)

**Jira project:** [Requesting team's project key]
**Type:** Dependency / Blocker
**Title:** [DEPENDENCY] Waiting on [Delivering Program]: [specific deliverable] — due [Date]
**Priority:** High / Critical
**Labels:** cross-team-dependency, blocked-by-[delivering-program]
**Assignee:** [Requesting team TPM]
**Due date:** [Date — same as Ticket 1]
**Blocked tickets:** [List of requesting team's tickets that cannot proceed until this resolves]

**Description:**
This ticket tracks an inbound dependency from [Delivering Program]. Until [specific deliverable] is received and accepted, the following work is blocked: [list blocked tickets or milestones].

**Acceptance criteria (from requesting team's perspective):**
- [ ] [Deliverable received and matches spec]
- [ ] [Integration test passes in [environment]]
- [ ] [TPM sign-off: [Name]]

**Escalation if not resolved by [Date - 3 days]:**
[Requesting TPM] escalates to Karl Bergstrom (Head of TPM) via [#slack-channel]. Karl escalates to Division Director level if not resolved within 24 hours.

---

## Dependency Status Tracking

[Add this table to the program master doc RAID log]

| Dependency | Delivering team | Due | Ticket | Status | Last checked |
|-----------|----------------|-----|--------|--------|-------------|
| [Deliverable] | [Team] | [Date] | [Jira key] | 🔴🟡🟢 | [Date] |
```

---

## Design Principles Applied

- **Delivery First:** Stories and dependency tickets have clear acceptance criteria and named owners — not tracked as "in progress" without definition
- **Cross-Team Alignment:** Dependency ticket mode makes verbal agreements traceable — both sides of the dependency have a ticket, an owner, and an escalation path
- **Risk Visibility:** Blocked tickets explicitly linked; escalation path defined before the dependency slips, not after
- **Tool-Connected:** Uses Jira project keys and label conventions from domain-context.md; dependency tracker updates the program RAID log
