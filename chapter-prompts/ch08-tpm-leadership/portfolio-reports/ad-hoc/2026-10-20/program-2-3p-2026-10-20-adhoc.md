# Kubernetes Platform Consolidation · 3P Report (Ad hoc)
**Program:** Kubernetes Platform Consolidation · **Owner:** Marcus Webb, Staff TPM · **Health:** 🔴 Red (→; Red since 2026-10-15) · **Last updated:** 2026-10-20
**Portfolio:** Platform Modernization · **Audience:** VP Engineering, Platform leadership, SRE Director
_Draft — owner confirmation needed (1 item)._

## Progress — What moved
- 44 of 68 services migrated (PRG2-118).
- Kafka migration runbook done (PRG2-160); Redis runbook in progress, due 2026-10-27 (PRG2-161).
- Reserved capacity approved by Cloud Finance on 2026-10-19 (CF-512).
- Joint review with Program 4 on 2026-10-17: network policies arrive in two drops, namespace-level on 2026-10-28 and service-level on 2026-11-11 (Decision log).
- Re-baseline proposed (PRG2-170): M3 → 2026-11-14, M4 → 2026-12-12. Awaiting decision.

## Plans — What comes next
| Milestone | Date | Confidence |
|---|---|---|
| M3 Stateful workloads migrated | 2026-10-31 (Jira; re-baseline proposes 2026-11-14) | Low |
| M4 Production cluster cutover (us-east-1) | 2026-11-21 (Jira; re-baseline proposes 2026-12-12) | Low |
| M5 Self-managed clusters decommissioned | 2027-01-16 | Medium |

**Next-cycle goals:** get a decision on PRG2-170, finish the Redis runbook, and take the namespace-level policies on 2026-10-28.

## Problems — What needs attention
| Risk | Owner | Mitigation |
|---|---|---|
| Service-level policies on 2026-11-11 leave 10 days before M4 (2026-11-21) | Marcus Webb | Re-baseline would give 31 days |
| Redis runbook slip would push stateful migration | Tomás Rivera, Eng Lead | PRG2-161 due 2026-10-27 |
| Two engineers leave 2026-11-01; backfill denied under Q4 headcount freeze (Slack 2026-10-20; not in Jira or Confluence — **Unverified**) | Platform Eng Manager | No mitigation recorded |

**Blocked dependencies:** none. Cloud Finance capacity (DEP-04) was approved on 2026-10-19.

**Escalations needed:**
- Red: M3 on 2026-10-31 will be missed without a decision.
- **Ask:** Platform leadership to approve or reject the re-baseline PRG2-170 by 2026-10-22.
- The 2026-10-15 ask to unblock FinOps is met (CF-512 approved). → Close it.

## Sources and gaps
- **Used:** Charter, Jira PRG2 (incl. CF-512), Confluence status and decision log, #program-2 Slack, migration tracker, dependency tracker, 2026-10-15 report.
- **Missing:** none.
- **Unverified:** backfill denial (Slack only).
- **Conflict:** the migration tracker shows 46 services, Jira shows 44. Jira used.
- **Owner question:** Confirm the migrated-service count, and whether the backfill denial is final.

Saved as portfolio-reports/ad-hoc/2026-10-20/program-2-3p-2026-10-20-adhoc.md.
