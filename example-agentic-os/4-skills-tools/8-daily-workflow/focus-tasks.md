---
name: focus-tasks
description: Use to identify the 3 highest-leverage tasks to focus on today. Invoked automatically by both start-day-prep and start-day as the final step of the morning routine. Can also be called directly mid-day when priorities shift. Trigger phrases include: "what should I focus on today", "top 3 tasks", "prioritize my day", "what's most important today", "focus list". Returns exactly 3 tasks — no more — ranked by unblocking potential, deadline, and cross-team impact.
---
# /focus-tasks — Daily Focus List

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Propose exactly 3 high-leverage tasks for today — ranked by impact, not recency — so the day starts with a deliberate priority stack rather than inbox order

---

## Overview

The failure mode of a busy TPM day is reactive execution: handling whatever arrives first, not whatever matters most. This skill reads the current portfolio state, open blockers, calendar obligations, and the active task list, then proposes exactly 3 tasks that — if completed today — most improve program health or unblock downstream work. The 3-task limit is enforced: if everything is urgent, nothing is. Fed from `start-day-prep` state when available; falls back to reading `this-week.md` and program masters directly.

## When to Use

- Automatically, as the final step inside `start-day-prep` and `start-day`
- Directly, mid-day when priorities shift after a blocker surfaces or a meeting changes the landscape
- On Mondays, to set the week's opening focus before the first meeting

**When NOT to use:**
- To get a full task list — use the active tracker directly (`1-inputs-triggers/active-tasks.md`)
- To triage a program's full backlog — use `/tpm-program-health`
- To generate a weekly plan — use the weekly state in `this-week.md`

---

## Interaction Flow

```
Load portfolio state (start-day-prep output or program masters + this-week.md)
       |
       v
Load active-tasks.md + any open escalations
       |
       v
Score all candidate tasks by: unblocking potential > deadline proximity > cross-team impact
       |
       v
Return exactly 3 tasks, ordered by score
       |
       v
If mid-day re-run: compare to morning list, note what changed
```

**Step 1 — Load**

Priority order for state source:
1. `start-day-prep` output (if this is called as part of the morning routine)
2. `3-memory-knowledge/layer4-weekly/this-week.md` + open escalations
3. `3-memory-knowledge/layer2-portfolio/program-index.md` (RAG status)
4. `1-inputs-triggers/active-tasks.md` (pending tasks)

**Step 2 — Score Candidate Tasks**

Rank all candidate tasks (from active-tasks.md + inferred from program state) using this priority order:

| Factor | Rank | Rule |
|--------|------|------|
| Unblocking potential | 1st | Task unblocks another team or removes a dependency holding up a milestone |
| Deadline proximity | 2nd | Task has a due date within 48 hours or is gating a same-day decision |
| Cross-team impact | 3rd | Task, if done today, aligns or advances work across two or more teams |
| Program RAG | Tiebreaker | Prefer tasks for 🔴 programs over 🟡, 🟡 over 🟢 |

**Step 3 — Return Exactly 3**

Return exactly 3 tasks. If there are fewer than 3 genuine high-leverage tasks, fill the third slot with the best available — do not pad with low-value tasks. If there are more than 3, cut ruthlessly — the 4th item goes to tomorrow or the active backlog.

---

## Output Format

```markdown
## Today's Focus — [Day, Date]

> These 3 tasks, if done today, move the most.

**1.** [Task description — specific, not vague]
   *Program:* [Name] · *Why today:* [One line: what this unblocks or what deadline it serves]
   *Owner:* [Me / [Name if delegating]] · *Done when:* [Concrete completion signal]

**2.** [Task description]
   *Program:* [Name] · *Why today:* [One line]
   *Owner:* [Me / [Name]] · *Done when:* [Concrete completion signal]

**3.** [Task description]
   *Program:* [Name] · *Why today:* [One line]
   *Owner:* [Me / [Name]] · *Done when:* [Concrete completion signal]

---

*Anything not in this list waits. Add new tasks via /add-task.*
```

**Mid-day re-run format** (when called after the morning):

```markdown
## Reprioritized Focus — [Time, Date]

**Changed since this morning:** [What shifted — new blocker, meeting outcome, escalation]

**Carried over from morning:**
- [Task 1 if still relevant]

**Replacing:**
- [New task that displaced a morning task] — *reason: [what changed]*

**Dropped:**
- [Task that no longer applies] — *reason: [resolved / deprioritized]*

[Same 3-task format as above]
```

---

## Behavioral Notes

- 3 tasks is a hard limit — not a guideline. If the user pushes for a 4th, explain why the limit exists and offer to add it to `active-tasks.md` instead
- "Done when" must be concrete: a sent email, a merged PR, a confirmed decision — not "followed up on"
- If all 3 tasks are for the same program, flag it: "All 3 tasks are for [Program] — is this intentional? Other programs may be underprioritized."
- The "why today" line must reference a real constraint (deadline, blocker, decision) — not just "this is important"

---

## Verification

- [ ] Exactly 3 tasks returned — not 2, not 4
- [ ] Each task has a "why today" tied to a real constraint
- [ ] Each task has a "done when" completion signal
- [ ] Tasks ranked by: unblocking > deadline > cross-team impact
- [ ] 🔴 program tasks appear before 🟢 when scores are tied

---

## Design Principles Applied

- **Delivery First:** 3 specific tasks — day starts with deliberate execution, not inbox triage
- **Risk Visibility:** Unblocking potential ranked first — the tasks that free other people move to the top
- **Cross-Team Alignment:** Cross-team impact as an explicit ranking factor — coordination is a first-class task type
