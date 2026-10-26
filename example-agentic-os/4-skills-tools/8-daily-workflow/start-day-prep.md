---
name: start-day-prep
description: Unattended morning orchestrator that runs before the workday begins. Launches 6 parallel subagents, aggregates their outputs, and delivers a single Slack DM to the TPM. Trigger phrases include: "run start-day-prep", "morning prep", "run the morning routine unattended", "prep my day". Designed to run without interaction — the TPM opens the DM and the day is already triaged.
---
# /start-day-prep — Unattended Morning Orchestrator

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Run 6 parallel subagents before the workday begins, aggregate their outputs, and deliver one Slack DM so the day is already triaged when the TPM starts

---

## Overview

The most expensive thing a TPM does in the morning is manually triage: scanning Slack, checking Jira, remembering what slipped yesterday, finding which meetings need prep, and deciding where to focus. `start-day-prep` automates that triage completely. It runs 6 subagents in parallel — each reading from a different source — aggregates the results into a single Slack DM, and exits. No interaction required. By the time the TPM starts, the day's state is already summarized, prioritized, and in the DM. The interactive `start-day` skill then reads this pre-baked state to present the briefing and propose the focus list.

## When to Use

- Scheduled to run automatically each weekday morning (recommended: 6:00–7:00 AM)
- Manually, if the scheduled run was missed or if you want a mid-day re-triage
- As a sub-invocation from an automation or cron job

**When NOT to use:**
- For an interactive morning review — use `/start-day` (reads the output of this skill)
- When you want to run a single subagent on-demand — invoke the subagent directly

---

## Orchestration Workflow

```
start-day-prep launches 6 subagents IN PARALLEL
       │
       ├── /tpm-brief          (Sonnet)  → Portfolio brief: one DM per active program
       ├── /reading-recommendations  (Haiku)  → 2–3 reads from backlog matched to today
       ├── /zoom-meeting-assets      (Haiku)  → Asset card per Zoom meeting today
       ├── /mine-meeting-ais         (Sonnet) → Process overnight Zoom transcripts
       ├── /refresh-org-data         (Haiku)  → Rebuild org CSV (last Monday of month only)
       └── /focus-tasks              (Sonnet) → Propose 3 highest-leverage tasks
       │
       ▼
Aggregate all outputs into one structured Slack DM
       │
       ▼
Send DM to self (TPM)
       │
       ▼
Write aggregated state to: 1-inputs-triggers/start-day-state.md
(start-day reads this file to avoid re-running subagents)
```

### Subagent Execution

Launch all 6 subagents simultaneously. Each subagent reads its own context sources and returns its output independently. Do not wait for one before starting the next.

**Subagent inputs** (pre-loaded from context, no user interaction required):
- Today's date and day of week
- `3-memory-knowledge/layer2-portfolio/program-index.md` — active programs and RAG status
- `3-memory-knowledge/layer4-weekly/this-week.md` — current week's state and escalations
- `1-inputs-triggers/reading-backlog.md` — reading backlog
- `1-inputs-triggers/org/novagrid-org.csv` — org structure
- `1-inputs-triggers/jira/novagrid-jira-export.json` — Jira export
- `4-skills-tools/8-daily-workflow/patterns.md` — accumulated patterns (for tpm-brief)
- Calendar context — Zoom meetings for today (from MCP or last known state)
- Overnight Zoom transcripts — if available from MCP

**Subagent that runs conditionally:**
- `refresh-org-data` — runs full logic only on the last Monday of the month; exits silently on all other days

### Aggregation

After all 6 subagents complete, aggregate into one DM structure. Order:
1. Portfolio brief (from tpm-brief) — highest signal, read first
2. Focus tasks (from focus-tasks) — next immediate action
3. Meeting assets (from zoom-meeting-assets) — time-ordered by meeting start
4. Reading recommendations (from reading-recommendations) — consume during breaks
5. Meeting AI outputs (from mine-meeting-ais) — if transcripts were processed
6. Org refresh status (from refresh-org-data) — one line, or omitted if not a refresh day

---

## Output Format

The aggregated Slack DM:

```markdown
# Morning Brief — [Day, Date]

---

## Portfolio Status

[tpm-brief output: one brief per program, ordered 🔴 → 🟡 → 🟢]

---

## Today's Focus

[focus-tasks output: 3 tasks with "why today" rationale]

---

## Meeting Prep

[zoom-meeting-assets output: asset card per meeting, ordered by start time]

---

## Reading

[reading-recommendations output: 2–3 reads with "why now" rationale]

---

## Meeting AI Outputs

[mine-meeting-ais output: structured action items, decisions, open questions from overnight transcripts]
[Omit this section if no transcripts were processed]

---

## Org Refresh

[refresh-org-data output: one-line status ("Not scheduled today — next run [date]" or diff + confirmation prompt)]
[Omit this section on non-refresh days]

---

*Generated by start-day-prep at [time]. Run /start-day to review interactively.*
```

**State file** (`1-inputs-triggers/start-day-state.md`):

Write the full aggregated output plus metadata:
```markdown
---
generated: [ISO timestamp]
programs_checked: [N]
subagents_run: [list]
---
[Full DM content]
```

---

## Behavioral Notes

- All 6 subagents run in parallel — do not run them sequentially
- If a subagent fails or returns an error, include a one-line error note in the relevant DM section and continue aggregating; do not abort the full run
- The state file is written regardless of whether the DM send succeeds — it's the input for `/start-day`
- If no calendar data is available, `zoom-meeting-assets` returns "Calendar not accessible — meeting prep skipped"
- If no overnight transcripts are available, `mine-meeting-ais` section is omitted from the DM

---

## Verification

- [ ] All 6 subagents invoked (refresh-org-data exits silently on non-scheduled days — this is correct behavior)
- [ ] Subagents run in parallel, not sequentially
- [ ] DM sections ordered: portfolio → focus → meetings → reading → meeting AIs → org
- [ ] `1-inputs-triggers/start-day-state.md` written after aggregation
- [ ] Subagent errors included as one-line notes, not silent failures

---

## Design Principles Applied

- **Delivery First:** Day triaged before the TPM starts — no morning triage cost
- **Risk Visibility:** 🔴 programs lead the DM — critical issues visible in the first scroll
- **Cross-Team Alignment:** Meeting assets and portfolio brief together surface what cross-team coordination is needed today
- **Context Aware:** Each subagent reads its own context sources — aggregation is additive, not redundant
