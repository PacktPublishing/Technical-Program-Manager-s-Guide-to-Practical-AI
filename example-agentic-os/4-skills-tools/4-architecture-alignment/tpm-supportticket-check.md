---
name: tpm-supportticket-check
description: "Use when you need to mine support tickets for signals relevant to your program — surface recurring pain, unmet needs, and SLA risks."
---
# /tpm-supportticket-check — Support Ticket Analyzer (SFDC/Jira)

**Lifecycle Stage:** Architecture & Technical Alignment
**Job-to-be-Done:** Mine support tickets for signals relevant to your program — surface recurring pain, unmet needs, and SLA risks

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use SFDC/Jira Support configuration and SLA tiers from `domain-context.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and affected product areas
2. Support ticket data — paste ticket summaries or export, or describe categories
3. Time window (e.g., last 60 days)
4. Customer tier(s) to focus on (Enterprise / Pro / Standard)
5. Any known customer pain points already on the radar

**Step 2 — Analyze**

---

## Output Format

```markdown
# Support Ticket Analysis: [Program Name]

**Period:** [Start date] – [End date]
**Ticket volume analyzed:** [N]
**Customer tier focus:** [All / Enterprise / Pro]

---

## Volume & Trend

| Week | Ticket Count | SLA Breaches | Escalations | Trend |
|------|-------------|-------------|------------|-------|
| | | | | ↑↓→ |

---

## Category Breakdown

| Category | Count | % | Avg Resolution Time | SLA Health |
|---------|-------|---|--------------------| -----------|
| | | | | ✅🟡🔴 |

---

## Top Recurring Issues

| # | Issue Description | Frequency | Affected Customers | Linked Jira | Program Relevance |
|---|-----------------|-----------|-------------------|------------|------------------|
| 1 | | | | | 🔴🟡🟢 |

---

## Customer Signal

**What customers are asking for (verbatim patterns):**
- "[Pattern 1]" — mentioned in X tickets
- "[Pattern 2]" — mentioned in Y tickets

**Sentiment trend:** [Improving / Stable / Degrading]

---

## Program Implications

| Finding | Impact on Program | Recommended Action |
|---------|------------------|------------------|
| [Issue X is recurring in core feature Y which this program touches] | | |

---

## Recommendations

| Priority | Action | Owner | By When |
|---------|--------|-------|---------|
| 🔴 | | | |
| 🟡 | | | |
```

---

## Design Principles Applied
- Tool-Connected: Uses SFDC/Jira Support structure from domain-context.md
- Risk Visibility: SLA breach trends surfaced as program risks
- Delivery First: Customer signals tied to program decisions
