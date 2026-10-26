# Template: Assumption Log

Referenced by: `/tpm-assumption-extractor`

> **No exact quote, no entry.** Every row traces to a verbatim sentence in the source document. A row you cannot quote is a row you invented.
> Every entry is born `EXTRACTED` — unvalidated by construction. A log pasted into a wiki without a validation pass is worse than no log, because tracked items carry implied credibility.
> Thirty assumptions in an eight-page scope document is normal. Zero means the extraction failed, not that the scope is clean.
> Rank by blast radius, not by how obviously wrong the assumption looks.

---

```markdown
# Assumption Log — [Program Name]

**TPM:** [Name]
**Source:** [document, version, date] — the working document, not the deck
**Extracted:** YYYY-MM-DD · **Validation deadline:** [date]
**Entries:** [N] extracted · [N] discarded at the evidence gate · [N] contradicted on arrival
**Yield check:** [N] vs expected [range] for [N] pages → 🟢 normal / 🔴 extraction failed, re-run

---

## State Machine

```
EXTRACTED ──validation conversation──┬──→ CONFIRMED  (true — promote to charter constraint)
                                     ├──→ BROKEN     (false — RAID issue today, not next cycle)
                                     └──→ OPEN       (unresolved — becomes a risk past its date)
```

---

## Top 10 by Blast Radius — schedule these conversations

| # | Assumption | Class | Source quote | Blast radius | Validate with | By | State |
|---|-----------|-------|-------------|-------------|--------------|-----|-------|
| 1 | | Capacity | "[exact sentence]" — §[section] | [what fails if false] | [name] | [date] | EXTRACTED |

---

## Full Log

### Capacity — assumes people, teams, budget, or infrastructure will be available

| ID | Assumption | Source quote | § | Blast radius | Owner | Validate by | State |
|----|-----------|-------------|---|-------------|-------|------------|-------|
| A-C01 | | "[exact sentence]" | | H/M/L | | | EXTRACTED |

### Sequencing — assumes phases, dependencies, or events happen in a stated order

| ID | Assumption | Source quote | § | Blast radius | Owner | Validate by | State |
|----|-----------|-------------|---|-------------|-------|------------|-------|
| A-S01 | | "[exact sentence]" | | H/M/L | | | EXTRACTED |

### Definitions — assumes a term has one agreed meaning

| ID | Term | What the document assumes it means | Source quote | § | Who defines it differently | Owner | State |
|----|------|----------------------------------|-------------|---|--------------------------|-------|-------|
| A-D01 | | | "[exact sentence]" | | [or "unknown — ask"] | | EXTRACTED |

### External parties — assumes someone outside the program behaves as expected

| ID | Party | Assumed behaviour | Source quote | § | Historical basis? | Owner | State |
|----|-------|------------------|-------------|---|------------------|-------|-------|
| A-E01 | | | "[exact sentence]" | | [prior evidence, or "none — assumed from norm"] | | EXTRACTED |

---

## ⚠️ Contradicted on Arrival

*The loaded context already disproves these. They skip validation — they are findings.*

| ID | Assumption | Source quote | Contradicted by | Routed to |
|----|-----------|-------------|----------------|-----------|
| | | "[exact sentence]" | [file + what it says] | `/tpm-raid-log` Issues |

---

## Evidence Gate Report

| Metric | Count |
|--------|-------|
| Candidates generated | [N] |
| Passed the verbatim re-scan | [N] |
| **Discarded — quote could not be located** | [N] |

*A zero discard count means the gate was not run. Re-run before using this log.*

---

## Validation Tracker

| ID | Conversation held | Outcome | New state | Routed to |
|----|------------------|---------|-----------|-----------|
| | YYYY-MM-DD | | CONFIRMED / BROKEN / OPEN | charter / RAID issue / risk register |

**Survival rate:** [N] CONFIRMED / [N] validated = [N]% — *below ~50% means the extraction is generating noise; tighten the quoting rule*
```

---

## Filled Example (NovaGrid — NEXUS)

```markdown
# Assumption Log — NEXUS

**TPM:** Sara Lindqvist
**Source:** NEXUS Platform Re-Architecture Scope v2.1, approved 2026-03-04 (9 pages)
**Extracted:** 2026-03-09 · **Validation deadline:** 2026-03-18 (Auth0 decision date)
**Entries:** 27 extracted · 6 discarded at the evidence gate · 2 contradicted on arrival
**Yield check:** 27 vs expected 20–40 for 9 pages → 🟢 normal

## Top 10 by Blast Radius

| # | Assumption | Class | Source quote | Blast radius | Validate with | By | State |
|---|-----------|-------|-------------|-------------|--------------|-----|-------|
| 1 | Auth0 renews on existing commercial terms | External | "IAM remains on Auth0 through the migration window." — §4.2 | Contract expires Jun 30 with a 90-day renewal window; missing it forces an unplanned IAM migration mid-program | James Whitfield (CISO) | Mar 18 | EXTRACTED |
| 2 | Platform team has Q3 capacity for service retirement | Capacity | "Retirement of the legacy services completes in phase two." — §6.1 | Two platform engineers are conditionally promised to SHIELD; M4 and M5 both depend on them | Yuki Tanaka | Mar 14 | EXTRACTED |
| 3 | "Migrated" means traffic cutover, not data backfill | Definitions | "All tenants migrated by end of Q3." — §3.4 | If backfill is in scope, Q3 is not achievable and the OKR is misstated | Ana Ferreira | Mar 12 | EXTRACTED |
| 4 | OTel adoption is a team decision, not a mandate | External | "Teams adopt the new observability standard during phase one." — §5.3 | 4 teams have already declined; R-002 is open on exactly this | Yuki Tanaka | Mar 14 | EXTRACTED |
| 5 | Legacy service dependencies are documented | Capacity | "Existing integrations are catalogued in the service registry." — §6.2 | Retirement sequencing is built on this catalogue | Tom Achebe | Mar 16 | EXTRACTED |

## Full Log (excerpt)

### Definitions

| ID | Term | What the document assumes it means | Source quote | § | Who defines it differently | Owner | State |
|----|------|----------------------------------|-------------|---|--------------------------|-------|-------|
| A-D01 | migrated | Traffic cutover complete | "All tenants migrated by end of Q3." | 3.4 | Ana Ferreira — includes historical data backfill | Sara Lindqvist | EXTRACTED |
| A-D02 | tenants | All paying accounts | "All tenants migrated by end of Q3." | 3.4 | unknown — ask; may exclude trial and sandbox | Sara Lindqvist | EXTRACTED |
| A-D03 | phase two | A scheduled workstream with owners | "Retirement of the legacy services completes in phase two." | 6.1 | unknown — phase two has no dates or owners in the document | Sara Lindqvist | EXTRACTED |

### External parties

| ID | Party | Assumed behaviour | Source quote | § | Historical basis? | Owner | State |
|----|-------|------------------|-------------|---|------------------|-------|-------|
| A-E01 | Auth0 | Renews on existing terms | "IAM remains on Auth0 through the migration window." | 4.2 | none — prior renewal was renegotiated upward | James Whitfield | EXTRACTED |
| A-E02 | Downstream teams | Adopt OTel voluntarily in phase one | "Teams adopt the new observability standard during phase one." | 5.3 | none — 4 teams have declined | Yuki Tanaka | EXTRACTED |

## ⚠️ Contradicted on Arrival

| ID | Assumption | Source quote | Contradicted by | Routed to |
|----|-----------|-------------|----------------|-----------|
| A-C07 | Security Engineering has bandwidth for the IAM workstream in Q2 | "Security review runs in parallel with phase one." — §4.4 | `dependency-matrix.md` — Security Eng is fully allocated to SHIELD through Aug 2026 | RAID Issue I-011 |
| A-S04 | GDPR residency design lands before phase two | "Data residency requirements are addressed ahead of retirement." — §6.4 | `domain-context.md` — GDPR residency is 🔴 Behind, still in design phase, Sep 2026 deadline | RAID Issue I-012 |

## Evidence Gate Report

| Metric | Count |
|--------|-------|
| Candidates generated | 33 |
| Passed the verbatim re-scan | 27 |
| **Discarded — quote could not be located** | 6 |

*Discarded examples: "assumes the mobile team is staffed for Q3" — the document never mentions the mobile team. "assumes budget approval by Q2" — no budget sentence exists in the source.*

## Validation Tracker

| ID | Conversation held | Outcome | New state | Routed to |
|----|------------------|---------|-----------|-----------|
| A-D01 | 2026-03-12 | Backfill IS in scope — Q3 date does not hold | BROKEN | RAID Issue I-013, escalated to Karl Bergstrom |
| A-E01 | 2026-03-18 | CISO unresponsive; renewal window closes Mar 31 | OPEN | Risk R-001, escalation brief filed |
| A-D03 | 2026-03-13 | Phase two confirmed undefined — now a planning action | OPEN | Action A-021, owner Sara Lindqvist |

**Survival rate:** 1 CONFIRMED / 8 validated = 13% — *low; three of the eight were definitions the document never settled, which is a scope-document quality finding rather than an extraction failure*
```
