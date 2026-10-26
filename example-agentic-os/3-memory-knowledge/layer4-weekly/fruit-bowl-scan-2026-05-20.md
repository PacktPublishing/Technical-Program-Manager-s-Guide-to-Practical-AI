# Fruit Bowl Portfolio Scan — May 20, 2026
*Skill: /tpm-fruit-bowl (portfolio mode)*
*Data sources: program-index.md · all 7 program master docs · novagrid-jira-export.json · novagrid-aha-export.json*
*All data as of: May 20, 2026T08:00:00Z (fresh — ≤1 week)*
*Checkpoint 1 annotations: collected May 20, 2026*
*Round 2 (post-Checkpoint 1) completed: May 20, 2026*

---

## Heat Map — Post Checkpoint 1 (Final)

| Program | TPM | RAG | Primary Pattern | Secondary | Confidence | Deep Dive Priority |
|---|---|---|---|---|---|---|
| PULSE | Yuna Park | 🔴 | 🍌 Banana | — | HIGH | Before May 27 CFO QBR |
| ATLAS | Marcus Chen | 🟡 | 🍉 Watermelon | — | **HIGH** *(upgraded)* | Before May 22 SteerCo pre-read |
| HORIZON | Priya Kaur | 🟡 | 🥑 Avocado | — | HIGH | Before Jun 15 definition deadline |
| NEXUS | Sara Lindqvist | 🟡 | 🍇 Grape Cluster | 🥥 Coconut | MEDIUM | After NEXUS early signal simulated |
| SHIELD | Fatima Al-Hassan | 🟡 | 🍇 Grape Cluster | 🥑 Avocado | MEDIUM | Escalates if NEXUS signal materializes |
| MERIDIAN | James Okonkwo | 🟡 | 🍌 Banana | — | MEDIUM | Escalation to Ingrid before Jun 1 |
| SPARK | Daniel Rios | 🟡 | 🍅 Tomato | — | MEDIUM | Leo + Rachel review before Jun 30 |

---

## Program-by-Program Findings

### PULSE 🔴 — Banana · HIGH

**Pattern:** Slow structural decay with no funded intervention. Same blocker has persisted for 35+ days with measurable cost accumulation.

**Evidence (3+ signals):**
- PULSE-204 (FlowEngine capacity constraint) active since Apr 15 — 35 days
- Actual velocity: 160/340 = 47% at 0.27 pipelines/day; pace needed to close meaningfully: ~2/day
- Dual-run cost: $795K accrued (May 20); $1.04M projected by M4 Aug 12
- M4 trajectory: Aug 12 — no pull-forward path without Stream Processing reallocation
- SDK-first decision (Apr 15) was deliberate; cost accepted; no new decision has been made

**Checkpoint 1 annotation:** Amara Osei confirmed open to reallocation discussion. Escalation path exists but has not been initiated.

**Implication:** The Banana pattern stands HIGH because the data signals (35 days, $795K, 0.27/day) are independent of Amara's willingness. However, the intervention path is now clear: Yuna → Amara with cost framing before May 27 CFO QBR. Amara being open but the conversation not happening for 35+ days is itself a Banana signal.

**Recommended action:** Yuna initiates Amara conversation with $795K vs Compass-equivalent reallocation cost framing. Before May 27. QBR is the forcing function.

---

### ATLAS 🟡 — Watermelon · HIGH *(upgraded from MEDIUM)*

**Pattern:** Program reads Amber at portfolio level while carrying an active, unmanaged SLA gap with no remediation plan.

**Evidence (3+ signals):**
- 94.2% actual NovaAI uptime vs 99.5% SLA commitment — documented gap (R-002, R-006)
- No uptime improvement plan exists as of May 20. No documentation. No timeline.
- M6 (SLA monitoring) funded but explicitly not an uptime fix. Karl Bergstrom flagged this distinction May 13.
- Leo Nakamura Jun 1 deadline for an uptime plan — 12 days away with nothing written
- Overall program RAG: 🟡 — SLA gap is not visible to portfolio readers

**Checkpoint 1 annotation:** "No documentation on the uptime improvement, timeline unclear — do not have further information." Confirmed: the gap exists, is not being managed, and is not visible to leadership.

**Upgraded to HIGH:** Third signal confirmed (gap not visible, not being acted on, leadership unaware of plan gap). 94.2% uptime → monitoring (M6) → no improvement plan = classic Watermelon: green outside, red inside.

**Crystallization point:** May 22 SteerCo. If Leo presents M6 monitoring as the uptime fix, the distinction will not be drawn. Pre-read (due May 21) must surface this explicitly.

**Recommended action:** Marcus Chen ensures SteerCo pre-read distinguishes M6 monitoring from uptime improvement. Leo confirms whether he is presenting an uptime plan or a monitoring plan at SteerCo. If no uptime plan exists by Jun 1, escalate to Karl.

---

### HORIZON 🟡 — Avocado · HIGH

**Pattern:** Three sequential contracted gates approaching with hard consequence at each stage. Timing ambiguity at the endpoint may make the committed date structurally impossible.

**Evidence (3+ signals):**
- Gate 1: NEXUS IAM Jun 30 → required for enterprise SSO in HORIZON
- Gate 2: Kestrel beta Jul 15 — contractually committed ($800K tranche 1 signed May 14)
- Gate 3: Solaris GA Jul 31 — committed May 9 (DR-004), deal at $2.4M, 65% probability
- App Store review: 2–3 weeks. Last possible submission date for Jul 31 availability: ~Jul 10
- R-005 explicitly states: "Jul 31 GA is effectively a soft GA / direct install, with App Store GA ~Aug 20"
- Jun 15 deadline for Rachel + Ingrid GA definition alignment — 26 days away, unresolved

**Checkpoint 1 annotation:** "Jul 31 GA was reviewed by Legal. Not sure on the Legal team having specific definition." Legal review confirms the commitment was examined — but the ambiguity is unresolved. No specific GA definition exists even after Legal review.

**Implication:** The legal review is incomplete without a definition. App Store vs direct install has material consequences for the Solaris deal (their contract says "GA available July 31"). This is an Avocado where the external constraint (App Store timeline, 18–21 days) is now confirmed as known but unresolved.

**Recommended action:** Jun 15 Rachel + Ingrid alignment meeting must produce a written GA definition. Three options to present: (a) soft GA / direct install Jul 31 with App Store follow Aug 15-22; (b) App Store submission Jul 10 with Jul 31 review risk; (c) revise Solaris commitment to Aug 20 before the deal closes. Legal must define what the Solaris contract term requires.

---

### NEXUS 🟡 — Grape Cluster · MEDIUM · Early Signal Flag

**Pattern:** Single-stem portfolio risk — 5 programs depend on NEXUS IAM Jun 30. Failure propagates simultaneously to SHIELD (board mandate), HORIZON ($3.2M in committed deals), and ATLAS (refactor timeline).

**Evidence (2 signals):**
- 5 programs with documented NEXUS IAM dependency (SHIELD, HORIZON, ATLAS, SPARK, MERIDIAN)
- 3+ cross-program risk registers cite NEXUS IAM as the same component (R-001 in SHIELD, R-006 in HORIZON, R-001 in ATLAS)
- Single-owner information path: Sara Lindqvist's weekly 30-min review is the primary signal path for 3 P0/P1 programs

**Checkpoint 1 annotation:** "They are surfacing an early signal (we might need to simulate this). Confirmed is on pace."

**Assessment:** "On pace" is confirmed — Sprint 1 delivered May 9, next checkpoint May 23. The early signal is not yet in the documentation. The risk: an early signal in Sara's weekly check-ins that hasn't propagated to master doc or downstream programs represents exactly the Coconut secondary pattern (single-owner, opaque information).

**Pending simulation:** The early signal needs to be named and documented before May 23 checkpoint. Recommended simulation: Auth0 API scope limitation or vendor configuration discovery. Once named, it can be tracked. Until it's in the master doc, the 3 dependent programs have no visibility.

**Recommended action:** Simulate the NEXUS early signal as a Sprint 2 finding. Document in NEXUS master doc. Assess cascade impact before SteerCo May 22 or NEXUS checkpoint May 23.

---

### SHIELD 🟡 — Grape Cluster + Avocado · MEDIUM

**Pattern (dual):** Cascading dependency from NEXUS (Grape Cluster) + hard external constraint at the endpoint with outstanding validation (Avocado).

**Evidence:**
- Board mandate Aug 31 SOC 2 Type II — immovable by definition
- Zero-buffer sequential chain: NEXUS Jun 30 → 14 controls Jul 1 → M4 Jul 15 → evidence Jul 15 → external audit Aug → cert Aug 31
- Any NEXUS IAM slip does not delay SHIELD — it may make Aug 31 mathematically impossible (3+ weeks required from control completion to cert)
- 19 non-IAM controls still in progress, must complete Jul 1–15

**Checkpoint 1 annotation:** "The auditor is not flexible on the timeline. Validation by the auditor outstanding."

**Implication:** the auditor inflexibility confirms the Aug 31 anchor is a hard external constraint (Avocado). The auditor validation still outstanding means the evidentiary requirements are not fully known — any gap discovered in feedback could compress the already-tight Jul 1–15 window further.

**Recommended action:** Fatima Al-Hassan must confirm the auditor validation status on the May 12 evidence submission before the Jul window planning finalizes. Any outstanding feedback from the auditor becomes a critical path item the moment it arrives.

---

### MERIDIAN 🟡 — Banana · MEDIUM · Confirmed

**Pattern:** Observable, measurable problem known to the program team — but not visible to the executive sponsor who could fund a fix — while the deadline compresses.

**Evidence:**
- Mid-market: 110/210 = 52%, at 0.6 customers/day actual vs 1.4/day needed for Sep 30
- Compass covers SMB (419 customers) — not mid-market (100 customers remaining)
- Sep 30 legal commitment: hard — 3 enterprise contracts specify it; no slip room
- Gap has been measurable since at least May 20; no mid-market intervention is funded or proposed

**Checkpoint 1 annotation:** "Has not been surfaced to Ingrid." Textbook Banana confirmation: the problem is known to the program team, not visible to the decision-maker who could commission a mid-market Compass-equivalent.

**Escalation path:** James → Ingrid, with specific data: 0.6/day actual vs 1.4/day needed; Sep 30 legal consequence; $240K Compass ROI as reference point (vs $2.1M/year dual-infra cost if EoL slips). Before Jun 1 to allow Jul intervention window.

**Recommended action:** James Okonkwo surfaces mid-market velocity gap to Ingrid Solvang before Jun 1. Proposal: mid-market specialist engagement (Compass expanded scope or separate engagement). Frame as Sep 30 legal risk, not a request for additional resources.

---

### SPARK 🟡 — Tomato · MEDIUM · Confirmed

**Pattern:** Plan appears internally consistent after correction (DR-005) but has not been stress-tested by the people who would catch hidden assumptions.

**Evidence:**
- DR-005 corrected M3 ordering error (M3 before M2 complete) — caught by Daniel during VantagePoint prep
- Dec 31 GA chain: M2 Aug 11 → M3 Sep 30 → M5 Nov 30 → M7 Dec 31 — zero recovery buffer
- M2 execution depends on Model Serving at 55% (historically pulled for other priorities; was at 90% when timeline was set)
- The plan was corrected by the person who made the error; only reviewed against VantagePoint framing

**Checkpoint 1 annotation:** "Not reviewed by Leo or Rachel." Leo's May 15 review was of the VantagePoint framework only — not the Dec 31 GA chain and its assumptions. Rachel has not reviewed.

**Implication:** The chain contains at least one prior ordering error that wasn't caught by leadership review. The assumption that Dec 31 is achievable at 55% Model Serving (vs the 90% it was set at) has not been questioned. Another undiscovered assumption could exist.

**Recommended action:** Leo Nakamura reviews the full Dec 31 GA chain (M2→M3→M5→M7) with current allocation assumptions before Jun 30. This is distinct from the VantagePoint conversation — it's an internal delivery chain review, not a customer roadmap briefing. Rachel does not need to review the chain in detail but should be aware Dec 31 has zero buffer.

---

## What This Scan Cannot Tell You (Requires Single-Program Deep Dive)

1. **NEXUS early signal nature** — Portfolio mode cannot name the early signal or assess its impact on Jun 30. Simulation + Sara interview required.
2. **ATLAS uptime improvement path** — Whether an uptime fix is technically feasible before Jun 30 (or at all) requires deep Leo + Model Serving engagement. Portfolio mode only sees the absence of a plan.
3. **HORIZON Solaris contract language** — Whether "GA available July 31" in the Solaris contract is satisfiable with a soft GA / direct install requires Legal review of the specific contract clause. Portfolio mode cannot assess contract language.
4. **SHIELD the auditor validation feedback** — Whether the May 12 evidence submission has outstanding feedback that could compress the Jul window requires Fatima's direct follow-up with the auditor. Portfolio mode only sees the validation is outstanding.
5. **MERIDIAN Thornbridge Capital** — Whether the one cautious enterprise customer (Thornbridge) will migrate before Jun 1 enterprise close target requires James's direct account engagement.
6. **SPARK M2 technical risk** — Whether vLLM-based model serving architecture at 55% allocation can realistically hit Aug 11 without a second ordering-error-style discovery requires deep technical review of the M2 sprint backlog.

---

## Recommended Deep-Dive Order

1. **ATLAS** (before May 21 EOD — pre-read window) — Watermelon HIGH + SteerCo in 2 days. Highest urgency.
2. **PULSE** (before May 27 CFO QBR) — Banana HIGH + Amara intervention path confirmed. QBR is forcing function.
3. **HORIZON** (before Jun 15) — Avocado HIGH + GA definition deadline. Highest dollar consequence.
4. **MERIDIAN** (before Jun 1) — Banana escalation conversation window. Sep 30 legal deadline.
5. **NEXUS** (after simulation) — Grape Cluster MEDIUM but carries portfolio-level consequence. Depends on early signal naming.

---

## Scan Metadata

| Field | Value |
|-------|-------|
| Scan date | May 20, 2026 |
| Data freshness | All sources ≤1 week |
| Portfolio RAG at scan | 1 red (PULSE), 6 amber |
| Patterns identified | 7 of 7 programs assigned |
| HIGH confidence findings | 3 (PULSE Banana, ATLAS Watermelon, HORIZON Avocado) |
| MEDIUM confidence findings | 4 |
| Checkpoint 1 annotations | 7 of 7 programs covered |
| Post-Checkpoint upgrades | ATLAS: MEDIUM → HIGH |
| Post-Checkpoint pattern shifts | SHIELD: Grape Cluster → Grape Cluster + Avocado dual |
| Pending simulation | NEXUS early signal (Sprint 2 finding) |
