# Template: QBR / MBR

Referenced by: `/tpm-qbr-prep`

> A QBR (Quarterly Business Review) or MBR (Monthly Business Review) answers one question: are we on track to hit what we said we'd hit, and if not, what are we doing about it?
> The point is not to narrate what happened — it's to show the delta between plan and actuals, explain the gap, and make a clear ask for the next period.

---

```markdown
# [Program Name] — [Q1 2026 / March 2026] Business Review

**Date:** YYYY-MM-DD
**Presenter:** [TPM name]
**Program phase:** [Phase]
**Review type:** QBR / MBR

---

## Program Health: [Period]

**Overall:** 🔴 Behind / 🟡 At risk / 🟢 On track

| Dimension | Start of period | End of period | Change |
|-----------|----------------|--------------|--------|
| Schedule | 🟢/🟡/🔴 | 🟢/🟡/🔴 | ↑↓→ |
| Scope | | | |
| Resources | | | |
| Risk exposure | | | |

---

## OKR Contribution

| OKR | Key Result | Target | Actual | Status |
|-----|-----------|--------|--------|--------|
| [O-N: OKR title] | [KR-N.N: Key Result] | [Target] | [Actual] | 🟢/🟡/🔴 |

---

## What We Planned vs. What We Delivered

| Milestone | Planned date | Delivered | Notes |
|-----------|-------------|-----------|-------|
| ✅ [Milestone] | YYYY-MM-DD | YYYY-MM-DD | On time |
| 🟡 [Milestone] | YYYY-MM-DD | Slipped to YYYY-MM-DD | [Why it slipped] |
| 🔴 [Milestone] | YYYY-MM-DD | Not delivered | [Blocking reason] |

**Completion rate:** [N of N] milestones delivered as planned ([%])

---

## What Changed from the Original Plan

1. **[Change 1]** — [What changed, why it changed, and impact on the program]
2. **[Change 2]** — [...]

*If nothing changed: "No scope changes this period. Plan is tracking as committed."*

---

## Key Decisions Made This Period

| Decision | Made by | Date | Outcome / Downstream commitment |
|---------|---------|------|--------------------------------|
| [What was decided] | [Name + role] | YYYY-MM-DD | [What this commits us to] |

---

## Top Risks Going into Next Period

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|-----------|-------|
| [Risk description] | High/Med/Low | Critical/High/Med | [What's being done] | [Name] |

*Max 3–5 risks. These should be the ones that could derail the next period — not the full risk register.*

---

## Ask for Next Period

> **[One clear ask — resource, decision, or scope change needed to stay on track]**

**Context:** [1–2 sentences explaining why this ask is needed now and what happens if it's not addressed]

**Options:**
- **Option A:** [...]
- **Option B:** [...]

**Recommendation:** Option [A/B] — [one sentence rationale]

**Decision needed by:** YYYY-MM-DD (after this date: [consequence])

---

## Next Period Outlook

| Milestone | Target date | Confidence | Key dependency |
|-----------|-----------|-----------|----|
| [Milestone] | YYYY-MM-DD | High / Med / Low | [Blocker or dep if any] |

**Forecast:** [One-sentence summary of what next period looks like and what has to go right]
```

---

## Filled Example (NovaGrid — SHIELD Q1 2026 QBR)

```markdown
# SHIELD — Q1 2026 Business Review

**Date:** 2026-04-01
**Presenter:** Fatima Al-Hassan
**Program phase:** Execution (Month 3 of 8)
**Review type:** QBR

## Program Health: Q1 2026

**Overall:** 🔴 Behind

| Dimension | Start of Q1 | End of Q1 | Change |
|-----------|------------|----------|--------|
| Schedule | 🟡 | 🔴 | ↓ |
| Scope | 🟢 | 🟢 | → |
| Resources | 🟡 | 🔴 | ↓ |
| Risk exposure | 🟡 | 🔴 | ↓ |

## OKR Contribution

| OKR | Key Result | Target | Actual | Status |
|-----|-----------|--------|--------|--------|
| O2: Enterprise Trust | KR2.1: SOC 2 Type II certified Aug 2026 | 40 controls by Apr 1 | 67 controls — 33 not started | 🔴 |
| O2: Enterprise Trust | KR2.2: CISO sign-off on all control owners | 100% owners by Mar 31 | 67% owners assigned | 🔴 |

## What We Planned vs. What We Delivered

| Milestone | Planned date | Delivered | Notes |
|-----------|-------------|-----------|-------|
| ✅ Controls framework baseline | 2026-01-31 | 2026-01-29 | 2 days early |
| 🟡 40 controls started | 2026-03-31 | Not fully delivered — 67 started, 33 not started | Model Serving (6) and 5 other teams unresponsive |
| 🔴 All control owners assigned | 2026-03-31 | Not delivered | Exec mandate not yet in place |

**Completion rate:** 1 of 3 milestones fully delivered (33%)

## What Changed from the Original Plan

1. **No exec mandate for team ownership** — Original plan assumed VP Eng would issue a directive in January. Directive not issued. Result: 8 teams are deprioritizing SHIELD against Q1 product roadmap. Impact: 33 controls unstarted.
2. **NEXUS IAM delivery moved to Jul 2026** — Was scheduled for Apr 2026. 14 SHIELD controls depend on NEXUS IAM. These 14 controls are now hard-blocked until July.

## Top Risks Going into Q2

| Risk | Likelihood | Impact | Mitigation | Owner |
|------|-----------|--------|-----------|-------|
| Model Serving unresponsive through Q2 | High | Critical — 6 controls blocked → M2 misses | Karl B. escalation to Leo Nakamura | Karl Bergstrom |
| NEXUS IAM Jul delivery slip | Medium | High — 14 controls shift to Aug, no time for audit prep | Sara Lindqvist to confirm NEXUS M6 timeline | Sara Lindqvist |
| Deloitte pre-audit readiness review Aug 1 — no buffer | High | Critical — any single dep slip = audit failure | Weekly SHIELD/NEXUS/MERIDIAN sync | Fatima Al-Hassan |

## Ask for Q2

> **Yuki Tanaka issues written exec mandate: SHIELD is P0 across all 8 Engineering divisions**

**Context:** Without this mandate, team leads will continue deprioritizing SHIELD against their Q2 roadmaps. 33 controls remain unowned. Aug 15 Deloitte audit — already contracted for $180K — will fail.

**Options:**
- **Option A:** Yuki issues written directive this week — SHIELD controls are non-negotiable P0 alongside roadmap
- **Option B:** Reduce SHIELD scope to 80 controls and accept partial SOC 2 scope with Deloitte

**Recommendation:** Option A — scope reduction in Option B is not viable; it voids our enterprise customer commitments and the audit contract.

**Decision needed by:** 2026-04-08 (after this date, M2 Apr 30 is unachievable)

## Q2 Outlook

| Milestone | Target date | Confidence | Key dependency |
|-----------|-----------|-----------|----|
| 50 controls complete (M2) | 2026-04-30 | Low | Exec mandate must be in place by Apr 8 |
| MERIDIAN audit logging unblocked | 2026-04-15 | Medium | MERIDIAN Q2 roadmap prioritization |
| NEXUS IAM unblocked (14 controls) | 2026-07-01 | Medium | NEXUS M6 — tracking Sara Lindqvist |

**Q2 forecast:** Achievable only if exec mandate lands in first 2 weeks of April. Without it, M2 slips to June and the August audit becomes unexecutable.
```
