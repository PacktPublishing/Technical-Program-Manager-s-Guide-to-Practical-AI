# Decision Record: NEXUS IAM — Scope Auth0-Only Fast Path as Fallback to Aug 28 Delivery

**ID:** DR-20260418-003
**Date:** April 18, 2026
**Status:** Proposed — awaiting Yuki Tanaka authorization by May 1, 2026
**Decision Maker(s):** Yuki Tanaka (VP Engineering) — decision pending
**Program:** NEXUS (cascades to SHIELD, HORIZON, ATLAS)
**Facilitated by:** Sara Lindqvist (TPM NEXUS), Karl Bergstrom (Head TPM)
**Estimate owner:** Sara Lindqvist + Ingrid Solvang

---

## Context

The NEXUS IAM unified service (M6) slipped from July 31 to August 28 on March 18 when the CISO (James Whitfield) punted on the Auth0 contract renewal decision for the third time. The August 28 delivery date creates a cascade: 14 SHIELD controls cannot complete before the Deloitte audit window, HORIZON GA cannot happen before August 31 (with zero buffer), and ATLAS is accruing Auth0 workaround technical debt. Combined revenue exposure from HORIZON-dependent deals: approximately $4M.

On April 14, Sara Lindqvist and Ingrid Solvang began scoping an alternative: an Auth0-only IAM build that bypasses the full NEXUS IAM unification service. The formal estimate was delivered April 18: Auth0-only IAM can deliver mobile and enterprise SSO by June 30 (8 engineers, 10 weeks). This does not require the Auth0 contract renewal decision — it uses Auth0 as the permanent IAM provider for mobile SSO, deferring full NEXUS IAM unification to H2 2026.

Yuki Tanaka is reviewing the estimate over the weekend (April 19-20). Decision required by May 1 — after that date, the build cannot complete by June 30.

---

## Decision Drivers

- August 28 IAM delivery puts 14 SHIELD controls outside the Deloitte evidence window (July 15)
- HORIZON needs IAM by June for GA July 31 — August 28 NEXUS delivery creates zero buffer and forced GA slip to August 31
- Kestrel Media ($1.6M) and Solaris Logistics ($2.4M) deals depend on HORIZON GA date
- Auth0-only path does not require CISO cooperation on contract renewal — removes the single most persistent decision blocker in the portfolio
- June 30 IAM delivery via Auth0-only recovers SHIELD M4, HORIZON GA Jul 31, and ATLAS debt trajectory simultaneously

---

## Options Considered

### Option A: Wait for full NEXUS IAM unification (current plan — Aug 28)
**Description:** Continue with NEXUS M6 as scoped. Full IAM unification service delivered August 28.
**Pros:** Clean architecture — single IAM service as originally designed. No tech debt from dual-path.
**Cons:** August 28 delivery. 14 SHIELD controls blocked until then. HORIZON GA August 31. $4M in deals at elevated risk. Zero buffer for any further slip.

### Option B: Auth0-only IAM fast path by June 30 + full unification deferred to H2
**Description:** Build a standalone Auth0-only IAM service (mobile SSO + enterprise SSO) on a 10-week timeline. Deliver June 30. Full NEXUS IAM unification (multi-provider, unified service) deferred to H2 2026 as a separate initiative.
**Pros:** June 30 delivery recovers 14 SHIELD controls (unblocked July 1), HORIZON GA returns to July 31, Auth0 workaround in ATLAS can begin paydown after July. Removes CISO dependency — no Auth0 contract renewal needed for the fast path (Auth0 as the long-term provider).
**Cons:** Creates technical bifurcation: Auth0-only fast path + future full IAM unification. Full IAM unification becomes H2 2026 scope — increases H2 engineering load. Teams must manage two IAM codepaths during the transition window.

### Option C: Negotiate with CISO for emergency Auth0 contract decision
**Description:** Escalate to Priya Anand (CEO) to force James Whitfield's hand on the Auth0 contract decision before April 30.
**Pros:** If contract decision made in time, original NEXUS M6 July 31 timeline may be partially recoverable.
**Cons:** CISO has punted three times. CEO escalation required — politically costly. Contract renewal still takes 90 days minimum, meaning decision needed before April 30 to avoid slipping past July 31 further. At this point in the calendar, even an immediate decision delivers IAM in late July at best — SHIELD and HORIZON still lose most of the July window.

---

## Decision

**Proposed:** Authorize the Auth0-only IAM fast path (Option B). Begin 10-week build immediately. Target delivery: June 30, 2026.

**Rationale (Sara's recommendation to Yuki):**
Option A accepts $4M in deal exposure and a high-probability Deloitte gap with no upside. Option C requires CEO escalation for a decision that may still not recover July. Option B eliminates the CISO dependency entirely and recovers the entire portfolio cascade — SHIELD, HORIZON, ATLAS, and $4M in deals — for the cost of deferring full IAM unification 6 months. The technical debt created is real but bounded and planned.

---

## Consequences (if authorized)

**Positive:**
- NEXUS IAM delivery: August 28 → June 30 (2-month recovery)
- SHIELD: 14 blocked controls unblocked from July 1. M4 (100 controls, July target) becomes feasible.
- HORIZON: GA recoverable from August 31 → July 31
- ATLAS: Auth0 workaround paydown can begin July — estimated 3-week refactor
- Kestrel Media deal: partial delivery (Jul 15 $800K) potentially upgradeable to full delivery (Jul 31) — contract amendment possible
- Solaris Logistics: Tom Okafor's 30-day window (expires ~May 10) — July 31 commitment becomes possible before deadline
- Removes single most persistent blocker in the portfolio without requiring CISO action

**Negative / Trade-offs:**
- Full NEXUS IAM unification deferred to H2 2026 — adds H2 engineering scope
- Auth0 becomes the long-term IAM provider (not originally designed as permanent) — architectural trade-off
- 8 engineers at full capacity for 10 weeks — opportunity cost across other NEXUS work (M4 service retirement may slip 1-2 weeks)
- Two IAM codepaths in transition window (July-H2 2026)

**Risks (if authorized):**
- Auth0-only build slips past June 30 — Mitigation: Sara to identify 2-week buffer checkpoints in build plan. Weekly status to Karl.
- H2 2026 full IAM unification scoping not started — Mitigation: Begin scoping during fast path build; deliver charter by August.

**Consequences if NOT authorized (Option A path):**
- 14 SHIELD controls remain blocked through August. M4 July target infeasible.
- HORIZON GA August 31 confirmed. Kestrel Oct deal at risk. Solaris Palantir evaluation proceeds.
- ATLAS continues accruing Auth0 workaround technical debt through August.
- Revenue exposure remains elevated.

---

## Communication Plan

| Stakeholder | How to Communicate | By When |
|------------|-------------------|---------|
| Yuki Tanaka | Decision brief from Karl Bergstrom — estimate reviewed, authorization requested | May 1 (hard deadline) |
| Sara Lindqvist | Decision outcome — begin build immediately if authorized | May 1 |
| Fatima Al-Hassan | SHIELD 14 controls unblocked from July 1 (if authorized) | May 1 |
| Priya Kaur | HORIZON GA recovery to July 31 possible — reassess Kestrel full delivery option | May 1 |
| Marcus Chen | ATLAS Auth0 debt paydown timeline confirmed | May 1 |
| Nina Ross | Kestrel deal: partial delivery structure may upgrade to full July delivery if authorized | May 2 |
| James Whitfield (CISO) | Inform only — Auth0 contract renewal no longer blocking IAM delivery | May 1 |

---

## Review Date

**Review this decision on:** June 15, 2026 — checkpoint on Auth0-only build trajectory. If build is on track for June 30, begin planning full IAM unification charter for H2. If slipping, reassess HORIZON GA date immediately.

**Reversibility:** Not reversible after build starts without significant sunk cost (8 engineers × weeks invested). Decision should be treated as binding once authorized.

**Supersedes:** N/A — this is a new scope addition, not a replacement of an existing decision.
**May supersede:** DR-20260415-002 (Kestrel partial delivery) — if HORIZON GA recovers to July 31, partial delivery deal may be upgraded to full delivery. Requires contract amendment with Luca Ferraro.
