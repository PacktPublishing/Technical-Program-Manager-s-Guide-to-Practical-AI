---
name: tpm-stakeholder-update
description: Use when you need to communicate program status to stakeholders at the right depth for each audience. Triggers on "write a status update", "draft the program newsletter", "what do I tell execs?", "stakeholder comms", "weekly update".
---
# /tpm-stakeholder-update — Stakeholder Comms Update

**Lifecycle Stage:** Execution & Delivery | **Job-to-be-Done:** Generate a stakeholder-segmented program update — the right message, at the right depth, for the right audience

---

## Overview

Write stakeholder communications that actually change behavior: execs get a signal with a clear ask, teams get operational detail with their blockers, and all stakeholders get confidence or an honest flag. The fatal mistake is one update sent to everyone — this skill produces the right version for each audience from a single set of inputs.

## When to Use

- Weekly or bi-weekly during active execution
- As Stage 4 of `/tpm-workflow-execution-health` (final output of the weekly cycle)
- Before a SteerCo or leadership review
- After a major milestone, decision, or incident
- When stakeholder alignment has drifted and needs reset

**When NOT to use:**
- For a formal SteerCo deck — use `/tpm-steerco-prep` instead
- For escalation comms — use `/tpm-escalation-brief` for urgent issues
- Pre-program before any execution data exists — wait until there's a health score to report

---

## Gated Workflow

```
Phase 1: Intake         →   Phase 2: Segment        →   Phase 3: Draft
     │                           │                            │
     ▼                           ▼                            ▼
Gather status inputs        Identify audiences          Exec version (≤1 page)
Confirm audience            Set depth per segment       Team version (5 min)
Confirm channel             Determine ask for execs     Stakeholder version
                                                        Channel-format output
```

### Phase 1 — Intake

**Required inputs:**
1. Program name and current status (RAG)
2. Key developments since last update
3. Upcoming milestones
4. Any decisions made or decisions needed
5. Audience for this update: all stakeholders / executives only / engineering teams / external
6. Channel: Slack / email / Confluence / SteerCo deck

**Read `2-goals-policies/stakeholder-personas.md`** for each audience's concerns, preferred style, common questions and prompt instructions, plus its special-case rules (program goes Red, date slip). Write each version from its audience's section. If the file is missing, use the defaults in Key Concepts and say so in the output. Structure: `templates/persona.md`.

### Phase 2 — Segment

Before drafting, confirm the ask for each audience segment:

```
AUDIENCE SEGMENTATION:
- Exec audience: [Name(s)] — Need: signal + ask — Max: 1 page / 2 min
- Team audience: [Teams] — Need: operational detail — Max: 5 min
- Stakeholder audience: [Others] — Need: confidence + next steps — Max: 3 min
→ Exec ask this week: [decision needed / escalation / "no action required"]
```

Never proceed to drafting without identifying the exec ask. "Keeping you informed" is not an ask.

### Phase 3 — Draft

Write each audience version. Risks go at the top — never buried in paragraph 4 of 6. The exec version leads with what changed since last update, not a recap of what they already know.

---

## Output Format

```markdown
# [Program Name] — Program Update

**Date:** [Date]
**Period covered:** [Date range]
**Status:** 🔴 Red / 🟡 Amber / 🟢 Green
**Author:** [TPM name]

---

## For Executives *(2-minute read)*

**Headline:** [Program Name] is [🔴🟡🟢] — [one sentence why]

**What happened:**
- [1–2 bullets: key progress since last update]

**What needs attention:**
- [1 bullet: key risk or decision needed]

**Ask:** [Specific decision needed / escalation needed / "No action required this week"]

**Next milestone:** [Name] — [Date] — [On track / At risk]

---

## For Engineering Teams *(5-minute read)*

**Status:** [Detailed RAG with context]

**Progress this period:**
- [Workstream A]: [Status] — [Key achievement]
- [Workstream B]: [Status] — [Key achievement]

**Blockers:**
| Blocker | Owner | Status | Escalated? |
|---------|-------|--------|-----------|
| | | | |

**Upcoming (next 2 weeks):**
- [Milestone / deliverable] — [Date] — [Owner]

**Action items:**
| Action | Owner | Due |
|--------|-------|-----|
| | | |

---

## For Customer Success *(optional — include when customers are affected)*

**Customer impact:** [Which customers or segments, and how — same numbers as the exec version]
**What to tell customers today:** [2–3 sentences they can reuse, no internal system names]
**SLA / contract exposure:** [Exposure, or "none — confirmed by [source]"]
**Next update:** [Date]

---

## For All Stakeholders *(optional section)*

**Key decisions made:**
- [Decision 1] — [Date] — [Rationale in 1 sentence]

**Coming up:**
- [What to expect in the next period]

---

## How to Reach the TPM

Slack: [#prog-channel] | Jira: [project key] | Next SteerCo: [Date]
```

---

## Key Concepts

**Audience-specific structure:**

| Audience | Length | Key need | Must include |
|---------|--------|---------|-------------|
| **Exec** | ≤1 page / 2 min | Signal, not noise | RAG, top risk, explicit ask |
| **Team** | 5 min | Operational detail | Actions, blockers, next period |
| **Stakeholder** | 3 min | Confidence + clarity | Milestone summary, next steps |

- **The exec ask is mandatory.** Every exec update must include a specific ask — a decision needed, an escalation, or an explicit "no action required." Execs who receive updates with no ask learn to ignore them.
- **Signal = change since last update.** Execs don't need a recap of what they already know. Lead with what changed and why it matters.
- **Never bury risk.** A risk mentioned in paragraph 4 wasn't communicated. Risks go first.
- **Same facts in every version.** Only depth, tone and framing change between audiences. A customer-facing version never softens a risk the exec version states: if the data shows impact, "no customer impact expected" is wrong.

---

## Common Rationalizations

| Rationalization | Reality |
|---|---|
| "I'll send the same update to everyone — they can skim" | Execs drown in operational detail. Teams miss context. One update fits no audience well. |
| "I don't need an exec ask — just keeping them informed" | Updates with no ask get ignored. Execs need to know what you need from them, every time. |
| "I'll mention the risk at the end so I don't alarm people" | Burying risk destroys trust when things go wrong. Stakeholders who feel surprised become adversarial. |
| "The program is Green so the update will be short" | Green programs need updates too. Confirm next milestone confidence, surface watch items, maintain cadence. |
| "The team knows the status — I only need to update execs" | Teams need written status to coordinate across functions. Verbal-only status creates alignment gaps. |

---

## Red Flags

- Exec update sent with no explicit ask ("no action required" is acceptable, but it must be stated)
- Risk or Amber/Red status mentioned only after positive news in the update
- Same update text sent to exec and engineering team audiences
- Update covers what happened last week with no "what's coming / what's needed"
- Stakeholder update published without checking against health scorecard from Stage 1

---

## Verification

- [ ] Exec section is ≤1 page and includes an explicit ask
- [ ] Risk / Amber-Red status appears in the first two bullets — not buried
- [ ] Team section includes a blocker table with owners (even if empty)
- [ ] Each audience version is differentiated in depth — not the same content reformatted
- [ ] Each version follows its audience's section in `2-goals-policies/stakeholder-personas.md`
- [ ] Impact numbers and dates are identical across all versions (compare exec vs Customer Success line by line)
- [ ] Channel format matches the specified channel (Slack ≠ Confluence ≠ email structure)

---

## Composes With

- `/tpm-program-health` — health scorecard provides the RAG and narrative for the exec section
- `/tpm-extract-blockers` — blocker table in team update pulls from blocker extraction
- `/tpm-steerco-prep` — exec section of this update is the basis for SteerCo opening
- `/tpm-workflow-execution-health` — Stage 4 (final output) of the weekly health check workflow

---

## Design Principles Applied
- Context Aware: Stakeholder personas from `2-goals-policies/stakeholder-personas.md` shape tone and format
- Delivery First: Update centered on progress, blockers, and next milestones
- Risk Visibility: Blockers and risks always included, never buried
