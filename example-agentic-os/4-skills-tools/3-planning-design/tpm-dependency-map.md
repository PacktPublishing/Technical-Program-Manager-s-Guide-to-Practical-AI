---
name: tpm-dependency-map
description: "Use when you need to generate a cross-team, cross-system dependency map with risk assessment for each dependency."
---
# /tpm-dependency-map — Dependency Map Generator

**Lifecycle Stage:** Planning & Design
**Job-to-be-Done:** Generate a cross-team, cross-system dependency map with risk assessment for each dependency

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name
2. List of workstreams or epics
3. Teams involved (can reference domain-context.md)
4. Known external systems or integrations
5. Any known blockers or at-risk dependencies

**Step 2 — Generate**

---

## Output Format

```markdown
# Dependency Map: [Program Name]

## Summary
[X] hard dependencies | [Y] soft dependencies | [Z] at-risk

---

## Dependency Table

| # | Dependency | Type | Providing Team | Consuming Team/Workstream | Due Date | Status | Risk |
|---|-----------|------|---------------|--------------------------|----------|--------|------|
| 1 | | Hard/Soft | | | | On track / At risk / Blocked | 🔴🟡🟢 |

**Types:**
- **Hard** — Program cannot proceed without this
- **Soft** — Work can proceed in parallel but will need to integrate

---

## Dependency Graph (ASCII)

```
[Workstream A] ──────────────────→ [Workstream C]
                                        ↑
[Workstream B] ─── [API Contract] ──────┘
                         ↑
                   [External Team X]
```

---

## At-Risk Dependencies

| Dependency | Risk | Impact if Delayed | Owner | Mitigation |
|-----------|------|------------------|-------|-----------|
| | | | | |

---

## Recommended Actions

1. [Immediate action for highest-risk dependency]
2. [...]
```

---

## TPM Context

TPMs cannot mandate delivery from other teams. The dependency map is a **negotiation surface** — it makes the critical path and handoffs visible so the TPM can align owners, escalate early when something slips, and avoid surprise blockers the week of a launch.

A risk without an owner is noise. A dependency without an owner is a future incident report. Every row in the dependency table must have a name next to it.

---

## Key Concepts

- **Direction:** A depends on B means A is blocked until B delivers. Always explicit about who is waiting on whom — "Team A and B are working together" is not a dependency.
- **Dependency types:**
  - **Deliverable** — a specific artifact must be handed off (API contract, design spec, dataset)
  - **API/Contract** — an interface must be finalized before consuming team can build
  - **Release gate** — another system's release must precede this one
  - **Approval/Sign-off** — decision or review required before proceeding
- **Owner** — the person responsible for unblocking, not just the team. "Backend team" is not an owner.
- **Hard vs Soft** — hard = program stops without this. Soft = work can proceed in parallel but must integrate.

---

## Anti-Patterns

- **No owners** — "Backend team" is not accountability. Get a name.
- **Ignoring direction** — vague "we have a dependency with Team X" hides who is blocked and who is accountable
- **One-and-done** — dependency maps age fast; refresh at every milestone boundary or sprint planning
- **Only internal dependencies** — external vendors, platform teams, and partner integrations slip silently; put them on the map
- **Not flagging unowned/undated** — these are your highest-risk items; call them out explicitly

---

## Composes With

- `/tpm-timeline-stress-tester` — at-risk dependencies feed directly into timeline stress analysis
- `/tpm-program-health` — Dependencies dimension of health score uses this map
- `/tpm-stakeholder-update` — dependency blockers surface in team and exec updates
- `/tpm-risk-identifier` — unowned/undated dependencies should be logged as program risks

---

## Design Principles Applied
- Cross-Team Alignment: Maps all inter-team dependencies explicitly
- Risk Visibility: At-risk table with impact and mitigations
- Delivery First: Focuses on what blocks delivery, not just documentation
