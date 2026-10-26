# Template: Alignment Gap Register

Referenced by: `/tpm-alignment-gap-detector`

> A gap needs a verbatim quote from **each** side, with both stakeholders named. One-sided goes in Unverified Concerns.
> Quote the hedge. "We could probably support Q3 if licensing resolves" is a conditional commitment, not support for Q3.
> A stakeholder with no conversation in the corpus is **uncovered**, not aligned.
> Every gap ends in a question you can put to both parties, not a finding about them.

---

```markdown
# Alignment Gap Register — [Program Name]

**TPM:** [Name]
**Analyzed:** YYYY-MM-DD
**Conversations:** [N] verbatim · [N] notes · [N] rejected (post-hoc summary)
**Corpus grade:** 🟢 Full (8+) / 🟡 Thin (4–7) / 🔴 Insufficient (<4 — do not run)
**Forcing event:** [SteerCo / kickoff, date] — [N] days to resolve

---

## Coverage & Volume Correction

| Stakeholder | Role | Input type | Word share | Low-volume pass | Positions |
|-------------|------|-----------|-----------|----------------|-----------|
| | | verbatim / notes | [N]% | ✅ / — | [N] |

**Volume-bias check:** [N] of [N] gaps involve a bottom-third speaker → 🟢 corrected / 🔴 top-speaker dominated
**Uncovered:** [Stakeholders with no conversation — blind spots, not agreement]

---

## Gaps

| # | Gap | Type | Grade | Parties | Resolve by | Decision owner |
|---|-----|------|-------|---------|-----------|---------------|
| 1 | | Scope / Timeline / Ownership / Success criteria | DIRECT / DERIVED / LATENT | | | |

**Grades:** DIRECT = both statements address the same topic and cannot both be true · DERIVED = conflict exists via a stated inference chain · LATENT = one side stated, other implied

---

### Gap 1 — [Short name]

**Type:** [Scope / Timeline / Ownership / Success criteria] · **Grade:** [DIRECT / DERIVED / LATENT]
**Blast radius:** [Which milestones, teams, or dependencies break if this stays unresolved]

**Side A — [Name, Role]**
> "[verbatim quote, hedge intact]" — [source, date]

**Side B — [Name, Role]**
> "[verbatim quote, hedge intact]" — [source, date]

**Why these conflict:** [One sentence. For DERIVED, write out the inference chain explicitly.]

**Resolution question:** [The question for both parties, phrased so neither is put on the defensive]
**Resolve by:** [date] · **Decision owner:** [role] · **Status:** Open / Resolved / Escalated

---

## Hedge Register — conditional commitments being read as commitments

| Stakeholder | Said (verbatim) | The condition | Read by others as | Who needs to know |
|-------------|----------------|--------------|------------------|------------------|
| | "[quote with hedge]" | [the if-clause] | [unconditional commitment] | |

*Not conflicts yet. These are the conflicts of week nine.*

---

## Unverified Concerns — one-sided, not findings

| Concern | Raised by | What would confirm or dissolve it |
|---------|----------|----------------------------------|
| | | [Who to ask, and what question] |

---

## Open Questions Nobody Answered

| Question | Raised by | Conversation | Still open? |
|----------|----------|-------------|------------|
| | | | |

---

## Drift Log — re-run at milestone boundaries and after reorgs

| Date | Closed | Still open | Reopened | New |
|------|--------|-----------|----------|-----|
| | | | | |
```

---

## Filled Example (NovaGrid — SHIELD)

```markdown
# Alignment Gap Register — SHIELD

**TPM:** Karl Bergstrom (acting)
**Analyzed:** 2026-05-14
**Conversations:** 6 verbatim · 2 notes · 1 rejected (post-hoc summary of the Deloitte sync)
**Corpus grade:** 🟢 Full
**Forcing event:** Monthly Executive SteerCo, May 26 — 12 days to resolve

## Coverage & Volume Correction

| Stakeholder | Role | Input type | Word share | Low-volume pass | Positions |
|-------------|------|-----------|-----------|----------------|-----------|
| James Whitfield | CISO | verbatim | 41% | — | 9 |
| Yuki Tanaka | VP Eng | verbatim | 22% | — | 6 |
| Marcus Bauer | CFO | notes | 14% | — | 3 |
| Priya Anand | CEO | verbatim | 11% | — | 2 |
| Ana Ferreira | Staff Eng, Platform | verbatim | 4% | ✅ | 2 |
| Tom Achebe | EM, Infra | verbatim | 4% | ✅ | 1 |
| Lena Vogt | Compliance Analyst | notes | 3% | ✅ | 2 |
| Deloitte engagement lead | External auditor | verbatim | 1% | ✅ | 1 |

**Volume-bias check:** 2 of 3 gaps involve a bottom-third speaker → 🟢 corrected
**Uncovered:** DataCore division EM (owns 3 of the 11 outstanding controls) — no conversation captured

## Gaps

| # | Gap | Type | Grade | Parties | Resolve by | Decision owner |
|---|-----|------|-------|---------|-----------|---------------|
| 1 | Evidence freeze date vs. control remediation window | Timeline | DIRECT | Whitfield / Deloitte lead | May 26 | Yuki Tanaka |
| 2 | What "control complete" means for evidence purposes | Success criteria | DIRECT | Whitfield / Ferreira | May 20 | James Whitfield |
| 3 | Who owns the 3 DataCore controls | Ownership | LATENT | Tanaka / (uncovered) | May 22 | Karl Bergstrom |

### Gap 1 — Evidence freeze date vs. control remediation window

**Type:** Timeline · **Grade:** DIRECT
**Blast radius:** The Deloitte audit date is fixed and contractually paid ($180K). A freeze earlier than assumed removes 3 weeks of remediation from the SHIELD plan and puts 11 controls at risk — board-mandated certification failure.

**Side A — James Whitfield, CISO**
> "We've got until the audit window opens in August, so remediation runs through July and we're fine on the tail-end controls." — 1:1, May 8

**Side B — Deloitte engagement lead**
> "Evidence collection closes six weeks before fieldwork. Anything remediated after that lands in the next cycle." — Audit prep call, May 12

**Why these conflict:** Both cannot be true. A six-week evidence freeze before an August window closes evidence in mid-June, not July — which deletes the entire remediation tail the CISO is planning around.

**Resolution question:** "What is the exact evidence freeze date, and which controls are currently scheduled to complete after it?"
**Resolve by:** May 26 · **Decision owner:** Yuki Tanaka · **Status:** Open

### Gap 2 — What "control complete" means for evidence purposes

**Type:** Success criteria · **Grade:** DIRECT
**Blast radius:** 11 controls currently reported complete in Vanta. If the auditor's definition is stricter, the reported 78% completion is wrong and the SteerCo has been briefed on a number that will not survive fieldwork.

**Side A — James Whitfield, CISO**
> "Vanta shows the control as passing, that's complete. That's what the tool is for." — 1:1, May 8

**Side B — Ana Ferreira, Staff Engineer, Platform**
> "Passing in Vanta means the check ran. It doesn't mean we have 90 days of evidence behind it, and for four of those controls we don't." — Architecture sync, May 11

**Why these conflict:** Both cannot be true for the same controls. One definition counts tool state, the other counts evidence history.

**Resolution question:** "For each of the 11 controls marked complete — do we have the full evidence period the auditor requires, or only current passing state?"
**Resolve by:** May 20 · **Decision owner:** James Whitfield · **Status:** Open

*Ana Ferreira is 4% of the corpus. This is the highest-blast-radius gap in the register.*

## Hedge Register

| Stakeholder | Said (verbatim) | The condition | Read by others as | Who needs to know |
|-------------|----------------|--------------|------------------|------------------|
| Yuki Tanaka | "We can probably free up two platform engineers for SHIELD if NEXUS holds its Q2 dates" | NEXUS holds Q2 dates | Two engineers committed to SHIELD | Karl Bergstrom, Sara Lindqvist |
| Marcus Bauer | "Budget's there assuming we don't need a second Deloitte engagement" | No re-audit | Budget approved | James Whitfield |
| Tom Achebe | "Infra should be ready, as long as the residency work doesn't land the same sprint" | GDPR residency work not concurrent | Infra ready | Yuki Tanaka |

## Unverified Concerns

| Concern | Raised by | What would confirm or dissolve it |
|---------|----------|----------------------------------|
| Vanta control owners have left the company for 2 controls | Lena Vogt | Ask Tom Achebe to reconcile Vanta owner list against current org CSV |

## Open Questions Nobody Answered

| Question | Raised by | Conversation | Still open? |
|----------|----------|-------------|------------|
| Who signs the management representation letter? | Marcus Bauer | CFO sync, May 6 | Yes |
| Does the APAC data residency work fall inside SOC 2 scope? | Ana Ferreira | Architecture sync, May 11 | Yes |
```
