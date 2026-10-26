---
name: refresh-org-data
description: Use to rebuild the org CSV from directory and Slack MCPs. Runs automatically as part of start-day-prep on the last Monday of each month. Can be invoked directly when the org structure has changed significantly (reorgs, new team leads, departures). Trigger phrases include: "refresh org data", "update org chart", "rebuild org CSV", "org data is stale".
---
# /refresh-org-data — Org Data Refresh

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Rebuild the org CSV with current manager-report relationships, Slack handles, and escalation paths — so all skills that auto-escalate or route DMs use accurate org state

---

## Overview

Several skills depend on org structure to route communications correctly: `org-weekly-digest` filters items per EM, `okr-reminder` computes escalation tiers (R3 adds manager, R4 adds skip-level), and `tpm-brief` uses team ownership to attribute blockers. When the org CSV is stale, these skills ping the wrong people. This skill rebuilds the CSV from the directory and Slack MCP sources and writes it to `1-inputs-triggers/org/novagrid-org.csv`. Runs automatically on the last Monday of each month; all other days it exits silently with a one-line status message.

## When to Use

- Automatically, as part of `start-day-prep` on the last Monday of the month
- When a significant reorg has occurred and you know the CSV is stale
- When an escalation was routed to the wrong person and org data is the suspected cause

**When NOT to use:**
- On any day that is not the last Monday of the month (unless manually triggered with explicit override)
- To update a single person's details — edit `novagrid-org.csv` directly for one-off corrections

---

## Interaction Flow

```
Check: is today the last Monday of the month?
       |
      NO → Exit silently: "Org refresh not scheduled today. Next run: [date]."
       |
      YES
       |
       v
Read current org CSV (detect baseline)
       |
       v
Pull updated data from directory / Slack MCP
       |
       v
Diff: new vs. current (additions, removals, changes)
       |
       v
Show diff for confirmation
       |
      YES
       |
       v
Write updated CSV to 1-inputs-triggers/org/novagrid-org.csv
```

**Step 1 — Date Check**

Compute whether today is the last Monday of the current month. If not, return:
> `Org refresh not scheduled today (today is [Day, Date]). Next scheduled run: [last Monday of next month].`

If running in manual override mode, skip the date check and proceed.

**Step 2 — Pull and Diff**

Read `1-inputs-triggers/org/novagrid-org.csv` as baseline. Pull updated data from available sources. Generate a diff showing:
- **Added:** new people or reporting relationships
- **Removed:** departures or reporting changes
- **Changed:** role, Slack handle, or manager updates

**Step 3 — Confirm and Write**

Show the diff. If changes are detected, ask for confirmation before overwriting. If no changes detected, report "No changes — org CSV is current."

---

## Output Format

When skipping (non-refresh day):
```
Org refresh not scheduled today (today is [Day, Date]).
Next scheduled run: [Date of last Monday next month].
```

When running:
```markdown
# Org Data Refresh — [Date]

**Baseline:** `1-inputs-triggers/org/novagrid-org.csv` (last updated: [date])
**Source:** [Directory MCP / Slack MCP]

---

## Diff Summary

**Added (N):**
- [Name] | [Title] | Reports to: [Manager] | Slack: @[handle]

**Removed (N):**
- [Name] — [reason if detectable, e.g., "no longer in directory"]

**Changed (N):**
- [Name]: [Field] changed from "[old]" to "[new]"

---

**No changes detected** (shown when diff is empty)

---

Write updated CSV to `1-inputs-triggers/org/novagrid-org.csv`? **yes** / cancel
```

After write:
```
✓ Org CSV updated. [N] additions, [N] removals, [N] changes.
Skills using org data will reflect the new structure on next run.
```

---

## Behavioral Notes

- "Last Monday of the month" is computed from today's date — not hardcoded
- If the last Monday falls on a holiday and the skill was skipped, the next invocation of `start-day-prep` on any weekday that week treats it as the scheduled day
- If no MCP data source is available, exit with: `Cannot refresh org data — directory MCP not reachable. Existing CSV unchanged.`
- Never overwrite the CSV without confirmation, even on scheduled run days

---

## Verification

- [ ] Date check runs first — silent exit on non-scheduled days
- [ ] Diff is shown before any write occurs
- [ ] Write confirmed before overwriting CSV
- [ ] Last-updated timestamp written to CSV header after successful refresh
- [ ] Skills that consume org data (org-weekly-digest, okr-reminder) noted in completion message

---

## Design Principles Applied

- **Delivery First:** Runs silently when not needed — zero friction on the 27+ days per month it doesn't apply
- **Risk Visibility:** Diff surfaced before write — no silent overwrites that corrupt escalation routing
- **Context Aware:** Schedule computed from actual calendar date, not hardcoded
