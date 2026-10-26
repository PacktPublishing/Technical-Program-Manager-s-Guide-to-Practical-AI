# Template: RAID Log

Referenced by: `/tpm-raid-log`

> RAID = Risks · Assumptions · Issues · Dependencies
> This is the consolidated view. For deeper tracking, see:
> — `templates/02-planning/risk-register.md` (full risk detail + mitigation plans)
> — `templates/04-execution/blocker-log.md` (active issues requiring immediate action)
> — `templates/cross-program-dependencies-template.md` (cross-team dependency surface)

---

```markdown
# RAID Log — [Program Name]

**TPM:** [Name]
**Last updated:** YYYY-MM-DD
**Review cadence:** Weekly
**Program phase:** [Current phase]

---

## RAG Summary

| Category | Open items | Critical | Owner attention needed |
|----------|-----------|----------|----------------------|
| 🔴 Risks | | | |
| 🟡 Assumptions | | | |
| 🟠 Issues | | | |
| 🔵 Dependencies | | | |

---

## Risks

> Potential events that could negatively affect program objectives.
> Likelihood × Impact = Priority. Every risk needs an owner.

| ID | Risk | Likelihood | Impact | Priority | Owner | Mitigation | Status |
|----|------|-----------|--------|----------|-------|-----------|--------|
| R-001 | | H/M/L | H/M/L | 🔴/🟡/🟢 | | | Open / Mitigated / Closed |

---

## Assumptions

> Things believed true but not formally validated.
> Each assumption is a risk if wrong. Validate before they become issues.

| ID | Assumption | Basis | Validated? | Owner | Due | Risk if wrong |
|----|-----------|-------|-----------|-------|-----|--------------|
| A-001 | | | Yes / No / Partial | | | |

---

## Issues

> Active problems already affecting the program. Unlike risks, these have materialized.

| ID | Issue | Impact | Owner | Resolution path | Due | Status |
|----|-------|--------|-------|----------------|-----|--------|
| I-001 | | High / Med / Low | | | | Open / In progress / Resolved |

---

## Dependencies

> What this program needs from external teams, and what others need from it.

| ID | Dependency | Direction | Source / Target | Required by | Risk if late | Status |
|----|-----------|-----------|----------------|-------------|-------------|--------|
| D-001 | | Inbound / Outbound | [Program or team] | YYYY-MM-DD | [Milestone impact] | 🟢/🟡/🔴 |

---

## Weekly Review Notes

**Week of:** [Date]
**Reviewed by:** [Names]

**New items this week:**
- [New risk / assumption / issue / dependency]

**Closed items this week:**
- [Item closed — reason]

**Items escalated:**
- [Item requiring action above TPM level]

**Overall RAID health:** 🟢 Stable / 🟡 Watch / 🔴 Deteriorating
```

---

## Filled Example (NovaGrid — SHIELD program)

```markdown
# RAID Log — SHIELD

**TPM:** Fatima Al-Hassan
**Last updated:** 2026-03-11
**Review cadence:** Weekly
**Program phase:** Execution

## RAG Summary

| Category | Open items | Critical | Owner attention needed |
|----------|-----------|----------|----------------------|
| 🔴 Risks | 6 | 3 | Yes — R-001, R-002, R-005 |
| 🟡 Assumptions | 1 | 0 | Monitor |
| 🟠 Issues | 2 | 2 | Yes — I-001, I-002 |
| 🔵 Dependencies | 3 | 2 | Yes — D-001, D-002 |

## Risks

| ID | Risk | Likelihood | Impact | Priority | Owner | Mitigation | Status |
|----|------|-----------|--------|----------|-------|-----------|--------|
| R-001 | 33 controls not started — teams deprioritizing for roadmap | H | Critical | 🔴 | Yuki Tanaka | Exec mandate required for all 8 teams | Open — not yet actioned |
| R-002 | NEXUS IAM delay blocks 14 Shield controls | H | Critical | 🔴 | Sara L. / Fatima A. | NEXUS IAM M6 (Jul) on critical path | Escalated |
| R-003 | Model Serving team (12 controls) — 6 unstarted, no owner | H | H | 🔴 | Leo N. | Karl B. raising with Leo directly | In progress |

## Issues

| ID | Issue | Impact | Owner | Resolution path | Due | Status |
|----|-------|--------|-------|----------------|-----|--------|
| I-001 | Model Serving unresponsive — no control owners assigned despite 2 reminders | 6 controls blocked | Leo Nakamura | Karl B. direct conversation + cc CISO | Mar 15 | 🔴 Active |
| I-002 | August external audit date immovable — $180K contract already signed | Hard deadline | James Whitfield | Must hit all milestones — no mitigation | — | Constraint |

## Dependencies

| ID | Dependency | Direction | Source / Target | Required by | Risk if late | Status |
|----|-----------|-----------|----------------|-------------|-------------|--------|
| D-001 | NEXUS IAM unification (14 controls) | Inbound | NEXUS | Jul 2026 | 14 controls cannot complete | 🔴 At risk |
| D-002 | MERIDIAN v2 API audit logging (8 controls) | Inbound | MERIDIAN | Apr 2026 | 8 controls blocked | 🟡 Monitoring |
| D-003 | PULSE Temporal audit trail (6 controls) | Inbound | PULSE | Aug 2026 | 6 controls at risk | 🟡 Monitoring |
```
