---
name: org-weekly-digest
description: Use to generate personalized weekly Slack DMs for each Engineering Manager covering only the items in their span that need attention. Trigger phrases include: "run weekly digest", "send EM digests", "org digest", "weekly EM update", "digest for engineering managers". Each EM receives a curated list — not a firehose — with stale, blocked, or missing items from all trackers covering their teams. Org leader gets a rollup.
---
# /org-weekly-digest — Per-EM Weekly Digest

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Generate one personalized Slack DM per Engineering Manager with only their span's stale, blocked, or missing items — so each EM opens a curated action list, not a full portfolio dump

---

## Overview

A weekly status request sent to all EMs is noise. A personalized DM containing only the items in a given EM's span that need attention is actionable in under a minute. This skill reads three tracker types per org (matrix tracker, offline OKR sheet, mandate tracker), filters items by EM ownership, and writes one Slack DM per EM containing exactly the items needing attention in their area. The org leader receives a separate rollup across all EMs. Preview in Obsidian before sending. End-to-end compute: approximately 3 minutes.

## When to Use

- Weekly, on Monday or Tuesday as part of the `start-day` scheduled task cycle
- When tracker hygiene has degraded and you need a fresh nudge across the org
- Before a QBR or portfolio review to clean up open items

**When NOT to use:**
- To send program-level status to executives — use `/tpm-stakeholder-update`
- To escalate a specific blocker — use `/tpm-escalation-brief`
- For OKR-specific reminders — use `/okr-reminder` (which handles escalation tiers)

---

## Gated Workflow

```
Phase 1: Read trackers        →    Phase 2: Filter per EM    →    Phase 3: Draft + Preview
     │                                   │                               │
     ▼                                   ▼                               ▼
Matrix tracker                    Items in EM's span             One DM per EM
Offline OKR sheet                 Stale / blocked / missing      Org leader rollup
Mandate tracker                   Cross-tracker dedup             Preview → confirm → send
```

### Phase 1 — Read Trackers

Read all three tracker types. Accept as pasted data, file paths, or MCP-accessible sheet references.

| Tracker | What it covers | Staleness rule |
|---------|---------------|----------------|
| Matrix tracker (team × mandate) | Each cell = ETA or status per team per mandate | Stale if no update in 7+ days or cell contains [need-eta] or a past date |
| Offline OKR sheet | Objective rows per owner | Stale if no update in 7+ days or cell is empty |
| Mandate tracker | Active mandates per team | Missing if a required field (owner, ETA, status) is blank |

Cross-reference all items against `1-inputs-triggers/org/novagrid-org.csv` to determine which EM owns each team/item.

### Phase 2 — Filter Per EM

For each EM in the org:
- Collect all stale, blocked, or missing items across the three trackers where the item's team or owner reports to that EM
- Deduplicate across trackers (same item appearing in two trackers = one mention in the DM)
- If an EM has zero items needing attention, do not send them a DM (silence is a signal that everything is fine)

Generate a separate rollup for the org leader: one line per EM showing item count and worst-case flag (🔴/🟡/🟢).

### Phase 3 — Draft and Preview

Draft one DM per EM with items only. Draft the org leader rollup. Show all in preview. Ask for confirmation before sending.

---

## Output Format

**Per-EM DM:**

```markdown
Hi [First name],

Here's your weekly tracker check for [week of Date]:

**[Tracker type — Matrix / OKR / Mandate]**
- **[Team or Objective]:** [Issue — e.g., "No ETA set", "Last updated 12 days ago at YELLOW", "[need-eta] in column O"] → [Direct link to item if available]
- **[Team or Objective]:** [Issue] → [Link]

**[Tracker type]**
- [...]

[If all trackers are clean for this EM — this line instead:]
Everything in your span is up to date this week. No action needed.

[Sign-off from TPM name]
```

**Org leader rollup:**

```markdown
# Weekly Digest Rollup — [Week of Date]

| EM | Items needing attention | Worst flag |
|----|------------------------|-----------|
| [Name] | [N] | 🔴 / 🟡 / 🟢 |
| [Name] | 0 | 🟢 |

**Total items across org:** [N]
**EMs with no items:** [N] (no DM sent)
```

**Preview confirmation:**

```markdown
# Digest Preview — [Date]

**EMs to contact:** [N] of [total EMs]
**EMs with no items:** [N] (no DM)
**Total items across all DMs:** [N]

[Full DM drafts for each EM listed here]

---

Send all [N] DMs? **yes** / edit / cancel
```

---

## Common Rationalizations

| Rationalization | Reality |
|----------------|---------|
| "Just send the same message to everyone" | Same message = everyone ignores it because most items don't apply to them. Per-EM filtering is the whole point. |
| "I'll add a note explaining why I'm sending this" | Keep it short. EMs open a DM with one purpose: act on their items. Preamble delays that. |
| "Send a DM even if an EM has zero items" | No. Silence for an EM is information — their span is clean. An unnecessary DM trains them to ignore future ones. |
| "The rollup is enough — skip the individual DMs" | The rollup is for you and the org leader. EMs need their filtered view, not a full org dump. |

---

## Verification

- [ ] Three tracker types read per org before drafting
- [ ] Items filtered strictly to each EM's reporting span (not their peer's items)
- [ ] EMs with zero items receive no DM
- [ ] Org leader rollup generated separately from EM DMs
- [ ] Cross-tracker deduplication applied before final list
- [ ] Preview shown before send — no silent sends

---

## Design Principles Applied

- **Delivery First:** Recipient friction reduced — each EM opens exactly the items requiring their action, nothing else
- **Cross-Team Alignment:** Three tracker types read in one pass — org-wide view without asking each EM to self-report
- **Risk Visibility:** Stale, blocked, and missing items surfaced per EM; worst-case flag shown in rollup
- **Context Aware:** EM span derived from `novagrid-org.csv` — routing accurate without manual assignment
