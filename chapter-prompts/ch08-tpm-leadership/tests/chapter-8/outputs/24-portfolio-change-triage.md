# 24 — Portfolio change triage · 2026-09-21 to 2026-10-20

**Sources:**
- Exec reports: 2026-10-15 (scheduled) and 2026-10-20 (ad hoc). Only 2 exist for the month; the earlier weeks are a gap.
- Decision log (portfolio config D-01..D-04)
- fixtures/evolution/okr-progress.md

## Artifact 1: triage

| Change | Program | First reported | Bucket | Reasoning |
|---|---|---|---|---|
| M3/M4 re-baseline needed (PRG2-170) | Kubernetes Platform Consolidation | 2026-10-15 | **Requires a re-plan decision now** | M3 (2026-10-31) will be missed before the next cycle, and 2 engineers leave 2026-11-01. Waiting means the miss happens without a plan. D-03 covers the headcount option only. |
| Security review blocked for a P1 program (SEC-91) | Zero-Trust | 2026-10-15 | Worth watching | Not covered by D-04 (P0 only). To move out: a SEC-91 date that fits before M3 on 2026-11-25. |
| M4 confidence Low | Program 1 | 2026-10-15 | Worth watching | The review on 2026-10-23 and the dry run on 2026-10-24 decide it. To move out: both pass. |
| Finance Data dependency (Unverified) | Program 1 | 2026-10-20 | Worth watching | Not confirmed. To move out: owner confirms or drops it. |
| Splunk go/no-go depends on Program 2 | Observability | 2026-10-15 | Worth watching | Resolves with the PRG2-170 decision. To move out: the decision, plus the Program 3 recommendation by 2026-11-10. |
| Spend +6% vs +5% guardrail | Observability | 2026-10-20 | Worth watching | Trending down. To move out: under 5%. |
| Network policy two-drop plan | Zero-Trust → Kubernetes | 2026-10-15 (slip) | Worth watching | Leaves a 10-day buffer on current dates. To move out: the PRG2-170 decision sets the buffer. |
| Security slot for Program 1 | Program 1 | 2026-10-15 | Noise (resolved) | Scheduled 2026-10-23; covered by D-04. Not re-raised. |
| Cloud Finance capacity | Kubernetes | 2026-10-15 | Noise (resolved) | Approved 2026-10-19. |

## Artifact 2: OKR impact (last two buckets)

| Change | OKR affected | OKR progress | Impact on target | Related executive decision | What would move it to a lower bucket |
|---|---|---|---|---|---|
| Kubernetes re-baseline | O1-KR2 (2027-01-31) | 65% migrated | At risk (a 2026-12-12 M4 keeps M5 on 2027-01-16) | D-03 (no headcount) | Approve or reject PRG2-170 |
| SEC-91 unscheduled | O3-KR1 (2026-12-15) | 0% | At risk | D-04 doesn't cover P1 programs | A review date |
| Program 1 M4 Low | O1-KR1 (2026-11-30) | 0% | At risk | D-01 (M4 committed) | Review and dry run pass 10-23/10-24 |
| Finance Data dependency | O1-KR1 | 0% | At risk (Unverified) | none | Owner confirmation |
| Splunk go/no-go | O2-KR1 (2026-12-31) | 9% | At risk | none | PRG2-170 decision |
| Spend over guardrail | O2-KR1 | 9% | None (spend trend helps the KR) | none | — |
| Two-drop plan | O1-KR2 via Program 2 M4 | 65% | At risk | none | PRG2-170 decision |
