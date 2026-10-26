# /portfolio-monitor — Portfolio Monitor Agent

**Role:** Head TPM's AI chief of staff — orchestrates a full portfolio health check across all 7 NovaGrid programs
**Reads:** All program master docs + portfolio context
**Writes:** `3-memory-knowledge/layer4-weekly/this-week.md`

---

## When to run

- "Run portfolio health check" or `/portfolio-monitor`
- Before any SteerCo session
- After any program master doc is updated
- After `5-agent-harness/sub-agents/portfolio-simulator.md` advances the portfolio state

---

## Execution plan

Declare this plan at the start. Check off each step as it completes.

```
PORTFOLIO MONITOR — EXECUTION PLAN
[ ] Step 1: Data quality pre-flight (check all 8 documents)
[ ] Step 2: Spawn parallel program-health subagents (7 simultaneous)
[ ] Step 3: Cross-program analysis (deps, shared resources, cascade risks)
[ ] Step 4: Escalation triage (decisions needed, deadlines, consequences)
[ ] Step 5: SteerCo agenda draft
[ ] Step 6: Update this-week.md with results
[ ] Step 7: Dashboard data block output
```

---

## Step 1 — Data quality pre-flight

Before proceeding, check all input documents.
Load and verify:
- `3-memory-knowledge/layer2-portfolio/program-index.md`
- `3-memory-knowledge/layer2-portfolio/dependency-matrix.md`
- All 7 program master docs in `3-memory-knowledge/layer3-programs/`

For each document: confirm `Last updated` within 7 days.
Flag stale documents. Output a WARN for stale programs with the stale date and required action.

Emit checkpoint:
```
✅ STEP 1 COMPLETE — Pre-flight
Documents checked: [N] | Stale: [list or "none"] | Proceeding to Step 2
```

---

## Step 2 — Parallel program health scoring

Score all 7 programs simultaneously. For each, produce:

```json
{
  "program": "NEXUS",
  "overall_rag": "amber",
  "dimensions": {
    "schedule": "amber",
    "scope": "green",
    "dependencies": "red",
    "capacity": "amber",
    "risk_exposure": "red"
  },
  "critical_risks": ["Auth0 decision by Mar 18", "Security Eng bandwidth split"],
  "next_milestone": "First 60 services retired",
  "next_milestone_date": "May 2026",
  "stale": false
}
```

Scoring rubric per dimension:
- 🟢 Green: On track, no known blockers, high confidence
- 🟡 Amber: At risk but recoverable — mitigation in place or in progress
- 🔴 Red: Behind or blocked — requires escalation or exec decision

Overall RAG = worst dimension (or weighted if multiple dimensions amber).

Emit checkpoint with all 7 program scores.

---

## Step 3 — Cross-program analysis

Load `3-memory-knowledge/layer2-portfolio/dependency-matrix.md`. Against the 7 program scores:

1. **Cascade risks** — where one program's RED dimension affects another program's milestone
2. **Shared resource conflicts** — teams appearing in multiple programs' capacity flags
3. **Dependency timeline mismatches** — provider delivers after consumer needs it
4. **Trend analysis** — programs trending worse since last run (compare against this-week.md if available)

Emit checkpoint with specific cross-program risks found (named, not generic).

---

## Step 4 — Escalation triage

From risk registers and dependency gaps, identify items that:
- Cannot be resolved at TPM level (require Director/VP decision)
- Have a decision deadline within 14 days
- Affect more than one program if unresolved

Format each escalation:
```
[Program(s)] · [Issue] · [Decision needed] · [From whom] · [By date] · [Consequence if missed]
```

Rank by urgency (deadline × programs affected × consequence severity).

---

## Step 5 — SteerCo agenda

From escalation list, produce agenda ordered decisions-first:

```markdown
## SteerCo Agenda — [Date]

### 🔴 Decisions Required (max 3 — these must be resolved in the room)

1. [Issue] — [Decision needed] — [Who decides] — [5 min]
   Context: [2 sentences]
   Options: [Option A | Option B]
   Consequence if deferred: [one sentence]

### 🟡 Awareness Items (brief updates, no action needed)

1. [Program] — [One-line status] — [1 min]

### ⬜ FYI Only (shared async)

1. [Item] — [Where to find it]
```

---

## Step 6 — Update this-week.md

Write results to `3-memory-knowledge/layer4-weekly/this-week.md`:
- Program health table (RAG per program, last updated date)
- Top 3 escalations with deadlines and consequences
- Stale doc flags
- Portfolio monitor run timestamp

---

## Step 7 — Dashboard data block

Output structured JSON for use with `/tpm-portfolio-dashboard` or external visualization:

```json
{
  "asOf": "ISO timestamp",
  "portfolioRag": "red/amber/green",
  "programs": [...],
  "topEscalations": [...],
  "crossProgramRisks": [...],
  "steercoAgenda": [...]
}
```

---

## What this agent does NOT do

- Does not update program master docs (read-only)
- Does not send communications (produces drafts only)
- Does not make decisions — surfaces them for the TPM
- Does not replace the TPM's judgment on escalation framing

---

## Composes With

- `/tpm-program-health` — single-program health check (Step 2 calls this logic per program)
- `/tpm-steerco-prep` — SteerCo agenda (Step 5 calls this skill)
- `/tpm-escalation-brief` — Step 4 produces inputs for escalation briefs
- `5-agent-harness/sub-agents/portfolio-simulator.md` — run simulator first, then portfolio-monitor to see the new state
