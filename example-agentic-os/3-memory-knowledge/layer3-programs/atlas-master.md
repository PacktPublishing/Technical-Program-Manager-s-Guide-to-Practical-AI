# ATLAS — Program Master Document
*Enterprise NovaAI Launch*
*Layer 3 context · Load for ATLAS work · Update cadence: weekly*

---

## Header

| Field | Value |
|-------|-------|
| **Program code** | ATLAS |
| **TPM** | Marcus Chen |
| **Executive Sponsor** | Rachel Lim (CPO) |
| **Phase** | Execution — post-GA |
| **Priority** | P0 |
| **Overall status** | 🟢 On track |
| **Last updated** | August 10, 2026 |

*Green because the platform is sound and the July uptime tradeoff was deliberate. Read M7 before treating this as a clean green — the program spent a milestone to protect an SLA.*

---

## Objective

Launch NovaAI as a fully enterprise-ready product tier with tenant isolation, enterprise SSO, audit logging, usage-based billing, and SLA guarantees. Target: 15 enterprise customers in production by Dec 2026; NovaAI at 20% of ARR.

## Why now

NovaAI is the primary investor growth narrative. Enterprise deals worth $40M+ in pipeline were blocked on tenant isolation, SSO, SOC 2 readiness, and uptime SLA credibility.

---

## Scope

**In scope:**
- Multi-tenant isolation for model serving
- SSO/SAML integration (Okta, Azure AD) ✅
- Audit logging ✅
- Usage-based billing metering + Stripe integration ✅
- SLA monitoring and alerting (99.5% uptime target) ✅ infrastructure; target not yet met
- Enterprise support tier (dedicated Slack, 4-hour SLA)
- GA launch + analyst briefings ✅

**Out of scope:**
- NovaAI v2 architecture (that's SPARK)
- Self-serve/SMB tier features

---

## Milestone plan

| Milestone | Description | Target | Status | Owner |
|-----------|-------------|--------|--------|-------|
| M1 | Enterprise requirements finalized | Jan 2026 | ✅ Done | Marcus C. |
| M2 | Tenant isolation design approved | Feb 2026 | ✅ Done | Leo N. |
| M3 | SSO integration live (Okta, Azure AD) | Apr 25 | ✅ Done (Apr 25) | Security Eng |
| M4 | Audit logging MVP | May 21 | ✅ Done (May 21) | Model Serving |
| M5 | Usage billing metering live | May 31 | ✅ Done (May 31) | AI App Builder |
| M6 | SLA monitoring infra live | Jun 15 → Jun 16 2026 | ✅ Done (Jun 16 — 1 day late) | Core Infra |
| M7 | First 5 enterprise GA customers | ~~Jun 30~~ **Sep 15 2026** | 🟡 At risk (60% — 3/5) | Marcus C. |
| M8 | GA launch + analyst briefings | Jun 30 2026 | ✅ Done (Jun 30 — on time) | Marcus C. |
| M9 | 15 enterprise customers in production | Dec 2026 | 🟡 At risk (20% — 3/15) | Marcus C. |

**M8 delivered Jun 30.** Apex Health and Finex Capital live at launch, Corinthia Bank signed Jul 2. Industry analyst briefings delivered; the analyst note was positive. The "Early Access for Enterprise" framing held, and uptime was communicated honestly as "97.8% current, 99.5% SLA target by Q3."

**M7 moved Jun 30 → Sep 15, and the reason matters.** 3/5 signed. Onboarding of the 4th and 5th was deliberately frozen Jul 6 – Aug 3 under DR-011 while rolling uptime sat below the 97% internal floor. The milestone was not missed through slow selling — it was traded for the SLA of the three customers already in production. Rate limit lifted Aug 3; 4th onboarding in progress.

**M9 is the one to renegotiate.** 3/15 with a Dec 31 target requires roughly 2.4 new production customers per month for the rest of H2, above any pace ATLAS has demonstrated. The four-week freeze cost roughly one customer of conversion. Raise this at the Q3 QBR rather than at the December board meeting.

---

## Team commitments

| Team | Role | Commitment |
|------|------|-----------|
| Model Serving | Tenant isolation, circuit breaker, IAM refactor | 35% (per DR-007) |
| AI Application Builder | Enterprise features | 70% |
| Embeddings & Vector Store | Tenant isolation | 60% |
| Security & Compliance Eng | ATLAS IAM refactor (DEP-002) | 15% (seeded Jul 13) |
| Core Infrastructure | Inference autoscaling (F7) | 35% |
| Developer Experience | SDK enterprise features | 30% |

---

## Risk register

| ID | Risk | Likelihood | Impact | Owner | Mitigation | Status |
|----|------|-----------|--------|-------|-----------|--------|
| R-001 | Auth0 workaround tech debt | Medium | Medium | Marcus C. / Sara L. | DEP-002 unblocked Jul 13 once NEXUS IAM proved stable. Full-IAM refactor sprint Aug–Sep, Sec Eng seeded at 15%. Debt stops accruing when the refactor lands. | 🟡 Planned — in flight |
| R-002 | NovaAI uptime cannot credibly support a 99.5% SLA | High | Critical | Leo N. | DR-006 took uptime 94.2% → 97.8% pre-GA. GA load then pushed it to 96.8% on Jul 6. DR-011 contained it; F6 circuit breaker shipped Jul 31 and recovered it to 98.9%. **July closed at 97.1% against a 99.0% commitment — missed.** 99.5% SLA target still unmet. | 🟡 Improving, target not met |
| R-003 | SHIELD SOC 2 evidence for enterprise deals | Low | Medium | Fatima A. | 100 controls complete, evidence accepted Aug 7. But DR-014 moved certification to Dec 15 — expansion revenue at Apex ($3.8M), Finex ($2.5M) and Corinthia ($3.1M) all re-baselined to Q4. | 🟡 Timing risk |
| R-004 | Security Eng bandwidth | — | — | — | ✅ Resolved May 1. | 🟢 Resolved |
| R-005 | Model Serving overcommit | — | — | — | ✅ Resolved. Team is not overcommitted for the first time this year (13 headcount, no allocation above 100%). | 🟢 Resolved |
| R-006 | Jun 30 GA depends on M6 and on real uptime improvement | — | — | Marcus C. / Leo N. | GA delivered Jun 30 with 3 customers. M6 monitoring is what caught the Jul 6 burn within minutes. | 🟢 Resolved Jun 30 |
| R-007 | Model Serving 35% allocation adequate for onboarding pace | Medium | Medium | Leo N. | Adequate — but note that the July uptime response pulled Model Serving cycles onto F6, which is the direct reason SPARK M2 is at 88% rather than closed. The allocation held on paper; the attention did not. | 🟡 Watch |
| **R-008** | **A second visible uptime breach would cost far more than the first** | **Medium** | **High** | **Leo N. / Marcus C.** | 🟡 **Active. The Jul 6 event was handled well — proactive disclosure to Apex Health the same afternoon, and Derek Huang's response was positive precisely because nobody waited for him to notice. That credit is spent. A second breach reads as a pattern rather than an incident, in front of a healthcare customer running production workloads. F7 autoscaling (65%, Sep 15) replaces the manual capacity add that bought time in July.** |
| **R-009** | **M9 (15 customers by Dec 31) is not achievable at demonstrated pace** | **High** | **Medium** | **Marcus C.** | 🟡 **Active. 3/15 at Aug 10 requires ~2.4/month for the rest of H2. The freeze cost about one customer. Renegotiate at the Q3 QBR with the freeze as the stated cause — this is a defensible conversation now and an indefensible one in December.** |

---

## Inbound dependencies (what ATLAS needs from others)

| Needs from | What | When | Status |
|-----------|------|------|--------|
| NEXUS | IAM (Auth0 workaround retirement) | Jun 30 → refactor Aug–Sep | ✅ IAM live Jun 30. DEP-002 planning started Jul 13. |
| SHIELD | SOC 2 evidence / certification for expansion | Ongoing | ✅ Readiness evidence available; Type II report Dec 15 (DR-014) |
| MERIDIAN | Enterprise SDK v2 features | May 2026 | ✅ Delivered |
| SPARK | Vector Store v2 with enterprise isolation (M4) | Jun 2026 | ✅ Delivered May 29, 32 days early |

---

## Outbound dependencies (what ATLAS provides)

| Program / Team | What we provide | When needed |
|----------------|-----------------|-------------|
| SHIELD | SSO + audit logging evidence for SOC 2 controls | ✅ Provided |
| CRO / Sales | Enterprise GA reference customers | ✅ 3 in production |
| SPARK | Enterprise tenant isolation patterns + multi-tenant serving path for M2 | **Now — M2 integration testing is the last 12% of SPARK's Aug 11 milestone** |

---

## Customer pipeline (enterprise)

| Customer | Stage | Status | Notes |
|---------|-------|--------|-------|
| Apex Health Systems | ✅ Production | Signed Jun 16, $360K | First GA customer. Live through the July uptime dip; disclosed proactively. Expansion $3.8M gated on Dec 15. |
| Finex Capital | ✅ Production | Signed Jun 22, $140K | Expansion $2.5M gated on Dec 15. |
| Corinthia Bank | ✅ Production | Signed Jul 2, $220K | Onboarding held Jul 6 – Aug 3 by DR-011; resumed Aug 3. Expansion $3.1M gated on Dec 15 **and** EU data residency (Q1 2027). |
| 4th enterprise customer | Onboarding | In progress since Aug 3 | Was frozen four weeks. Drives M7. |
| 5th enterprise customer | Contracting | Qualifying | Needed for M7 by Sep 15. |

---

## Stakeholders

| Name | Role | Engagement |
|------|------|-----------|
| Rachel Lim | CPO — Executive Sponsor | Bi-weekly |
| Leo Nakamura | Dir. NovaAI — delivery | Weekly |
| Awa Diallo | Group PM NovaAI | Daily |
| CRO | Revenue dependency | Monthly |

---

## Latest update (August 10, 2026)

GA shipped on time June 30 with two customers live and a third signed two days later. The analysts' briefing note was positive. On the milestone plan that is a clean quarter.

The real story is July 6. Six days after launch, sustained inference traffic hit roughly 3x the pre-GA baseline as three enterprise customers moved production workloads on, model serving queues saturated, and rolling uptime fell to 96.8% — below the 97% internal floor. The SLA monitoring built in M6 caught it within minutes of the burn starting, which is the clearest return that milestone has produced.

Leo Nakamura's 17:00 decision was to add emergency capacity **and** rate-limit new tenant onboarding to zero until the structural fix shipped. That second half is the one worth recording: it meant ATLAS could not onboard its 4th or 5th enterprise customer for four weeks, and M7 moved from June 30 to September 15 as a direct consequence. The program spent a milestone to protect the SLA of the customers it already had. That was the right call and it should be described that way at the QBR, not buried as a slip.

The F6 circuit breaker shipped Jul 31 and uptime recovered to 98.9%. The rate limit lifted Aug 3. July closed at a 97.1% month average against a 99.0% commitment — **missed, and it should be stated plainly.** The 99.5% SLA target remains unmet.

Two things need decisions rather than monitoring. **M9** (15 production customers by Dec 31) sits at 3 and is not reachable at any pace ATLAS has demonstrated; renegotiate it at the Q3 QBR while the four-week freeze is a fresh and defensible explanation. **R-008**: the goodwill from handling July well is spent, and a second visible breach in front of Apex Health reads as a pattern. F7 autoscaling is the mitigation and it is at 65% with a Sep 15 target.
