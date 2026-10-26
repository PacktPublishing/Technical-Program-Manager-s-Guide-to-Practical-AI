# 4a · Dependency extraction, one document at a time (stage 1)

**Book:** Chapter 5, *Technical Dependency and Architecture Synthesizing*: "Running Chapter 3's
single-document extraction eleven times gets you eleven lists of dependencies, and eleven lists
aren't a graph." Stage one is that extraction ([P3.2](../../ch03-modalities-of-ai-interactions.md)), run once per document.
**Paste underneath:** one design document from [inputs/](inputs/) per run, eleven runs in total
**Next:** feed all eleven results, plus the ownership map, to [prompt-stage2-synthesize.md](prompt-stage2-synthesize.md)

## The prompt (Chapter 3)

The only change: Chapter 3's version says "I've provided an architectural diagram of our systems
and data pipelines for reference." The sample documents have no diagram, so that line is removed.

```
[ROLE] You are a senior technical architect reviewing this system design document.

[TASK] Your task: Extract ALL technical dependencies and categorize them precisely.

[CONTEXT - Categories defined]
Categories:
1. Hard dependencies (blocking) - system cannot function without these
2. Soft dependencies (optional) - degraded functionality if unavailable
3. Data dependencies (shared state) - systems that share databases or state

[CONTEXT - What to extract]
For each dependency, identify:
- Source service (what depends on something else)
- Target service (what is being depended upon)
- Integration method (REST API, message queue, shared database, etc.)
- Failure impact (what breaks if this dependency fails)
- Current status (existing, planned, or assumption requiring validation)

[FORMAT]
Output format: Markdown table with columns: Source | Target | Type | Method | Failure Impact | Status

[CONSTRAINTS] Constraints:
- Only extract dependencies explicitly stated in the document
- Flag any circular dependencies you detect
- Note integration points requiring cross-team coordination

[FEEDBACK LOOP]
Ask follow up questions where you have uncertainty, I will validate the output and give feedback.
```

Keep each result under its document's name (for example "Doc 7 — payments-core and
ledger-api v3"), because stage 2 cites documents by number. Use the service names exactly as
each document writes them. Reconciling the names is stage 2's job.
