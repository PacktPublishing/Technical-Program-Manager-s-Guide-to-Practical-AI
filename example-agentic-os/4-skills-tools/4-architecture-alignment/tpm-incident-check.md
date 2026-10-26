---
name: tpm-incident-check
description: "Use when you need to analyze recent incidents for patterns, risks, and signals relevant to your program."
---
# /tpm-incident-check — Incident Checker (DataDog)

**Lifecycle Stage:** Architecture & Technical Alignment
**Job-to-be-Done:** Analyze recent incidents for patterns, risks, and signals relevant to your program

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use DataDog environment and SLO configuration from `domain-context.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name (to identify relevant services/systems)
2. Incident data — paste incident summaries, or describe recent SEV1/SEV2 incidents
3. Time window to analyze (e.g., last 30 days, last quarter)
4. Services / systems owned by or depended on by this program
5. Any known reliability concerns going into the program

**Step 2 — Analyze**

---

## Output Format

```markdown
# Incident Analysis: [Program Name]

**Period:** [Start date] – [End date]
**Services analyzed:** [List]

---

## Incident Summary

| # | Incident | Severity | Date | Duration | Root Cause Category | Impact |
|---|---------|---------|------|----------|--------------------| -------|
| 1 | | SEV1/2/3 | | | | |

---

## Pattern Analysis

### Frequency by Root Cause
| Root Cause Category | Count | % of Total | Trend |
|--------------------|-------|-----------|-------|
| Infrastructure failure | | | ↑↓→ |
| Code/deployment | | | |
| Dependency failure | | | |
| Configuration | | | |
| Unknown | | | |

### Most Affected Services
| Service | Incident Count | Total Downtime | SLO Status |
|---------|---------------|---------------|-----------|
| | | | ✅🟡🔴 |

---

## Program Relevance

**Incidents affecting program-critical services:**
[List incidents that directly affect services this program will touch or depend on]

**Risk signals:**
- [Risk 1]: [Implication for this program]
- [Risk 2]: [...]

---

## Recommendations

| Recommendation | Priority | Owner | Timeline |
|---------------|---------|-------|---------|
| [Fix X before program touches this service] | 🔴 | | Before [milestone] |
| [Add monitoring for Y] | 🟡 | | |
| [Runbook update for Z] | 🟢 | | |

---

## SLO Status (from domain-context.md)
| SLO | Target | Current | Status |
|-----|--------|---------|--------|
| API latency p99 | <200ms | | ✅🟡🔴 |
| Uptime | 99.9% | | |
```

---

## Design Principles Applied
- Tool-Connected: Structured for DataDog data from domain-context.md
- Risk Visibility: Incident patterns surfaced as program risks
- Delivery First: Recommendations tied to program milestones
