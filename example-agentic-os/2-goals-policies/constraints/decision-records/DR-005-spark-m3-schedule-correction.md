# DR-005 — SPARK: M3 Visual Workflow Builder Target Corrected to Sep 30

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

| Field | Value |
|-------|-------|
| **Decision ID** | DR-005 |
| **Date** | May 6, 2026 |
| **Decision maker** | Daniel Rios (SPARK TPM) + Leo Nakamura (Dir. NovaAI, sponsor) |
| **Stakeholders** | Daniel Rios, Leo Nakamura, Awa Diallo (Group PM NovaAI), Rachel Lim (CPO) |
| **Programs affected** | SPARK |
| **Status** | ✅ Decided — milestone plan updated |

---

## Decision

**SPARK M3 (Visual Workflow Builder beta) target corrected from July 31 to September 30, 2026.**

The July 31 target was an error: M3 has a stated dependency on M2 architecture patterns being established, but M2 (new model serving alpha) is targeted August 11 — 11 days *after* the former M3 target. The plan was never updated after the March 27 Model Serving scope reduction.

---

## How the error was discovered

During the VantagePoint Analytics roadmap briefing preparation (week of April 27), Daniel Rios assembled a full downstream milestone dependency map for Elena Markov's May 1 briefing. While building the dependency chain (M2 → M3 → M5 → M7 GA), Daniel identified the M3/M2 inversion. He flagged it to Leo Nakamura May 5. Leo confirmed: "M3 cannot start until M2 architecture patterns are locked in. That's a 2-3 week lag after M2 completes."

Leo and Daniel corrected the milestone plan May 6, before the Elena Markov briefing.

---

## Updated milestone plan (SPARK)

| Milestone | Old target | New target | Change |
|-----------|-----------|-----------|--------|
| M2 — Model serving alpha | Aug 11, 2026 | Aug 11, 2026 | No change |
| M3 — Visual workflow builder beta | **Jul 31, 2026** | **Sep 30, 2026** | +60 days |
| M5 — Multi-modal input support | Sep 30, 2026 | Nov 30, 2026 | +60 days (downstream of M3 patterns) |
| M7 — NovaAI v2 GA | Q4 2026 | **Q4 2026 (Dec 31)** | No change — M7 still achievable if M2 holds Aug 11 |

M4 (Vector Store v2, Jun 30) and M6 (Evaluation framework, Aug 31) are unaffected — they are not downstream of M3.

---

## Rationale

- The July 31 M3 target was set before the March 27 Model Serving scope reduction and never corrected
- With M2 at August 11, M3 work cannot begin until architecture patterns are established (approximately Aug 25 at earliest)
- A 5-week M3 build (Sep 30) assumes the visual workflow builder team (AI Application Builder, 100% allocation) can execute at pace once M2 patterns are available
- M7 GA (December 31) remains achievable: M3 Sep 30 → M5 Nov 30 → M7 Dec 31 is a compressed but executable chain

---

## VantagePoint impact

Elena Markov was briefed with the corrected dates on May 7 (one day after the correction). Her response (per Daniel, May 7): "I appreciate the honesty about the M3 slip. The Dec 31 GA with enterprise RAG (M4 Jun 30) still works for our renewal case — we're primarily evaluating vector retrieval capability, not the workflow builder for the renewal. Keep M4 on track."

VantagePoint deal probability: 55% (updated from 40% following the May 7 briefing with corrected roadmap).

---

## What this is not

This is a **schedule correction**, not a scope change. The visual workflow builder remains in SPARK scope, unchanged. The AI Application Builder team commitment (100%) is unchanged. Only the target date moved to reflect M2 dependency.

---

## Related risks

- SPARK R-001: Model Serving at 55% — M2 Aug 11 holds. If M2 slips, M3 slips proportionally.
- SPARK R-005: VantagePoint Analytics renewal ($1.8M) — updated roadmap delivered May 7. Risk status: 🟡 Active (probability improving).
