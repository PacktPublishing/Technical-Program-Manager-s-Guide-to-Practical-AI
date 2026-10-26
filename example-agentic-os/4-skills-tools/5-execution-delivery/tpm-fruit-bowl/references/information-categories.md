# Information Categories

The 9 information categories required for a complete fruit bowl diagnostic. Referenced by `rounds/assess.md`.

The skill works with what exists. Gaps in coverage are signal, not blockers.

---

## The 9 Categories

| # | Category | What it captures | Freshness threshold |
|---|---|---|---|
| 1 | **Reported status** | What someone said the state is | ≤ 1 week |
| 2 | **Actual delivery data** | What actually happened — velocity, milestones, burndown | ≤ 1 week (live) or ≤ 2 weeks (snapshot) |
| 3 | **Scope definition** | Written scope boundary (in/out) | ≤ 4 weeks |
| 4 | **Decision state** | Open and closed decisions with owners and dates | ≤ 2 weeks |
| 5 | **Risk state** | Risks with owner, date, mitigation status | ≤ 2 weeks |
| 6 | **Dependency map** | Cross-team or cross-system dependencies with owners | ≤ 4 weeks |
| 7 | **Timeline baseline** | Original plan vs. current state (delta visible) | ≤ 2 weeks |
| 8 | **Team signal** | Sentiment, retro themes, health indicators, morale | ≤ 3 weeks |
| 9 | **Open work** | Blockers, aged items, action items, unresolved tickets | ≤ 1 week |

---

## Artifact Mapping by Role

| Category | TPM artifact | PM artifact | Engineering artifact |
|---|---|---|---|
| Reported status | `status-report.md`, RAG email, SteerCo deck | OKR snapshot, roadmap slide, weekly update | Sprint report, Slack update, eng weekly |
| Actual delivery data | `milestone-tracker.md`, Aha milestones | Roadmap milestone history, feature burndown | Ticket burndown, velocity chart, commit frequency |
| Scope definition | `program-charter.md`, scope doc | PRD, one-pager, product brief | Tech spec, design doc, RFC |
| Decision state | `decision-log.md`, RAID log | Decision log, RFC status tracker | RFC, ADR, design review notes |
| Risk state | `risk-register.md`, RAID log | Risk section in PRD, issue tracker | Risk section in design doc, incident history |
| Dependency map | `dependency-register.md`, cross-program matrix | Integration matrix, partner commitments | Service map, CODEOWNERS, API contract list |
| Timeline baseline | `roadmap.md`, program timeline | Roadmap, release plan | Sprint plan, migration tracker, gantt |
| Team signal | `team-health.md`, retro summaries | Team retro, satisfaction survey | Oncall load, retro, incident rate, eng survey |
| Open work | `open-items.md`, escalation log | Backlog, P0 list, blockers column | Bug tracker, tech debt log, PR backlog |

---

## Coverage Scoring

Rate each category during Round 1 (assess.md):

| Status | Meaning |
|---|---|
| ✅ Present | Artifact exists, content is current (within freshness threshold) |
| ⚠️ Stale | Artifact exists but older than freshness threshold |
| ❌ Missing | No artifact found for this category |

**Coverage score:** Count of Present categories out of 9.
- 8–9 present: Full coverage — all patterns assessable
- 5–7 present: Partial coverage — flag which patterns are LOW or UNASSESSABLE
- 3–4 present: Sparse — Coconut signal, multiple patterns UNASSESSABLE
- 0–2 present: Coconut confirmed — diagnostic cannot proceed without human input

---

## Absence as Signal

Missing categories map directly to failure pattern signals:

| Missing category | Failure pattern signal |
|---|---|
| Decision state | 🥑 Avocado — decisions may be drifting past their window |
| Dependency map | 🍇 Grape Cluster — interconnections are unmapped |
| Risk state | 🍉 Watermelon — risks may be hidden |
| Team signal | 🍌 Banana — decay may be invisible |
| 3+ categories missing | 🥥 Coconut — opacity confirmed |
| Reported status contradicts actual delivery data | 🍉 Watermelon — explicit contradiction signal |
| Scope definition classifies work as "small" but technical spec or estimate history says otherwise | 🍅 Tomato — category error, complexity underestimated |
| Same open item in 3+ status cycles | 🍉 Watermelon — delivery reality diverging from reported status |
