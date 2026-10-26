# Round 2 — Pattern Scoring (score.md)

**Purpose:** Score all 7 patterns with confidence levels using the Round 1 coverage map, human annotations from Checkpoint 1, and original artifacts. Produce an auditable diagnostic with chain of custody.

This round does the scoring. Every pattern gets a rating. Every rating gets a confidence level. Every rating cites specific evidence.

---

## Instructions

Read `references/patterns.md` and `references/confidence-model.md` before scoring.

Inputs for this round:
1. Round 1 context audit output
2. Human annotations from Checkpoint 1
3. Original artifacts (re-read as needed for specific evidence)

For each of the 7 patterns:
1. Count corroborating signals present (from `references/patterns.md` detection criteria)
2. Apply confidence level (from `references/confidence-model.md`)
3. Cite specific evidence for each signal claimed
4. Adjust for human annotations — if the human explained a signal, document the adjustment
5. Rate the pattern: **Detected / Possible / Not detected / UNASSESSABLE**

Determine PRIMARY and SECONDARY patterns. Patterns do not cancel each other out.

---

## Round 2 Output Template

```markdown
## Fruit Bowl Diagnostic — [Initiative Name]
**Role:** [tpm | pm | eng]
**Diagnostic date:** [date]
**Human annotations incorporated:** Yes / No (if no: explain why Checkpoint 1 was skipped)

---

### PRIMARY PATTERN

[Emoji] [Pattern name] — [HIGH / MEDIUM / LOW] CONFIDENCE

**Evidence:**
- [Signal 1]: [Specific artifact, specific data point or quote]
- [Signal 2]: [Specific artifact, specific data point or quote]
- [Signal 3]: [Specific artifact, specific data point or quote]

**Human annotation:** [What the human confirmed, corrected, or added]
**Confidence rationale:** [Why this confidence level — number of signals, freshness, conflicts]

---

### SECONDARY PATTERN(S)

[Emoji] [Pattern name] — [HIGH / MEDIUM / LOW] CONFIDENCE

**Evidence:**
- [Signal 1]: [Specific artifact, specific data point]
- [Signal 2]: [Specific artifact, specific data point]

**Human annotation:** [If applicable]

---

### WITHIN NORMAL RANGE

[Emoji] [Pattern name] — [LOW / not detected]
[One sentence: what was checked and why this pattern was not flagged]

---

### UNASSESSABLE

[Emoji] [Pattern name] — UNASSESSABLE
**Reason:** [Which information category is missing]
**Recommendation:** [What artifact or action would make this assessable]

---

### Questions the Data Cannot Answer

These are not open items — they are specific gaps where agent reasoning hit its limit and human judgment is required before action can be taken.

1. [Specific question the evidence surface but cannot resolve]
2. [...]
3. [...]

---

### Recommended Actions

Ordered by urgency. Every action has a specific owner and timeframe.

| Priority | Action | Why | Owner | By |
|---|---|---|---|---|
| 🔴 Immediate | | | | |
| 🟡 This week | | | | |
| 🟢 Before next milestone | | | | |

---

### Chain of Custody

| Step | Actor | What was reviewed or added |
|---|---|---|
| Context pull | Agent (MCP: [list]) | [Categories populated from live sources] |
| Context pull | Agent (static) | [Uploaded or pasted artifacts] |
| Round 1 audit | Agent | 9 information categories assessed, [N] contradictions found |
| Checkpoint 1 | [Human name or "pending"] | [What was confirmed, corrected, or added] |
| Round 2 scoring | Agent | 7 patterns scored, [N] detected, [N] UNASSESSABLE |
| Checkpoint 2 | [Human name or "pending"] | [Approved / adjusted — describe changes] |
```

---

## Scoring Guidance

### On evidence citation

Never state a signal without citing its source. Acceptable citation forms:
- "[artifact-name.md], [section or line]: '[exact quote]'"
- "Jira sprint export, Sprint 14: velocity = 18 (Sprint 12: 31, Sprint 13: 24)"
- "status-report-2026-05-12.md, para 3: 'we expect to complete integration by end of sprint'"

Unacceptable:
- "The status report suggests things may be behind"
- "Velocity appears to be declining"

### On human annotations

When the human explained or corrected a signal at Checkpoint 1, document it explicitly:
- **If fully explained:** "Human confirmed: velocity drop in Sprint 14 was due to two engineers on PTO. Signal removed from Watermelon count."
- **If partially explained:** "Human noted: PTO accounts for some velocity drop, but blocker aging predates the PTO window. Signal retained at reduced weight."
- **If unexplained or confirmed:** "Human confirmed: slippage is not known to leadership. Signal weight increased."

### On the PRIMARY / SECONDARY distinction

- **PRIMARY:** The most severe or most evidence-supported pattern. If two patterns tie on confidence, the more actionable one is PRIMARY.
- **SECONDARY:** Additional patterns with sufficient evidence. List all that meet MEDIUM or above.
- **Not detected:** 0–1 signals, no human confirmation. State what was checked.
- **UNASSESSABLE:** Information category absent. Never skip — the absence is the finding.

### On recommended actions

Actions must be specific enough to assign:
- Bad: "Improve status reporting transparency"
- Good: "Correct status report to AMBER before Wednesday SteerCo. Bring the Sprint 13–14 velocity chart explicitly."

Every action has an owner (named role or named person from context) and a timeframe.

### On the chain of custody

The chain of custody is what makes the diagnostic defensible. It answers: "How did you arrive at this finding?" without requiring anyone to re-read all the evidence. Complete it even when some steps are not yet done (mark as "pending").
