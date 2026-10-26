> **Recorded output.** Produced by `run.sh` from `5-premortem/prompt-4-product.md` with model `sonnet` on 2026-09-29.
> One real run: yours will differ in wording. Validate it the way the prompt file describes.

# Incident Narratives — Payments Platform Consolidation
### Written from the lens of the Product Manager owning the merchant relationship and the market window (not program TPM, no stake in program success)

---

### Narrative 1 — The enterprise cohort that was promised twice

**What happened, in sequence:** Marcus Webb's mandate was "one platform, one processor... I don't want a long tail of special cases living on Kestrel for another two years" (Conflict #1). Tom Delacroix's execution plan kept the top forty enterprise accounts on legacy contract terms indefinitely, "if legal agrees" (Conflict #1). Both positions went into planning unresolved — the charter's governance section names a steering committee but states nothing about who breaks a scope tie between Engineering and Platform ownership (Charter §8, left empty). Execution proceeded on Tom's plan: enterprise accounts assigned to a single "final cohort" in Phase 2. That cohort is 31% of volume against a hard cohort cap of 15% (Assumption #10, #22, #23, all rated High blast radius). When the cap forced a split partway through migration, half of the top-forty accounts were cut over and half were not, with no criteria communicated for which half was which. Enterprise account managers, who under the plan "will handle their own communications" (Positions no one else addressed, Maya Ostrowski), had been briefed on Marcus's "no long tail" framing months earlier and told their clients the migration was complete. It wasn't. I fielded the first calls from three named accounts asking why their statements showed a processor that was supposed to be retired.

**Earliest observable signal:** Conflict #1 in the alignment output — Marcus and Tom's statements were captured side by side, unresolved, before any cohort plan was drafted.

**Which document should have caught this and did not:** The charter (Artifact 1, §8 — Decision rights and governance). It names a steering committee but assigns it no explicit authority over scope disputes between the mandate owner and the delivery owner — Marcus's own words in Conflict #7 state the committee "advises," while Priya's position was that anything touching savings "goes to the steering committee for a decision." Neither charter nor conflict register resolves which is true, so nothing ever forced the enterprise-cohort conflict to a decision before it reached my customers.

---

### Narrative 2 — Ninety days we didn't have

**What happened, in sequence:** Lena Fischer planned to start switching Kestrel merchants in May. Maya Ostrowski stated Kestrel contracts require ninety days' written notice before a processor change, putting the realistic earliest start in mid-July (Conflict #5). The charter's dependency and assumption layers never reconciled this: Assumption #18 states merchant notice periods are "covered by the standard 30-day notice in our merchant terms," rated High blast radius, with no owner or validation date attached to it in the assumption log despite the extraction being scoped to produce exactly that. Kestrel merchants were issued 30-day notices in May on the standard-terms assumption. The notices were contractually short for that segment. Two enterprise-adjacent Kestrel merchants — both flagged separately by Maya as needing individual handling — escalated to their account teams citing breach of their notice terms, three weeks before their scheduled cutover date. I had to freeze their cohort and issue a contractual cure, which pushed those merchants past the freeze window entirely (see Narrative 4).

**Earliest observable signal:** Conflict #5 in the alignment output, dated before any cohort notice went out — Maya's statement directly contradicts the 30-day assumption that was used operationally.

**Which document should have caught this and did not:** The assumption log (Artifact 3). Row 18 is rated High blast radius but carries no owner and no validation date column populated anywhere in the table, even though the extraction's stated purpose was to produce "an assumption log with owners and validation dates." An assumption with no owner is not tracked to closure — it's tracked to nothing, which is what happened here.

---

### Narrative 3 — The residency problem we called a migration problem

**What happened, in sequence:** Anika Roth's position — "two of the three processors store cardholder data in the EU. If we consolidate onto the US processor, we have a data residency problem rather than a migration problem" — appears only in the alignment output's "Positions no one else addressed" section. It is absent from the charter's Known Risks (§10), which lists only "Legal has flagged a licensing risk" with no detail. It is absent from the assumption log's technical or external-party rows. Lena Fischer's separate, unverified claim that "Northwind supports both [EU-only payment methods], I checked" was taken as sufficient close-out for the EU question, with no named source. Neither statement was reconciled against the other before EU merchant cohorts were scheduled. When EU merchants began cutting over onto the Northwind path, a subset processing under EU-only payment methods hit rejected transactions inconsistent with Lena's claim. I had to tell three EU merchants their payment methods were temporarily unsupported on the platform they'd just been migrated to, with no rollback path rehearsed for that failure mode (Positions no one else addressed, Jonas Brandt: "Nobody has rehearsed a rollback on any of these platforms. Including 2024.").

**Earliest observable signal:** Anika Roth's residency statement in the alignment output, sitting directly adjacent to Lena's unsourced counter-claim — the same document, unresolved, months before cutover.

**Which document should have caught this and did not:** The charter's Known Risks (§10). Legal's licensing flag is logged there but never expanded into what Legal actually flagged; the residency risk — arguably the more severe of the two, since it could invalidate the processor choice outright rather than just delay it — never made it into the charter at all.

---

### Narrative 4 — The renewal, the freeze, and the year we didn't save

**What happened, in sequence:** The charter's own inferred risk (§10, §6) flags that Tessera Pay's contract renews 1 October, one day after the assumed Q3-end completion target, rated Medium confidence and never elevated beyond a footnote — the governance section that could have forced a decision on it was empty (§8). Separately, Jonas Brandt noted the payments change freeze runs 15 November to 5 January, and anything not done by mid-November waits until January (Positions no one else addressed) — a fact Priya's "weeks, not months" dual-run tolerance and Tom's "through year end, minimum" position never reconciled (Conflict #3). The cohort-cap violation in Narrative 1 and the notice-period breach in Narrative 2 each cost real weeks. By the time Tessera decommissioning was reachable, it was past 1 October — Tessera auto-renewed for another year, the cost the whole program was chartered to eliminate (Charter §1) — and the remaining decommissioning work landed inside the freeze, pushing final cutover to January. The Q4 savings this program was funded to deliver (Charter §5, §6) did not materialize in Q4. That slip is what reached my desk: the market-facing "single platform" positioning I had already briefed to two prospective enterprise merchants as a Q4 selling point was no longer true when they asked for a reference customer.

**Earliest observable signal:** The charter's own Tessera/Q3 sequencing risk (§10) — logged at charter time, before any cohort work began, and never escalated.

**Which document should have caught this and did not:** The charter's Decision rights and governance (§8). The Tessera risk was correctly identified as a risk but had no forum with the authority to force an early decision on it — it stayed a passive footnote instead of a gating item on the steering committee's agenda, and by the time it mattered, it was a fait accompli rather than a choice.

---

## Ranking by likelihood

1. **Narrative 1 (enterprise cohort collision)** — Most likely. This is the only failure mode backed by *both* an unresolved stakeholder conflict (#1) *and* an internal arithmetic contradiction in the plan itself (31% into a 15%-capped cohort, Assumption #10/#22/#23). Two independent paths point to the same failure; it doesn't require an external party to behave badly, only for an internal contradiction to go unresolved, which it demonstrably did.
2. **Narrative 2 (notice-period breach)** — Second most likely, because the assumption log itself shows the mechanism: a High-blast-radius assumption with no owner and no validation date, sitting next to a named stakeholder directly contradicting it. That combination — flagged risk, zero accountability — is close to a guarantee, not a possibility.
3. **Narrative 4 (Tessera renewal / freeze)** — Third, because it's a *chained* failure: it only bites if earlier cohort work slips at all, which Narratives 1 and 2 already show is likely. It's a near-certain consequence of the other two, not an independent risk.
4. **Narrative 3 (data residency)** — Least likely of the four, because it depends on Lena's unverified "I checked" claim being wrong. It's plausible — an unsourced claim carries real risk — but it's the only narrative resting on a single unconfirmed assertion rather than a documented structural contradiction, so I rank it last.
