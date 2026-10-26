---
name: start-day
description: Interactive morning orchestrator that reads start-day-prep's pre-baked state and walks the TPM through the day's briefing, scheduled tasks, and focus list. Trigger phrases include: "start my day", "morning briefing", "what's on for today", "run start-day", "walk me through today". If start-day-prep hasn't run, generates the briefing from loaded context directly. Ends with the 3-item focus list from /focus-tasks.
---
# /start-day — Interactive Morning Orchestrator

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Walk the TPM through today's portfolio briefing, scheduled tasks, and focus list in an interactive session — reading pre-baked state from start-day-prep when available

---

## Overview

`start-day-prep` triages the day unattended. `start-day` is where you actually review it. This skill reads the state file written by `start-day-prep`, presents the briefing in a structured interactive session, walks any scheduled tasks for today (OKR reminder cycle, weekly org digest, expense reminder, monthly triggers), asks whether to run them, and closes with the 3-item focus list. If `start-day-prep` hasn't run, `start-day` generates the briefing directly from loaded context. The session takes 5–10 minutes and leaves the TPM with a clear picture of the day and three tasks to execute.

## When to Use

- Every weekday morning as the primary interactive briefing
- After `start-day-prep` has run (reads pre-baked state) or independently (generates from context)
- When you want to review the morning brief interactively rather than reading the DM directly

**When NOT to use:**
- For an unattended run — use `/start-day-prep`
- For a mid-day re-triage — call `/focus-tasks` directly
- For a weekly portfolio review with metrics — use `/tpm-program-health`

---

## Interaction Flow

```
Check: does 1-inputs-triggers/start-day-state.md exist and is it from today?
       │
      YES → Load pre-baked state
      NO  → Generate briefing from program masters + this-week.md
       │
       ▼
Step 1: Present portfolio briefing (from tpm-brief output)
       │
       ▼
Step 2: Walk scheduled tasks for today
       │
       ▼
Step 3: Present meeting prep (from zoom-meeting-assets output)
       │
       ▼
Step 4: Present reading recommendations
       │
       ▼
Step 5: Propose focus list (from focus-tasks output or re-run if needed)
       │
       ▼
Session complete — TPM has triaged briefing and confirmed focus
```

### Step 1 — Portfolio Briefing

Present the portfolio brief from `tpm-brief` output (or generate it now if no pre-baked state). Walk programs in order: 🔴 → 🟡 → 🟢. For each, present the brief and ask:
- "Any action to take right now on [program]?" (yes → open the relevant skill / no → continue)

Keep this step to 2–3 minutes. The brief is already curated — this is review, not re-triage.

### Step 2 — Scheduled Tasks

Check whether any recurring tasks are due today and present them for confirmation:

| Task | Trigger | Skill |
|------|---------|-------|
| OKR reminder cycle | Weekly — configured day (default: Monday) | `/okr-reminder` |
| Org weekly digest | Weekly — configured day (default: Tuesday) | `/org-weekly-digest` |
| Org data refresh | Last Monday of month (auto-triggered via start-day-prep) | `/refresh-org-data` |
| Expense reminder | Configurable cadence (e.g., last Friday of month) | Prompt only — no skill |

For each due task: "This is scheduled for today — run it now? (yes / skip / later)"

If "later": note it in `1-inputs-triggers/active-tasks.md` for the day.

### Step 3 — Meeting Prep

Present meeting asset cards from `zoom-meeting-assets` output. For meetings with 🔴 Required prep:
- "You have a prep action for [Meeting] at [Time]. Do it now or add to focus list?"

### Step 4 — Reading

Surface the 2–3 reading recommendations with "why now" rationale. No action required — informational only.

### Step 5 — Focus List

Present the 3 focus tasks from `focus-tasks` output. Ask:
- "Are these the right 3 tasks for today, or should we reprioritize?" (yes → confirm / no → re-run focus-tasks with adjusted context)

On confirmation, the session closes.

---

## Output Format

The session is conversational — present each step as a structured block with a clear prompt:

```markdown
# Good morning — [Day, Date]

---

## Portfolio Briefing

[tpm-brief output for each program — one at a time, waiting for acknowledgment before next]

Any action to take right now on [program]?

---

## Scheduled Tasks Today

| Task | Due? | Action |
|------|------|--------|
| OKR reminder cycle | ✓ Today | Run now? |
| Org weekly digest | ✗ Not today | — |
| Expense reminder | ✓ Today | Reminder noted |

---

## Meeting Prep

[zoom-meeting-assets output — meeting cards ordered by start time]

[For 🔴 Required prep items:]
Do it now or add to focus list?

---

## Today's Reading

[reading-recommendations output]

---

## Today's Focus

[focus-tasks output — 3 tasks with "why today" and "done when"]

These the right 3 for today?
```

---

## Behavioral Notes

- State file freshness check: if `start-day-state.md` is from a prior day, use it for reference but re-generate the briefing from current program masters — yesterday's state is stale
- If `start-day-prep` didn't run (no state file), generate all sections directly — do not ask the user to run `start-day-prep` first; just proceed
- Scheduled task triggering: check the day of week and month calendar, not just the task list — don't rely on the user knowing what's due
- The session should take 5–10 minutes — if it's running longer, the briefing is too long or the interaction is too detailed; trim

---

## Verification

- [ ] State file freshness checked before loading pre-baked content
- [ ] Programs briefed in order: 🔴 → 🟡 → 🟢
- [ ] Scheduled tasks checked against today's calendar (not just a static list)
- [ ] Meeting prep cards presented in start-time order
- [ ] Focus list confirmed by TPM before session closes
- [ ] Session takes ≤ 10 minutes of interaction

---

## Design Principles Applied

- **Delivery First:** Pre-baked state means the briefing starts immediately — no warm-up retrieval cost
- **Risk Visibility:** 🔴 programs and 🔴 Required prep items surface first in every step
- **Cross-Team Alignment:** Scheduled tasks (OKR reminders, EM digest) reviewed every morning — outbound coordination doesn't get forgotten
- **Context Aware:** Scheduled tasks triggered by actual calendar date, not hardcoded day assumptions
