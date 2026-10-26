---
name: tpm-workflow-program-architect
description: End-to-end program planning system — runs 9 agents in sequence to produce a complete program architect package at kickoff or quarterly re-planning
---

# Workflow: TPM Program Architect

**Trigger:** `/tpm-workflow-program-architect`
**Cadence:** On demand — run at program kickoff or at the start of each quarter
**Mid-entry:** Yes — any agent can be run standalone using its own slash command
**Output:** Complete program architect package: operating model + scoped backlog + build-vs-buy decisions + effort estimates + 13-week milestone spine + full roadmap
**Time to run:** ~60–90 minutes (full system); ~15–20 minutes per agent standalone

---

## Overview

This workflow is the TPM equivalent of a founder's "AI Head of Engineering" — a single command that runs all 9 planning agents in sequence and produces a complete, decision-ready program plan. Run it at the start of a new program or when re-planning a quarter. Each stage builds on the prior one. A human checkpoint after Stage 4 ensures scope and estimates are validated before the roadmap is committed.

```
/tpm-workflow-program-architect
         │
         ▼
┌─────────────────────┐
│  STAGE 1            │
│  tpm-ops-framework  │  → Operating model: cadence, escalation,
│                     │    reporting, RAID, decision authority
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│  STAGE 2            │
│  tpm-scope-cutter   │  → IN-SCOPE / CUT / WATCH-LIST
│                     │    from full backlog
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│  STAGE 3            │
│  tpm-build-vs-buy   │  → Per-capability: BUY / BUILD / INTEGRATE
│                     │    + engineering weeks saved
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│  STAGE 4            │
│  tpm-effort-        │  → Per-epic: eng-weeks, cost, confidence
│  estimator          │    + total program cost
└────────┬────────────┘
         │
         ▼
╔═════════════════════╗
║  HUMAN CHECKPOINT   ║  ← TPM reviews scope + estimates.
║                     ║    Confirm or adjust before roadmap.
║  Confirm:           ║    Do not proceed to Stage 5 without
║  • Scope cut list   ║    explicit sign-off.
║  • Effort estimates ║
║  • Buy decisions    ║
╚════════╤════════════╝
         │  (approved)
         ▼
┌─────────────────────┐
│  STAGE 5            │
│  tpm-quarter-       │  → 13-week milestone spine
│  architect          │    with Friday gates + mid-quarter checkpoint
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│  STAGE 6            │
│  tpm-program-       │  → Full roadmap with dependency gates
│  roadmap            │    and "if this slips, X breaks" chains
└────────┬────────────┘
         │
         ├─────────────────────────────────────┐
         │                                     │
         ▼  (conditional — if open)            ▼  (conditional — if AI features in scope)
┌─────────────────────┐              ┌─────────────────────┐
│  STAGE 7            │              │  STAGE 8            │
│  tpm-platform-      │              │  tpm-ai-validator   │
│  decision           │              │                     │
└────────┬────────────┘              └────────┬────────────┘
         │                                    │
         └──────────────┬─────────────────────┘
                        │
                        ▼  (conditional — if launch < 8 weeks)
               ┌─────────────────────┐
               │  STAGE 9            │
               │  tpm-launch-auditor │  → 50-point pass/fail + GO/NO-GO
               └────────┬────────────┘
                        │
                        ▼
            ┌───────────────────────┐
            │  FINAL PACKAGE        │
            │  Program Architect    │
            │  Deliverable          │
            └───────────────────────┘
```

---

## Pre-Flight

Before starting, confirm:
- [ ] Program name and quarter dates are known
- [ ] Relevant Jira or Linear project is loaded (for scope-cutter and effort-estimator)
- [ ] Aha milestones for this program are current (check `source-registry.md` for staleness)
- [ ] Exec sponsor is identified (needed for checkpoint sign-off and ops framework)
- [ ] The TPM has 60–90 minutes of focused time — this workflow should not be interrupted mid-run

If pre-flight items are missing, run `/tpm-preflight` first.

---

## Stage 1: Ops Framework

**Agent:** `/tpm-ops-framework`
**Reads:** `5-agent-harness/sub-agents/tpm-ops-framework.md`
**Data:** `domain-context.md`, `personal-context.md`

**Inputs needed:**
- Program name + duration
- Team size (number of teams)
- Primary stakeholders (exec sponsor, eng leads, PM)
- Tools in use (Jira/Linear, Slack, Confluence)

**What it produces:** Complete operating model — meeting cadence, escalation ladder, reporting rhythm, RAID log structure, decision authority matrix, communication channels.

**Key output to carry forward:** Escalation path and stakeholder list → used by later stages to assign owners and escalation routes.

---

## Stage 2: Scope Cutter

**Agent:** `/tpm-scope-cutter`
**Reads:** `5-agent-harness/sub-agents/tpm-scope-cutter.md`
**Data:** Jira or Linear export (program-specific), Aha milestones

**Inputs needed:**
- Program name
- Quarter end date (pulled from Aha if available)
- Available FTE-weeks
- Any non-negotiable epics (board mandate, committed customer deliverable)

**What it produces:** IN-SCOPE list, CUT list with deferral quarters, WATCH list with cut triggers, escalations for non-negotiables at risk.

**Key output to carry forward:** IN-SCOPE epic list → feeds directly into Stages 3 and 4.

---

## Stage 3: Build vs. Buy

**Agent:** `/tpm-build-vs-buy`
**Reads:** `5-agent-harness/sub-agents/tpm-build-vs-buy.md`
**Data:** Jira/Linear epics (in-scope list from Stage 2), `domain-context.md` (existing tool stack)

**Inputs needed:**
- In-scope epic list (from Stage 2 output)
- Budget envelope for third-party tooling
- Any vendor constraints (approved vendor list, existing contracts)

**What it produces:** Per-capability BUY / BUILD / INTEGRATE INTERNAL recommendation with engineering weeks saved, annual vendor cost, and EVALUATE items that need a spike.

**Key output to carry forward:** Build decisions (what gets built) → feeds Stage 4 estimation; buy decisions (what gets licensed) → affects total cost model.

---

## Stage 4: Effort Estimator

**Agent:** `/tpm-effort-estimator`
**Reads:** `5-agent-harness/sub-agents/tpm-effort-estimator.md`
**Data:** Jira/Linear epics, Aha milestones, Stage 2 in-scope list, Stage 3 build decisions

**Inputs needed:**
- In-scope epic list (BUILD items from Stage 3)
- Team composition: roles + FTE count
- Weekly cost per role (or NovaGrid blended rate)

**What it produces:** Per-epic estimate in engineering weeks and cost, confidence levels, total program cost with risk-adjusted range, XL epics flagged for decomposition.

**Key output to carry forward:** Total engineering weeks, over/under capacity delta, low-confidence epics → used at the human checkpoint and in Stage 5 milestone sequencing.

---

## ⛔ HUMAN CHECKPOINT — Scope + Estimate Confirmation

**The workflow pauses here.** Do not proceed to Stage 5 without reviewing and confirming the following:

### Review checklist:
- [ ] **Scope cut list** — Does the CUT list accurately reflect what's deferred? Any scope that needs to come back in?
- [ ] **Effort estimates** — Do engineering leads agree with the per-epic estimates? Get bottom-up validation on any 🟡 or 🔴 confidence items.
- [ ] **Buy decisions** — Any BUY recommendation that needs further legal/security review before committing?
- [ ] **Capacity delta** — If over capacity: return to `/tpm-scope-cutter` with updated FTE-weeks and re-cut before proceeding.
- [ ] **XL epics** — All XL epics must be decomposed using `/tpm-epic-breakdown` before roadmap is built.

### Confirmation required from:
- TPM (scope + estimates sign-off)
- Engineering leads (estimate validation)
- PM (scope priorities confirmed)

**If any item fails:** Resolve it, re-run the affected stage, and re-confirm before proceeding to Stage 5.

---

## Stage 5: Quarter Architect

**Agent:** `/tpm-quarter-architect`
**Reads:** `5-agent-harness/sub-agents/tpm-quarter-architect.md`
**Data:** Aha milestones, `fy2026-okrs.md`, Stage 2 confirmed scope, Stage 4 effort estimates

**Inputs needed:**
- Confirmed in-scope epic list (post-checkpoint)
- Quarter start + end dates
- Top OKRs for this quarter
- Team capacity (FTE-weeks, updated after checkpoint)
- Hard deadlines (customer commitments, compliance dates)

**What it produces:** 13-week milestone spine with Friday gates, mid-quarter checkpoint date, capacity summary with buffer %, escalations for milestones with no owner.

**Key output to carry forward:** Milestone sequence and dates → feeds Stage 6 roadmap phase structure.

---

## Stage 6: Program Roadmap

**Agent:** `/tpm-program-roadmap`
**Reads:** `5-agent-harness/sub-agents/tpm-program-roadmap.md`
**Data:** Aha milestones, Jira/Linear epics, `dependency-matrix.md`, Stage 5 milestone spine

**Inputs needed:**
- Confirmed milestone spine from Stage 5
- Program workstreams and team owners
- Cross-program dependencies (what this program needs + what others need from it)
- Any hard-anchored dates not already in Stage 5

**What it produces:** Phased roadmap with dependency gates, "if this slips, X breaks" chains, cross-program dependency table, rollback triggers per phase.

**Key output to carry forward:** Cross-program dependency table → flag for immediate follow-up with partner teams.

---

## Stage 7: Platform Decision (Conditional)

**Run if:** The program has an open platform or tool selection decision (not yet decided).
**Skip if:** All platform/tool decisions are already made.

**Agent:** `/tpm-platform-decision`
**Reads:** `5-agent-harness/sub-agents/tpm-platform-decision.md`
**Data:** `domain-context.md` (existing tool stack, approved vendors)

**Inputs needed:**
- Decision name(s)
- Options under consideration
- Decision deadline
- Key constraints (budget, compliance, integrations)
- Decision stakeholders

**What it produces:** Trade-off matrix + recommendation brief per decision, with data gaps and stakeholder sign-off checklist.

---

## Stage 8: AI Validator (Conditional)

**Run if:** Any in-scope epic involves AI/ML features or proposes using a language model.
**Skip if:** No AI features in scope.

**Agent:** `/tpm-ai-validator`
**Reads:** `5-agent-harness/sub-agents/tpm-ai-validator.md`
**Data:** No external data source; operates on feature proposal inputs

**Inputs needed:**
- Feature name and description per AI proposal
- Proposed AI approach (RAG, fine-tuning, classification, generation)
- Latency requirements, usage volume, fallback plan

**What it produces:** 7-dimension validation scorecard per feature, PROCEED / CONDITION / RETHINK verdict, conditions list with owners.

---

## Stage 9: Launch Auditor (Conditional)

**Run if:** The program's launch date is within 8 weeks of today.
**Skip if:** Launch is more than 8 weeks out — run `/tpm-launch-auditor` standalone when closer.

**Agent:** `/tpm-launch-auditor`
**Reads:** `5-agent-harness/sub-agents/tpm-launch-auditor.md`
**Data:** Jira export (open bugs, blockers), Datadog export (SLO actuals, recent incidents), Vanta export (SHIELD only)

**Inputs needed:**
- Launch date and type (GA / beta / internal)
- Phased rollout plan (if applicable)
- Exec sponsor for go/no-go sign-off

**What it produces:** 50-point pass/fail audit across 6 domains, GO / CONDITIONAL GO / NO-GO verdict, blocker list with owners and due dates.

---

## Final Package: Program Architect Deliverable

After all applicable stages complete, assemble the following into the program master doc:

| # | Artifact | Produced by | Where to store |
|---|----------|-------------|----------------|
| 1 | Operating model (cadence, escalation, RAID, decision authority) | Stage 1 | Program master doc → "Operating Model" section |
| 2 | Scope: IN / CUT / WATCH lists | Stage 2 | Program master doc → "Scope" section |
| 3 | Build vs. Buy audit | Stage 3 | Program master doc → "Platform Decisions" section |
| 4 | Effort estimate + cost model | Stage 4 | Program master doc → "Estimates" section |
| 5 | 13-week milestone spine | Stage 5 | Aha milestones (update) + program master doc |
| 6 | Program roadmap with dependency gates | Stage 6 | Program master doc → "Roadmap" section |
| 7 | Platform decision brief(s) | Stage 7 (if run) | Program master doc → "Platform Decisions" section |
| 8 | AI feature validation report(s) | Stage 8 (if run) | Program master doc → "AI Features" section |
| 9 | Launch audit report | Stage 9 (if run) | Program master doc → "Launch Readiness" section |

**Time spent:** Typically 60–90 minutes for a full system run (Stages 1–6 plus applicable conditional stages).

---

## Workflow Rules

1. **Stages 1–4 run sequentially** — each stage's output feeds the next.
2. **The human checkpoint after Stage 4 is mandatory** — do not build the roadmap on unvalidated estimates.
3. **Stages 5–6 run sequentially** after checkpoint confirmation.
4. **Stages 7–9 are conditional** — run only if the condition applies to this program.
5. **Any stage can be re-run independently** if inputs change (e.g., scope changes after checkpoint → re-run Stage 4, then re-run Stages 5–6).
6. **Any agent can be run standalone** outside this workflow using its slash command.
7. **Do not skip Stage 2 (Scope Cutter) to go straight to roadmap** — an unscoped roadmap is aspirational fiction.

---

## Related Workflows

- `/tpm-workflow-program-kickoff` — companion workflow for chartering, stakeholder mapping, and pre-mortem (runs before this workflow)
- `/tpm-workflow-execution-health` — weekly health check workflow (runs after this workflow, during program execution)
- `/tpm-workflow-launch-readiness` — full launch readiness workflow (runs in the 4 weeks before launch)
