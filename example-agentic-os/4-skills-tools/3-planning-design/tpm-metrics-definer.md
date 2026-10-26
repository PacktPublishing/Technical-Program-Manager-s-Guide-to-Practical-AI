---
name: tpm-metrics-definer
description: "Use when you need to define the full measurement plan for a program before execution begins — primary metrics, guardrail metrics, anti-metrics, baselines, targets, owners, and data sources — aligned to OKRs."
---
# /tpm-metrics-definer — Program Metrics Definer

**Lifecycle Stage:** Planning & Design
**Job-to-be-Done:** Define the full measurement plan for a program before execution begins — primary metrics, guardrail metrics, anti-metrics, baselines, targets, owners, and data sources — aligned to OKRs

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

If OKR context is available, also load `3-memory-knowledge/layer2-portfolio/fy2026-okrs.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and lifecycle stage
2. Program objective (one sentence: what outcome are we driving?)
3. OKR(s) this program contributes to (paste, describe, or say "load from context")
4. Primary success hypothesis ("we'll know this worked when...")
5. Known data sources / tooling available (DataDog, Salesforce, Jira, Aha, etc.) — optional

**Step 2 — Generate**

---

## Output Format

```markdown
# Program Metrics Definer: [Program Name]

**Objective:** [One-sentence program objective]
**Linked OKR(s):** [OKR label(s) from fy2026-okrs.md or user input]
**Measurement Horizon:** [Date range — e.g., Q2 2026 → Q4 2026]
**Success Hypothesis:** [What "winning" looks like]

---

## Primary Metrics

| Metric | Definition | Baseline | Target | Owner | Data Source | Cadence |
|--------|-----------|----------|--------|-------|-------------|---------|
| | | | | | | Weekly/Monthly |

---

## Guardrail Metrics

Metrics that must NOT degrade. Crossing a threshold triggers escalation.

| Metric | Definition | Threshold | Alert Owner | Data Source |
|--------|-----------|-----------|-------------|-------------|
| | | | | |

---

## Anti-Metrics

Proxy or vanity signals to avoid optimizing for. Flag if team reports these as evidence of success.

| Anti-Metric | Why It's Misleading | Better Alternative |
|-------------|--------------------|--------------------|
| | | |

---

## Leading vs. Lagging Balance

| Metric | Type | Rationale |
|--------|------|-----------|
| | Leading / Lagging | |

**Balance:** [X]% Leading — [X]% Lagging
> ⚠️ Flag if leading indicators are below 30% — insufficient early warning coverage.

---

## Compliance & Regulatory Flags

> Auto-flagged based on domain-context.md compliance obligations.

| Obligation | Relevance to This Program | Measurement Required |
|------------|--------------------------|----------------------|
| SOC 2 Type II (Aug 2026) | [Yes/No — reason] | [e.g., audit log completeness, access control metrics] |
| SOX Controls (Jun 2026) | [Yes/No — reason] | [e.g., change approval rate, segregation of duties] |
| GDPR (Sep 2026) | [Yes/No — reason] | [e.g., data subject request SLA, deletion confirmation rate] |

---

## Gaps & Risks

| Gap | Type | Recommended Action |
|-----|------|--------------------|
| [Metric name] has no baseline | Missing baseline | Instrument and collect for 2 sprints before setting target |
| [Metric name] has no assigned owner | Ownership gap | Assign during kickoff |
| [Metric name] lags outcome by 60+ days | Measurement lag | Add a leading proxy metric |
```

---

## Design Principles Applied
- Delivery First: Measurement plan is tied to program outcomes, not activity tracking
- Risk Visibility: Guardrail metrics and gap flags surface measurement blind spots early
- Tool-Connected: Data sources mapped to existing NovaGrid tooling (DataDog, Jira, Salesforce, Aha)
