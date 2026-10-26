# Program 1 · 3P Report (Ad hoc)
**Program:** Program 1 · **Owner:** Daniella, Senior TPM · **Health:** 🟡 Yellow (↑; Yellow in 2026-10-08 and 2026-10-15 scheduled reports) · **Last updated:** 2026-10-20
**Portfolio:** Platform Modernization · **Audience:** VP Engineering, Platform leadership
_Draft — owner confirmation needed (1 item)._

## Progress — What moved
- Schema validation script delivered 2026-10-19: 12 mismatches found, 9 fixed (PRG1-245, PRG1-246).
- Security review session for the data-retention design scheduled for 2026-10-23 (SEC-88).
- 2 of 4 carried items closed (PRG1-240, PRG1-241); PRG1-242 and PRG1-243 are in progress.
- Decision: if billing-table mismatches are still open on 2026-10-23, the dry run uses a 10% sample without billing tables (Decision log, 2026-10-17).

## Plans — What comes next
| Milestone | Date | Confidence |
|---|---|---|
| M3 Data migration dry run | 2026-10-24 | Medium |
| M4 Production migration | 2026-11-14 | Low (unchanged; no source changes it before the 2026-10-23 review) |
| M5 Legacy decommission | 2026-12-12 | Medium |

**Next-cycle goals:** close the last 3 billing-table mismatches (PRG1-247, due 2026-10-23), pass the Security review on 2026-10-23, and run the dry run on 2026-10-24.

## Problems — What needs attention
| Risk | Owner | Mitigation |
|---|---|---|
| 3 billing-table mismatches could force a partial dry run | Priya Shah, Eng Lead | PRG1-247 due 2026-10-23; fallback is the 10% sample (decision 2026-10-17) |
| Security review on 2026-10-23 could require design changes that push M4 | Daniella | Review scheduled; no mitigation recorded for a failed review |
| Finance Data team input needed on billing target types — **Unverified** (Slack only; not in Jira or the dependency tracker) | Priya Shah | Pinged 2026-10-19, no reply |

**Blocked dependencies:** none. The Security review (DEP-01) moved from Blocked to Scheduled on 2026-10-20.

**Escalations needed:**
- Yellow twice in a row (2026-10-08, 2026-10-15) and still Yellow.
- The 2026-10-15 ask ("VP Engineering to secure a Security slot by 2026-10-22") is met: SEC-88 was scheduled on 2026-10-20. → Close the ask.
- No new ask. Watch the Finance Data team input: if there's no reply by 2026-10-22, it becomes an external blocker on M3.

## Sources and gaps
- **Used:** Charter, Jira PRG1 (incl. SEC-88), Confluence status, decision log and milestone plan, #program-1 Slack, dependency tracker, 2026-10-15 report.
- **Missing:** #program-1-eng (no access, file not found).
- **Unverified:** Finance Data team dependency (Slack 2026-10-19 only).
- **Conflicts:** none. The 2026-10-15 conflict is resolved: Confluence now shows M3 on 2026-10-24, matching Jira. The rumored 2026-10-21 Security slot is superseded by SEC-88 (2026-10-23).
- **Owner question:** Is the Finance Data team a real dependency for M3? If so, add it to the dependency tracker.

Saved as portfolio-reports/ad-hoc/2026-10-20/program-1-3p-2026-10-20-adhoc-v2.md (same sources as the first ad hoc run; content unchanged).
