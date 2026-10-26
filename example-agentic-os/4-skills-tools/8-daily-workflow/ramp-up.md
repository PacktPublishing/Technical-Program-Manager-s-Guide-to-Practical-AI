---
name: ramp-up
description: Use when starting work on a new problem space, program area, or technical domain and you need to build context fast. Trigger phrases include: "ramp me up on", "I'm new to", "help me get up to speed on", "what do I need to know about", "build me a ramp-up guide for". Uses all available MCPs (Slack, GitHub, Google Docs, Jira) to produce a structured guide: context, key people, open questions, recommended reads, and a suggested first 2-week action plan.
---
# /ramp-up — Ramp-Up Guide

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Generate a structured ramp-up guide for a new problem space — context, key people, open questions, recommended reads, and a first 2-week action plan — by mining all available sources so you don't have to

---

## Overview

Starting a new program area or domain without structured onboarding means 2–4 weeks of expensive context-building through ad-hoc conversations and accidental discovery. This skill compresses that by mining Slack history, GitHub, Google Docs, and Jira for signals about the domain, synthesizing them into a guide, and pairing it with a suggested first 2-week action plan. The guide is a starting point — not a finished map — and is intentionally structured to feed into `/project-plan` as source material. Key people, open questions, and knowledge gaps are made explicit so the first conversations are precise.

## When to Use

- Starting on a new program, initiative, or technical domain
- Picking up a program from another TPM mid-flight
- Preparing to support an adjacent team for the first time
- Before your first meeting with a new team whose work you'll coordinate

**When NOT to use:**
- For a specific meeting prep — use `/intro-prep` or `/zoom-meeting-assets`
- For deep technical architecture review — use `/tpm-architecture-review`
- For a pre-existing program you've been running — use `/tpm-program-health` for current state

---

## Interaction Flow

```
Phase 1: Intake           →    Phase 2: Mine sources    →    Phase 3: Synthesize
     │                               │                              │
     ▼                               ▼                              ▼
Domain / program name          Slack: last 60 days          Context summary
Key contacts (optional)        GitHub: recent activity       Key people + roles
Starting questions             Jira: open tickets            Open questions
                               Google Docs: shared docs      Knowledge gaps
                               Program masters               Recommended reads
                                                             First 2 weeks plan
```

### Phase 1 — Intake

Required:
- Domain, program name, or problem space (e.g., "ML inference pipeline", "Project Horizon", "payments compliance")

Optional but improves output:
- Names of 2–3 key contacts already identified
- Specific questions you're trying to answer
- Any docs or links you've already been pointed to

### Phase 2 — Mine Sources

Read from all available sources (use MCPs where accessible; fall back to loaded context):

| Source | What to extract |
|--------|----------------|
| Slack (last 60 days) | Key discussions, decisions, recurring pain points, active participants |
| GitHub (recent) | Active repos, recent PRs and issues, technical direction signals |
| Jira | Open epics and tickets, blockers, milestone status |
| Google Docs | Shared docs, design docs, meeting notes related to the domain |
| Program master docs | Phase, milestones, stakeholders, known risks |
| `domain-context.md` | Tool landscape, escalation paths, org standards |

Flag any source that could not be accessed.

### Phase 3 — Synthesize

Generate the full ramp-up guide. Be explicit about knowledge gaps — what the sources suggest vs. what needs to be validated in conversation.

---

## Output Format

```markdown
# Ramp-Up Guide: [Domain / Program]

**Generated:** [Date] | **Source coverage:** [List of sources successfully mined]
**Confidence:** [High / Medium / Low] — [One line: what's well-sourced vs. what's inferred]

---

## Context Summary

[3–5 paragraph overview: what this domain is, why it matters to NovaGrid, current state, and the main challenges or open problems. Written for someone starting from zero.]

---

## Key People

| Name | Role | Why they matter | Best way to reach |
|------|------|----------------|-----------------|
| [Name] | [Title / team] | [Decision-maker / domain expert / blocker owner] | [Slack / email / 1:1 cadence] |

---

## Open Questions

[Questions that the source mining surfaced but could not answer — these should drive your first conversations]

1. [Question — with source evidence that raised it]
2. [Question]
3. [...]

---

## Knowledge Gaps

[What is explicitly NOT known from available sources — not inferred, genuinely missing]

- [Gap 1: what's unknown and why it matters]
- [Gap 2: ...]

---

## Recommended Reads

| Resource | Source | Why it matters for ramp-up |
|----------|--------|--------------------------|
| [Doc / article name] | [Slack link / Drive link / URL] | [One line] |

---

## First 2 Weeks: Suggested Action Plan

**Week 1 — Orient**
- [ ] Meet [Name] — [why: decision authority / domain context]
- [ ] Read [Doc] — [why: foundational to everything else]
- [ ] Answer open question [#X] before next cross-team sync

**Week 2 — Engage**
- [ ] [First substantive contribution or milestone]
- [ ] [First dependency to clarify or unblock]
- [ ] [First program state update to make]

---

*This guide is a starting point. Use `/project-plan` to turn it into a draft project plan. Update it after your first week of conversations.*
```

---

## Behavioral Notes

- "Confidence" in the header is mandatory — never present a ramp-up guide as authoritative when sources are thin
- Open questions must reference source evidence (e.g., "Slack thread from 2026-03-12 suggested X but no resolution was found")
- Recommended reads should be specific docs, not categories — "the Confluence page on ML pipeline latency" not "documentation"
- First 2 weeks plan must be actionable and named — "understand the domain" is not a task

---

## Verification

- [ ] All available sources attempted (inaccessible sources flagged)
- [ ] Confidence level stated with rationale
- [ ] Open questions sourced from evidence (not invented)
- [ ] Knowledge gaps distinguished from open questions
- [ ] First 2-week plan has named owners and completion signals

---

## Design Principles Applied

- **Delivery First:** Week-1 action plan included — ramp-up is a starting point for execution, not a reading assignment
- **Risk Visibility:** Knowledge gaps explicit — you know what you don't know before the first meeting
- **Cross-Team Alignment:** Key people identified with "why they matter" — first conversations are targeted, not generic
- **Context Aware:** Mines all available MCPs + loaded program context before synthesizing
