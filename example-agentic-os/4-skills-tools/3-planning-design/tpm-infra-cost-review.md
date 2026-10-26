---
name: tpm-infra-cost-review
description: Audits cloud and infrastructure spend from billing exports and resource inventories. Flags orphaned assets, idle or over-provisioned resources, tagging gaps, dual-run waste, and month-over-month spikes. Use when reviewing cloud costs, FinOps, COGS, infrastructure burn, or orphaned resources.
---
# /tpm-infra-cost-review — Infrastructure Cost Review

**Lifecycle Stage:** Planning & Design
**Job-to-be-Done:** Audit infrastructure spend, isolate waste and orphaned assets, and produce a prioritized remediation plan with owners and savings estimates

---

## TPM Context

Infrastructure cost is a delivery risk disguised as a finance line item. Dual-run environments, orphaned resources after migrations, and untagged spend hide in program execution until CFO review or a budget cut forces reactive triage.

This skill is the TPM-facing FinOps gate: ingest billing or inventory data, cross-check against program context (expected workloads, migration state, milestone timelines), and output actionable findings — not a raw cost dump. Savings without an owner and a due date are suggestions, not remediation.

**When to use:**
- Monthly or quarterly infra cost review for a program or platform area
- Before SteerCo or QBR when COGS or burn is on the agenda
- During migrations (dual-run exposure — e.g. Airflow + Temporal, v1 + v2 API)
- After major retirements — verify resources actually decommissioned
- When `/tpm-program-health` or `/tpm-risk-identifier` surfaces a cost risk

**When NOT to use:**
- Pre-commit business case for a new program — use `/tpm-roi-checker`
- Abstract tech debt without spend data — use `/tpm-techdebt`
- Live API calls to cloud consoles — paste exports or describe inventory; this skill analyzes provided data

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

For program-scoped reviews, load `3-memory-knowledge/layer3-programs/[program]-master.md` for migration state, dual-run notes, and known cost risks.

Use escalation paths and RAG standards from `domain-context.md` when flagging findings that need exec attention.

---

## Interaction Flow

**Step 1 — Intake**

1. **Scope:** program name, platform area, or cloud account(s)
2. **Review period:** e.g. last 30 / 60 / 90 days; comparison baseline if available
3. **Data provided** (at least one required):
   - Cloud billing export (CSV/JSON) — AWS Cost Explorer, GCP Billing, Azure Cost Management
   - Resource inventory export — instances, clusters, storage, load balancers, databases
   - Internal cost allocation report or FinOps dashboard snapshot
   - Program master notes on expected spend, dual-run, or retirement targets
4. **Budget context (optional):** monthly budget, burn target, or CFO threshold that triggers escalation
5. **Known events:** recent launches, migrations, scale-ups, or incidents that explain spikes

If data is partial, proceed with stated assumptions and mark confidence on each finding.

**Step 2 — Normalize & Baseline**

- Group spend by service, environment (prod/staging/dev), team/tag, and program if tags exist
- Compute period-over-period change (MoM or vs. baseline) for top spend categories
- Note data quality issues: missing tags, untagged %, stale inventory dates

**Step 3 — Audit checks**

Run all seven checks; do not skip because the user did not mention them:

| Check | What to look for |
|-------|------------------|
| **Orphaned resources** | Resources with no owner tag, no recent activity, or tied to retired services/programs |
| **Idle / over-provisioned** | Low CPU/memory utilization, oversized instances, unused volumes, idle load balancers |
| **Dual-run waste** | Parallel stacks during migration (old + new orchestrator, API, logging, observability) |
| **Tagging & allocation gaps** | Untagged spend, shared accounts without chargeback, "default" or empty cost-center tags |
| **Storage & data drift** | Orphan snapshots, old AMIs, unreferenced S3/GCS buckets, log retention bloat |
| **Commitment mismatch** | Reserved capacity vs. actual usage; savings plans under-utilized |
| **Anomaly spikes** | Single-service MoM increase >20% without documented program event |

**Step 4 — Prioritize & assign**

Score each finding: **Savings estimate × Confidence × Ease of remediation**. Every 🔴 finding needs an owner and target date or escalation path.

---

## Output Format

```markdown
# Infrastructure Cost Review: [Scope]

**Date:** [Date]
**Review period:** [Start] – [End]
**Data sources:** [Billing export / inventory / program master — with snapshot dates]
**Total spend (period):** $[X] · **vs. prior period:** [+/-X%]
**Data quality:** 🟢 Good / 🟡 Partial / 🔴 Gaps — [brief note]

---

## Executive Summary

[2–3 sentences: largest drivers, top waste category, recommended immediate action and estimated recoverable savings]

**Recoverable savings (estimated):** $[X]/month (range: $[low]–$[high])
**Escalation required:** Yes / No — [if yes, why]

---

## Spend Overview

| Rank | Category / Service | Period spend | % of total | MoM change | Notes |
|------|-------------------|-------------|-----------|-----------|-------|
| 1 | | $ | % | +/-% | |

### Spend by environment

| Environment | Spend | % of total | Flag |
|-------------|-------|-----------|------|
| Production | $ | % | |
| Staging / non-prod | $ | % | 🟡 if non-prod >15% of prod without justification |
| Untagged / unknown | $ | % | 🔴 if >5% |

---

## Findings

### 🔴 Critical — act within 7 days

#### F-001: [Title]
| Field | Value |
|-------|-------|
| **Category** | Orphaned / Dual-run / Over-provisioned / Tagging / Storage / Commitment / Anomaly |
| **Resources** | [IDs, names, regions — as available] |
| **Current cost** | $[X]/month |
| **Est. savings** | $[X]/month |
| **Evidence** | [What in the data supports this] |
| **Program link** | [Program / milestone affected, if any] |
| **Owner** | [Name or role] |
| **Recommended action** | [Specific: decommission, rightsizing, consolidate, tag, escalate] |
| **Due** | [Date] |

### 🟡 Major — act within 30 days

[Same table format, condensed or repeated per finding]

### 🟢 Monitor — track, no immediate action

| ID | Finding | Est. savings | Owner | Review date |
|----|---------|-------------|-------|-------------|
| | | | | |

---

## Orphaned & Untagged Inventory

| Resource | Type | Last activity | Monthly cost | Likely owner | Action |
|----------|------|--------------|-------------|-------------|--------|
| | | | $ | | Decommission / Verify / Tag |

---

## Dual-Run & Migration Exposure

| Stack A | Stack B | Programs | Monthly overlap cost | Planned end date | Risk if extended 30 days |
|---------|---------|----------|---------------------|-----------------|-------------------------|
| | | | $ | | $ |

---

## Recommended Remediation Plan

**This week:**
1. [Highest-confidence, highest-savings action — owner — date]

**This month:**
1. [...]

**Ongoing governance:**
- [Tagging policy, monthly review cadence, owner for FinOps liaison]

---

## Risks to Log

| Risk ID | Description | Est. exposure | Feed to |
|---------|-------------|--------------|---------|
| R-COST-01 | | $/month or $ total | `/tpm-risk-identifier` |

---

## Data Gaps & Next Pull

| Gap | Impact on confidence | Who should provide |
|-----|---------------------|-------------------|
| | | |
```

---

## Key Concepts

- **Recoverable vs. structural:** Rightsizing an idle instance is recoverable; platform re-architecture is structural — label each finding correctly.
- **Dual-run is a program decision:** Quantify monthly burn and tie to milestone exit date; escalation when overlap exceeds plan.
- **Untagged spend is unowned spend:** Treat untagged resources above threshold as 🔴 until allocated.
- **Confidence levels:** High = billing line + inventory match; Medium = billing only; Low = inferred from program notes — never present Low as exact dollars.

---

## Anti-Patterns

- **Listing every line item** — top drivers and actionable findings only; aggregate the long tail
- **Savings without owners** — every 🔴/🟡 finding needs a name or role
- **Ignoring non-prod** — staging clusters and forgotten dev sandboxes often exceed production waste
- **Decommission without verifier** — recommend verify-with-owner before delete on ambiguous resources
- **One-time snapshot as trend** — state snapshot date; do not imply trend without comparison period

---

## Composes With

- `/tpm-roi-checker` — infra savings feed business case and investment decisions
- `/tpm-risk-identifier` — cost findings become program risks (dual-run, budget overrun)
- `/tpm-program-health` — Cost dimension for programs with COGS or burn targets
- `/tpm-stakeholder-update` — CFO/sponsor audience when escalation required
- `/tpm-escalation-brief` — when dual-run or overrun exceeds domain escalation threshold
- `/tpm-preflight` — run before exec-facing cost artifacts; flag stale billing exports

---

## Design Principles Applied

- **Delivery First:** Findings tied to program milestones and migration exit dates, not abstract FinOps
- **Risk Visibility:** Dual-run and orphan exposure quantified with escalation triggers
- **Tool-Connected:** Works from billing/inventory exports; cross-references program masters and domain context
