# Round 1 — Context Audit (assess.md)

**Purpose:** Map what information is available, assess its freshness, surface contradictions, and pre-assess which patterns are likely assessable before human input is required.

This round does NOT score patterns. It lays the evidentiary foundation and flags where the agent ran out of signal.

---

## Instructions

Read `references/information-categories.md` before starting.

For each of the 9 information categories, determine:
1. Whether an artifact exists (from MCP data, uploaded files, or pasted context)
2. How fresh it is (compare to thresholds in `references/information-categories.md`)
3. What specific signals it contains relevant to the 7 patterns

Then compare across categories to surface contradictions.

Do not score patterns in this round. The output is a coverage map, a contradiction list, and a pre-assessment — nothing more.

---

## Round 1 Output Template

```markdown
## Fruit Bowl Context Audit — [Initiative Name]
**Role:** [tpm | pm | eng]
**Audit date:** [date]
**Sources used:** [MCP-live: GitHub, Jira, Confluence, etc.] [Uploaded: list files] [Pasted: describe]

---

### Information Coverage

| # | Category | Status | Source | Freshness | Key signals found |
|---|---|---|---|---|---|
| 1 | Reported status | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 2 | Actual delivery data | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 3 | Scope definition | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 4 | Decision state | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 5 | Risk state | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 6 | Dependency map | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 7 | Timeline baseline | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 8 | Team signal | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |
| 9 | Open work | ✅/⚠️/❌ | [file or source] | [age] | [brief signal] |

**Coverage:** [N]/9 present · [N] stale · [N] missing

---

### Contradictions Detected

For each contradiction: cite the specific artifacts, quote the conflicting signals, and state why this matters.

1. **[Contradiction description]**
   - Source A: [artifact name, specific quote or data point]
   - Source B: [artifact name, specific quote or data point]
   - Why it matters: [pattern implication — e.g., "Watermelon signal: status says GREEN but velocity declining 3 sprints"]

2. [Repeat for each contradiction found]

*If no contradictions: state explicitly — "No contradictions detected between available artifacts."*

---

### Hedging Language Detected

Scan status reports and stakeholder updates for hedging phrases (see `references/official-frameworks.md`).

| Source | Quoted phrase | Signal strength | Context |
|---|---|---|---|
| [status-report.md, para 2] | "[exact quote]" | High/Medium/Low | [what makes it a hedge] |

*If none found: "No hedging language detected in available status narratives."*

---

### Pre-Assessment: Pattern Assessability

Before human input, which patterns have enough signal to proceed and which don't?

| Pattern | Pre-assessment | Reason |
|---|---|---|
| 🥝 Kiwi | [Strong / Possible / Unlikely / UNASSESSABLE] | [reason] |
| 🍉 Watermelon | [Strong / Possible / Unlikely / UNASSESSABLE] | [reason] |
| 🥑 Avocado | [Strong / Possible / Unlikely / UNASSESSABLE] | [reason] |
| 🍌 Banana | [Strong / Possible / Unlikely / UNASSESSABLE] | [reason] |
| 🥥 Coconut | [Strong / Possible / Unlikely / UNASSESSABLE] | [reason] |
| 🍇 Grape Cluster | [Strong / Possible / Unlikely / UNASSESSABLE] | [reason] |
| 🍅 Tomato | [Strong / Possible / Unlikely / UNASSESSABLE] | [reason] |

---

### For Human Review — Checkpoint 1

Present only what the agent could not resolve. Do not ask the human to re-confirm what the artifacts already show.

**Contradictions requiring interpretation:**
For each contradiction, ask a specific interpretive question:

1. [Contradiction 1]: "[Specific yes/no or either/or question about the interpretation]"
   - E.g., "Is the milestone slippage known to leadership, or is it being held at the team level?"

2. [Contradiction 2]: "[Question]"

**Missing context the artifacts don't contain:**
- Is there organizational context (PTO, reorg, external constraint) that explains [specific signal]?
- Is [named decision or dependency] being tracked somewhere not accessible here?

**Critical gaps:**
- [Category X] is missing entirely. Before Round 2, can you share [specific artifact] or confirm whether it exists?
```

---

## Guidance for Running Round 1

**If MCP data is available:**
Pull Jira sprint data, GitHub commit history, and Confluence/Notion documents before starting. Note which categories were populated from live sources vs. static uploads.

**If no MCP data is available:**
Work with what is uploaded or pasted. Note explicitly which categories could not be assessed.

**On hedging language:**
Apply the taxonomy from `references/official-frameworks.md`. Quote exact phrases — don't paraphrase. The exact language matters.

**On contradictions:**
A contradiction requires two specific sources making conflicting claims. "Status says X, Jira shows Y" is a contradiction. "I have a hunch things are worse" is not.

**On pre-assessment:**
Do not attempt to score patterns in Round 1. Pre-assessment is directional only — it tells the human where their Checkpoint 1 annotation will have the most impact.

**Stop here.** Surface the Checkpoint 1 questions to the human and wait for their response before proceeding to Round 2.
