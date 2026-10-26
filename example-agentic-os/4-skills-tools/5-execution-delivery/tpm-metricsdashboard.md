---
name: tpm-metricsdashboard
description: "Use when you need to define, structure, and populate a program metrics dashboard — with leading and lagging indicators across all key dimensions."
---
# /tpm-metricsdashboard — Metrics Dashboard

**Lifecycle Stage:** Execution & Delivery
**Job-to-be-Done:** Define, structure, and populate a program metrics dashboard — with leading and lagging indicators across all key dimensions

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use DataDog, Jira, and business metrics conventions from `domain-context.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and objectives
2. What success looks like at program end
3. Key workstreams or teams contributing metrics
4. Available data sources (Jira, DataDog, SFDC, manual)
5. Dashboard audience (TPM / engineering / leadership / all)
6. Update frequency (real-time / weekly / bi-weekly)

**Step 2 — Design Dashboard**

---

## Output Format

```markdown
# Metrics Dashboard Design: [Program Name]

**Audience:** [TPM / Engineering / Leadership / All]
**Update frequency:** [Real-time / Weekly / Bi-weekly]
**Primary data sources:** [Jira / DataDog / SFDC / Manual]

---

## Dashboard Structure

### Section 1: Program Health (Top-Level)

| Metric | Type | Current | Target | Trend | Source | Owner |
|--------|------|---------|--------|-------|--------|-------|
| Overall RAG | Status | 🔴🟡🟢 | 🟢 | → | Manual | TPM |
| Schedule confidence | Leading | % | >80% | ↑ | Manual | TPM |
| Open critical risks | Leading | # | 0 | ↓ | Risk Registry | TPM |
| Blocked dependencies | Leading | # | 0 | ↓ | Jira | TPM |

### Section 2: Delivery Metrics

| Metric | Type | Current | Target | Trend | Source | Owner |
|--------|------|---------|--------|-------|--------|-------|
| Epics on track | Leading | X/Y (%) | >90% | ↑ | Jira | TPM |
| Sprint velocity | Leading | pts/sprint | [baseline] | → | Jira | EM |
| Stories completed (period) | Lagging | # | [target] | ↑ | Jira | EM |
| Scope changes (period) | Lagging | # | <2 | ↓ | Jira | TPM |
| Milestones hit on time | Lagging | X/Y | 100% | → | Manual | TPM |

### Section 3: Quality & Reliability

| Metric | Type | Current | Target | Trend | Source | Owner |
|--------|------|---------|--------|-------|--------|-------|
| SEV1/SEV2 incidents | Lagging | # | 0 | ↓ | DataDog | On-call |
| SLO compliance | Lagging | % | >99.9% | → | DataDog | Eng Lead |
| Test coverage | Leading | % | >80% | ↑ | CI/CD | EM |
| Open P0 bugs | Leading | # | 0 | ↓ | Jira | EM |

### Section 4: Business Impact *(if applicable)*

| Metric | Type | Current | Target | Trend | Source | Owner |
|--------|------|---------|--------|-------|--------|-------|
| [Business metric] | Lagging | | | | | |

---

## Metric Definitions

| Metric | Definition | Measurement Method | Update Frequency |
|--------|-----------|-------------------|-----------------|
| Schedule confidence | TPM estimate: probability of hitting next milestone | Manual assessment | Weekly |
| [Add others] | | | |

---

## Dashboard Setup Recommendations

**Recommended tool:** [Confluence dashboard / DataDog dashboard / Notion / Google Sheets]
**Automation opportunities:**
- Jira → auto-update epic status, velocity
- DataDog → auto-update SLO, incident counts
- Manual → RAG, schedule confidence, milestone status

---

## Leading vs Lagging Balance

> **Leading indicators** (predictive — act now): [N metrics]
> **Lagging indicators** (confirmatory — validate impact): [N metrics]
> Target: 60% leading, 40% lagging
```

---

## Design Principles Applied
- Delivery First: Dashboard tells delivery story, not just vanity metrics
- Risk Visibility: Leading indicators surface problems before they become lagging ones
- Tool-Connected: Data sources mapped to Jira/DataDog/SFDC from domain-context.md
