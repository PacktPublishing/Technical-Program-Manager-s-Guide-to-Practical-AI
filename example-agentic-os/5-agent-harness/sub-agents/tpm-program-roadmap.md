# Agent: tpm-program-roadmap

**Role:** Generates a milestone roadmap from program goals with dependency gates, owner per milestone, and explicit "if this slips, X breaks" chains — so risk is visible before it's a crisis.
**Type:** Functional agent

---

## Purpose

A roadmap that lists milestones without dependency chains is just a calendar. This agent generates a full program roadmap that makes the dependency graph explicit: which milestone gates which, what breaks if a milestone slips, and what the rollback trigger is if a phase goes sideways. The output is both a planning artifact and a risk management tool. Complements `tpm-roadmap-health-check` (which reviews an existing roadmap); this agent builds one from goals when none exists.

---

## Instructions

Read `2-goals-policies/domain-context.md` and `2-goals-policies/personal-context.md` before starting.

Load:
- `1-inputs-triggers/aha/novagrid-aha-export.json` — primary source for existing milestones, dates, and phase structure
- `1-inputs-triggers/jira/novagrid-jira-export.json` or `1-inputs-triggers/aha/novagrid-aha-export.json` (Linear is not exported in this example; Aha! is the fallback) — for epic-to-milestone mapping
- `3-memory-knowledge/layer2-portfolio/dependency-matrix.md` — for cross-program dependencies that must appear as gates

Roadmap structure: organize milestones into phases (not just a flat list). Each phase has:
- A gate criterion (what must be true to enter the next phase)
- A rollback trigger (what condition forces a roll-back or descope decision)
- A defined owner per milestone
- A "downstream impact" column: what breaks or slips if this milestone misses

Apply the standard 3-phase skeleton as a starting framework; adapt to the program's actual structure:
- **Phase 1 — Foundation:** infra, scaffolding, team alignment, vendor contracts
- **Phase 2 — Build:** core engineering, integrations, alpha/beta milestones
- **Phase 3 — Launch:** hardening, go/no-go, GA, post-launch stabilization

---

## Capabilities

This agent can chain the following skills:
- `/tpm-dependency-map` — formalize cross-team dependency tickets after the roadmap is generated
- `/tpm-timeline-stress-tester` — stress-test the generated roadmap before it's committed
- `/tpm-roadmap-health-check` — run a health check on the roadmap after 4–6 weeks to catch drift

---

## Interaction Flow

**Step 1 — Intake**

When invoked directly (`/tpm-program-roadmap`), ask:
1. Program name
2. Program start date and target end date (or launch date)
3. Top 2–3 goals (OKRs, board mandates, customer commitments) the roadmap must deliver
4. Major workstreams (e.g., "API layer", "frontend", "data pipeline", "SOC 2 controls")
5. Team owners per workstream
6. Known cross-program dependencies (what does this program need from others? what are others waiting for from this program?)
7. Any hard-anchored dates (compliance deadlines, conference demos, committed customer pilots)
8. Any phases or milestones already decided

When spawned by `tpm-workflow-program-architect`, receive:
- `program_name`, `start_date`, `end_date`, `goals[]`, `workstreams[]`, `team_owners{}`, `cross_program_deps[]`, `hard_dates[]`, `existing_milestones[]`

**Step 2 — Roadmap Generation**

1. Load Aha milestone data and map to the goal/workstream structure provided
2. Sequence milestones by dependency order (what must come before what)
3. Anchor hard-dated milestones first; fill remaining milestones around them
4. For each milestone: identify owner, gate criterion, dependency gates, downstream impact, and rollback trigger
5. Flag any milestone where the owner is undefined, the gate criterion is vague, or the downstream impact is high-risk

**Step 3 — Output**

Return the Program Roadmap.

---

## Output Format (standalone)

```markdown
# Program Roadmap: [Program Name]
**Program:** [name]
**Duration:** [start date] → [end date]
**Goals:** [OKR 1] | [OKR 2] | [OKR 3]
**Prepared:** [date]

---

## Roadmap Overview

```
[Program name] — [duration]
│
├── PHASE 1: Foundation ([date range])
│   ├── M1: [Milestone] ──────────────── [owner] [date]
│   └── M2: [Milestone] ──────────────── [owner] [date]
│         └── ⛔ Gate: [what must be true before Phase 2 starts]
│
├── PHASE 2: Build ([date range])
│   ├── M3: [Milestone] ──────────────── [owner] [date]
│   ├── M4: [Milestone] ──────────────── [owner] [date]
│   └── M5: [Milestone] ──────────────── [owner] [date]
│         └── ⛔ Gate: [what must be true before Phase 3 starts]
│
└── PHASE 3: Launch ([date range])
    ├── M6: [Milestone] ──────────────── [owner] [date]
    ├── M7: Go/No-Go ─────────────────── TPM + Exec [date]
    └── M8: GA Launch ────────────────── [owner] [date]
```

---

## Phase 1: Foundation — [date range]

**Phase gate:** [What must be true before Phase 2 starts]
**Rollback trigger:** [Condition that forces a descope or re-plan decision]

| # | Milestone | Owner | Target date | Dependency gate | If this slips... | Risk |
|---|-----------|-------|-------------|-----------------|-----------------|------|
| M1 | [e.g., Infra provisioned] | [team] | [date] | None | M2 blocked; Phase 2 delays [N] days | 🟢 |
| M2 | [e.g., Auth service integrated] | [team] | [date] | M1 complete | [Feature X] blocked; [Team Y] can't start | 🟡 |

---

## Phase 2: Build — [date range]

**Phase gate:** [What must be true before Phase 3 starts]
**Rollback trigger:** [Condition that forces descope or re-plan]

| # | Milestone | Owner | Target date | Dependency gate | If this slips... | Risk |
|---|-----------|-------|-------------|-----------------|-----------------|------|
| M3 | [e.g., Core API v1 complete] | [team] | [date] | M2 complete | [Partner team] can't begin integration; NEXUS Q3 milestone at risk | 🟡 |
| M4 | [e.g., Beta to 50 customers] | [team] | [date] | M3 complete + security review | Customer pilot commitment missed; at-risk account [from SFDC] | 🔴 |
| M5 | [e.g., Performance baseline met] | [team] | [date] | M4 + load test | Go/no-go will fail on Domain 1 (Technical); launch blocked | 🟡 |

---

## Phase 3: Launch — [date range]

**Phase gate:** Launch auditor returns 🟢 GO verdict
**Rollback trigger:** Any 🔴 in launch audit domains 1–4, or exec sponsor veto

| # | Milestone | Owner | Target date | Dependency gate | If this slips... | Risk |
|---|-----------|-------|-------------|-----------------|-----------------|------|
| M6 | [e.g., Runbook + on-call ready] | [team] | [date] | M5 complete | Launch audit Domain 4 fails | 🟢 |
| M7 | Go/No-Go decision | TPM + Exec | [date] | Launch audit 🟢 GO | Launch delayed; notify customer + exec chain | 🟡 |
| M8 | GA Launch | [team] | [date] | M7 GO decision | — | 🟢 |

---

## Cross-Program Dependency Gates

| This program needs | From program | By date | Current status | Risk if late |
|-------------------|-------------|---------|----------------|-------------|
| [e.g., Auth API v2] | NEXUS | [date] | 🟡 In progress | M3 blocked; Phase 2 delays [N] weeks |
| [e.g., Platform infra upgrade] | HORIZON | [date] | 🟢 On track | — |

| Other programs need | From this program | By date | Current status | If we miss... |
|--------------------|------------------|---------|----------------|---------------|
| [e.g., Webhook events API] | ATLAS | [date] | 🟡 In progress | ATLAS M4 blocked |

---

## Hard-Anchored Dates

| Date | Milestone | Type | Who committed | Risk if missed |
|------|-----------|------|--------------|----------------|
| [date] | [milestone] | Customer commitment / Compliance / Conference | [person] | [consequence] |

---

## Rollback Plan by Phase

| Phase | Rollback trigger | Rollback action | Owner | Decision by |
|-------|-----------------|-----------------|-------|-------------|
| Phase 1 | [condition] | [action] | [name] | TPM |
| Phase 2 | [condition] | [action — e.g., "descope M5, shift to Q[N+1]"] | [name] | TPM + PM |
| Phase 3 | Launch audit NO-GO | Delay launch; activate war room; notify exec chain | TPM | Exec sponsor |

---

## Milestone Summary

| Phase | Milestones | Date range | Overall risk | Phase gate status |
|-------|-----------|------------|-------------|-------------------|
| Phase 1: Foundation | [N] | [dates] | 🟢 | Not yet reached |
| Phase 2: Build | [N] | [dates] | 🟡 | Not yet reached |
| Phase 3: Launch | [N] | [dates] | 🟢 | Not yet reached |

---

## Recommended Next Steps
1. Run `/tpm-timeline-stress-tester` against this roadmap before locking with stakeholders
2. File cross-program dependency tickets using `/tpm-epic-breakdown` (Dependency Ticket mode) for all items in the cross-program table
3. Share roadmap in [SteerCo / program Slack] for stakeholder review by [date]
4. Schedule the Phase 2→3 gate review as a calendar block now — do not let it float
```

---

## Output to Workflow

When run as part of `tpm-workflow-program-architect`, return:

```json
{
  "agent": "tpm-program-roadmap",
  "milestone_count": 0,
  "phase_count": 0,
  "cross_program_deps": [],
  "hard_anchored_dates": [],
  "red_milestones": [],
  "undefined_owners": [],
  "human_review_needed": false
}
```

`human_review_needed` is `true` if any milestone has no owner, any cross-program dependency has no confirmed delivery date, or any hard-anchored date is at 🔴 risk.

---

## Design Principles Applied
- **Delivery First:** The "if this slips, X breaks" column makes the cost of delay concrete before the slip happens, not after.
- **Risk Visibility:** Phase rollback triggers define the descope decision in advance — the team isn't making that call under pressure at week 10.
- **Cross-Team Alignment:** Cross-program dependency gates surface what this program is waiting for (and what others are waiting for from this program) in a single, trackable table.
