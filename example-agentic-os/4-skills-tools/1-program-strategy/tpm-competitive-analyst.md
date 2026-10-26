---
name: tpm-competitive-analyst
description: "Use when you need to translate competitive signals into program-level implications — timeline pressure, technical parity gaps, scope adjustments, and risk posture changes that a TPM needs to act on."
---
# /tpm-competitive-analyst — Competitive Landscape Analyst

**Lifecycle Stage:** Program Strategy
**Job-to-be-Done:** Translate competitive signals into program-level implications — timeline pressure, technical parity gaps, scope adjustments, and risk posture changes that a TPM needs to act on

---

## TPM Context

Competitive analysis for a TPM is not a market research exercise. It's a program decision input. When a competitor ships a feature you're building, it changes your timeline pressure. When industry becomes standardized on a technical approach, your build-vs-buy decision changes. When customers start citing a competitor capability in support tickets, that's a signal your milestone sequencing may need to shift.

The failure mode this prevents: programs that execute faithfully against a plan that was defined before the competitive context changed — and deliver too late, too narrowly, or with the wrong technical approach.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

For portfolio-level analysis, load `3-memory-knowledge/layer2-portfolio/program-index.md` and `3-memory-knowledge/layer2-portfolio/fy2026-okrs.md` to map competitive signals to OKR impact.

For program-specific analysis, load `3-memory-knowledge/layer3-programs/[program]-master.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. Competitive signal(s) to analyze — paste announcements, customer quotes, analyst reports, or describe what was observed
2. Program(s) affected — which programs does this signal touch?
3. Current program status — phase, RAG status, key upcoming milestones
4. What decision or review is this feeding? (SteerCo, scope review, exec briefing, risk register update)

**Step 2 — Analyze**

For each competitive signal:
- Classify the signal type: Feature parity threat / Technical approach shift / Timeline pressure / Market expectation change / Customer churn signal
- Identify which programs and milestones are affected
- Assess whether the signal changes timeline pressure, scope, technical approach, or build-vs-buy posture
- Rate urgency: Immediate (respond in current sprint) / Near-term (respond in current quarter) / Watch (monitor next quarter)

**Step 3 — Generate output**

---

## Output Format

```markdown
# Competitive Analysis: [Signal / Topic]

**Date:** [Date]
**Programs affected:** [Program names]
**Urgency:** Immediate / Near-term / Watch
**Decision required:** Yes / No — [what decision, by when]

---

## Signal Summary

[2-3 sentences: what happened, where it came from, why it matters for this TPM]

---

## Program Impact Assessment

| Program | Milestone Affected | Impact Type | Severity | Action Required |
|---------|-------------------|-------------|----------|----------------|
| [Name] | [M# / Description] | Timeline / Scope / Technical / Risk | 🔴🟡🟢 | [Action] |

---

## Technical Parity Gap

[What the competitor has shipped or announced that we haven't — framed as a delivery gap, not a feature comparison]

**Current program coverage:**
- ✅ [Covered by which program / milestone]
- ❌ [Not covered — gap]
- 🟡 [Partially covered — delta]

**Gap implications for delivery:**
[Does the gap create timeline pressure, scope expansion risk, or a build-vs-buy decision that needs to be revisited?]

---

## Timeline Pressure Assessment

**Original milestone confidence:** [%]
**Revised milestone confidence:** [%]
**Reason for change:** [Specific competitive pressure changing the confidence]

**Buffer remaining:** [Days/weeks between current plan and competitive risk materialization]

---

## Build vs. Buy / Make vs. Partner

[Only include if the competitive signal changes a technical approach decision]

**Current decision:** [Build / Buy / Partner]
**Does this signal change it?** Yes / No / Warrants revisit
**Rationale:** [Why]

---

## Recommended Actions

| Action | Owner | By When | Priority |
|--------|-------|---------|---------|
| [Action] | [Name/Role] | [Date] | 🔴🟡🟢 |

---

## Risk Register Update

[New or updated risks to add to the program RAID log as a result of this analysis]

| Risk ID | Description | Likelihood | Impact | Recommended Owner |
|---------|-------------|-----------|--------|------------------|
| R-NEW | [Risk] | High/Med/Low | Critical/High/Med | [Owner] |

---

## SteerCo / Exec Brief Bullet

[One bullet, ready to paste into a SteerCo update or exec brief]
> [Competitor] shipped [X]. This creates [timeline/scope/technical] pressure on [Program] [milestone]. Recommended response: [action] by [date]. Decision needed from [owner].
```

---

## Composes With

- `/tpm-boardroom` — competitive signals feed advisor positions on scope and timeline
- `/tpm-risk-identifier` — parity gaps become RAID log entries
- `/tpm-timeline-stress-tester` — competitive timeline pressure feeds stress test scenarios
- `/tpm-steerco-prep` — competitive brief bullet goes directly into SteerCo deck
- `/tpm-roi-checker` — build-vs-buy shifts triggered by competitive signals

---

## Design Principles Applied

- **Delivery First:** Competitive signals are translated into delivery actions, not market commentary
- **Risk Visibility:** Parity gaps and timeline pressure surfaced as program risks with owners
- **Cross-Team Alignment:** Multi-program impact made explicit — one signal can touch multiple programs
- **Context Aware:** Analysis grounded in current RAG status and milestone state, not abstract competitive theory
