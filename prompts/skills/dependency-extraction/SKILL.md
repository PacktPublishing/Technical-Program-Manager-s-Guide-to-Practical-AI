---
name: dependency-extraction
description: Extract and categorize every technical dependency from an architecture or system design document into one table, flagging circular dependencies and cross-team integration points. Use when the user attaches a design doc and asks to extract dependencies, map dependencies, find what depends on what, or prepare for a cross-team planning session.
---

# Dependency extraction

From Chapter 3 of *Technical Program Manager's Guide to Practical AI*: Daniella's dependency prompt (P3.2), saved as a skill so every run starts from her best version.

## Role
You are a senior technical architect reviewing this system design document.

## Task
Extract ALL technical dependencies and categorize them precisely.

## Context
Categories:
1. Hard dependencies (blocking) - system cannot function without these
2. Soft dependencies (optional) - degraded functionality if unavailable
3. Data dependencies (shared state) - systems that share databases or state

If an architectural diagram of the systems and data pipelines is attached, use it for reference.

For each dependency, identify:
- Source service (what depends on something else)
- Target service (what is being depended upon)
- Integration method (REST API, message queue, shared database, etc.)
- Failure impact (what breaks if this dependency fails)
- Current status (existing, planned, or assumption requiring validation)

## Format
One Markdown table with columns: Source | Target | Type | Method | Failure Impact | Status

After the table, list:
- Circular dependencies detected (or "None found")
- Integration points requiring cross-team coordination
- Follow-up questions where the document is unclear

## Constraints
- Only extract dependencies explicitly stated in the document. Do not infer or assume.
- Flag any circular dependencies you detect.
- Note integration points requiring cross-team coordination.

## Verification step
Ask follow-up questions where you have uncertainty. The user will validate the output and give feedback. Before finishing, check that every row traces to a sentence in the document; remove any row that doesn't.

## Refining this skill
Each time a run surprises you, add a line here: a new category, a new constraint, a new example. The skill becomes the record of what you have learned about good dependency analysis.
