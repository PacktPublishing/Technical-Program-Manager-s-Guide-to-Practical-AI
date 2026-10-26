---
name: tpm-escalation-brief
description: "Use when you need to draft a structured escalation with context, impact, ask, and recommended path — unblock without burning bridges."
---
# /tpm-escalation-brief — Escalation Brief

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Draft a structured escalation with context, impact, ask, and recommended path — unblock without burning bridges

---

## TPM Context

TPMs escalate without authority. You cannot order resolution — an escalation is a request for a decision or help, often crossing boundaries upward or sideways. If the escalation is vague, emotional, or missing a clear ask, it gets deferred. If it's crisp and actionable, it gets a response.

The escalation brief is the TPM's instrument for unblocking without damaging relationships. It encodes the right framing: factual context, quantified impact, one ask, and a recommended path that makes the recipient's decision easy.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use escalation paths and risk thresholds from `domain-context.md`.

---

## Interaction Flow

**Step 1 — Intake**

Gather:
1. What is blocked, and who owns the blocker
2. What has already been tried to resolve it
3. Impact: timeline slip (specific dates), scope reduction, downstream teams affected
4. The one thing you need from the escalation recipient
5. 1–2 options for resolution with pros/cons

**Step 2 — Draft Escalation Brief**

---

## Output Format

```markdown
# Escalation Brief: [Blocker Title]

**Date:** [Date]
**From:** [TPM name]
**To:** [Escalation recipient — name/role]
**Program:** [Program name]
**Urgency:** 🔴 Immediate (today) / 🟡 Urgent (48 hours) / 🟢 This week

---

## Context

[2–4 sentences: What is going on — factual, neutral, no blame. State the situation so the recipient understands it without background.]

> Example: "The Backend team's API v2 is currently 2 weeks behind the contracted delivery date of March 10. The Platform team cannot begin integration testing until the contract is signed off. We've had three syncs with the Backend tech lead and are waiting on their engineering manager to confirm capacity."

---

## Impact

[Why this matters now — quantify wherever possible: dates, sprint slips, downstream teams blocked.]

| Impact | Details |
|--------|---------|
| Schedule | Phase 2 slips to [date] unless resolved by [date] |
| Downstream | [Team X] and [Team Y] are blocked pending resolution |
| Risk | [What happens if this isn't resolved this week] |

---

## Ask

> **One clear request:** [What you need from the recipient, by when]

Example: "We need [Eng Manager Backend] to confirm the API contract by March 20, or approve moving Phase 2 to April 15."

---

## Recommended Path

**Option A: [Title]**
- What: [Brief description]
- Pros: [...]
- Cons: [...]

**Option B: [Title]**
- What: [Brief description]
- Pros: [...]
- Cons: [...]

**Recommendation:** Option [A/B] — [One sentence reason]

---

## What Happens Next

If resolved by [date]: [Outcome — Phase 2 stays on track]
If not resolved by [date]: [Consequence — escalate to [next level] per escalation path]
```

---

## Key Concepts

- **Context:** Facts only — who, what, when. No blame, no emotion.
- **Impact:** Always quantify — "one sprint slip" beats "significant delay"
- **Ask:** One clear request per escalation. Multiple asks cause inaction.
- **Recommended path:** Give options so the recipient makes a decision, not an investigation.
- **Tone:** Professional, brief, assumes the recipient is busy and acting in good faith.

---

## Anti-Patterns

- **Multiple asks** — one escalation, one ask. Split if you need more than one.
- **No recommendation** — forcing the recipient to invent options slows resolution
- **Blame language** — "Team X failed to deliver" undermines your credibility and their cooperation
- **Long backstory** — 2–4 sentences of context max; attach doc if they need more
- **No deadline** — always specify when a response is needed and what happens if it doesn't come

---

## Composes With

- `/tpm-extract-blockers` — identify which blockers need escalation
- `/tpm-program-health` — use health score to justify urgency
- `/tpm-stakeholder-update` — reference escalation in stakeholder comms
- `/tpm-steerco-prep` — surface in SteerCo if executive action is needed

---

## Design Principles Applied
- Delivery First: Escalation focused on unblocking delivery, not documenting fault
- Risk Visibility: Impact quantified in terms of dates and downstream teams
- Cross-Team Alignment: Escalation path from domain-context.md applied
