# Decision Record: Kestrel Media — Restructure to Partial Delivery Deal

**ID:** DR-20260415-002
**Date:** April 15, 2026
**Status:** Accepted (pending Priya Kaur scope confirmation by Apr 25)
**Decision Maker(s):** CRO (NovaGrid) + Rachel Lim (CPO) + Luca Ferraro (VP Technology, Kestrel Media)
**Program:** HORIZON
**Facilitated by:** Nina Ross (Account Executive), Priya Kaur (TPM HORIZON)

---

## Context

HORIZON GA slipped from July 31 to August 31 following the Auth0/NEXUS IAM cascade confirmed March 18. Kestrel Media ($1.6M deal) has a budget cycle that closes July 31 — if mobile is not GA by that date, Kestrel cannot commit FY2026 spend and the deal moves to 2027. Nina Ross escalated to CRO April 11. An emergency call was scheduled for April 15 with CRO, Nina Ross, and Priya Kaur to explore whether a partial delivery option could preserve the FY2026 deal.

---

## Decision Drivers

- Kestrel budget cycle closes July 31 — immovable from Kestrel's side
- HORIZON GA (full mobile with native SSO) cannot happen before August 31 without IAM resolution
- $1.6M deal at risk of moving to 2027 if no interim option
- Partial delivery (dashboard + alerts without SSO) is technically feasible by July 15 — it does not require NEXUS IAM
- Preserving revenue in FY2026 is a board-level priority

---

## Options Considered

### Option A: Wait for full GA (Aug 31)
**Description:** No changes to deal structure. Kestrel deal closes October 2026 or moves to 2027 budget cycle.
**Pros:** Clean contract — no partial delivery complexity.
**Cons:** $1.6M exits FY2026 pipeline. High probability Kestrel moves to 2027. Revenue miss.

### Option B: Partial delivery deal — dashboard + alerts + polling push by Jul 15, full GA Oct
**Description:** Split deal into two tranches: $800K for dashboard viewer, pipeline alerts, push notifications via polling (no native mobile SSO) by July 15; $800K for full native app with SSO by October 2026.
**Pros:** $800K secured in FY2026. Kestrel budget cycle satisfied. Full GA still deliverable in Oct. Deal structure is additive, not replacement.
**Cons:** Contract complexity — two tranches, two delivery gates. Partial scope must be explicitly defined and agreed. Oct tranche still depends on HORIZON full GA timeline. If Auth0-only IAM authorized by May 1 and HORIZON recovers to Jul 31, partial deal may be superseded.

### Option C: Emergency feature acceleration (SSO by Jul 15)
**Description:** Auth0-only workaround to deliver mobile SSO before July 15.
**Pros:** Full deal closes in FY2026.
**Cons:** 10-week build to deliver Auth0-only IAM — technically infeasible before July 15 even with Yuki's authorization. Option ruled out on timeline grounds.

---

## Decision

**We will:** Restructure to partial delivery deal (Option B). Dashboard viewer + pipeline alerts + push notifications via polling by July 15 ($800K). Full native app with SSO by October 2026 ($800K).

**Rationale:**
Option A loses the deal from FY2026. Option C is technically infeasible on the July timeline. Option B preserves $800K of FY2026 revenue, satisfies Kestrel's budget cycle constraint, and leaves the full deal intact for October. Luca Ferraro accepted this structure for evaluation — Priya Kaur must confirm partial scope feasibility by April 25 to lock the contract.

---

## Consequences

**Positive:**
- $800K secured in FY2026 (previously at serious risk of zero)
- Relationship preserved — Kestrel remains an active NovaGrid customer in FY2026
- Oct full-tranche deal ($800K) provides clear expansion path

**Negative / Trade-offs:**
- Partial delivery requires Priya Kaur to scope and deliver a Jul 15 milestone not in the original HORIZON plan — additional engineering coordination required
- Native SSO explicitly excluded from July scope — must be documented in contract to avoid expectation mismatch
- Oct $800K tranche still dependent on HORIZON full GA timeline — if HORIZON slips further, Oct tranche is at risk
- If Yuki authorizes Auth0-only IAM by May 1 and HORIZON GA recovers to Jul 31, the partial deal structure may be superseded by full GA — deal should include a provision to upgrade to full delivery if GA date recovers

**Risks:**
- Priya scope confirmation deadline Apr 25 — if missed, deal structure falls through. Mitigation: Priya top priority this week.
- Contract ambiguity on SSO exclusion — Mitigation: Legal must explicitly exclude native SSO from July tranche language.
- HORIZON GA slip beyond Oct 2026 — Mitigation: Monitor Auth0-only IAM authorization (May 1). If authorized, HORIZON Jul 31 GA recovers and Oct tranche de-risks.

---

## Communication Plan

| Stakeholder | How to Communicate | By When |
|------------|-------------------|---------|
| Luca Ferraro (Kestrel) | Nina Ross confirms scope + deal structure in writing | Apr 26 (after Priya confirms Apr 25) |
| Priya Kaur (HORIZON TPM) | Direct: confirm partial delivery scope feasibility | Apr 25 |
| CRO | Deal update — $800K FY2026 secured pending Priya confirmation | Apr 25 |
| Legal | Contract structure — two tranches, Jul 15 partial + Oct full, SSO exclusion explicit | Apr 26 |
| HORIZON program team | New Jul 15 partial delivery milestone added to program plan | Apr 22 |

---

## Review Date

**Review this decision on:** May 2, 2026 — after Yuki's Auth0-only IAM authorization decision (May 1). If HORIZON GA recovers to July 31, reassess whether to upgrade Kestrel to full delivery by July rather than partial. Upgrade requires Luca Ferraro agreement and contract amendment.

**Reversibility:** Reversible before contract signature. After Luca Ferraro signs, partial delivery commitment is binding — upgrade to full July delivery would require contract amendment and Kestrel agreement.
