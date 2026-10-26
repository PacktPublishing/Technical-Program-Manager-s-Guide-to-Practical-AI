# /portfolio-simulator — Portfolio Simulator Agent

**Role:** Advance the NovaGrid portfolio state to any target date with realistic, tension-aware changes
**Writes to:** `1-inputs-triggers/`, `3-memory-knowledge/layer3-programs/`, `1-inputs-triggers/simulation-log.json`

---

## Purpose

Given a target date, simulate what the NovaGrid portfolio state would realistically look like by that date. This is not mechanical advancement — the agent must reason about cause and effect given the current tensions, known risks, and inter-program dependencies.

The simulation produces updated versions of all data files (Jira, Aha!, Salesforce, program master docs) plus a simulation log explaining what happened and why.

**Use case:** Practice running skills against realistic program states at different points in time. Advance to May 2026 and practice a SteerCo prep. Advance to July 2026 and see what happened to HORIZON.

---

## Invocation

```
Run 5-agent-harness/sub-agents/portfolio-simulator.md
Target date:  [YYYY-MM-DD]
Current date: [YYYY-MM-DD]   # optional — defaults to the Aha! export's _meta.exported_at
```

Optional modifiers:
```
Inject event: [describe a specific event to force into the simulation]
# Examples:
#   "Inject event: Apple rejects the HORIZON iOS submission on Aug 18"
#   "Inject event: Lead engineer on SHIELD quits Sep 2"
#   "Inject event: SPARK M2 lands on time Aug 11"
```

> **Never hardcode a current date or a tension list into this file.** Both are read from live state at run time (Step 0). An earlier version of this spec pinned "Current date: 2026-03-11" and reasoned through five March tensions; by August every one of them had resolved, and running the agent verbatim would have re-litigated March's conflicts against August's data.

---

## Simulation logic

### Step 0 — Read the current state

Do not assume any date or tension. Derive both:

1. **Current date** — `1-inputs-triggers/aha/novagrid-aha-export.json` → `_meta.exported_at`. This is the milestone SoT and therefore the portfolio's real "as of". Override only if the invocation supplies one explicitly.
2. **Run `python scripts/check_novagrid_consistency.py` first.** If it fails, the state is not coherent and simulating from it will produce coherent-looking output built on a contradiction. Fix, then simulate.
3. **The live tension set** — read, in this order:
   - `3-memory-knowledge/layer4-weekly/this-week.md` → *Top 3 escalations* (decisions with owners and deadlines) and *Open decisions (not yet escalated)*
   - `3-memory-knowledge/raid-log.md` → open Risks, Assumptions, Issues, and any DEP-xxx marked Open
   - `3-memory-knowledge/cross-program-dependencies.md` → dependencies not yet closed
   - `1-inputs-triggers/simulation-log.json` → `openTensionsAtBoundary` from the previous run
4. **Milestones in the window** — every Aha! milestone whose `targetDate` falls between current and target date. Each one needs an explicit outcome: closed on time, closed late (state the delta), missed and revised (state the new date), or still open with a percentage.

### Step 1 — Establish the time delta

Compute weeks elapsed from current date to target date. Each two-week period is one sprint for Jira-tracked programs (SHIELD, PULSE, MERIDIAN + DataCore-Infra). Sprint numbering continues from the last entry in the Jira export's `sprints` array — do not restart it.

Roughly 8–14% milestone progress per week for active, unblocked work.

### Step 2 — Resolve each live tension

For every item gathered in Step 0.3, decide an outcome and record *why*. Use these rules rather than narrative preference:

- **Decisions with a stated deadline inside the window must resolve.** A decision listed with a deadline of "today" does not quietly persist for six weeks.
- **A documented mitigation that is already in flight usually works** — but delivers on its own ramp, not instantly. A person assigned this week is productive in one to two weeks.
- **An intervention approved close to a deadline generally does not save that deadline.** It moves the outcome, not the date.
- **At least one thing should go wrong that is not on any list.** Real portfolios generate their own surprises — an audit finding, an undocumented dependency, an external review. Take it from the `Event injection` table below or invent one grounded in a known structural weakness.
- **Externally gated items are not controllable.** Where a third party decides (an auditor, an app store, a customer's legal team), the program can only choose how it prepares. Do not resolve these by internal effort.
- **Prefer the boring outcome.** Most commitments held by programs with a track record of holding them do hold.

Record each resolution in the ledger (Step 5) *before* touching any data file.

### Step 3 — Cascade

No program moves alone. For each resolution, walk `cross-program-dependencies.md` and apply the second-order effect. Two patterns to watch for specifically:

- **A shared-team allocation is not a protection.** If a program that shares a team hits a production incident, it takes that team regardless of the written percentage split. Reflect this in the consuming program's progress, not just in a note.
- **Delivery slips convert into commercial ones.** A missed milestone that a customer was tracking changes an opportunity's probability or close date, even when nobody renegotiated anything.

### Step 4 — Advance program data

For each program, update all three data sources:

**Aha! updates:**
- Milestone percentComplete: advance by realistic weekly rates
  - Active, unblocked milestones: 8–14% per week
  - Milestones with blockers: 2–4% per week
  - Milestones blocked on external dep: 0% until dep resolves
- Update milestone status (not_started → at_risk → behind / on_track) based on trajectory
- Update overallRag

**Jira updates:**
- Epic percentComplete: advance in proportion to Aha! milestone progress
- Move issues from todo → inProgress → done at realistic rates
- Add new blockers if tensions worsen
- Remove blockers if tensions resolve
- Adjust team capacity allocations if bandwidth decisions are made

**Salesforce updates:**
- opportunity probability: increase by 5–15% if program dependency is met; decrease by 10–25% if missed
- closeDate: slip if program dependency at risk
- Update revenueAtRisk based on new program status
- If a deal closes: mark won, update arr_current

**Program master docs:**
- Update milestone RAG column to match Aha!
- Add new risks if blockers surface
- Close resolved risks
- Update "Latest update" section with a realistic TPM-authored narrative for the target date

### Step 5 — Inject discrete events

If events are injected or probabilistically triggered:

| Event type | Data changes |
|------------|-------------|
| Engineer leaves | Jira: team headcount -1, availableSP -10/sprint, milestone slips 2-4wk |
| Sprint overcommit | Jira: epic % advancement halves for one sprint |
| Deal closes | Salesforce: stage → Closed Won, arr_current updated, probability 100% |
| Audit finding | New blocker on the affected program; the milestone reopens rather than slipping cleanly. Consider whether the finding also invalidates a *date* the org has been reporting, not just a deliverable |
| Incident (SEV1/SEV2) | Affected program epics -30% velocity for one sprint; new risk added; a sibling program sharing that team loses capacity too, whatever the written split says |
| Exec mandate issued | Jira: blocked epics unblock, new assignees added |
| External review pending | The program can prepare but cannot resolve. Milestone stays open with a decision window, not a delivery date |
| Contract / vendor decision | Cascade through every dependent program listed in `cross-program-dependencies.md` |

### Step 6 — Produce the simulation ledger

**Write this before editing any data file.** Every subsequent write is a mechanical projection of it. Deciding outcomes once, in one place, is what stops the layers drifting apart — which is exactly how the Jun 29 – Aug 10 split-brain happened.

Write to `1-inputs-triggers/simulation-log.json`:

```json
{
  "simulationRun": "ISO timestamp",
  "fromDate": "[current date, from Step 0]",
  "toDate": "[target date]",
  "weeksAdvanced": N,
  "baselineNote": "Why this fromDate — especially if layers disagreed and one was chosen as canon",
  "outcomePosture": "realistic mixed | favorable | stress",
  "sprints": [ { "id": "SPR-2026-NN", "window": "...", "outcome": "closed|active", "completedPoints": N, "plannedPoints": N, "note": "..." } ],
  "tensionsResolved": [...],
  "tensionsWorsened": [...],
  "weeks": [ { "week": "WNN", "window": "YYYY-MM-DD to YYYY-MM-DD", "events": [ { "date": "...", "program": "...", "event": "...", "decisionRecord": "DR-0NN" } ] } ],
  "milestoneOutcomes": [ { "id": "PROG-MN", "result": "closed|missed|open", "date": "...", "target": "...", "delta": "...", "revisedTarget": "..." } ],
  "eventsInjected": [...],
  "eventsTriggered": [...],
  "salesforceChanges": { "closedWon": [...], "probabilityChanges": [...] },
  "revenueAtRiskDelta_usd": N,
  "newDecisionRecords": [ { "id": "DR-0NN", "date": "...", "title": "..." } ],
  "ragAtBoundary": { "NEXUS": "green", "...": "..." },
  "openTensionsAtBoundary": ["Fed into Step 0.3 of the next run"],
  "narrativeSummary": "Plain English: what happened and what it means for the portfolio"
}
```

---

## What the agent must NOT do

- Do not hardcode a date or a tension list — both come from Step 0, every run
- Do not simulate from state that fails `scripts/check_novagrid_consistency.py`
- Do not advance milestones that are blocked — 0% progress on hard dependencies
- Do not resolve tensions arbitrarily — apply the Step 2 rules and record the reasoning in the ledger
- Do not make all deals close — maintain realistic probability outcomes
- Do not ignore compounding effects — a slip in one program is rarely contained to it
- Do not write program master doc updates that sound optimistic when the data is red
- Do not update only the layers you find interesting. Advancing the weekly layer without the exports beneath it is what produced the Jun 29 – Aug 10 split-brain, and nothing detected it for six weeks

---

## Output files (write all of these)

Write the ledger first (Step 6), then project it into:

**Data exports** — all six, so no source is left stamped older than the rest:
1. `1-inputs-triggers/aha/novagrid-aha-export.json` — milestone SoT; leads
2. `1-inputs-triggers/jira/novagrid-jira-export.json` — sprints, epics, `issues_by_program`, `team_capacity.snapshot_date`
3. `1-inputs-triggers/salesforce/novagrid-sfdc-export.json` — probabilities, close dates, revenue at risk
4. `1-inputs-triggers/vanta/novagrid-vanta-export.json` — SHIELD only
5. `1-inputs-triggers/datadog/novagrid-datadog-export.json` — SLO actuals, incidents
6. `1-inputs-triggers/jira/novagrid-jira-l3-tickets.json` and `1-inputs-triggers/salesforce/novagrid-sfdc-support-tickets.json` — ticket corpora

**Narrative layers:**
7. `3-memory-knowledge/layer3-programs/*-master.md` — all changed programs
8. `3-memory-knowledge/layer2-portfolio/program-index.md` · `fy2026-okrs.md` · `dependency-matrix.md`
9. `3-memory-knowledge/cross-program-dependencies.md` · `raid-log.md`
10. `3-memory-knowledge/layer1-always/company-changes-q2-2026.md` · `source-registry.md` (and `company-snapshot.md` if a board-level fact changed)
11. `3-memory-knowledge/layer4-weekly/` — one archive per elapsed week, then a fresh `this-week.md`. Preserve its section structure: `dashboard/refresh.ps1` parses the "Program master doc health" table and the numbered escalation rows by regex
12. `2-goals-policies/constraints/decision-records/DR-0NN-*.md` — one per decision in the ledger

**Then verify:**
```
python scripts/check_novagrid_consistency.py    # must exit 0
```

Then prompt: "Simulation complete and consistency checks passing. Run `/portfolio-monitor` to regenerate the dashboard?"

---

## Example invocations

### Forward run: advance to the end of the quarter

```
Run 5-agent-harness/sub-agents/portfolio-simulator.md
Target date: 2026-09-30
```

The agent reads the current date from the Aha! export, pulls the live tension set from `this-week.md` and `raid-log.md`, and resolves each item with a deadline inside the window. It does not need to be told what the tensions are.

### Stress test: force the externally-gated risk the wrong way

```
Run 5-agent-harness/sub-agents/portfolio-simulator.md
Target date: 2026-09-30

Inject event: Apple rejects the HORIZON iOS submission on Aug 18, requiring resubmission
```

Expected shape of the outcome — HORIZON M8 misses Aug 31; the Android-alone contingency becomes a forced decision rather than a chosen one; Solaris ($2.4M, Sep 15) sees a third slipped date and its probability falls; Kestrel tranche 2 ($800K, Oct) moves. Note that no amount of NovaGrid execution changes the first domino — that is the point of the scenario.

### Recovery test: what if the thing due tomorrow lands

```
Run 5-agent-harness/sub-agents/portfolio-simulator.md
Target date: 2026-10-15

Inject event: SPARK M2 closes on time Aug 11
```

Expected shape — M3 (Sep 30) starts Aug 25 with its full window; the Dec 31 GA chain holds; the VantagePoint Sep 15 roadmap review passes cleanly. Useful as the counterfactual against a default run where M2 slips.
