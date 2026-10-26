---
name: tpm-feedback-analyzer
description: "Use when you need to extract program-relevant signals from support tickets, post-launch feedback, retro notes, and stakeholder responses — and translate patterns into milestone adjustments, risk updates, and escalation decisions."
---
# /tpm-feedback-analyzer — Feedback Analyzer

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Extract program-relevant signals from support tickets, post-launch feedback, retro notes, and stakeholder responses — and translate patterns into milestone adjustments, risk updates, and escalation decisions

---

## TPM Context

Feedback reaches a TPM through many channels: support ticket spikes, customer escalations, post-launch surveys, internal retrospectives, QBR input, and field reports. The signal that matters for a TPM is not "customers like feature X" — it's "this feedback pattern suggests our definition of done was wrong" or "this support ticket volume indicates a delivery gap we haven't acknowledged" or "this retro theme will repeat next quarter if we don't change something structurally."

The failure mode this prevents: programs that ship, collect feedback, and file it in a Notion doc — instead of using it to update milestone confidence, adjust the risk register, and inform the next delivery cycle.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

For program-specific analysis, load `3-memory-knowledge/layer3-programs/[program]-master.md`.

If analyzing support ticket data, use `1-inputs-triggers/` exports if available.

---

## Interaction Flow

**Step 1 — Intake**

1. Feedback source(s) — paste or describe: support tickets, customer quotes, retro notes, survey data, QBR input, Slack thread, stakeholder email
2. Program and phase — which program, what stage of delivery
3. Time window — what period does this feedback cover?
4. What prompted this analysis? (Post-launch review / SteerCo prep / retrospective / escalation signal)

**Step 2 — Analyze**

Classify feedback by signal type:
- **Delivery gap** — feedback indicates something shipped but doesn't work as intended
- **Scope gap** — feedback indicates something customers / stakeholders expected that wasn't in scope
- **Operational gap** — feedback indicates something works technically but fails in production use (reliability, latency, UX)
- **Communication gap** — feedback indicates a disconnect between what shipped and what was announced or promised
- **Structural gap** — retro or internal feedback indicating a process or governance problem that will recur

**Step 3 — Generate output**

---

## Output Format

```markdown
# Feedback Analysis: [Program / Source / Time Window]

**Date:** [Date]
**Program:** [Program name]
**Source:** [Support tickets / Retro / Customer calls / Survey / Other]
**Period covered:** [Date range]
**Feedback volume:** [N items / N tickets / N responses]

---

## Pattern Summary

[3-5 sentences: what the feedback is saying in aggregate, what themes repeat, what is surprising vs. expected]

---

## Signal Classification

| # | Theme | Signal Type | Volume | Severity | Program Implication |
|---|-------|------------|--------|----------|-------------------|
| 1 | [Theme] | Delivery / Scope / Operational / Comms / Structural | High/Med/Low | 🔴🟡🟢 | [What this means for delivery] |

---

## Delivery Gap Analysis

[Only include if feedback reveals a delivery gap — something shipped that doesn't meet the definition of done]

**Gap description:** [What was built vs. what was needed]
**Milestone affected:** [Which milestone or epic]
**Definition of done problem:** [Was DoD wrong, incomplete, or not validated?]
**Recommended action:** [Rework scope / Reopen milestone / Create follow-on epic]
**Owner:** [Name/Team]

---

## Scope Gap Analysis

[Only include if feedback reveals something missing from scope]

**What's missing:** [Capability or behavior not in current scope]
**Was it ever in scope?** Yes — descoped / No — never considered / Unknown
**Impact if unaddressed:** [Customer / delivery / revenue implication]
**Recommended action:** Add to backlog with priority / Escalate for scope decision / Deprioritize with rationale
**Decision required from:** [Name/Role]

---

## Risk Register Updates

[New or updated risks based on feedback patterns]

| Risk | Likelihood | Impact | Owner | Recommended Action |
|------|-----------|--------|-------|-------------------|
| [Risk from feedback pattern] | High/Med/Low | Critical/High/Med | [Owner] | [Action] |

---

## Milestone Confidence Impact

| Milestone | Current Confidence | Revised Confidence | Reason |
|-----------|------------------|------------------|--------|
| [M#] | [%] | [%] | [Feedback signal driving change] |

---

## Structural Issues (Will Recur Without Change)

[Only include if feedback reveals a process, governance, or operating model problem]

1. **[Issue]** — Root cause: [Why it happened] — Recommended fix: [Structural change, not a patch]

---

## Recommended Actions

| Action | Owner | By When | Priority |
|--------|-------|---------|---------|
| [Action] | [Name/Role] | [Date] | 🔴🟡🟢 |

---

## SteerCo / Stakeholder Summary

[2-3 sentences ready to paste into a SteerCo update, program health report, or stakeholder email]
> [Period] feedback from [source] surfaces [N] patterns. Most significant: [top signal]. Recommended program response: [action]. Decision needed: [yes/no — what, from whom].
```

---

## Composes With

- `/tpm-program-health` — feedback patterns update RAG status and health narrative
- `/tpm-risk-identifier` — feedback-driven risks feed the formal RAID log
- `/tpm-raid-log` — structural issues and delivery gaps become RAID entries
- `/tpm-programretro` — feedback analysis is a primary input to program retrospective
- `/tpm-escalation-brief` — delivery or scope gaps requiring exec decision feed escalation briefs
- `/tpm-supportticket-check` — complementary skill for real-time support ticket analysis

---

## Design Principles Applied

- **Delivery First:** Feedback is translated into delivery actions — milestone updates, scope decisions, RAID entries — not filed as observation
- **Risk Visibility:** Patterns that indicate structural problems surfaced explicitly, not softened as "areas for improvement"
- **Cross-Team Alignment:** Scope and communication gaps call out where cross-team agreements may need to be revisited
- **Context Aware:** Analysis grounded in current program phase, milestone state, and known risk register
