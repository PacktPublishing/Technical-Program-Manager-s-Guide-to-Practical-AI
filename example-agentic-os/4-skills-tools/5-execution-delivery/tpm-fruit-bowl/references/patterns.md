# Fruit Bowl Patterns — Detection Criteria

Detection criteria for all 7 patterns. Referenced by `rounds/assess.md` and `rounds/score.md`.

---

## 🥝 Kiwi (Ideal State)

**What it means:** Reported status reflects actual delivery reality. No hidden problems. What you see is what you get.

**Detection criteria — all must be true for HIGH confidence Kiwi:**
- Reported status matches delivery data (no contradiction)
- 7+ of the 9 information categories present and updated within 2 weeks
- Risk register has active mitigations with owners and dates
- No blockers aged 21+ days without owner or resolution
- Decision log has no open items older than 3 weeks without owner
- Team signal shows stable or improving trend

**TPM context:** Kiwi programs exist in cultures where red is treated as a request for help, not a punishment. When you find a kiwi culture, protect it.

---

## 🍉 Watermelon (Classic Hidden Failure)

**What it means:** Reported status is green. Actual delivery data shows red. The higher you go in the reporting chain, the greener things magically become.

**Detection signals — any 2+ = MEDIUM, 3+ = HIGH confidence:**
- Reported status = GREEN/AMBER while delivery data shows milestone slippage in 2+ consecutive cycles
- Status narrative contains hedging language: "working toward," "should be fine," "on track to," "fingers crossed," "hoping to," "expect to"
- Risk register last updated 30+ days while open items show active blockers
- Blockers aged 21+ days with no owner change or resolution
- EVM signal (where available): SPI < 0.9 while RAG = GREEN
- Program reported at same percentage complete (e.g., "90%") for 3+ consecutive weeks

**What the agent cannot assess:**
- Whether the contradiction is known to leadership or hidden
- Whether slippage was intentional absorbed risk or concealed
- The reason behind the hedging language

**Checkpoint 1 annotation required:** "Is this contradiction known or unknown to leadership?"

**What you hear vs. what's actually happening:**

| What the dashboard says | What's actually happening |
|---|---|
| "All RAGs green" | Teams hiding blockers because red equals blame |
| "On track for Q2 launch" | Three unresolved dependencies on the critical path |
| "Program is 90% complete" | That last 10% contains all the integration risk — and has been at 90% for six weeks |
| "Stakeholders aligned" | Silent disagreement in the room; escalations planned offline |

---

## 🥑 Avocado (Timing Critical)

**What it means:** A narrow decision window exists. Miss it and you're dealing with brown mush — rebuilding from a position of locked-in technical debt, committed scope, or lost negotiating leverage.

**Detection signals — any 2+ = MEDIUM, 3+ = HIGH confidence:**
- Decision log has 2+ open decisions older than 3 weeks with no owner
- Roadmap has milestones dependent on unresolved decisions (decision must close before milestone can start)
- Stakeholder map missing decision authority for key scope items
- PRD/charter has "TBD" on scope boundary with an implied deadline
- External constraint with a date: API deprecation, compliance cutover, vendor EOL, partner SLA, contract renewal
- Architecture decision deferred with language like "we can decide later" while downstream teams proceed

**What the agent cannot assess:**
- Whether the decision owner knows the window is closing
- Whether the decision is blocked on data or on politics
- Whether "TBD" is intentional deferral or avoidance

**What you hear vs. what's actually happening:**

| What you hear | What's actually happening |
|---|---|
| "We can decide the architecture later" | Decision window is closing; technical debt is cementing |
| "We'll staff it when we need to" | Best engineers getting allocated to other programs |
| "Leadership will be flexible on scope" | Once commitments are public, scope becomes fixed |
| "We have six months before vendor renewal" | Leverage window shrinks daily; vendor knows you're locked in |

---

## 🍌 Banana (Slow Decay)

**What it means:** Was healthy at launch. Degrading without constant attention. No single dramatic failure — cumulative rot that no single status update captures.

**Detection signals — requires time series; any 2+ declining trends = MEDIUM, 3+ = HIGH confidence:**
- Team signal shows declining sentiment across 3+ retro cycles
- Sprint velocity declining 3+ consecutive sprints without reset or replan
- Recurring themes in open items across multiple status cycles (same blocker restated)
- Dependency register has unresolved items older than 2 milestone cycles
- Oncall incident rate trending upward without post-mortem action items being closed
- Documentation freshness declining: artifacts getting progressively staler across time
- Same "action item" appears in multiple consecutive meeting notes without closure

**What the agent cannot assess:**
- Whether the team knows the decay is happening
- Whether the decay is reversible at current intervention level
- Root cause of declining sentiment (workload, leadership, product direction)

**What you hear vs. what's actually happening:**

| What you hear | What's actually happening |
|---|---|
| "We'll clean up technical debt next quarter" | Debt compounding; each sprint gets slower; morale dropping |
| "The team is fine, just busy" | Burnout brewing; key people updating their LinkedIn profiles |
| "We documented everything at launch" | Docs now two years stale; new engineers lost for weeks |
| "We follow the established process" | Teams quietly routing around broken processes; shadow systems emerging |

---

## 🥥 Coconut (Opaque)

**What it means:** The real state requires cracking open a person, not reading a document. The information exists but is protected by layers of organizational scar tissue, verbal commitments without documentation, and assumptions that were never validated.

**Detection signals — any 2+ = MEDIUM, 3+ = HIGH confidence:**
- 3+ of the 9 information categories missing entirely
- Status narrative under 100 words with no specifics
- Decision log sparse, empty, or absent
- Stakeholder map missing or incomplete
- Single-person ownership across multiple artifacts with no written backup
- Multiple artifacts contain "TBD," "N/A," or empty sections
- Scope definition absent or locked in one person's head (Slack thread as only source of truth)
- Status updates require scheduling a call to understand

**Special case:** If you cannot run the diagnostic because there is nothing to read, Coconut is confirmed. The inability to assess is the finding.

**What you hear vs. what's actually happening:**

| What you hear | What's actually happening |
|---|---|
| "Team X will deliver their API on time" | Their backlog is packed; no one has actually committed capacity |
| "Vendor confirmed the timeline" | Sales said yes; the delivery team doesn't know about the commitment |
| "We've identified all major risks" | Known risks only; unknown unknowns lurking everywhere |
| "The documentation says it supports that feature" | Docs are five years old; actual system behavior unknown |

---

## 🍇 Grape Cluster (Hidden Interconnections)

**What it means:** Looks like many individual items, but they're all connected by the same stem. Pull one grape and you might get the whole bunch. Hidden interconnections that only become visible during failure.

**Detection signals — any 2+ = MEDIUM, 3+ = HIGH confidence:**
- Dependency map missing or has 3+ "TBD" entries
- 5+ dependencies owned by the same team or person
- Risk register has 3+ risks referencing the same component, service, or system
- Roadmap has milestones with no dependency mapping despite obvious cross-team scope
- Architecture doc or design spec missing service dependency section
- CODEOWNERS or DRI list absent or incomplete
- Post-mortems from past incidents reference "unexpected dependency" as contributing factor
- A config, library, or API is shared across teams but has no explicit owner

**What the agent cannot assess:**
- Whether coupling is an intentional architectural decision or accumulated accident
- Whether the dependency owner knows they are load-bearing for multiple other teams
- Blast radius of a failure in the shared component

**What you hear vs. what's actually happening:**

| What you hear | What's actually happening |
|---|---|
| "Isolated outage in Service A" | Service A calls B calls C; cascading failure imminent |
| "Small config change, low risk" | Config shared by twelve services; change breaks six of them |
| "We'll migrate teams one at a time" | First team depends on second; migration order matters critically |
| "Reorg only affects Team X" | Team X owns shared services; ten teams lose their point of contact |

---

## 🍅 Tomato (Wrong Category)

**What it means:** Classified as one thing, actually another. The framing determines the investment level — and the framing is wrong. Most commonly: a systemic problem labeled as a quick win, a complex feature labeled as a minor change, or a bug pattern that signals architectural failure but gets triaged as isolated incidents.

Detection reads against scope definition, complexity signals, and estimate history — not status reports. The problem isn't hidden reporting; it's a category error that was never questioned.

**Detection signals — any 2+ = MEDIUM, 3+ = HIGH confidence:**
- Scope definition classifies the work as "small" or "quick win" but the technical spec (if it exists) references 3+ services, schema changes, or cross-team coordination
- Estimate history shows the same class of work consistently running 2x–3x the original estimate with no recalibration
- Jira ticket labeled as "bug" or "tech debt" but root cause points to a missing capability, a design gap, or an architectural constraint
- Support ticket clusters: 3+ tickets in the same area within a sprint that are triaged as isolated but share a common failure mode
- Work item entered sprint as "2 points" or "minor change" and exits incomplete or carrying a tail of follow-on tickets
- Complexity analysis (CODEOWNERS, service map, config references) reveals blast radius that the ticket description doesn't mention
- "Quick win" language appears in roadmap or stakeholder update for work that has no written scope boundary or acceptance criteria
- Feature request or project framed as "just [X]" where [X] requires integration, migration, or cross-team agreement

**What the agent cannot assess:**
- Whether the miscategorization was deliberate (sandbagging, scope compression under pressure) or genuine (knowledge gap about downstream impact)
- Whether the team doing the work already knows it's more complex than scoped
- Whether the estimate history pattern is visible to leadership or only to the team

**What you hear vs. what's actually happening:**

| What you hear | What's actually happening |
|---|---|
| "It's just a UI change" | UI change requires API contract, data migration, and consent flow update |
| "Small bug, should be a one-pointer" | Fifth ticket in the same subsystem this sprint; the bug is a symptom |
| "Quick win — we can deliver this in a week" | No scope doc, no acceptance criteria, no dependency check — it will take four weeks |
| "We estimated it at two weeks" | Same team estimated the last three similar items at two weeks; all took six |
