# Observability Consolidation (DataDog) · 3P Report (Ad hoc)
**Program:** Observability Consolidation (DataDog) · **Owner:** Aisha Okafor, TPM · **Health:** 🟢 Green (→) · **Last updated:** 2026-10-20
**Portfolio:** Platform Modernization · **Audience:** VP Engineering, SRE Director, Platform leadership

## Progress — What moved
- Metrics migration at 55 of 68 services (PRG3-077).
- Tier-1 SLO dashboards: 9 of 14 done (PRG3-100).
- Log exclusion filters and retention tiers done (PRG3-104, PRG3-105). Tiers ratified as 15 days hot and 90 days archive (Decision log 2026-10-17).
- Log ingest down 11% week over week. Projected spend vs plan is now +6%, down from +15% (DataDog dashboard).

## Plans — What comes next
| Milestone | Date | Confidence |
|---|---|---|
| M3 Tier-1 SLO dashboards | 2026-10-30 | High |
| M4 Splunk contract exit | 2026-12-01 | Medium |
| M5 APM tracing on tier-1 | 2027-01-15 | Medium |

**Next-cycle goals:** finish the 5 remaining dashboards, and prepare the Splunk go/no-go recommendation for Procurement (due 2026-11-10).

## Problems — What needs attention
| Risk | Owner | Mitigation |
|---|---|---|
| Projected spend +6% exceeds the charter guardrail of +5% | Ken Liu, Eng Lead | Filters applied 2026-10-17; trending down. No new date to get under 5% |
| Splunk go/no-go (2026-11-10) depends on Program 2 migration waves; Program 2 is Red | Aisha Okafor | Agent auto-enrolls via Helm chart; recommendation depends on the PRG2-170 decision |

**Blocked dependencies:** none.

**Escalations needed:** none. Heads-up: the PRG2-170 decision sets whether M4 stays Medium.

## Sources and gaps
- **Used:** Charter, Jira PRG3, Confluence, #program-3 Slack, DataDog dashboard, procurement calendar, dependency tracker, 2026-10-15 report.
- **Missing:** none.
- **Unverified:** none.
- **Conflicts:** none.

Saved as portfolio-reports/ad-hoc/2026-10-20/program-3-3p-2026-10-20-adhoc.md.
