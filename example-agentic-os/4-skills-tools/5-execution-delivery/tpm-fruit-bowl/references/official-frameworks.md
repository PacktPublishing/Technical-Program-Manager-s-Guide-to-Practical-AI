# Official Frameworks Reference

Framework citations and thresholds used in pattern detection. Referenced by `rounds/score.md` for evidentiary grounding.

---

## EVM (Earned Value Management) Thresholds

Used for Watermelon detection — objective divergence between plan and actuals.

| Metric | Formula | Warning threshold | Critical threshold |
|---|---|---|---|
| **SPI** (Schedule Performance Index) | EV / PV | < 0.9 | < 0.8 |
| **CPI** (Cost Performance Index) | EV / AC | < 0.9 | < 0.8 |
| **SV** (Schedule Variance) | EV – PV | Negative | > 10% of PV |

**Key finding:** PMI research shows that once CPI falls below 0.9, it rarely recovers. A program with SPI < 0.9 and RAG = GREEN is a Watermelon by definition.

**Application:** When Jira velocity or milestone tracker data is available, calculate implied SPI. If velocity is declining for 3+ sprints and status shows GREEN, flag as Watermelon signal regardless of reported percentage complete.

---

## PMBOK 7 (7th Edition) — Performance Domains

Relevant performance domains and their diagnostic implications:

| Domain | Diagnostic relevance | Pattern |
|---|---|---|
| **Stakeholder** | Engagement gaps, silent disagreement, misalignment not surfaced in status | 🍉 Watermelon |
| **Team** | Morale trends, burnout signals, documentation decay, shadow systems | 🍌 Banana |
| **Development Approach** | Methodology fit; process workarounds signal decay | 🍌 Banana |
| **Planning** | Missing plans, TBD placeholders, decisions deferred past windows | 🥑 Avocado, 🥥 Coconut |
| **Project Work** | Unresolved blockers, aged items, velocity signals | 🍉 Watermelon |
| **Delivery** | Milestone slippage, scope delta, acceptance criteria gaps | 🍉 Watermelon |
| **Measurement** | KPI absence, stale metrics, lagging vs. leading indicator misuse | 🍉 Watermelon, 🍌 Banana |
| **Uncertainty** | Hidden dependencies, unvalidated assumptions, complexity from interconnection | 🍇 Grape Cluster |

**PMBOK 7 key principles applied:**
- Principle 11 (Adaptability and Resilience): Declining velocity without replan = failure to adapt
- Principle 12 (Enable Change): "TBD" scope with no change control = Avocado in progress
- Principle 7 (Systems Thinking): Hidden interconnections require explicit mapping — not just mental models

---

## PMI Program Standard (3rd Edition)

Governance and benefits realization requirements:

| Standard | Diagnostic threshold | Pattern |
|---|---|---|
| Benefits realization | If the program cannot articulate how current work maps to committed benefits, report as AT RISK | 🍉 Watermelon |
| Decision authority | Decision authority must be documented and active. Deferred decisions blocking benefits = governance failure | 🥑 Avocado |
| Interdependency management | Interdependencies among component projects must be explicitly identified and managed | 🍇 Grape Cluster |
| Transparent reporting | Reporting must enable drill-down without requiring a person as the interface | 🥥 Coconut |
| Stakeholder engagement | Chronic AMBER without escalation is a governance failure, not a delivery failure | 🍉 Watermelon |
| Scope management | Work labeled as "quick win" or "minor change" without written scope boundary or acceptance criteria is an unmanaged scope risk | 🍅 Tomato |
| Complexity estimation | Three-point estimation (PERT: optimistic / likely / pessimistic) required before committing to timelines; single-point estimates compress complexity into false precision | 🍅 Tomato |

---

## PMI Research — Status Reporting Reality

- Only **31% of programs** meet their original goals, timeline, and budget (PMI Pulse of the Profession)
- Most of those programs showed **green status right up until they didn't**
- Root cause: honesty feels unsafe. In blame-heavy cultures, red gets treated as failure rather than information.

**Implication for the diagnostic:** The baseline assumption is that GREEN is optimistic until corroborated by delivery data. The diagnostic does not start from a position of trust — it starts from a position of verification.

---

## Hedging Language Taxonomy

For Watermelon NLP detection — phrases that signal hidden risk the author may not consciously recognize:

**High signal (strong hedging):**
- "hopefully," "fingers crossed," "all going well"
- "should be fine," "expect to," "plan to"
- "working toward," "working on it," "making progress"

**Medium signal (soft hedging):**
- "on track to," "targeting," "aiming for"
- "pending [X]," "subject to [X]," "assuming [X]"
- "we believe," "we think," "we anticipate"

**Low signal (appropriate uncertainty language):**
- "risk identified," "dependency on [named team]"
- "blocker logged," "escalated to [name]"
- "confidence: medium" (explicit, not hidden)

**Key principle:** Appropriate uncertainty language is transparent about what is unknown. Hedging language presents uncertainty as likely-fine. The difference is whether the risk is surfaced or softened.
