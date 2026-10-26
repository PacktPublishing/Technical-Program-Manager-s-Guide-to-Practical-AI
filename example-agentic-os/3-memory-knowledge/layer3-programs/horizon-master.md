# HORIZON — Program Master Document
*Mobile Platform — NovaGrid iOS & Android App*
*Layer 3 context · Load for HORIZON work · Update cadence: weekly*

---

## Header

| Field | Value |
|-------|-------|
| **Program code** | HORIZON |
| **TPM** | Priya Kaur (Associate TPM) |
| **Executive Sponsor** | Ingrid Solvang (Dir. Platform & Infra) |
| **Phase** | Execution — post soft-GA |
| **Priority** | P1 |
| **Overall status** | 🟡 At risk |
| **Last updated** | August 10, 2026 |

*Amber for one reason only: the Aug 31 public GA now depends on an Apple review decision NovaGrid does not control. Everything inside the program's control has been delivered.*

---

## Objective

Launch NovaGrid Mobile App on iOS and Android. Per DR-008: soft GA Jul 31 (limited enterprise release) ✅, App Store GA Aug 31. Target: data consumers and executives who need dashboard monitoring, pipeline alerts, and AI insight cards without a laptop.

## Why now

60% of enterprise buyers cited "no mobile access" as renewal friction. Competitor announced mobile in Q4 2025. Board approved $3.2M incremental investment January 2026.

---

## Scope

**In scope:**
- Native iOS app (Swift + SwiftUI) ✅
- Native Android app (Kotlin + Jetpack Compose) ✅
- Core features: dashboard viewer, pipeline health monitor, alert center, AI insight cards ✅
- Enterprise SSO (Okta/Azure AD) via NEXUS IAM ✅
- Push notifications via v2 API notification endpoints ✅

**Out of scope:**
- Data entry or modification from mobile
- Full parity with web app
- React Native (rejected for v1)

---

## Milestone plan

| Milestone | Description | Target | Status | Owner |
|-----------|-------------|--------|--------|-------|
| M1 | Product requirements finalized | Feb 2026 | ✅ Done | Priya M. (PM) |
| M2 | Design system complete | Mar 2026 | ✅ Done | Design |
| M3 | Backend API contracts finalized | Apr 22 | ✅ Done (Apr 22) | DevEx |
| M4 | iOS alpha (internal) | May 15 → May 16 | ✅ Done (May 16 — 1 day late) | Mobile |
| M5 | Android alpha (internal) | May 21 | ✅ Done (May 21) | Mobile |
| M6 | Beta with 10 enterprise customers | Jul 15 2026 | ✅ Done (Jul 22 — **7 days late**) | Priya K. |
| M7 | App Store / Play Store submission | Aug 1 2026 | ✅ Done (Aug 1 — **on time**) | Mobile |
| M8 | GA launch (soft + App Store) | Aug 31 2026 (DR-008) | 🟡 At risk (55%) | Priya K. |

**M6 closed Jul 22, seven days late.** Beta opened Jul 2 (48h behind the IAM plan, absorbed). At Jul 5 the cohort was 4/10 and trending to about 7. DR-012 approved a dedicated onboarding engineer on Jul 8; they ramped Jul 13 and took the cohort to 10/10 by Jul 22. **The decision was right and it was two weeks late** — had it been made in late June when the pace was already visible, Jul 15 would have held.

**M7 submitted Aug 1 on time.** Google Play approved Aug 6 (4-day review). Apple App Store still in review as of Aug 10; the standard 2–3 week window puts the decision at Aug 15–22.

**M8 is half delivered.** Soft GA executed Jul 31 on time — limited release to Kestrel, Solaris and the beta cohort. The public App Store GA on Aug 31 is the remaining half: marketing staged, press release drafted, launch gated entirely on Apple.

---

## Team commitments

| Team | Role | Commitment |
|------|------|-----------|
| Mobile | Lead (iOS + Android) + beta onboarding | 100% |
| Core Infrastructure | API backend for mobile | 30% |
| Developer Experience | Mobile SDK | 40% |
| Model Serving | AI insight cards | 20% |
| Security & Compliance Eng | Mobile auth / SSO | 15% (down from 25% — IAM integration complete) |

---

## Risk register

| ID | Risk | Likelihood | Impact | Owner | Status |
|----|------|-----------|--------|-------|--------|
| R-001 | NEXUS IAM for mobile SSO | — | — | Sara L. / Priya K. | 🟢 Resolved. IAM live Jun 30 22:05. Beta opened Jul 2 with a 48h absorbed slip. |
| R-002 | MERIDIAN mobile push endpoints | — | — | — | 🟢 Resolved Apr 3. |
| R-003 | Kestrel Media Group deal ($1.6M) | Low | Medium | Priya K. / Nina Ross | 🟢 Tranche 1 ($800K) **released Jul 15**. Luca Ferraro is an active beta participant. Tranche 2 ($800K, Oct) rides on App Store GA Aug 31. |
| R-004 | Solaris Logistics deal ($2.4M) | Medium | High | Jennifer Wu | 🟡 Improved to 78%. The DR-008 expectation gap was closed properly — Jennifer briefed Tom Okafor on Jul 1, *before* onboarding, that Jul 31 meant limited enterprise release. Soft GA then landed on time. After two previously slipped dates, delivering exactly what was described is what moved this number. Sep 15 close, gated on Aug 31 public GA. |
| R-005 | App Store review timeline | — | — | Priya K. | 🟢 Resolved as a *definition* risk by DR-008 and by the Aug 1 on-time submission. Superseded as an *execution* risk by R-007. |
| R-006 | NEXUS IAM slip breaching the Solaris commitment | — | — | Sara L. | 🟢 Resolved. |
| **R-007** | **Apple App Store review outcome is outside NovaGrid's control and gates Aug 31** | **Medium** | **High** | **Priya K.** | 🔴 **Active. Submitted Aug 1; decision expected Aug 15–22. A rejection requiring resubmission puts Aug 31 out of reach and shows Solaris a third slipped date on a deal that has only just recovered. Android is already approved and could ship independently — that contingency is drafted but not decided. Decide it before the review returns, not after.** |
| **R-008** | **Post-GA support load has no dedicated owner** | **Medium** | **Medium** | **Priya K.** | 🟡 **Watch. Mobile L1 ticket volume rose sharply from Jul 31 (51 tickets in the pattern-5 window, up from 34). SC-2026-0402 was a real integration defect two days after soft GA in front of both renewal-critical customers. The onboarding engineer approved under DR-012 was scoped for onboarding, not for run. Public GA multiplies this.** |
| **R-009** | **Mobile–IAM integration contract gaps** | **Low** | **Medium** | **Priya K. / Sara L.** | 🟡 **Watch. INC-2026-0129: mobile assumed a 7-day refresh token lifetime, backend issued 24-hour, and ~60 beta users were silently logged out. Fixed in 92 minutes and the value is now in a shared integration contract. Worth checking whether other shared IAM values carry the same class of assumption before public GA.** |

---

## Deal pipeline summary (August 10)

| Deal | Value | Status | Delivery commitment |
|------|-------|--------|---------------------|
| Kestrel Media Group | $1.6M ($800K + $800K) | ✅ Signed May 14 · **Tranche 1 released Jul 15** | Tranche 2 Oct 2026, gated on App Store GA Aug 31 |
| Solaris Logistics | $2.4M ACV | 🟡 **78% probability** (up from 70%) | Soft GA ✅ Jul 31. Close Sep 15, gated on Aug 31 public GA. |
| Meridian Financial (mobile add-on) | TBD | Qualifying | Pending the enterprise ATLAS deal, now Q4 |

---

## Inbound dependencies (critical)

| Needs from | What | Needed by | Status |
|-----------|------|-----------|--------|
| NEXUS | IAM unified service for enterprise mobile SSO | Jun 30 2026 | ✅ Delivered Jun 30 22:05 |
| MERIDIAN | Mobile push notification endpoints | Apr 2026 | ✅ Delivered Apr 3 |
| ATLAS | Enterprise SSO implementation (shared work) | Apr 2026 | ✅ Delivered Apr 25 |
| **Apple** | **App Store review decision** | **Aug 15–22 2026** | 🔴 **Pending — the only thing between HORIZON and Aug 31** |

---

## Stakeholders

| Name | Role | Engagement |
|------|------|-----------|
| Ingrid Solvang | Dir. Platform — Executive Sponsor | Weekly |
| Priya Mehta | PM Mobile | Daily |
| Raj Patel | Mobile Eng Lead | Daily |
| Rachel Lim | CPO | Monthly |

---

## Latest update (August 10, 2026)

HORIZON delivered everything inside its control this window. Beta closed Jul 22 with all 10 enterprise customers live, soft GA shipped on time Jul 31, and both store submissions went in on Aug 1. Google Play approved on Aug 6.

The M6 slip is worth being honest about, because the lesson is not "we were slow." At Jul 5 the cohort was 4/10 with a pace that landed around 7, and that pace was already visible in late June. The dedicated onboarding engineer approved on Jul 8 (DR-012) took the cohort from 4 to 10 in nine days once ramped. **The decision was correct and roughly two weeks late.** The signal existed before the escalation did.

The Solaris relationship is the quiet win. Jennifer Wu briefed Tom Okafor on Jul 1 — before onboarding, not after — that July 31 meant a limited enterprise release rather than App Store GA. Then soft GA landed on the day it was promised. On a deal carrying two previously slipped dates, doing exactly what was described is what moved probability from 70% to 78%. That is the DR-008 decision paying off.

**What is left is not a delivery problem.** Apple's review decision is expected Aug 15–22 and the Aug 31 public GA rides on it entirely. R-007 needs a decision this week rather than monitoring: Android is approved and could ship alone. Deciding that contingency *before* the review returns is the difference between a considered staged launch and a scramble — and Solaris does not need to see a third slipped date.

Two things are accumulating quietly. Post-GA support load has no owner (R-008) — mobile ticket volume is up sharply since soft GA and the DR-012 engineer was scoped for onboarding, not run. And INC-2026-0129 showed that mobile and backend held different assumptions about a shared IAM value; the token lifetime is now in a shared contract, but nobody has checked whether other shared values carry the same class of gap (R-009). Public GA is the wrong time to find out.
