# T03 — /portfolio-reporting-agent ad hoc run · 2026-10-20 (prompt 05)

**Prompt run:** tests/chapter-8/runs/05-adhoc-agent-run.md

## Run summary (agent output)

**Reports saved:**
- portfolio-reports/ad-hoc/2026-10-20/program-1-3p-2026-10-20-adhoc.md (Draft, 1 question)
- portfolio-reports/ad-hoc/2026-10-20/program-2-3p-2026-10-20-adhoc.md (Draft, 1 question)
- portfolio-reports/ad-hoc/2026-10-20/program-3-3p-2026-10-20-adhoc.md
- portfolio-reports/ad-hoc/2026-10-20/program-4-3p-2026-10-20-adhoc.md
- portfolio-reports/executive/ad-hoc/platform-modernization-exec-2026-10-20-adhoc.md

**Programs skipped:** none.

**Questions for owners (asked once, at the end):**
1. Daniella: Is the Finance Data team a real dependency for M3? If so, add it to the dependency tracker.
2. Marcus Webb: Confirm the migrated-service count (Jira 44, tracker 46), and whether the backfill denial is final.

**Not changed:** last-report dates in the configs (ad hoc run).

## Checks

| Check | Result |
|---|---|
| One program per skill call | ✅ 4 calls |
| Trends compared with latest scheduled report before the date (2026-10-15) | ✅ |
| Decision log applied (D-03 headcount, D-04 P0 reviews) | ✅ Ask 1 drops the headcount option; P1's security ask closed; P4's ask kept because P4 is P1 |
| No invented dates | ⚠️ First draft of the P4 ask had two derived dates (2026-11-04, 2026-10-24) not in any source. Caught in the pre-save check and replaced with source-backed dates. |
| Never overwrite | ✅ No existing files touched |
