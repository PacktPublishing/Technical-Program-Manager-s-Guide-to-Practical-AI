# tpm-workflow-daily-ops — Daily Operations Workflow

**Lifecycle Stage:** Daily Workflow
**Job-to-be-Done:** Run the full daily operations loop — from unattended morning prep through interactive briefing and ad-hoc task execution — to triage the day, push curated attention to collaborators, and maintain portfolio state without manual overhead

---

## Overview

The daily ops workflow is the operating layer that sits above the TPM program lifecycle skills. It scales in two directions simultaneously:

- **Inbound (scaling me):** Morning orchestrators eliminate manual triage. The day is triaged before the TPM starts.
- **Outbound (scaling beyond me):** Personalized digests and OKR reminders push curated attention to collaborators with exactly the items that require their action — no firehose, no noise.

The workflow has three phases: unattended preparation (automated), interactive review (morning session), and ad-hoc execution (throughout the day). Monthly and weekly triggers are built into the morning routine and checked automatically.

---

## Phases

### Phase 1 — Unattended Morning Prep
*Recommended: 6:00–7:00 AM, automated*

**Skill:** `/start-day-prep`

Launches 6 parallel subagents, aggregates outputs, delivers one Slack DM to self.

```
start-day-prep
   ├── /tpm-brief          → Portfolio brief: one DM per active program
   ├── /reading-recommendations → 2–3 reads matched to today's programs
   ├── /zoom-meeting-assets → Asset card per Zoom meeting
   ├── /mine-meeting-ais   → Structured output from overnight transcripts
   ├── /refresh-org-data   → Org CSV rebuild (last Monday of month only)
   └── /focus-tasks        → 3 highest-leverage tasks for today
          │
          ▼
   Aggregated Slack DM → self
   State written to: 1-inputs-triggers/start-day-state.md
```

**Output:** One Slack DM containing the full day brief. State file written for Phase 2.

---

### Phase 2 — Interactive Morning Review
*Recommended: First 10 minutes of the workday*

**Skill:** `/start-day`

Reads pre-baked state from Phase 1. Walks the briefing interactively. Checks scheduled tasks. Closes with confirmed focus list.

```
start-day
   │
   ├── Step 1: Portfolio briefing (from tpm-brief output)
   │          🔴 programs first → confirm any immediate actions
   │
   ├── Step 2: Scheduled tasks check
   │          ├── OKR reminder cycle      → /okr-reminder (weekly, Monday default)
   │          ├── Org weekly digest       → /org-weekly-digest (weekly, Tuesday default)
   │          └── Expense reminder        → prompt only (last Friday of month)
   │
   ├── Step 3: Meeting prep (from zoom-meeting-assets)
   │          🔴 Required prep items → act now or add to focus list
   │
   ├── Step 4: Reading recommendations
   │          (informational — no action required)
   │
   └── Step 5: Confirm focus list (from focus-tasks)
              3 tasks confirmed → session closes
```

**Output:** Confirmed focus list. Scheduled tasks run or deferred. Day begins with deliberate priority stack.

---

### Phase 3 — Ad-Hoc Execution
*Throughout the workday — direct invocation*

Skills invoked on-demand as the day unfolds:

**Deep work (high cognitive load — schedule blocks):**

| Skill | When to invoke |
|-------|---------------|
| `/intro-prep` | Before first meeting with a new collaborator |
| `/ramp-up` | Starting a new program area or domain |
| `/project-plan` | After ramp-up, ready to bootstrap a draft plan |
| `/write-doc` | Any long-form document that needs quality gating |
| `/podcast` | Commute or low-attention window — curated listening |

**Quick utilities (low cognitive load — invoke anytime):**

| Skill | When to invoke |
|-------|---------------|
| `/add-task` | Task surfaces mid-conversation — capture without context switching |
| `/save-to-read` | Encounter an article worth reading later |
| `/jira-lookup-table` | Need ticket status without opening Jira |
| `/chrome` | Need search queries or doc links for a topic |
| `/tpm-interview-feedback` | After a TPM candidate interview |

**Mid-day re-triage (when priorities shift):**

```
/focus-tasks → re-run with updated context
```

---

## Monthly and Weekly Triggers

These are checked automatically during Step 2 of `/start-day`:

| Task | Cadence | Skill | Trigger logic |
|------|---------|-------|--------------|
| OKR reminder cycle | Weekly | `/okr-reminder` | Day of week check (Monday default) |
| Org weekly digest | Weekly | `/org-weekly-digest` | Day of week check (Tuesday default) |
| Org data refresh | Monthly | `/refresh-org-data` | Last Monday of month check |
| Expense reminder | Monthly | Prompt only | Last Friday of month check |

Spacing rules for OKR reminder cycle: 7 days from **actual send date**, not calendar date. Cycle log maintained in `1-inputs-triggers/okr-cycle-log.md`.

---

## State Files

The daily ops workflow writes and reads two state files:

| File | Written by | Read by | Contents |
|------|-----------|---------|----------|
| `1-inputs-triggers/start-day-state.md` | `/start-day-prep` | `/start-day` | Aggregated morning brief + metadata |
| `1-inputs-triggers/okr-cycle-log.md` | `/okr-reminder` | `/okr-reminder` | Last send date per owner per step |
| `1-inputs-triggers/reading-backlog.md` | `/save-to-read` | `/reading-recommendations`, `/podcast` | Reading queue with priority + program tags |
| `1-inputs-triggers/active-tasks.md` | `/add-task`, `/start-day` | `/focus-tasks` | Open tasks with program, priority, owner |
| `1-inputs-triggers/org/novagrid-org.csv` | `/refresh-org-data` | `/okr-reminder`, `/org-weekly-digest`, `/intro-prep` | Current org structure |
| `4-skills-tools/8-daily-workflow/patterns.md` | `/tpm-brief` | `/tpm-brief` | Accumulated program patterns across runs |

---

## Intelligence Compounding

Five mechanisms make the daily ops workflow improve over time without prompt changes:

1. **patterns.md** — `tpm-brief` observes recurring signals per program and writes them to `patterns.md`. Each run reads the file first — the brief gets smarter across runs.

2. **Auto-memory** — Claude maintains cross-session memory of preferences, naming conventions, and corrections. A correction made once applies in all future sessions.

3. **OKR cycle log** — `okr-reminder` spaces escalation tiers from actual send dates, not assumed dates. Missed weeks don't corrupt the escalation sequence.

4. **Reading backlog** — Items accumulate via `save-to-read`. `reading-recommendations` and `podcast` draw from the backlog — the longer it's curated, the more relevant the recommendations.

5. **Org CSV freshness** — `refresh-org-data` keeps escalation routing current. OKR reminders, EM digests, and intro prep all depend on an accurate org CSV.

---

## Composes With

- All Stage 5 (Execution & Delivery) skills: daily briefing feeds into `tpm-steerco-prep`, `tpm-extract-blockers`, `tpm-escalation-brief`
- `/tpm-program-health` — weekly health check runs independently; daily ops covers the day-to-day
- `/tpm-dependency-map` — run after `/project-plan` to formalize cross-team dependencies
- `/tpm-risk-identifier` — run after `/project-plan` or when `tpm-brief` surfaces a new risk

---

## Design Principles Applied

- **Delivery First:** Both phases complete in ≤ 15 minutes combined — the remainder of the day is execution
- **Risk Visibility:** 🔴 programs and required prep actions surface first in every phase
- **Cross-Team Alignment:** Outbound skills (okr-reminder, org-weekly-digest) are scheduled and checked automatically — they don't require the TPM to remember to run them
- **Context Aware:** Phase 2 reads Phase 1's pre-baked state — no redundant context loading; state compounds via files across runs
