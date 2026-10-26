---
name: add-task
description: Use when you need to quickly capture a task without switching context. Trigger phrases include: "add a task", "remind me to", "log this", "capture this action", "I need to do X for program Y". Runs in under 10 seconds — describe the task in plain language and the skill infers program, priority, and owner.
---
# /add-task — Quick Task Capture

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Capture a task in one line, infer program and priority, and append it to the active tracker without breaking context

---

## Overview

The fastest way to lose a task is to think "I'll write that down later." This skill turns a plain-language description into a structured task entry — program tag, priority, owner, and due date — and appends it to the active tracker in one step. Confirmation before write prevents phantom tasks.

## When to Use

- Any time a task surfaces mid-meeting, mid-email, or mid-conversation
- When you want to capture a follow-up without opening Jira or a tracker
- After a blocker is surfaced and an action item is clear

**When NOT to use:**
- To capture a full epic or workstream — use `/tpm-epic-breakdown` for that
- To log a decision — use `/tpm-decision-record`
- To record a blocker with escalation tracking — use `/tpm-extract-blockers`

---

## Interaction Flow

```
Plain-language task description
       |
       v
Infer: program, priority, owner, due date
       |
       v
Show structured entry for confirmation
       |
      YES
       |
       v
Append to active tracker
```

**Step 1 — Intake**

Describe the task in plain language. Include as much or as little context as you have:
- "Follow up with Priya on the API contract for Project Nexus by Friday"
- "Review Shield's rollout plan before SteerCo Thursday"
- "Add OKR update reminder for Atlas Q2 milestone"

**Step 2 — Infer and Confirm**

Infer the following fields from the description and loaded context:

| Field | Inference Rule |
|-------|---------------|
| Program | Match keywords to `3-memory-knowledge/layer2-portfolio/program-index.md` |
| Priority | Default Medium; High if deadline ≤ 2 days or blocker keyword detected |
| Owner | Default to TPM (me); assign to named person if mentioned |
| Due | Extract explicit date or infer from relative ("by Friday", "before SteerCo") |
| Type | Action / Follow-up / Review / Decision-needed |

Show the structured entry and ask: **Add this task? (yes / edit / cancel)**

**Step 3 — Append**

On confirmation, append to `1-inputs-triggers/active-tasks.md` (create if not present).

---

## Output Format

```markdown
## Pending Confirmation

**Task:** [Plain-language description as entered]
**Program:** [Inferred program name]
**Priority:** 🔴 High / 🟡 Medium / 🟢 Low
**Owner:** [Name or "Me"]
**Due:** [Date or "No deadline"]
**Type:** Action / Follow-up / Review / Decision-needed

---

Add this task? **yes** / edit / cancel
```

After confirmation:

```markdown
✓ Task added to active tracker.

[Task] | [Program] | [Priority] | Due: [Date]
```

---

## Behavioral Notes

- If no program can be inferred, ask one question: "Which program is this for?" Do not ask for anything else.
- If priority is ambiguous, default to Medium — the TPM can adjust.
- Never silently write to the tracker without confirmation.
- If the task description already exists verbatim in the tracker, flag it as a duplicate before appending.

---

## Verification

- [ ] Task description preserved exactly as entered
- [ ] Program tag is one of the active programs from `program-index.md`
- [ ] Priority defaulted to Medium when not explicit
- [ ] Confirmation shown before write
- [ ] Appended to `1-inputs-triggers/active-tasks.md`

---

## Design Principles Applied

- **Delivery First:** Capture happens in one step — no tracker switching, no formatting overhead
- **Context Aware:** Program and priority inferred from loaded portfolio context
