# NovaGrid — Tech Stack

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

*Layer 1 context · Always loaded · Update cadence: on migrations*

---

## Languages

| Language | Primary use | Status |
|----------|-------------|--------|
| Python | Data pipelines, ML/AI, SDK, internal tooling | Primary (40% of codebase) |
| Go | Core API services, data plane, high-throughput microservices | Primary (30%) |
| Rust | Query engine hot path, model serving inference | Strategic — growing, limited hiring pipeline |
| TypeScript | Frontend (React), BFF layer, developer SDK | Primary (15%) |
| Java | Legacy DataCore ingestion services | Legacy — being replaced by Go via NEXUS |
| Swift / Kotlin | iOS / Android mobile apps | Active — HORIZON program |
| SQL | Query engine DSL, internal analytics | Ubiquitous |

## Internal tooling (know which teams use what)

| Tool | Used for | Coverage |
|------|---------|----------|
| **GitHub** | Source control, CI/CD, code review | All teams |
| **Linear** | Sprint + bug tracking, roadmap | 9 eng teams |
| **Jira** | Legacy eng tracking | 6 teams (DataCore, FlowEngine) — being deprecated, resistance from senior leads |
| **Aha!** | Roadmap planning, OKR tracking, **milestone SoT for TPMs** | TPM + Product |
| **Productboard** | Product discovery, feature prioritization | Product |
| **Notion** | Design docs, runbooks, wikis | All — low governance, docs go stale |
| **Confluence** | Legacy docs (DataCore, Legal) | Migrating to Notion |
| **Slack** | Async comms, incident response | All — 1,200+ channels, high noise |
| **PagerDuty** | On-call, incident management | Engineering |
| **Vanta** | SOC 2 control tracking | Security (SHIELD) |
| **Datadog** | Observability — being migrated off ($2.1M/year) | Partial — NEXUS migrating to OTel |
| **Figma** | Product design + design system | Design |

## Key migration states (relevant for skills)

| Layer | Current (legacy) | Target | Program |
|-------|-----------------|--------|---------|
| API gateway | Custom v1 Go | Kong v2 | MERIDIAN |
| Auth | Auth0 (consumer) + Okta (enterprise) | Unified IAM (custom Go) | NEXUS |
| Observability | Datadog | OpenTelemetry → Grafana Cloud | NEXUS |
| Pipeline orchestration | Apache Airflow 2.6 | Temporal | PULSE |
| Data table format | Delta Lake | Apache Iceberg | DataCore |
| CI/CD | Jenkins (legacy) + GitHub Actions | GitHub Actions (unified) | NEXUS |

## TPM tooling friction notes

- **Linear vs Jira split:** cross-program status requires manual reconciliation — flag when running status skills
- **Aha! is milestone SoT** but engineers don't update it — TPMs must chase updates
- **Notion docs decay** — no ownership model, runbooks frequently stale
- **Slack signal/noise** — prefer named channels for program comms, avoid DMs for decisions
