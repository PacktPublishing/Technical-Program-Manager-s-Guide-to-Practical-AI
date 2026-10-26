# Program 1 — Deep Dive (Ad hoc) · 2026-10-20

**For:** VP Engineering
**Sources:**
- Scheduled 3P reports: 2026-09-24, 2026-10-01, 2026-10-08, 2026-10-15 (4 of 4 needed)
- Ad hoc 3P report: 2026-10-20 (-v2)
- Portfolio executive reports: 2026-10-15 (scheduled) and 2026-10-20 (ad hoc)
- Portfolio config

## Verdict

Program 1 went from Green (09-24, 10-01) to Yellow (10-08) and has stayed Yellow, but the signals are now improving. The blocker behind the Yellow, the Security review, is scheduled for 2026-10-23 (Ad hoc 10-20). The committed M4 (2026-11-14, D-01) depends on two events this week: the Security review on 10-23 and the dry run on 10-24 (Ad hoc 10-20).

## Health trend

| Report | Health | Trend | Driver (source) |
|---|---|---|---|
| 2026-09-24 | 🟢 Green | — | Security review requested, no slot (09-24) |
| 2026-10-01 | 🟢 Green | → | Schema mismatches found in sample (10-01) |
| 2026-10-08 | 🟡 Yellow (1st) | ↓ | M2 slipped; Security review blocked since 10-06 (10-08) |
| 2026-10-15 | 🟡 Yellow (2nd) | → | Security still blocked; M4 Low; ask raised to VP Eng (10-15) |
| 2026-10-20 ad hoc | 🟡 Yellow | ↑ | Security scheduled 10-23; 9 of 12 mismatches fixed (Ad hoc 10-20) |

No health status disagrees with the definitions.

## Milestones

| Milestone | First reported | Now | Slip | Confidence history |
|---|---|---|---|---|
| M2 API Gateway cutover | 2026-10-06 (09-24) | Done 2026-10-13 (10-15) | +7 days | High → Med → Med → Done |
| M3 Dry run | 2026-10-17 (09-24) | 2026-10-24 (Ad hoc 10-20) | +7 days | High → Med → Med → Med → Med |
| M4 Production migration (committed, D-01) | 2026-11-14 | 2026-11-14 | none | Med → Med → Med → Low → Low |
| M5 Legacy decommission | 2026-12-12 | 2026-12-12 | none | Med throughout |

**Recurring risks and blockers:**
- **Security review** has been in every report since 09-24. It was requested 09-22, blocked from 10-06, and scheduled 10-20 for a session on 10-23 (09-24 → Ad hoc 10-20).
- **Schema mismatches** have been in every report since 10-01. The validation script was due 10-14, slipped to 10-20, and was done 10-19. 3 mismatches remain, due 10-23 (10-01, 10-08, Ad hoc 10-20).

**Escalations:**
- 10-08: none ("monitoring one more week").
- 10-15: ask to VP Eng. Met on 10-20 (Ad hoc 10-20).

**New since 10-15:**
- Validation script delivered.
- Security session booked.
- Fallback decision (10% sample, 10-17).
- Finance Data team input needed (**Unverified**, Slack only) (Ad hoc 10-20).

## Root causes

| Issue | Likely root cause | Evidence |
|---|---|---|
| M2 slip | Quality: auth load test failed at 1.5x on 10-03 | 10-08 report |
| M3 slip | Sequencing: M3 moved in the same report as M2 | **Hypothesis**: the reports don't say why M3 moved |
| Validation script slip (10-14 → 10-20) | Capacity: same eng lead owns the auth fix and the schema work | **Hypothesis**: owner overlap is shown (Priya Shah on PRG1-231 and PRG1-245), but no report names capacity as the cause |
| Security review delay | Dependency delay: Security Eng "backlog full, no slot" | 10-08 report |
| Security review delay (contributing) | Unclear lead-time ownership: requested 09-22 with no agreed date for a 11-14 milestone | **Hypothesis** |
| Billing-table mismatches | Unclear ownership: needs a team that isn't in the dependency tracker | **Hypothesis**: Slack only (Ad hoc 10-20) |

## Portfolio risks and dependencies

- **Programs that depend on Program 1:** Kubernetes Platform Consolidation M5 (gateway workloads move after Program 1 M5 on 2026-12-12), with about 5 weeks of float (P2 3P 10-15; Exec 10-20).
- **Teams Program 1 depends on:**
  - Security Eng (DEP-01)
  - Finance Data team (**Unverified**)
- **Shared bottleneck:** Security Eng, with Program 4. Program 1's P0 slot was resolved through D-04; Program 4's wasn't (Exec 10-20).
- **Big bets and OKRs:** BB-1 and BB-3. O1-KR1 (target 2026-11-30) has 16 days of buffer after M4 (Portfolio config).
- **Executive attention:** nothing new this week. Why it matters soon: if the 10-23 review asks for design changes, or the dry run runs on the 10% fallback, M4 needs a decision before the 2026-10-29 scheduled report. No mitigation is recorded for a failed review (Ad hoc 10-20).

## Gaps

- #program-1-eng was missing from all 5 reports.
- No report states why M3 moved.
- No report states M4's exit criteria, so it's unknown whether the 3 open mismatches block M4. (The charter isn't a listed source for this prompt.)
- Finance Data dependency is Unverified.

## Executive Q&A (VP Engineering)

1. **Will M4 land on 2026-11-14?** Confidence is Low. It depends on the Security review on 10-23 and the dry run on 10-24 (Ad hoc 10-20).
2. **Is the Security problem solved?** A session is booked for 10-23 (SEC-88), and the ask to you is closed. The reports don't record a fallback if the review fails (Ad hoc 10-20).
3. **What if the billing mismatches aren't fixed by 10-23?** The dry run uses a 10% sample without billing tables (decision 10-17). The reports can't say whether that is enough for M4. Missing: the severity of the 3 open mismatches.
4. **Does a Program 1 slip hurt other programs?** Only Kubernetes Platform Consolidation M5, which has about 5 weeks of float (P2 3P 10-15).
5. **Do you need anything from me?** Not this week (Ad hoc 10-20). A possible ask is help reaching the Finance Data team if they haven't replied by 10-22. That is still Unverified.

Saved as portfolio-reports/ad-hoc/2026-10-20/program-1-deep-dive-2026-10-20-adhoc.md.
