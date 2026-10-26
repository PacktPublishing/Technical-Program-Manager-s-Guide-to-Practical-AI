---
name: tpm-techdebt
description: "Use when you need to identify, categorize, and prioritize tech debt items against program goals and delivery risk."
---
# /tpm-techdebt — Tech Debt Checker

**Lifecycle Stage:** Architecture & Technical Alignment
**Job-to-be-Done:** Identify, categorize, and prioritize tech debt items against program goals and delivery risk

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

---

## Interaction Flow

**Step 1 — Intake**

1. Program or system name
2. List of known tech debt items (or description of the problem area)
3. Upcoming program work that will touch these areas
4. Team's current capacity for debt reduction
5. Any incidents or slowdowns caused by existing debt

**Step 2 — Generate**

---

## Output Format

```markdown
# Tech Debt Assessment: [Program / System Name]

**Date:** [Date]
**Assessed by:** [TPM + Engineering lead]

---

## Debt Inventory

| # | Debt Item | Category | Age | Delivery Impact | Risk if Unaddressed | Effort to Fix |
|---|-----------|---------|-----|----------------|--------------------| --------------|
| 1 | | Architecture / Code / Test / Infra / Process | | 🔴🟡🟢 | | S/M/L |

**Categories:**
- **Architecture** — Structural issues affecting scalability or flexibility
- **Code** — Poor quality, inconsistent patterns, missing abstractions
- **Test** — Missing or flawed test coverage
- **Infra** — Outdated dependencies, infrastructure, or tooling
- **Process** — Manual steps, missing automation, runbook gaps

---

## Priority Matrix

**Pay Now (High impact, Low effort):**
- [Item]

**Schedule (High impact, High effort):**
- [Item] — Recommend: [Q/Sprint]

**Monitor (Low impact, Low effort):**
- [Item]

**Accept (Low impact, High effort):**
- [Item] — Accept as known risk

---

## Program Impact Analysis

| Debt Item | Which Epics/Features Are Affected | Risk to Timeline | Recommendation |
|-----------|----------------------------------|-----------------|---------------|
| | | | Fix before / Fix alongside / Defer |

---

## Recommended Debt Reduction Plan

**Sprints 1–2:** [Highest-priority quick wins]
**Sprints 3–4:** [Scheduled debt items]
**Ongoing:** [Items to track and monitor]

**Proposed capacity allocation:** [X% of sprint capacity for debt reduction]
```

---

## Design Principles Applied
- Delivery First: Debt items tied to delivery impact, not abstract quality
- Risk Visibility: Risk if unaddressed made explicit for each item
