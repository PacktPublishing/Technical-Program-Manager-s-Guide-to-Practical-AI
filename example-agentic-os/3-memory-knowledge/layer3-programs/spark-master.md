# SPARK — Program Master Document
*NovaAI v2 Core Platform*
*Layer 3 context · Load for SPARK work · Update cadence: weekly*

---

## Header

| Field | Value |
|-------|-------|
| **Program code** | SPARK |
| **TPM** | Daniel Rios (Associate TPM) |
| **Executive Sponsor** | Leo Nakamura (Dir. NovaAI) |
| **Phase** | Execution |
| **Priority** | P1 |
| **Overall status** | 🟡 At risk |
| **Last updated** | August 10, 2026 |

*M2 is due tomorrow at 88%. Go/no-go is today. This is the sharpest open decision in the portfolio.*

---

## Objective

Build the next-generation NovaAI core platform: new model serving architecture, visual AI workflow builder, multi-modal input support, and enterprise-scale RAG infrastructure. This is the 3-year AI growth thesis investment.

## Why now

NovaAI v1 doesn't support multi-tenancy at scale, has no visual workflow builder, and vector retrieval is bolted on. ATLAS enterprise launch commitments require v2 capabilities long-term.

---

## Scope

**In scope:**
- New model serving architecture (vLLM-based, multi-tenant, horizontal scaling)
- Visual workflow builder (drag-and-drop AI pipeline construction)
- Multi-modal input (text, image, structured data)
- Enterprise RAG infrastructure (vector store v2 with access controls, hybrid retrieval) ✅
- Evaluation framework (automated model quality testing before deployment)
- All new capabilities on v2 API only

**Out of scope:**
- NovaAI v1 maintenance (stays in ATLAS scope)
- Customer migration from v1 to v2 (future program)

---

## Milestone plan

| Milestone | Description | Target | Status | Owner |
|-----------|-------------|--------|--------|-------|
| M1 | Architecture design review | Mar 24 | ✅ Done | Daniel R. |
| M2 | New model serving alpha | **Aug 11 2026 — TOMORROW** | 🟡 At risk (**88%**) | Leo N. |
| M3 | Visual workflow builder beta | Sep 30 2026 *(DR-005)* | ⬜ Not started (0%) | AI App Builder |
| M4 | Vector Store v2 with enterprise isolation | ~~Jun 30~~ May 29 2026 | ✅ Done (May 29 — **32 days early**) | Embeddings team |
| M5 | Multi-modal input support | Nov 30 2026 *(DR-005)* | ⬜ Not started | Model Serving |
| M6 | Evaluation framework | Aug 31 2026 | 🟡 At risk (35%) | Leo N. |
| M7 | NovaAI v2 platform GA | **Dec 31 2026** | 🟡 At risk (0%) | Daniel R. |

**M2 trajectory:** 21% (May 20) → 39% (Jun 28) → 47% (Jul 5) → 79% (Jul 31) → 88% (Aug 7) → 88% (Aug 10).

The DR-007 allocation did what it was supposed to. The last 12% is integration testing against ATLAS multi-tenant model serving — and that is the problem: the ATLAS side of that integration lost engineering cycles in July to the uptime response and the F6 circuit breaker. **The allocation held on paper; the attention did not.**

**Go/no-go is today.** A 1–2 week slip still clears the VantagePoint Sep 15 contractual review. Anything longer does not, and it compresses M3 (Sep 30), which has zero buffer and cannot start until M2's architecture patterns are established.

---

## Team commitments

| Team | Role | Commitment |
|------|------|-----------|
| Model Serving | New architecture | **60% actual** (65% nominal per DR-007 — see R-010) |
| AI Application Builder | Visual workflow builder | 100% |
| Embeddings & Vector Store | RAG infrastructure | 90% |
| Core Infrastructure | Compute scaling | 30% |
| Security & Compliance Eng | Tenant isolation | 30% |

*DR-007 (Jun 4) set Model Serving to 65% SPARK / 35% ATLAS. The nominal split held all quarter; actual SPARK time ran nearer 60% from Jul 6 as the ATLAS uptime response pulled shared engineers onto F6.*

---

## Risk register

| ID | Risk | Likelihood | Impact | Owner | Status |
|----|------|-----------|--------|-------|--------|
| R-001 | Model Serving allocation constraining M2 | Confirmed | High | Leo N. / Karl B. | 🟡 Accepted. DR-007 raised SPARK to 65% and M2 moved 39% → 88% in six weeks. The allocation worked. |
| R-002 | Architecture design review | — | — | — | 🟢 Resolved Mar 24. |
| R-003 | ATLAS + SPARK sharing Model Serving | Medium | High | Leo N. | 🟡 **Re-opened in practice.** Formally resolved by DR-007, but July demonstrated the resolution is a paper split, not a protected one: an ATLAS production incident pulls shared engineers regardless of the percentage. See R-010. |
| R-004 | vLLM maturity risk | Low | Medium | Leo N. | 🟢 POC validated Apr 4. Performing within parameters. |
| R-005 | VantagePoint Analytics renewal ($1.8M) | — | — | Daniel R. | 🟢 **Resolved — CLOSED WON Jul 15.** Daniel escalated past the summer legal queue on Jul 8 after the term sheet sat unowned for five days. That intervention is why the date held. |
| R-006 | SPARK blocked on PULSE Temporal migration | — | — | Yuna P. | 🟢 Resolved. PULSE M5 closed Jun 10; all NovaAI pipelines on Temporal. |
| R-007 | Hiring freeze (CHG-004) blocks M3 frontend engineer | Confirmed | Medium | Daniel R. | 🟡 Active. Freeze runs Jun 15 – Aug 15 — **it lifts in five days.** The M3 frontend request filed Jun 12 can be refiled Aug 15. M3 must still be scoped to the current team until someone is actually hired, which is a Q4 arrival at best. Replanning session with Leo was due Jul 15 and has not happened. |
| R-008 | VantagePoint Sep 15 contractual review expects M2 delivered | Medium | High | Daniel R. | 🟡 Active. The renewal is signed and banked, so this is not FY2026 revenue risk — it is the opening move in the FY2027 negotiation. M2 at 88% with go/no-go today. A 1–2 week slip clears Sep 15; longer does not. |
| **R-009** | **Dec 31 GA chain still not reviewed at leadership level** | **Medium** | **High** | **Daniel R.** | 🔴 **Escalation still open — carried since May 20. The chain (M2 Aug 11 → M3 Sep 30 → M5 Nov 30 → M7 Dec 31) has zero recovery buffer and has never been reviewed end-to-end by Leo Nakamura or Rachel Lim. The review was due before Jun 30. It is now Aug 10, M2 is at its target date, and the first domino is about to be tested with the chain still unexamined. This risk previously carried a duplicate ID (a second R-007) and was easy to miss in the register — renumbered to R-009.** |
| **R-010** | **The DR-007 split is nominal, not protected** | **Medium** | **Medium** | **Leo N.** | 🟡 **Active. From Jul 6 the ATLAS uptime response drew shared Model Serving engineers onto the F6 circuit breaker. The 65/35 split held on paper while actual SPARK time ran nearer 60%, and the shortfall landed precisely on M2 integration testing — the last 12%. If M2 slips tomorrow, this is the mechanism. Worth naming before the go/no-go, not after.** |

---

## Inbound dependencies

| Needs from | What | When | Status |
|-----------|------|------|--------|
| NEXUS | OpenTelemetry | May 2026 | ✅ Delivered May 2 |
| MERIDIAN | v2 API only | Pre-GA | ✅ Complete |
| PULSE | Temporal for training pipelines | Pre-SPARK v2 GA | ✅ Delivered Jun 10 (M5) |
| **ATLAS** | **Multi-tenant model serving integration path for M2** | **Now — the last 12% of M2** | 🔴 **Contended. ATLAS F1 is at 88% and its engineers spent July on uptime.** |

## Outbound dependencies

| Program | What SPARK provides | When needed | Status |
|---------|-------------------|-------------|--------|
| ATLAS | Vector Store v2 with enterprise isolation (M4) | Jun 2026 | ✅ Delivered May 29, 32 days early |
| VantagePoint (contractual) | M2 model serving alpha at the Sep 15 roadmap review | Sep 15 2026 | 🟡 Gated on tomorrow's go/no-go |

---

## Stakeholders

| Name | Role | Engagement |
|------|------|-----------|
| Leo Nakamura | Dir. NovaAI — Executive Sponsor | Weekly |
| Rachel Lim | CPO | Monthly |
| Awa Diallo | Group PM NovaAI | Weekly |
| Priya Anand | CEO — AI growth thesis | Quarterly |

---

## Latest update (August 10, 2026)

M2 is due tomorrow at 88%. Daniel Rios calls go/no-go today.

The allocation decision worked. DR-007 gave SPARK 65% of Model Serving on Jun 4 and M2 went from 39% to 88% in six weeks — the strongest velocity the program has had. VantagePoint signed on Jul 15 for $1.8M, which closed SPARK's only open commercial thread, and it held its date because Daniel escalated past the summer legal queue on Jul 8 rather than waiting.

What is left is the last 12%: integration testing against ATLAS multi-tenant model serving. That is where the risk sits, and the mechanism is worth naming before the decision rather than after. From Jul 6, the ATLAS uptime response pulled shared Model Serving engineers onto the F6 circuit breaker. The DR-007 split held at 65/35 on paper while actual SPARK time ran nearer 60%, and the shortfall landed exactly on integration testing (R-010). **The split was never protected — it was just written down.** A production incident in a sibling program will always win against an alpha milestone, and the split should be re-specified with that in mind rather than restated at the same percentage.

A 1–2 week slip is the realistic downside and it still clears the VantagePoint Sep 15 contractual review. Longer than that compresses M3 (Sep 30), which cannot start until M2's architecture patterns are established and has no buffer.

**R-009 should not go into tomorrow unresolved.** The Dec 31 GA chain — M2 → M3 → M5 → M7, zero recovery buffer at every link — has still never been reviewed end-to-end by Leo Nakamura or Rachel Lim. That review was due before Jun 30. It is now Aug 10, the first domino is being tested tomorrow, and the chain behind it remains unexamined. The risk also spent three months carrying a duplicate ID with the hiring-freeze risk, which is a good part of why it stayed easy to skip over; it is renumbered here.
