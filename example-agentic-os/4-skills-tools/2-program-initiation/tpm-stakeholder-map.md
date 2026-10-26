---
name: tpm-stakeholder-map
description: "Use when you need to build a complete stakeholder map with influence analysis, RACI skeleton, and communication plan."
---
# /tpm-stakeholder-map — Stakeholder Mapping

**Lifecycle Stage:** Program Initiation
**Job-to-be-Done:** Build a complete stakeholder map with influence analysis, RACI skeleton, and communication plan

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use any stakeholder information already in `domain-context.md` as a starting point. Ask only for what's missing or program-specific.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name (or reference master document if available)
2. List of known stakeholders (name, role, team)
3. Any known concerns or resistance from specific stakeholders
4. Communication constraints (e.g., "CTO wants weekly async only")

**Step 2 — Generate**

Produce three artifacts:

---

## Output Format

### 1. Stakeholder Influence Map

```
## Stakeholder Map: [Program Name]

| Name | Role | Team | Influence | Interest | Stance | Key Concern |
|------|------|------|-----------|---------|--------|-------------|
| | | | High/Med/Low | High/Med/Low | Champion/Neutral/Risk | |
```

**Power/Interest Grid:**
```
High Interest
    |  [Manage Closely]  |  [Keep Satisfied]  |
    |  (High influence,  |  (High influence,  |
    |  high interest)    |  low interest)     |
Low ─────────────────────────────────────────── High
    |  [Keep Informed]   |  [Monitor]         | Influence
    |  (Low influence,   |  (Low influence,   |
    |  high interest)    |  low interest)     |
Low Interest
```

### 2. RACI Skeleton

```
| Decision / Activity | [Stakeholder 1] | [Stakeholder 2] | [Stakeholder 3] |
|--------------------|----------------|----------------|----------------|
| Program go/no-go   | A              | C              | I              |
| Scope changes      |                |                |                |
| Architecture decisions |            |                |                |
| Launch sign-off    |                |                |                |
| Budget approval    |                |                |                |
```
R = Responsible, A = Accountable, C = Consulted, I = Informed

### 3. Communication Plan

```
| Stakeholder | Cadence | Format | Owner | Key Topics |
|-------------|---------|--------|-------|-----------|
| | Weekly | Slack update | | |
| | Bi-weekly | SteerCo deck | | |
| | Monthly | Written summary | | |
```

**Escalation Path:**
1. [TPM] → [EM] (same day for blockers)
2. [EM] → [Director] (24hr if unresolved)
3. [Director] → [VP] (48hr if unresolved)

---

## TPM Context

TPMs rarely own the org chart. The stakeholder map encodes the **political landscape** — who can block, who can accelerate, who needs managing up, and who will go quiet when they're unhappy. It's a negotiation and influence tool, not an org chart copy.

Critical because TPMs operate through influence, not authority. Without this map, you're flying blind into every escalation, status update, and go/no-go conversation.

---

## Key Concepts

- **Stakeholder groups:** Sponsor (decision authority), SteerCo (accountability), Core Team (execution), Working Team (delivery), Partners/Dependents (external)
- **Influence vs Interest:** High influence + low interest = keep satisfied (easy to lose). High influence + high interest = manage closely (your most important relationship).
- **Stance:** Champion (advocate), Neutral (informational), Risk (potential blocker or detractor) — never skip this column
- **Communication cadence:** Match cadence to their involvement level. Daily for blockers, weekly for core, bi-weekly for steerco, monthly for exec sponsors.
- **RACI clarity:** "Review" = substantive feedback expected. "Informed" = FYI only. Mixing these wastes everyone's time.

---

## Anti-Patterns

- **Skipping the map** — leads to last-minute "why wasn't I consulted?" escalations at the worst possible time
- **Over-granularity** — mapping every individual instead of roles; map becomes maintenance burden and goes stale
- **No update owner** — map without a designated owner goes stale in 2 sprints; assign an owner for refresh at major milestones
- **All stakeholders in one tier** — flattening influence/interest differences means treating your CEO and a contributing engineer the same way
- **Missing the Stance column** — if you don't know who's at risk of blocking you, you can't manage it proactively

---

## Composes With

- `/tpm-master-document` — stakeholder list from Charter feeds directly into this map
- `/tpm-premortem` — "Stakeholder Misalignment" failure scenario is informed by the map
- `/tpm-steerco-prep` — SteerCo prep uses this map to calibrate audience and framing
- `/tpm-stakeholder-update` — communication plan from this map drives the update cadence

---

## Design Principles Applied
- Cross-Team Alignment: Influence map makes cross-functional dynamics visible
- Risk Visibility: Stance column flags potential resistance early
- Delivery First: Communication plan focused on decisions and blockers, not status theater
