# Template: Blocker Log

Referenced by: `/tpm-extract-blockers`, `/tpm-raid-log`

> A blocker is something that has already materialized and is preventing work from proceeding. Not a risk (might happen), not a concern (might slow things), but an active impediment.
> Every blocker needs: a clear impact statement, a named owner, a resolution path with next action, and an escalation trigger if it's not resolved in time.

---

```markdown
# Blocker Log — [Program Name]

**TPM:** [Name]
**Last updated:** YYYY-MM-DD HH:MM
**Program phase:** [Phase]

---

## Summary

| Total | Critical (🔴) | High (🟠) | Medium (🟡) | Resolved this week | Escalated |
|-------|--------------|----------|------------|-------------------|-----------|
| | | | | | |

**Blockers older than 5 days with no resolution progress:** [N] — requires escalation review

---

## Active Blockers

| ID | Blocker | Severity | Impact | Owner | Raised | Due | Status |
|----|---------|----------|--------|-------|--------|-----|--------|
| BL-001 | | 🔴/🟠/🟡 | [What can't proceed] | [Name] | YYYY-MM-DD | YYYY-MM-DD | 🔴 Open / 🟡 In progress / 🟢 Resolved |

---

## Blocker Detail

### BL-001 — [Blocker Title]

**Severity:** 🔴 Critical (program at risk) / 🟠 High (milestone delayed) / 🟡 Medium (work slowed)
**Raised:** YYYY-MM-DD by [Name]
**Owner:** [Person accountable for resolution]
**Due:** YYYY-MM-DD (after this date, milestone impact is confirmed)

**What is blocked:**
> [Specific work, milestone, or team that cannot proceed until this is resolved]

**Root cause:**
> [Why is this blocked? Technical issue / missing decision / external dependency / resource gap / org friction]

**Resolution path:**

| Step | Owner | Due | Done? |
|------|-------|-----|-------|
| [Immediate next action] | [Name] | [Date] | ☐ |
| [If step 1 fails, escalate to...] | [Name] | [Date] | ☐ |

**Escalation trigger:**
> [If not resolved by DATE, escalate to NAME. At that point, impact becomes: CONSEQUENCE.]

**Related risks / RAID items:** [R-XXX / I-XXX]

---

## Resolved Blockers

| ID | Blocker | Raised | Resolved | Resolution | Age (days) |
|----|---------|--------|---------|------------|-----------|
| | | | | | |

---

## Blocker Trends

| Week | New | Resolved | Net | Escalated |
|------|-----|----------|-----|-----------|
| [Date] | | | | |
```

---

## Filled Example (NovaGrid — SHIELD)

```markdown
# Blocker Log — SHIELD (SOC 2 Type II)

**TPM:** Fatima Al-Hassan
**Last updated:** 2026-03-11
**Program phase:** Execution

## Summary

| Total | Critical (🔴) | High (🟠) | Medium (🟡) | Resolved this week | Escalated |
|-------|--------------|----------|------------|-------------------|-----------|
| 4 | 2 | 1 | 1 | 0 | 2 |

**Blockers older than 5 days with no resolution progress:** 2 (BL-001, BL-002) — escalated

## Active Blockers

| ID | Blocker | Severity | Impact | Owner | Raised | Status |
|----|---------|----------|--------|-------|--------|--------|
| BL-001 | Model Serving: no control owners assigned after 2 reminders | 🔴 Critical | 6 controls blocked — M2 at risk | Leo Nakamura | 2026-03-04 | Escalated to Karl Bergstrom |
| BL-002 | NEXUS IAM delivery Jul 2026 — 14 SHIELD controls depend on it | 🔴 Critical | M3 + M5 blocked until Jul | Sara Lindqvist | 2026-02-18 | In escalation — dependency acknowledged |
| BL-003 | MERIDIAN API audit logging — feature deprioritized for Q2 roadmap | 🟠 High | 8 controls blocked until Apr at earliest | Fatima Al-Hassan | 2026-03-08 | Resolution path in progress |
| BL-004 | Auth0 contract decision pending — CISO not responding | 🟡 Medium | NEXUS M3 blocked, indirect SHIELD impact | James Whitfield | 2026-02-24 | Escalated by Sara Lindqvist |

## Blocker Detail

### BL-001 — Model Serving team unresponsive

**Severity:** 🔴 Critical
**Raised:** 2026-03-04 by Fatima Al-Hassan
**Owner:** Leo Nakamura (VP, Model Serving)
**Due:** 2026-03-15

**What is blocked:**
> 6 SHIELD controls in the Model Serving domain have no assigned owner despite 2 email reminders. Controls cannot be implemented without team ownership.

**Root cause:**
> Org friction — Leo Nakamura has not prioritized SHIELD against Model Serving roadmap. No exec mandate in place.

**Resolution path:**

| Step | Owner | Due | Done? |
|------|-------|-----|-------|
| Karl Bergstrom direct conversation with Leo + CISO cc | Karl Bergstrom | 2026-03-14 | ☐ |
| If unresolved: escalate to Yuki Tanaka as org blocker | Fatima Al-Hassan | 2026-03-15 | ☐ |

**Escalation trigger:**
> If no owner assigned by Mar 15, escalate to Yuki Tanaka. Impact: M2 (50 controls) misses Apr 30 — audit timeline at risk.
```
