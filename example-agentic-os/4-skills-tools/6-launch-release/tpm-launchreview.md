---
name: tpm-launchreview
description: "Use when you need to given the DPLY ticket, PRD, and EDD, fill out the launch template and ready it for sign-off."
---
# /tpm-launchreview — Launch Review

**Lifecycle Stage:** Launch / Release
**Job-to-be-Done:** Given the DPLY ticket, PRD, and EDD, fill out the launch template and ready it for sign-off

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Use the launch checklist template and sign-off requirements from `domain-context.md`.

---

## Interaction Flow

**Step 1 — Intake**

Provide:
1. DPLY ticket (paste key fields: description, scope, risk assessment)
2. PRD summary (key features, success metrics, non-goals)
3. EDD summary (architecture changes, data migrations, rollback plan)
4. Target launch date and deployment plan (phased / big bang / feature flag)
5. Any known risks or last-minute concerns

**Step 2 — Generate Launch Review**

---

## Output Format

```markdown
# Launch Review: [Feature / Program Name]

**DPLY:** [Link / ticket number]
**Launch date:** [Date]
**Launch type:** Phased rollout / Full launch / Feature flag / Hotfix
**Risk level:** 🔴 High / 🟡 Medium / 🟢 Low

---

## Launch Readiness Checklist

### Engineering Readiness
- [ ] Code reviewed and merged to main
- [ ] All tests passing (unit, integration, e2e)
- [ ] Performance testing completed (results: ...)
- [ ] Feature flags configured
- [ ] Rollback plan documented and tested
- [ ] EDD reviewed and approved

### Architecture & Security
- [ ] Architecture review approved
- [ ] Security review completed (or waived with reason)
- [ ] SOC2 / GDPR / PCI implications addressed (per domain-context.md)
- [ ] API contracts finalized and versioned

### Operational Readiness
- [ ] Runbook published in Confluence
- [ ] Monitoring and alerting configured (DataDog)
- [ ] SLO targets set
- [ ] On-call team briefed
- [ ] Incident response plan reviewed

### Customer & Stakeholder Readiness
- [ ] Customer-facing comms drafted (if applicable)
- [ ] Customer Success briefed
- [ ] Sales enablement materials ready (if applicable)
- [ ] External documentation updated

### Go/No-Go Approvals
- [ ] Engineering Lead: ☐ Go / ☐ No-Go — [Name] — [Date]
- [ ] Product: ☐ Go / ☐ No-Go — [Name] — [Date]
- [ ] Security: ☐ Go / ☐ No-Go — [Name] — [Date] (if required)
- [ ] TPM: ☐ Go / ☐ No-Go — [Name] — [Date]

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation | Rollback Trigger |
|------|-----------|--------|------------|-----------------|
| | | | | |

**Launch risk level justification:**
[Why this is rated Low / Medium / High]

---

## Rollback Plan

**Trigger conditions:** [What must happen for rollback to be initiated]
**Rollback owner:** [Name]
**Rollback time estimate:** [X minutes]
**Rollback steps:**
1. [Step 1]
2. [Step 2]

---

## Launch Communication Plan

| Audience | Channel | Message | Owner | Timing |
|---------|---------|---------|-------|--------|
| Engineering | Slack #eng | | | T-1hr |
| CS team | Email | | | T-24hr |
| Customers (if applicable) | In-app / email | | | T-0 |

---

## Post-Launch Monitoring Plan

| Metric | Baseline | Alert Threshold | Owner | Check At |
|--------|---------|----------------|-------|---------|
| | | | | T+1hr, T+24hr, T+7d |
```

---

## Design Principles Applied
- Delivery First: Launch review is actionable checklist, not a ceremony
- Risk Visibility: Rollback triggers explicit and pre-agreed
- Tool-Connected: Uses DPLY, Confluence, DataDog from domain-context.md
