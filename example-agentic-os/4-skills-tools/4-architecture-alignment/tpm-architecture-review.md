---
name: tpm-architecture-review
description: "Use when you need to synthesize Design Reviews and RFCs into a coherent architecture narrative a TPM can own and communicate."
---
# /tpm-architecture-review — Architecture Synthesizer

**Lifecycle Stage:** Architecture & Technical Alignment
**Job-to-be-Done:** Synthesize Design Reviews and RFCs into a coherent architecture narrative a TPM can own and communicate

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

A TPM doesn't need to author architecture — but must be able to represent it, challenge it, and communicate it. This skill bridges engineering depth and program communication.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name
2. RFC(s) or Design Review document(s) — paste key sections or summaries
3. Open architecture questions / unresolved decisions
4. Audience for the synthesis (engineering team / VP / cross-team / exec)
5. Any known concerns from architects or engineers

**Step 2 — Generate**

---

## Output Format

```markdown
# Architecture Synthesis: [Program Name]

**Version:** 1.0
**Source documents:** [RFC-XXX, Design Review YYY]
**Audience:** [Engineering / Leadership / Cross-team]

---

## Architecture Summary (Plain Language)

[3–5 sentences: what the system does, how it works, what's new or changed]

---

## Key Design Decisions

| Decision | Options Considered | Choice Made | Rationale | Decision Maker |
|---------|-------------------|-------------|-----------|---------------|
| | | | | |

---

## System Interaction Diagram (ASCII)

```
[Client] → [API Gateway] → [Service A]
                               ↓
                          [Service B] ← [Data Store]
                               ↓
                          [Event Bus] → [Service C]
```

---

## Open Architecture Questions

| Question | Owner | Priority | Decision Needed By |
|---------|-------|---------|-------------------|
| | | 🔴🟡🟢 | |

---

## Technical Risks

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|------------|-------|
| | | | | |

---

## Program Implications

**Timeline impact:** [Does this architecture add complexity to the schedule?]
**Dependency impact:** [Does this architecture create new cross-team dependencies?]
**Operational impact:** [New runbooks, on-call changes, monitoring requirements]

---

## TPM Talking Points

*Use these when presenting to non-technical stakeholders:*
- [Talking point 1]
- [Talking point 2]
- [Talking point 3]
```

---

## Design Principles Applied
- Delivery First: Translates architecture into program implications
- Risk Visibility: Technical risks surfaced and tied to owners
- Cross-Team Alignment: Dependency implications called out explicitly
