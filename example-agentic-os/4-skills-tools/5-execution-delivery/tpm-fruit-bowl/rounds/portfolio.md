# Portfolio Mode — Fruit Bowl Heat Map (portfolio.md)

**Purpose:** One-round pattern scan across all active programs. No checkpoints. Produces a ranked heat map and recommended deep-dive order.

Portfolio mode trades depth for breadth. The two-round + checkpoint workflow is impractical across 7 programs. Instead: load structured data, apply the highest-signal detection criteria from `references/patterns.md`, assign confidence from structured evidence only, surface what needs a human and flag it explicitly in the output.

---

## Instructions

Read `references/patterns.md` and `references/confidence-model.md` before starting.

### Step 1 — Load data sources

Load all of the following (use whatever is available; note what is missing):

| Source | Path | What it provides |
|---|---|---|
| Program index | `3-memory-knowledge/layer2-portfolio/program-index.md` | Quick status table — RAG, phase, TPM, next milestone |
| Program master docs | `3-memory-knowledge/layer3-programs/[program]-master.md` (all 7) | Full per-program context: milestones, risk register, dependencies, team commitments, narrative |
| Jira export | `1-inputs-triggers/jira/novagrid-jira-export.json` | Sprint velocity, blocker counts, issue age, escalation status |
| Aha! export | `1-inputs-triggers/aha/novagrid-aha-export.json` | Milestone RAG, percentComplete, target dates, ragNote per milestone |
| Dependency matrix | `3-memory-knowledge/layer2-portfolio/dependency-matrix.md` | Cross-program dependency grid, shared resource conflicts |

If a source is unavailable, note it and proceed. Missing Jira/Aha data degrades Banana and Tomato detection confidence; missing master docs trigger Coconut signal for that program.

### Step 2 — Score each program

For each of the 7 programs, evaluate the signals below using only what the structured data shows. Do not ask for human input — mark signals as LOW or flag them for deep dive instead.

Work through all 7 programs before writing output. Do not produce partial results.

#### Signal checklist per program

**🍉 Watermelon — check for:**
- Overall RAG (from program-index or master header) vs individual milestone RAGs (from Aha! or master milestones table)
- Overall RAG vs risk register severity distribution
- Status narrative hedging language (from master doc "latest update" section)
- Program at the same percentComplete for 2+ consecutive milestone entries

**🥑 Avocado — check for:**
- Open decisions in the risk register or master doc with no owner or no date
- Milestones dependent on an external decision gate (named person, named date)
- External constraints with a hard date: contract renewals, compliance cutoffs, API deprecations
- "TBD" scope entries with an implied deadline visible in the milestone plan

**🍌 Banana — check for:**
- Sprint velocity trend across last 3 sprints (from Jira: completedPoints / plannedPoints)
- Same blocker appearing across 2+ sprint notes or milestone ragNotes
- Recurring retro themes (if retro notes available in master doc)
- Team commitment % sustained above 100% for 2+ sprints

**🥥 Coconut — check for:**
- Master doc "last updated" date older than 2 weeks
- Risk register absent or empty
- Dependency table absent or all entries marked "TBD"
- Single-owner across 3+ critical artifacts (only one person's name appears)
- Status narrative under 3 sentences with no specifics

**🍇 Grape Cluster — check for:**
- 5+ inbound or outbound dependencies listed in master doc
- Same team or person appearing as owner of 4+ dependencies across different programs (from dependency matrix)
- 3+ risks in the risk register referencing the same component, service, or team
- A shared resource conflict flagged in the dependency matrix

**🍅 Tomato — check for:**
- Milestone or feature labeled "quick win," "minor," or "small" with a scope or estimate that contradicts the label (check Jira story points vs milestone scope)
- Aha! milestone with status "on_track" but percentComplete < 30% and targetDate within 3 weeks
- Jira epic marked "Done" or "Completed" but with open blockers or <100% story points completed
- Scope definition absent for a milestone that involves 2+ teams

**🥝 Kiwi — assign when:**
- Overall RAG matches milestone RAGs (no contradiction)
- Risk register has active mitigations with owners and dates
- Master doc updated within 1 week
- No signals detected for any of the above patterns at MEDIUM or above

### Step 3 — Assign confidence

Apply `references/confidence-model.md`. In portfolio mode:
- **HIGH:** 3+ corroborating signals from fresh data (master doc ≤ 1 week, Jira/Aha current)
- **MEDIUM:** 2 corroborating signals, or 3+ from stale data
- **LOW:** 1 signal, or required data missing, or master doc > 2 weeks old
- Do not use UNASSESSABLE in portfolio output — convert to LOW with a "needs deep dive" flag

### Step 4 — Rank and write output

Order the heat map: 🔴 programs first, then 🟡 by confidence (HIGH before MEDIUM), then 🟢.

---

## Portfolio Output Template

```markdown
## Fruit Bowl Portfolio Scan — [Date]

**Data sources loaded:** [list: program-index, N/7 master docs, Jira ✅/❌, Aha! ✅/❌, dependency matrix ✅/❌]
**Data freshness:** [note any master docs older than 1 week]

---

### Heat Map

| Program | TPM | RAG | Primary Pattern | Confidence | Deep Dive? |
|---|---|---|---|---|---|
| [PROGRAM] | [Name] | 🔴/🟡/🟢 | [emoji + name] | HIGH/MEDIUM/LOW | Yes — [reason] / No / Optional |

*Ordered: 🔴 → 🟡 HIGH → 🟡 MEDIUM → 🟢*

---

### Top Signals

For each HIGH or MEDIUM flagged program, one bullet per primary pattern signal — cite the specific artifact and data point.

**[PROGRAM] — [pattern]:**
- [Signal]: [artifact name, specific quote or number]
- [Signal]: [artifact name, specific quote or number]

---

### Recommended Deep-Dive Order

Rank programs that need a full single-program diagnostic (two-round + checkpoints). Give the reason for the order.

1. **[PROGRAM]** — [reason: e.g., "HIGH confidence Watermelon + SteerCo in 4 days"]
2. **[PROGRAM]** — [reason]
...

Programs not listed: no deep dive recommended at this time.

---

### What Portfolio Mode Cannot Tell You

Portfolio mode reads structured data only. The following require single-program deep dive + Checkpoint 1 to resolve:

- Whether any contradiction is **known to leadership or concealed** (Watermelon confirmation)
- Whether any Avocado decision window is blocked on **data or politics**
- Whether Banana decay is **reversible** at current intervention level
- Whether Grape Cluster coupling is **intentional architecture or accumulated accident**
- Whether Tomato miscategorization was **deliberate sandbagging or a genuine knowledge gap**
- Any signal from a program whose master doc is **stale or missing** (LOW confidence by definition)

To run a full diagnostic on a specific program: `/tpm-fruit-bowl` → single-program mode → [program name]
```

---

## Guidance Notes

**On Kiwi:** Assign Kiwi only when there is genuine absence of signals AND the master doc is fresh AND the Jira/Aha data corroborates. Do not assign Kiwi to a program because its data is missing — that is Coconut.

**On programs with missing master docs:** One missing master doc = Coconut signal for that program at MEDIUM confidence. Note it explicitly. Do not skip the program from the heat map.

**On the deep-dive recommendation:** Every HIGH confidence non-Kiwi program gets "Yes." MEDIUM programs get "Recommended." LOW programs get "Optional." Kiwi programs at any confidence get "No" unless the user specifically asks.

**On portfolio-level Grape Cluster:** The dependency matrix may reveal cross-program cascade risks that no single master doc captures. If 3+ programs share a common dependency owner or component, flag it as a portfolio-level Grape Cluster note below the heat map, separate from any single program's rating.
