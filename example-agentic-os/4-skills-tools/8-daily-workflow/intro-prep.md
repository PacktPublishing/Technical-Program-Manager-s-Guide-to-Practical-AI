---
name: intro-prep
description: Use before a first meeting with a new collaborator, stakeholder, or partner to build a structured intro package. Trigger phrases include: "prep for intro meeting with", "first meeting with", "intro prep for", "who is [name] and how should I approach them", "meeting [name] for the first time". Returns role/scope, shared program touchpoints, open dependencies, suggested opening questions, and tone calibration — ready to scan in 2 minutes before joining.
---
# /intro-prep — Intro Meeting Preparation

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Build a structured prep package for a first meeting with a new collaborator — their role, shared programs, open dependencies, suggested questions, and tone calibration — so the first impression is informed, not generic

---

## Overview

First meetings set the working relationship for months. Walking in without context signals either that you didn't prepare or that the relationship isn't a priority — neither is the impression you want. This skill takes a person's name (and optionally their role or the meeting purpose) and returns a prep card: what they own, where your programs intersect, what you need from them or they might need from you, and how to calibrate the conversation. Reads from `novagrid-org.csv`, program master docs, and the dependency matrix.

## When to Use

- Before any first meeting with a new collaborator, EM, PM, or stakeholder
- Before a skip-level or exec intro where context matters more than agenda
- When someone is joining a program you're managing and you need to calibrate the relationship

**When NOT to use:**
- For recurring syncs with someone you already know — use `/zoom-meeting-assets`
- For SteerCo or formal executive reviews — use `/tpm-steerco-prep`
- For interview prep — use `/tpm-interview-feedback`

---

## Interaction Flow

```
Name + [optional: role, meeting purpose, program context]
       |
       v
Resolve: role, team, reporting line, known programs
       |
       v
Cross-reference: shared programs, open dependencies, blockers they own
       |
       v
Calibrate: tone, what they likely care about, what you need from them
       |
       v
Return prep card
```

**Step 1 — Intake**

Provide:
- Person's name (required)
- Role or title (optional — will be looked up from `novagrid-org.csv`)
- Meeting purpose or context (optional but improves calibration)
- Any known shared programs (optional — will be inferred if not provided)

**Step 2 — Resolve**

From `1-inputs-triggers/org/novagrid-org.csv`:
- Title, team, and reporting line
- Manager and skip-level (useful for escalation calibration)

From `3-memory-knowledge/layer3-programs/`:
- Which programs they appear in as owner, stakeholder, or dependency node

From `3-memory-knowledge/layer2-portfolio/dependency-matrix.md`:
- Any dependencies flowing between their team and yours

**Step 3 — Calibrate Tone**

Infer conversation calibration from role type:

| Role type | Calibration |
|-----------|-------------|
| Engineering Lead | Lead with technical blockers and dependency clarity; avoid status theater |
| Product Manager | Lead with scope, priority, and customer impact; connect your program to their roadmap |
| Executive / VP | Lead with impact and risk; skip operational detail unless asked |
| Peer TPM | Lead with mutual dependencies and shared pain points; offer reciprocity |
| External partner | Lead with clear ask and timeline; establish communication norms early |

---

## Output Format

```markdown
# Intro Prep: [Name]

**Role:** [Title] | **Team:** [Team] | **Reports to:** [Manager]
**Meeting purpose:** [As provided, or inferred]

---

## What They Own

[2–4 bullets on their scope, current initiatives, and decision authority — from org data and program masters]

---

## Where You Intersect

| Program | Their involvement | Your involvement | Open dependency |
|---------|-----------------|-----------------|----------------|
| [Program] | [Owner / stakeholder / dependency] | [Your role] | [Yes — [what] / No] |

---

## What You Need From Them (or They From You)

- **You need:** [Specific ask, if any — decision, resource, dependency resolution]
- **They likely need:** [What they probably want from this relationship — inferred from their role and your programs]

---

## Suggested Opening Questions

1. [Question that establishes shared context — not generic small talk]
2. [Question that surfaces their current priorities relative to your programs]
3. [Question that opens the door to the dependency or ask, without leading with it]

---

## Tone Calibration

**Approach:** [2–3 sentences on how to frame the conversation — what to lead with, what to avoid in a first meeting, and what to listen for]

**Watch for:** [Signal that would change your approach mid-meeting — e.g., "If they mention X, it means Y"]
```

---

## Behavioral Notes

- If the person is not found in `novagrid-org.csv`, note it and proceed with whatever context is provided — do not refuse to generate a prep card
- "What you need from them" should be specific — if you genuinely have no current ask, say so rather than inventing one
- Suggested questions should be conversation-openers, not interrogation — avoid questions that can be answered with "yes" or "no"
- Tone calibration should reference their role type, not personal speculation

---

## Verification

- [ ] Role and reporting line resolved from org data (or flagged as not found)
- [ ] At least one shared program identified (or "no shared programs currently" explicitly stated)
- [ ] Dependency matrix checked
- [ ] Exactly 3 opening questions — none generic
- [ ] Tone calibration present and role-specific

---

## Design Principles Applied

- **Delivery First:** Prep card scannable in 2 minutes — structured for the moment before joining, not a reference document
- **Cross-Team Alignment:** Dependencies and shared programs surfaced explicitly — relationship starts with clarity on what connects you
- **Context Aware:** Tone calibrated to role type from loaded org context
