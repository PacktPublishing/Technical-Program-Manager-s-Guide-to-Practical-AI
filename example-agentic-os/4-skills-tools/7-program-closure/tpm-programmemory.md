---
name: tpm-programmemory
description: "Use when you need to capture institutional knowledge before the team disperses — decisions, patterns, pitfalls, and context that lives only in people's heads."
---
# /tpm-programmemory — Program Memory

**Lifecycle Stage:** Program Closure
**Job-to-be-Done:** Capture institutional knowledge before the team disperses — decisions, patterns, pitfalls, and context that lives only in people's heads

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

Program memory is the most undervalued closure artifact. Its purpose is to prevent the next TPM from making the same mistakes and to preserve the "why" behind decisions that future engineers will inherit.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name
2. Program duration and key phases
3. Key team members to interview or whose knowledge to capture
4. Most significant decisions made and their rationale
5. Biggest surprises — what the team didn't know at the start
6. What future programs in this area should know

**Step 2 — Capture**

---

## Output Format

```markdown
# Program Memory: [Program Name]

**Captured:** [Date]
**Captured by:** [TPM name]
**Team contributors:** [Names]
**Archive location:** [Confluence link / folder]

---

## Program Context (for future readers)

[3–5 sentences: What was this program? Why did it exist? What problem did it solve?
Write this for someone joining the team in 12 months with no prior context.]

---

## Key Decisions & Why

| Decision | When | The Options Considered | Why We Chose This | What We'd Do Differently |
|---------|------|----------------------|------------------| -------------------------|
| | | | | |

---

## What We Didn't Know at the Start

[The biggest discoveries, surprises, and hidden complexity that weren't visible during planning:]

1. **[Discovery]:** [What we found out, when, and how it changed the program]
2. [...]

---

## Patterns That Worked

1. **[Pattern]:** [What we did and why it worked well — make it repeatable]
2. [...]

---

## Pitfalls to Avoid

1. **[Pitfall]:** [What went wrong, root cause, and how to prevent it]
2. [...]

---

## Critical Context for Future Owners

### Systems & Services
[Things the next engineer or TPM must know about the systems this program touched]

| System | Key Context | Watch Out For | Contact |
|--------|------------|--------------|---------|
| | | | |

### Stakeholder Context
[Key stakeholder dynamics, preferences, and history that aren't written anywhere]

| Stakeholder | Key Context | Communication Tips |
|------------|------------|-------------------|
| | | |

### Technical Debt Left Behind
[Debt that was knowingly deferred — don't let it get lost]

| Debt Item | Jira Link | Why Deferred | Risk if Ignored |
|-----------|----------|-------------|----------------|
| | | | |

---

## Unfinished Business

[Items that were descoped, deferred, or not resolved — with enough context to pick up later]

| Item | Context | Why Deferred | Recommended Next Step |
|------|---------|-------------|----------------------|
| | | | |

---

## One Thing Every Future TPM Should Know

> "[The most important single piece of advice, in one sentence]"
```

---

## Design Principles Applied
- Delivery First: Memory focused on what enables future delivery, not nostalgia
- Risk Visibility: Pitfalls and unresolved tech debt captured explicitly
- Cross-Team Alignment: Stakeholder context preserved for future cross-team work
