---
name: jira-lookup-table
description: Use when you need a quick snapshot of Jira tickets for a program, epic, or specific ticket ID. Trigger phrases include: "show me the Jira tickets for", "what's the status of", "jira lookup", "pull up tickets for", "what epics are open in". Returns a formatted table with status, owner, ETA, and blocker flags — no Jira UI required.
---
# /jira-lookup-table — Jira Quick Reference

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Return a formatted Jira ticket table for a program, epic, or ticket ID in seconds — status, owner, ETA, and blockers surfaced at a glance

---

## Overview

Navigating Jira filters takes time. This skill reads from the pre-exported Jira snapshot (`1-inputs-triggers/jira/novagrid-jira-export.json`) and returns a clean lookup table for whatever scope is provided — a full program, a single epic, or a specific ticket. Blocker flags and overdue ETAs are highlighted automatically. Use it during standups, SteerCo prep, or any time you need ticket state without context-switching.

## When to Use

- During or before a meeting when you need to check ticket status quickly
- When building a status update and need current Jira state
- When a stakeholder asks "what's the status of X"
- To spot-check whether a sprint is on track

**When NOT to use:**
- For deep risk analysis — use `/tpm-risk-identifier`
- For full program health scoring — use `/tpm-program-health`
- For epic breakdown or ticket creation — use `/tpm-epic-breakdown`
- Note: Results reflect the last export timestamp. For real-time Jira state, check Jira directly.

---

## Interaction Flow

```
Program name / Epic name / Ticket ID
       |
       v
Filter novagrid-jira-export.json by scope
       |
       v
Flag: blockers, overdue ETAs, unassigned tickets
       |
       v
Return formatted lookup table
```

**Step 1 — Intake**

Provide any of:
- Program name (e.g., "Project Nexus", "Atlas")
- Epic name or partial name
- Ticket ID or range (e.g., "NEX-101", "NEX-100 to NEX-110")
- Free query (e.g., "all blocked tickets across all programs")

**Step 2 — Filter and Flag**

Read `1-inputs-triggers/jira/novagrid-jira-export.json`. Apply scope filter. Then flag:
- 🔴 **Blocker** — ticket has blocker flag or linked blocking ticket
- 🟡 **Overdue** — ETA is in the past and status is not Done/Closed
- ⬜ **Unassigned** — no owner field set

**Step 3 — Return Table**

Return a scoped table sorted by: Blockers first, then Overdue, then by ETA ascending.

---

## Output Format

```markdown
# Jira Lookup: [Scope]

**Source:** `novagrid-jira-export.json` | **Export date:** [timestamp from JSON]
**Tickets returned:** [N] | **Blockers:** [N 🔴] | **Overdue:** [N 🟡] | **Unassigned:** [N ⬜]

---

| ID | Summary | Status | Owner | ETA | Priority | Flags |
|----|---------|--------|-------|-----|----------|-------|
| [ID] | [Summary truncated to 60 chars] | To Do / In Progress / Done | [Name or ⬜ Unassigned] | [Date or —] | P1/P2/P3 | 🔴 Blocker / 🟡 Overdue / — |

---

## Blockers Detail

### [Ticket ID]: [Summary]
**Blocking:** [What this blocks — ticket ID or description]
**Owner:** [Name]
**Last updated:** [Date]
**Status:** [Current status]
```

If no tickets match the scope:

```markdown
No tickets found matching "[scope]" in the current Jira export.
Export date: [timestamp]. If this seems wrong, check Jira directly or refresh the export.
```

---

## Behavioral Notes

- If the program name is ambiguous (matches multiple programs), list the matches and ask the user to confirm scope before returning results
- Do not invent tickets — if the export doesn't contain a ticket, say so explicitly
- Truncate ticket summaries at 60 characters; full summary available on request
- If export timestamp is more than 24 hours old, prepend a staleness warning

---

## Verification

- [ ] Scope filter correctly applied (not returning tickets from other programs)
- [ ] Blocker flags accurately reflect JSON blocker field
- [ ] Overdue logic compares ETA to today's date (not export date)
- [ ] Export timestamp shown in header
- [ ] Staleness warning shown if export is older than 24 hours

---

## Design Principles Applied

- **Delivery First:** Ticket state surfaced without switching to Jira — decision-ready in one query
- **Risk Visibility:** Blockers and overdue tickets sorted to the top automatically
- **Context Aware:** Reads from the canonical Jira export in `1-inputs-triggers/`
