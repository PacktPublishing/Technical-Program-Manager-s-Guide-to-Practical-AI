# NovaGrid — TPM Operating Context
*Always loaded · Update cadence: quarterly or on policy changes*

> **Full org and technical detail** lives in `3-memory-knowledge/layer1-always/`. This file owns only what is unique to TPM operations: program taxonomy, RAG standards, Definition of Done, escalation policy, and compliance constraints.

---

## Company anchor

**NovaGrid, Inc.** (NGRD, NASDAQ) — post-IPO B2B Data & AI platform. **ARR:** $187M → $265M target FY2026.
Three pillars: DataCore (58% ARR) · FlowEngine (27%) · NovaAI (15% — primary growth thesis).

*Full context:* `3-memory-knowledge/layer1-always/company-snapshot.md`

---

## Program taxonomy

| Tier | Definition | Programs |
|------|-----------|---------|
| **P0** | Board-critical — failure = company-level risk | SHIELD · NEXUS · ATLAS |
| **P1** | Strategic — material revenue or platform impact | MERIDIAN · PULSE · HORIZON · SPARK |
| **P2** | Important — can slip without cascading consequences | Team-level improvement programs |

*Full program status:* `3-memory-knowledge/layer2-portfolio/program-index.md`

---

## RAG status standards

| Status | Meaning | Required action |
|--------|---------|----------------|
| 🟢 Green | Confident, on track — no known blockers | Routine update |
| 🟡 Amber | At risk but recoverable — mitigation in progress | Flag at weekly SteerCo |
| 🔴 Red | Behind — requires escalation or exec decision | Escalation brief required within 24 hours |

**Default to Amber when uncertain.** Green requires active confidence, not absence of known issues.

---

## Escalation path

```
Program TPM → Karl Bergstrom (Head TPM) → Division Director → Yuki Tanaka (VP Eng) → Priya Anand (CEO)
```

**Cross-division:** Any TPM can raise to Karl for immediate Director-level triage — no need to wait for a SteerCo slot.
**Red programs:** Escalation brief required within 24 hours of status change (`/tpm-escalation-brief`).

*Org and contact details:* `3-memory-knowledge/layer1-always/org-chart.md`

---

## Governance cadence

| Forum | When | Chair | Attendees | TPM action |
|-------|------|-------|-----------|-----------|
| Weekly TPM SteerCo | Fridays 10:00 CET | Karl Bergstrom | All TPMs | Status update + flag risks |
| Monthly Executive SteerCo | Last Tuesday | Yuki Tanaka | Division Directors · Head TPM · VP Product · CFO | Exec summary + escalations |
| Program SteerCo (per program) | Varies by program | Program TPM | Sponsor + leads | Program-specific — see master doc |

---

## Definition of Done

| Gate | Requirement |
|------|------------|
| **Milestone complete** | Owner signed off + evidence updated in Aha! |
| **Risk closed** | Resolution documented in program master doc |
| **Decision made** | Decision record written (`/tpm-decision-record`) |
| **Blocker resolved** | Blocker owner confirms resolution in Slack + Aha! updated |
| **Dependency delivered** | Receiving TPM confirms acceptance against spec — not just "it's done" |

---

## Compliance constraints (hard deadlines)

| Requirement | Owner | Deadline | Program | Status |
|-------------|-------|---------|---------|--------|
| SOC 2 Type II | CISO (James Whitfield) | Aug 2026 | SHIELD | 🔴 Behind |
| SOX financial controls | CFO (Marcus Bauer) | Jun 2026 | — | 🟢 60% complete |
| GDPR + data residency (EU + APAC) | VP Eng (Yuki Tanaka) | Sep 2026 | Design phase | 🔴 Behind |

**SOC 2 note:** Deloitte audit date is fixed ($180K contract). Any slip = certification failure. Board mandate — treat as P0 constraint across all programs.

---

## Tool landscape (TPM view)

| Tool | TPM use | Key friction |
|------|---------|-------------|
| **Aha!** | Milestone SoT — update after every milestone gate | Engineers don't update it — TPMs must chase |
| **Jira** | 6 legacy teams (SHIELD, PULSE, MERIDIAN, DataCore) | Split with Linear — manual reconciliation for cross-program status |
| **Linear** | 9 teams (NEXUS, ATLAS, HORIZON, SPARK) | Split with Jira — same problem |
| **Salesforce** | Enterprise pipeline — $48M active with program dependencies | Sales + CS owned; TPMs use for at-risk account signals and deal deadline tracking |
| **Slack** | Async comms — use named channels, avoid DMs for decisions | High noise; decisions made in DMs get lost |
| **Vanta** | SOC 2 control tracking (SHIELD) | Single-program scope |
| **PagerDuty** | Incident + on-call | Relevant for SRE dependencies and production readiness gates |
| **Notion** | Design docs, runbooks | High decay rate — low governance, frequently stale |

*Full tool inventory and migration states:* `3-memory-knowledge/layer1-always/tech-stack.md`

---

## Context file map

| What you need | File |
|---------------|------|
| Company financials, strategy, board mandates | `3-memory-knowledge/layer1-always/company-snapshot.md` |
| Org chart, engineering divisions, exec contacts | `3-memory-knowledge/layer1-always/org-chart.md` |
| How each stakeholder wants to be updated | `2-goals-policies/stakeholder-personas.md` |
| Languages, tools, migration states | `3-memory-knowledge/layer1-always/tech-stack.md` |
| All programs — RAG status, milestones, TPMs | `3-memory-knowledge/layer2-portfolio/program-index.md` |
| Cross-program dependencies + active risks | `3-memory-knowledge/layer2-portfolio/dependency-matrix.md` |
| Company + division OKRs mapped to programs | `3-memory-knowledge/layer2-portfolio/fy2026-okrs.md` |
| Single program detail | `3-memory-knowledge/layer3-programs/[program]-master.md` |
| Current week — SteerCo prep, escalations | `3-memory-knowledge/layer4-weekly/this-week.md` |
