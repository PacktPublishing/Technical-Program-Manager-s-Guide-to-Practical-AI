---
name: tpm-premortem
description: "Use when you need to run four independent professional lenses over the program corpus, each answering \"it is six months later and this program failed — explain what happened,\" then collide, rank, and convert the narratives into a one-hour human session that produces a real risk register."
---
# /tpm-premortem — Persona Swarm Pre-Mortem

**Lifecycle Stage:** Program Initiation
**Job-to-be-Done:** Run four independent professional lenses over the program corpus, each answering "it is six months later and this program failed — explain what happened," then collide, rank, and convert the narratives into a one-hour human session that produces a real risk register

---

## TPM Context

The pre-mortem is one of the best-evidenced practices in program risk management. Gary Klein's formulation is simple: assume the program has already failed, then explain why. Prospective hindsight measurably improves risk identification compared to asking "what could go wrong," because it converts risk-spotting from imagination into explanation — and people are better at explaining than imagining.

Almost nobody runs them. The prep takes hours, the facilitation takes skill, and getting eight busy people in a room during the exact weeks when everyone is busiest requires calendar heroics. So the practice with the best evidence behind it gets skipped for logistics reasons, and week ten arrives with failures a two-hour session would have named in advance.

**The overhead was never the thinking. It was the assembly** — preparing materials, structuring the session, capturing output, and above all convening the perspectives. A good pre-mortem needs the security engineer's paranoia, the SRE's operational scars, the staff engineer's architectural skepticism, and the PM's market anxiety, all in one room.

The perspectives are the part this skill simulates. **Not replaces — simulates**, and the distinction carries the whole design. What this produces is preparation for a human pre-mortem, compressed from four hours of overhead to forty-five minutes. The room still finds things the swarm cannot, because the room contains the tribal knowledge that never made it into any document.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

### Corpus check — run this first

Failure is perspectival, but it is also evidential. The swarm can only see what the corpus encodes. **Thin corpus, thin pre-mortem.**

| Artifact | Source | Required? |
|----------|--------|-----------|
| Program charter / master doc | `/tpm-master-document` or `3-memory-knowledge/layer3-programs/[program]-master.md` | **Required** |
| Scope document | TPM-supplied | **Required** |
| Assumption log | `/tpm-assumption-extractor` | Strongly recommended — the richest swarm material in the corpus |
| Dependency map | `/tpm-dependency-map` | Strongly recommended |
| Stakeholder map / alignment gaps | `/tpm-stakeholder-map`, `/tpm-alignment-gap-detector` | Recommended |
| Prior program retros | `/tpm-retro-rootcause` output, `/tpm-programmemory` | Optional — enables the memory pass |

| Artifacts loaded | Expected scenarios after collision | Read |
|-----------------|-----------------------------------|------|
| 5–6 | 6–10 | Full swarm |
| 3–4 | 4–7 | Solid — name the missing artifacts in the output |
| 2 (charter + scope only) | 2–5 | Thin — scenarios will skew generic; label the run as thin-corpus |
| 1 | — | **Do not run.** A single document produces failure fiction, not failure analysis |

State the corpus grade and expected yield to the TPM *before* running the swarm.

### The four lenses

Each reviewer reads the **full corpus independently** and answers Klein's question from inside their lens. The lenses matter because failure is perspectival: the SRE sees the missing rollback plan, the security reviewer sees the data flow nobody threat-modeled. One generic reviewer sees a blur of both and the sharpness of neither.

---

**The Security Engineer**
**Lens:** Threat surface, data flows, access boundaries, compliance exposure
**Assumes:** every new integration is an unreviewed trust boundary until proven otherwise
**Hunts for:** data crossing a boundary nobody threat-modeled, credentials and secrets in migration paths, access that gets granted for a cutover and never revoked, compliance obligations discovered after design freeze, third-party processors nobody listed
**Failure vocabulary:** exposure, boundary, blast radius of a breach, unreviewed flow, standing access
**Signature question:** "Where does data go that nobody drew on the diagram?"

**The SRE**
**Lens:** Production reality — rollback, observability, on-call, degradation
**Assumes:** the system will fail; the only question is whether anyone planned for it
**Hunts for:** migrations with no rollback inside the maintenance window, "we'll monitor it" with no defined alert, dual-run periods with no reconciliation check, cutovers scheduled against on-call rotations nobody consulted, capacity assumptions never load-tested
**Failure vocabulary:** rollback window, alert coverage, mean time to detect, degradation path, toil
**Signature question:** "It is 3am on cutover night and something is wrong — what does the on-call engineer actually see?"

**The Staff Engineer (three migrations survived)**
**Lens:** Architectural skepticism earned the hard way
**Assumes:** the interesting failure is in the seams between systems, and the estimate is wrong in a specific direction
**Hunts for:** the long tail nobody scoped (the 4% of records that do not map), interface contracts marked TBD at kickoff, "phase two" as a place where hard problems go to be forgotten, the legacy behaviour one customer depends on, sequencing that assumes two teams finish in the same week
**Failure vocabulary:** the long tail, the seam, phase-two debt, the edge case that was 4% of revenue
**Signature question:** "What does the last 10% of this migration look like, and who is still working on it in month nine?"

**The Product Manager**
**Lens:** Market window, customer impact, the value that justified the program
**Assumes:** the program can succeed technically and still fail commercially
**Hunts for:** the window closing while the platform work runs long, customer-visible regressions treated as acceptable internally, the competitor move that makes the plan irrelevant, success metrics that measure activity rather than outcome, the segment that quietly churns during a dual-run
**Failure vocabulary:** window, regression, churn, the metric that moved and the one that did not
**Signature question:** "We shipped it and nobody cared — why?"

*Customizing the lenses:* swap or add reviewers when the program demands it (a Data Engineer for a migration, a Legal/Compliance lens for a regulated program). One rule — each lens must have a **distinct failure vocabulary**. If two reviewers write interchangeable narratives, you have voice bleed and one less perspective than you think.

### Swarm rules

1. **Isolation in Round 1.** Each lens reads the corpus and writes its narrative without seeing the others. Sequential generation where later reviewers see earlier output produces convergence, not coverage — and convergence is exactly the failure this technique exists to prevent.
2. **Narrative, not bullets.** Klein's mechanism is *explanation*. "Dependency risk" is a bullet. "The API contract was still TBD at kickoff, both teams built against their own assumption, and integration testing in week fourteen was the first time anyone found out" is an explanation, and it contains its own early-warning sign.
3. **Every scenario names its early signature.** The point of a pre-mortem is recognizing the failure *while it is forming*. Each scenario must state what the TPM would observe in weeks 2–6 if this failure were beginning — something observable, not a feeling.
4. **Trace to the corpus where possible.** A scenario grounded in a specific artifact ("the scope document's phase-two section," "assumption A-C03") outranks a plausible scenario grounded in nothing. Tag each scenario `GROUNDED` or `INFERRED`.
5. **Candidates, not conclusions.** The swarm produces fluent, plausible failure narratives, and fluency reads as completeness. It is not complete. Treat every output as a candidate for human ranking.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name, brief description, target completion date
2. Which corpus artifacts are available (run the corpus check, state the grade and expected yield)
3. Top 3 things the team is most confident about — *these get targeted specifically; confidence is where pre-mortems find the most*
4. Any concerns already on the team's mind (so the swarm can deepen them rather than rediscover them)
5. Whether prior program retros are available for the memory pass
6. Date of the human session this output feeds

**Step 2 — Round 1: Independent narratives**

Produce one response with four sections, one per lens, in order: Security Engineer, SRE, Staff Engineer, Product Manager. Each writes 2–4 failure narratives in first person, past tense, from six months in the future. Voices must be distinct.

**Step 3 — Collision analysis**

Cross-reference the four sets. Classify every scenario:

- **CORROBORATED** — named by 2+ lenses, usually in different vocabularies. The strongest signal in the run: two independent professional perspectives arrived at the same failure from different directions. These lead the ranking
- **SINGULAR** — named by one lens. Not weaker, but narrower. Frequently the sharpest finding, because it required that specific expertise to see
- **COLLIDING** — two lenses propose mitigations that conflict (the SRE wants a longer dual-run; the PM says the window closes). Surface the tension explicitly — it is a real trade-off the human session must decide, not a synthesis error

**Step 4 — Memory pass** *(when prior retros are available)*

Cross-reference against risks that materialized in previous programs. Tag matches `RECURRENT` with the program and the prior outcome. A failure mode this organization has already paid for twice outranks a novel one at equal plausibility — and feeding retros back into pre-mortems, program after program, is institutional knowledge capture wearing a risk-management costume.

**Step 5 — Rank**

Rank by (plausibility × blast radius), with `CORROBORATED` and `RECURRENT` promoted. **Plausibility is the TPM's call, not the model's** — present the ranking as proposed and ask the TPM to re-order before the session pack is finalized.

**Step 6 — Blind spots by construction**

State explicitly what this run could not see. Coverage follows the corpus: risks legible in documents get found; risks living in organizational dynamics do not appear, because nothing in the input encodes them. The two directors who do not speak. The team quietly interviewing elsewhere. The vendor relationship that is one escalation from ending. Name these as *categories to spend the human hour on* — this section is the agenda for the part of the session the swarm cannot do.

**Step 7 — Output**

Return the Pre-Mortem Report and the session pack.

---

## Output Format

```markdown
# Pre-Mortem: [Program Name]

> It is [target date + 3 months]. The program has failed.
> The post-mortem is happening now. What went wrong?

**Corpus grade:** [🟢 Full ([N] artifacts) / 🟡 Thin / 🔴 Insufficient — did not run]
**Artifacts loaded:** [list] · **Missing:** [list]
**Scenario yield:** [N] after collision vs expected [range] → [🟢 to spec / 🟡 under-performed]
**Memory pass:** [✅ [N] prior retros / ⬜ none available]
**Human session:** [date] — this document is the input, not the conclusion

---

## Executive Read

[3 sentences: the most plausible failure, which lenses saw it, and the one thing to do this week.]

---

## Round 1 — Independent Narratives

### The Security Engineer
[2–4 narratives, first person, past tense. Each: what happened → what we should have noticed → why we did not.]

### The SRE
[...]

### The Staff Engineer
[...]

### The Product Manager
[...]

---

## Collision Analysis

| # | Scenario | Lenses | Class | Grounding | Recurrent? |
|---|---------|--------|-------|-----------|-----------|
| 1 | [short name] | SRE + Staff Eng | CORROBORATED | GROUNDED — [artifact] | ⚠️ [prior program] |
| 2 | | Security | SINGULAR | INFERRED | — |

**Colliding mitigations:**
- [Lens A wants X, Lens B wants Y, because …] → **decision required at the session**

---

## Ranked Failure Scenarios

### 1. [Specific failure name — not "Scope Collapse"]
**Class:** CORROBORATED (SRE + Staff Engineer) · **Grounding:** GROUNDED — [artifact/section] · **Recurrent:** [prior program or —]

**What happened:** [Vivid narrative. Specific systems, teams, weeks.]
**Early signature (weeks 2–6):** [What the TPM would observe *now* if this were beginning. Observable, not a feeling.]
**Why we missed it:** [The structural reason, not "we were busy."]
**Prevention:** [The control, and what it costs.]
**Mitigation owner:** [role] · **Confirm by:** [date]

### 2 … N: [...]

*Ordered by (plausibility × blast radius). Do not pad to a fixed count.*

---

## Blind By Construction — spend the human hour here

The swarm read documents. These risk classes are not in any document and were therefore invisible to it:

| Class | Why the corpus cannot encode it | Question for the room |
|-------|-------------------------------|----------------------|
| Interpersonal / political | [e.g. two owners who do not escalate to each other] | "Which two people on this program need to agree and currently do not talk?" |
| Attrition / team stability | | "Who leaving would stall this for a month?" |
| Vendor & partner relationship health | | |
| Unwritten organizational commitments | | |

---

## Risk Priority Matrix

| Risk | Likelihood (1–5) | Impact (1–5) | Score | Mitigation Owner |
|------|----------------|--------------|-------|-----------------|
| | | | | |

---

## Top 3 Actions to Take This Week

1. [Specific action against the highest-ranked scenario]
2. [...]
3. [...]

---

## Human Session Pack — 60 minutes

| Time | Segment | Material |
|------|---------|----------|
| 0–5 | Frame: "it failed, explain why" | Executive read |
| 5–25 | Walk the top 4 ranked scenarios — confirm, kill, or re-rank | Ranked scenarios |
| 25–40 | **Blind-by-construction questions** — the part only the room can do | Blind spots table |
| 40–50 | Resolve colliding mitigations | Collision analysis |
| 50–60 | Assign mitigation owners and confirm-by dates | Risk priority matrix |

**Bring to the room:** the ranked list. **Do not bring:** the raw Round 1 narratives — four sets of fluent failure fiction will dominate a discussion that should be about the room's knowledge.
```

---

## Key Concepts

- **Swarm vs. debate:** Round 1 reviewers never see each other's output. This is a swarm (parallel, isolated, then collided), not the two-round adversarial debate in `/tpm-boardroom`. Use the boardroom to stress-test a *document*; use this to stress-test a *plan against the future*.
- **CORROBORATED is the signal:** two lenses reaching the same failure through different professional reasoning is much stronger evidence than one lens stating it confidently.
- **Fluency is not coverage:** the most dangerous property of this output is that it reads as complete. The blind-spots section exists to keep that visible on the page.
- **Preparation, not replacement:** the deliverable is a session pack. A pre-mortem where no humans ever met has not happened.
- **Confidence is a target:** the three things the team is most confident about are where the swarm should push hardest. Normalized confidence is how risks become invisible.

---

## Anti-Patterns

- **Skipping the human session** — the swarm produces candidates. Without the room, the program has a document, not a risk process
- **Generic scenario names** — "Scope Collapse," "Resource Constraints," "Stakeholder Misalignment." If the scenario name would fit any program, it is a category, not a scenario. Name the actual failure
- **Voice bleed** — if the SRE and the Staff Engineer wrote interchangeable narratives, you ran one reviewer four times
- **Contaminated Round 1** — letting reviewers see each other's narratives produces consensus and hides the coverage gaps
- **Missing early signatures** — a scenario you cannot recognize forming is a story, not a risk
- **Padding to a count** — a thin corpus honestly producing three scenarios beats eight scenarios where five were invented to fill the format
- **Bringing the raw narratives to the room** — fluent AI failure fiction will crowd out the tribal knowledge the session exists to capture

---

## Composes With

- `/tpm-assumption-extractor` — the assumption log is the highest-value swarm input; unvalidated high-blast-radius assumptions become the sharpest scenarios
- `/tpm-dependency-map` — unowned and undated dependencies feed the Staff Engineer and SRE lenses directly
- `/tpm-alignment-gap-detector` — unresolved stakeholder conflicts are a documented input for a failure class the swarm otherwise cannot see
- `/tpm-boardroom` — complementary adversarial review of the program document itself
- `/tpm-raid-log` · `/tpm-risk-identifier` — confirmed scenarios become the program's opening risk register
- `/tpm-retro-rootcause` · `/tpm-programmemory` — prior-program output feeds the memory pass; this run's misses feed the next retro

---

## Feedback Signal

The retro, months from now. Which materialized risks did the pre-mortem name, which did it miss, and did the misses share a shape? Feed past retros back into future pre-mortems and the swarm gets a memory. That loop, program after program, is the whole point.

---

## Design Principles Applied
- **Risk Visibility:** Named failure scenarios with early signatures replace the generic "resource constraints" entries that make risk registers a compliance ritual.
- **Delivery First:** Every ranked scenario carries a control, an owner, and a confirm-by date before the program starts.
- **Cross-Team Alignment:** The dependency and seam failures the Staff Engineer lens hunts are cross-team by construction; colliding mitigations surface trade-offs between functions rather than hiding them.
- **Context Aware:** The blind-by-construction section states plainly what the corpus could not encode, and hands that hour back to the humans.
