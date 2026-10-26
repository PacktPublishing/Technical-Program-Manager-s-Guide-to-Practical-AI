---
name: tpm-workflow-benefits-closure
description: Act 3 benefits delivery and closure — runs 4 agents to turn program closure from an administrative burden into root-cause analysis, contribution truth, a validated knowledge asset, and a governed operational handoff
---

# Workflow: Benefits Delivery & Closure (Act 3)

**Trigger:** `/tpm-workflow-benefits-closure`
**Cadence:** On demand — final 2–3 weeks of a program
**Mid-entry:** Yes — any agent runs standalone via its own slash command
**Output:** Root-cause retro analysis + contribution synthesis record + validated Program Brain + governed operational handshake package
**Time to run:** ~90 minutes across the four agents; the human gates add elapsed time, not agent time

---

## Overview

Programs end while the team is already being pulled into the next kickoff. What gets left behind is undocumented debt, unverified benefits, and institutional memory scattered across archived channels. This workflow is the AI-augmented version of Act 3: it replaces the rushed checklist with four mechanisms that each produce a durable asset.

It composes with `/tpm-workflow-program-closure` rather than replacing it. That workflow runs the operational closure sequence (checklist → summary → memory → retro). This one supplies the analytical depth beneath it: run this workflow's Stage 1 before `/tpm-programretro`, and its Stage 4 before `/tpm-programclosure` signs off.

```
/tpm-workflow-benefits-closure
         │
         ▼
┌────────────────────────────┐
│  STAGE 1                   │
│  tpm-retro-rootcause       │  → Top 4 systemic themes, each with
│  (supervisor: 4 evidence   │    2-class corroboration + mitigation
│   classes)                 │    forensics + an installed control
└────────┬───────────────────┘
         │
         ▼
┌────────────────────────────┐
│  STAGE 2                   │
│  tpm-contribution-         │  → Value-vs-volume matrix, invisible
│  synthesis                 │    work surfaced, pillar coverage
└────────┬───────────────────┘
         │
         ▼
╔════════════════════════════╗
║  HUMAN GATE A              ║  ← TPM confirms retro themes with the
║  • Themes validated w/team ║    team; EMs review contribution
║  • EM review of Stage 2    ║    records. Neither output is
╚════════╤═══════════════════╝    published before this gate.
         │  (confirmed)
         ▼
┌────────────────────────────┐
│  STAGE 3                   │
│  tpm-program-brain         │  → Pruned corpus + contradiction
│                            │    register + 10/10 accuracy gate
└────────┬───────────────────┘
         │
         ▼
╔════════════════════════════╗
║  HUMAN GATE B              ║  ← Architecture owner runs the accuracy
║  • Manifest confirmed      ║    gate. 10/10 or the corpus is fixed
║  • Gate passed 10/10       ║    and re-run. No partial publish.
╚════════╤═══════════════════╝
         │  (published)
         ▼
┌────────────────────────────┐
│  STAGE 4                   │
│  tpm-operational-handshake │  → 3-tier backlog + telemetry check
│                            │    + circuit breakers
└────────┬───────────────────┘
         │
         ├──── 🔴 breaker tripped ──→ /tpm-escalation-brief
         │                             + emergency operational review
         ▼  (breakers clear)
╔════════════════════════════╗
║  HUMAN GATE C              ║  ← Dual approval: sending program lead
║  • Sending lead signs      ║    AND receiving sustaining lead.
║  • Receiving lead signs    ║    Unapproved items stay with the program.
╚════════╤═══════════════════╝
         │  (approved)
         ▼
   ┌──────────────────┐
   │  CLOSURE PACKAGE │
   └──────────────────┘
```

---

## Pre-Flight

Before starting, confirm:
- [ ] The program has actually shipped — this workflow analyzes delivered outcomes, not forecasts
- [ ] Execution tracker (Jira or Linear) is current for the program — check `source-registry.md` staleness thresholds
- [ ] DataDog export covers the post-launch window (needed for both Stage 1 telemetry and Stage 4 anomaly check)
- [ ] The launch-testing baseline is available (Stage 4 circuit breaker depends on it)
- [ ] Receiving sustaining team and its lead are identified and have agreed to take the handoff
- [ ] An architecture owner has committed to running the Stage 3 accuracy gate — without a named validator, Stage 3 cannot complete

If pre-flight items are missing, run `/tpm-preflight` first.

---

## Stage 1: Retrospective Root-Cause

**Agent:** `/tpm-retro-rootcause`
**Reads:** `5-agent-harness/sub-agents/tpm-retro-rootcause.md`
**Data:** Jira/Linear, DataDog, Jira L3, program master risk section, plus TPM-supplied team feedback and Git telemetry
**Goal:** Four systemic themes, each corroborated across ≥2 evidence classes, each ending in an installed control

**Key output to carry forward:**
- `themes[]` → Stage 3 corpus input (the retrospective analysis is a required Program Brain artifact)
- `blind_spot_count` → next program's risk register via `/tpm-raid-log`
- Structural findings → `/tpm-techdebt`, and they reappear in Stage 4 as Tier 2 candidates

**Gate:** None automated. Proceed to Stage 2 while themes await team confirmation at Gate A.

---

## Stage 2: Contribution Synthesis

**Agent:** `/tpm-contribution-synthesis`
**Reads:** `5-agent-harness/sub-agents/tpm-contribution-synthesis.md`
**Data:** Jira/Linear resolution text, DataDog incident resolutions, Jira L3 fixes, `6-outputs/decisions/DR-*.md`, Aha milestones, TPM-supplied peer feedback
**Goal:** What each contributor changed about the outcome, with volume metrics shown only as contrast

**Key output to carry forward:**
- `single_points_of_knowledge[]` → `/tpm-programmemory` critical-context section, and a Stage 4 ownership risk if that person is not on the receiving team
- `invisible_work_items` → often reveals undocumented operational work that belongs in the Stage 4 handoff

**Gate:** Output does not leave the TPM until EM review at Gate A.

---

## HUMAN GATE A — Themes and Contributions

Do not proceed past this gate on the agent's authority.

**Confirm:**
- [ ] Retro themes presented to the program team; disputed themes marked as disputed rather than deleted or defended
- [ ] Each Stage 1 recommendation has a named owner who has accepted it
- [ ] Every contribution record reviewed by that contributor's EM
- [ ] Contributors have seen their own entry
- [ ] No ranking or score derived from Stage 2

---

## Stage 3: Program Brain

**Agent:** `/tpm-program-brain`
**Reads:** `5-agent-harness/sub-agents/tpm-program-brain.md`
**Data:** Final architecture docs, accepted decision records, shipped specs, Stage 1 output, `/tpm-programmemory` output, Stage 4 debt inventory if already drafted
**Goal:** A queryable knowledge asset that returns cited, correct answers — or says "not documented"

**Sequencing note:** Stage 3 and Stage 4 exchange input. Run Stage 3's manifest step first, hold the inherited-debt section open, populate it from Stage 4's Tier 2 output, then run the accuracy gate. If time forces a single pass, run Stage 4 first and treat its Tier 2 list as a Stage 3 corpus input.

**Key output to carry forward:** Published repository URL/location → referenced in the Stage 4 handoff summary so the sustaining team knows where the "why" lives

**Gate:** Gate B — 10/10 accuracy, named validator.

---

## HUMAN GATE B — Accuracy

**Confirm:**
- [ ] Artifact manifest reviewed — TPM agrees with every EXCLUDE decision
- [ ] Contradiction register shows zero unresolved entries
- [ ] Architecture owner ran all 10 evaluation questions, including the stale-traps and the no-answer questions
- [ ] Score is 10/10 with correct citations — a 9 means fix the corpus and re-run, not publish
- [ ] Review owner and staleness horizon are recorded

---

## Stage 4: Operational Handshake

**Agent:** `/tpm-operational-handshake`
**Reads:** `5-agent-harness/sub-agents/tpm-operational-handshake.md`
**Data:** Jira/Linear open items, Jira L3, DataDog, Salesforce support tickets, Vanta (SHIELD), dependency matrix, TPM-supplied undocumented workarounds
**Goal:** Every unresolved item tiered, described sprint-ready, and owned — or explicitly recommended for closure

**Circuit breakers run before the package is produced:**
- Tier 1 > 10% of program scope → halt, emergency operational review
- Telemetry deviates from launch baseline unexplained → halt, escalate
- Any Tier 1 item unowned → halt

**On a tripped breaker:** the workflow branches to `/tpm-escalation-brief` and stops. Do not proceed to Gate C with a provisional backlog.

**Gate:** Gate C — dual approval.

---

## HUMAN GATE C — Dual Approval

**Confirm:**
- [ ] All three circuit breakers clear
- [ ] Sending program lead has approved each tier
- [ ] Receiving sustaining lead has approved each tier — separately, not by proxy
- [ ] Tier 3 routed to product management, not to engineering's backlog
- [ ] Held and rejected items remain assigned to the program, with an owner
- [ ] Only after approval: create or transfer tickets via `/tpm-epic-breakdown` (Cross-Team Dependency Ticket mode)

---

## Workflow Complete

**Artifacts produced:**
1. `Retrospective Root-Cause Analysis` — 4 systemic themes with installed controls and mitigation forensics
2. `Contribution Synthesis Record` — EM-reviewed, no rankings
3. `Program Brain` — published, validated 10/10, with a review owner and staleness horizon
4. `Operational Handshake Package` — dual-approved 3-tier backlog with telemetry verification

**Then run:** `/tpm-workflow-program-closure` — the closure checklist, summary, memory, and retro session now have analytical inputs rather than recollection.

**Escalation branch:** If any Stage 4 circuit breaker tripped, the deliverable is an escalation brief and an emergency operational review, and the program is not closed.

---

## Design Principles Applied
- **Delivery First:** Each stage produces an asset with an owner — a control, a record, a repository, a maintenance roadmap.
- **Risk Visibility:** Circuit breakers make it structurally impossible to hand off an unstable program quietly.
- **Cross-Team Alignment:** The handoff requires both organizations to sign; the Program Brain documents boundaries for the teams that will build against them.
- **Context Aware:** Three explicit human gates place judgment where it matters — theme validation, factual accuracy, and backlog transfer.
