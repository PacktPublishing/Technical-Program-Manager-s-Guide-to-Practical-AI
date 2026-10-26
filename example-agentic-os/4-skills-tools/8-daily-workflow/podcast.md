---
name: podcast
description: Use when you want curated podcast episode recommendations tied to your current programs and active problem spaces. Trigger phrases include: "podcast recommendations", "what should I listen to", "podcast for my commute", "TPM podcast", "recommend a podcast episode". Scans the reading backlog and active program topics, identifies 2–3 relevant recent episodes, and explains why each one is timely for your current work.
---
# /podcast — Podcast Listening Brief

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Surface 2–3 podcast episodes that are directly relevant to current programs or active problem spaces — so listening time compounds rather than entertains

---

## Overview

Podcast listening is often the one form of professional development that fits into commutes, walks, and low-attention windows. But without curation, episode selection is random. This skill reads the current portfolio state and active program challenges, then identifies 2–3 episodes from TPM, engineering leadership, and adjacent-domain podcasts that speak directly to what's happening in your programs right now. Each recommendation includes a 3-sentence summary and a "why now" rationale tied to a specific program or challenge. Recommendations draw from known feeds and saved items in the reading backlog tagged as podcast episodes.

## When to Use

- When you have a commute, walk, or low-attention window and want to use it deliberately
- On Fridays as part of the end-of-week wind-down
- When you're ramping up on a new technical domain and want supplementary audio content
- After the `/ramp-up` skill when you want to continue learning in a different modality

**When NOT to use:**
- To replace a ramp-up guide — use `/ramp-up` for structured context building
- For reading recommendations — use `/reading-recommendations`
- If you need current news (podcasts have publishing lag) — check Slack or industry feeds directly

---

## Interaction Flow

```
Load active programs + RAG status (program-index.md)
       |
       v
Load reading-backlog.md (filter for podcast-tagged items)
       |
       v
Match episode topics to active program challenges
       |
       v
Return 2–3 episodes with summary + "why now" rationale
```

**Step 1 — Load Context**

Read:
- `3-memory-knowledge/layer2-portfolio/program-index.md` — active programs, current phase, key challenges
- `1-inputs-triggers/reading-backlog.md` — items tagged as "podcast" or categorized under "Industry / Leadership / Technical"
- `3-memory-knowledge/layer4-weekly/this-week.md` — current focus areas and open escalations

**Step 2 — Match**

For each potential episode (from backlog or known feeds), score against:
- Does the episode topic directly address a challenge in a 🔴 or 🟡 program?
- Does it cover a technical domain relevant to an active ramp-up?
- Does it feature a practitioner perspective on a problem type the TPM is navigating (e.g., cross-team alignment, technical debt triage, OKR design)?

**Step 3 — Return**

Return exactly 2–3 episodes. Each recommendation must have a clear "why now" tied to current work — not just "this is a good podcast."

---

## Output Format

```markdown
## Podcast Recommendations — [Date]

---

**[Episode Title]**
*[Podcast name] · [Approx. length] · [Published: date or "recent"]*

[Sentence 1: what the episode covers.] [Sentence 2: the specific insight or framework discussed.] [Sentence 3: what you'll walk away with.]

**Why now:** [One line connecting this episode to a specific active program, challenge, or ramp-up area]

→ [Link if available from backlog, or search query: `"[podcast name]" "[episode title]"`]

---

**[Episode Title]**
*[Podcast name] · [Approx. length]*

[3-sentence summary]

**Why now:** [Program-specific rationale]

→ [Link or search query]
```

When no strong matches are found:

```markdown
## Podcast Recommendations — [Date]

No strong program-matched episodes found in the current backlog.

**Suggested searches** (based on active program topics):
1. `[Podcast name or topic] "[challenge keyword]"` — [why this topic is relevant now]
2. `[...]`

Add episodes to the backlog via /save-to-read when you find relevant ones.
```

---

## Behavioral Notes

- Never fabricate episode titles or guest names — if an episode is not in the backlog or a confirmed source, provide a search query instead
- "Why now" must be specific to current program state — not generic ("this is relevant to any TPM")
- Return exactly 2–3 items — same rule as reading recommendations: decision, not another list to scan
- If the backlog has podcast-tagged items older than 60 days, note the age — podcast content has a shorter shelf life than articles

---

## Known Podcast Feeds (reference for search queries)

When backlog has no matching items, suggest searches in these feeds as appropriate:
- Lenny's Podcast (product, strategy, org design)
- Engineering Leadership (Staff Eng, engineering management)
- The Knowledge Project (decision-making, mental models)
- Acquired (business and tech strategy deep dives)
- Software Engineering Daily (technical depth)
- The Tim Ferriss Show (leadership, systems thinking)

---

## Verification

- [ ] 2–3 recommendations returned (not 1, not 4+)
- [ ] Each has a "why now" tied to a specific active program or challenge
- [ ] No fabricated episode titles — search queries used when content not confirmed
- [ ] Backlog podcast-tagged items checked first before suggesting generic feeds
- [ ] Episode age flagged if > 60 days old

---

## Design Principles Applied

- **Delivery First:** 2–3 ready-to-listen recommendations — decision in 30 seconds, listening starts immediately
- **Context Aware:** Episode relevance scored against current program challenges and ramp-up areas
