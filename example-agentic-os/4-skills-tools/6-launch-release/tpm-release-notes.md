---
name: tpm-release-notes
description: "Use when you need to generate internal and external release notes from program delivery data — translating engineering output into audience-ready language with appropriate technical depth per audience."
---
# /tpm-release-notes — Release Notes Generator

**Lifecycle Stage:** Launch / Release
**Job-to-be-Done:** Generate internal and external release notes from program delivery data — translating engineering output into audience-ready language with appropriate technical depth per audience

---

## TPM Context

Release notes are a TPM delivery artifact, not a marketing exercise. The TPM owns the translation layer between what engineering shipped and what different audiences need to know: the internal team doing the next handoff, the CS team fielding customer questions, the enterprise customer reading the changelog, and the executive reviewing launch completeness. Each audience needs a different cut of the same source truth.

The failure mode this prevents: release notes written by engineers for engineers (too technical for customers) or by marketing for marketing (too vague for CS and internal teams) — leaving the TPM fielding questions that a well-structured release document would have answered.

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

If Jira or Aha! data is available, load from `1-inputs-triggers/` to generate the feature list automatically.

For program-specific context, load `3-memory-knowledge/layer3-programs/[program]-master.md`.

---

## Interaction Flow

**Step 1 — Intake**

1. Release version and date
2. Program and milestone this release corresponds to
3. Feature/change list — paste Jira epic/story titles, Aha! milestone items, or describe what shipped
4. Target audiences — select all that apply: External customers / Internal teams / Executive / CS/Support / Changelog
5. Any features to exclude or flag as limited availability / early access
6. Known issues or caveats to disclose

**Step 2 — Generate**

Generate one section per audience. Do not blend audiences. Tone and depth differ per section:
- **External (customers):** Outcome language, no internal code names or team references, no Jira keys
- **Internal:** Full technical detail, migration notes, known issues, rollout sequence
- **Executive:** One paragraph, impact framing, milestone completion status
- **CS/Support:** What changed that will generate tickets, how to answer common questions, escalation path for issues

---

## Output Format

```markdown
# Release Notes: [Program] [Version]

**Release date:** [Date]
**Milestone:** [M# — description]
**TPM:** [Name]
**Status:** GA / Limited Availability / Internal Only

---

## Executive Summary

[1 paragraph, 3-5 sentences. What shipped, what it enables, milestone completion status, any material caveats. Ready to paste into an exec SteerCo update or board slide.]

---

## External Release Notes
*(Customer-facing — safe to publish)*

### What's New

#### [Feature / Capability Name]
[2-4 sentences in outcome language. What can customers now do that they couldn't before? No jargon, no internal names, no Jira keys.]

**Who this affects:** [All customers / Enterprise tier / Customers using X feature]
**Available:** [GA / Early Access — contact your CSM / Coming soon]

[Repeat per feature]

---

### Improvements

- [Short improvement description — customer-facing language]
- [...]

---

### Fixed

- [Bug or reliability issue fixed — customer impact language]
- [...]

---

### Known Issues

- [Issue] — Workaround: [description] — Fix expected: [version/date]

---

## Internal Release Notes
*(Engineering, PM, TPM — full detail)*

### Changes by Team

| Team | Component | Change | Jira / PR | Notes |
|------|-----------|--------|-----------|-------|
| [Team] | [Component] | [What changed] | [Key] | [Migration note / dependency] |

---

### Migration & Rollout Notes

[What teams need to do before / after this release lands in their environment]

1. [Step — owner — deadline]
2. [...]

---

### Rollback Plan

**Can this release be rolled back?** Yes / Partial / No
**Rollback procedure:** [Steps or link to runbook]
**Blast radius if rollback needed:** [What is affected]

---

### Known Issues (Internal)

| Issue | Severity | Affected component | Workaround | Fix target |
|-------|---------|-------------------|-----------|-----------|
| [Issue] | 🔴🟡🟢 | [Component] | [Workaround] | [Version/Date] |

---

## CS / Support Briefing
*(For customer-facing teams)*

### What Changed (That Will Generate Tickets)

1. **[Feature/Change]** — Likely customer questions: [Q1] / [Q2] — Answer: [Answer]
2. [...]

---

### How to Answer Common Questions

**Q: [Anticipated customer question]**
A: [Scripted answer]

---

### Escalation Path for Issues

[Where CS should route issues related to this release]
- Tier 1 (usage questions): [Slack channel / Runbook]
- Tier 2 (bugs): [Jira project / How to file]
- Tier 3 (production impact): [On-call / PagerDuty routing]

---

## Slack Announcement
*(Ready to post — edit channel name)*

> 🚀 **[Feature/Release name] is live**
> [2-3 sentences on what shipped and who it affects]
> 📖 Full release notes: [link]
> 🐛 Issues? [#channel or support path]
```

---

## Composes With

- `/tpm-launchreview` — launch review gate precedes release notes generation
- `/tpm-execsummary` — executive summary from release notes feeds the exec summary deliverable
- `/tpm-program-health` — release completion updates program RAG status
- `1-inputs-triggers/jira/novagrid-jira-export.json` — feature list from Jira epic and story data
- `1-inputs-triggers/aha/novagrid-aha-export.json` — milestone items from Aha!

---

## Design Principles Applied

- **Delivery First:** Release notes confirm delivery completion, not just activity — milestone status is explicit
- **Risk Visibility:** Known issues and rollback plans are required sections, not optional
- **Cross-Team Alignment:** Internal notes include per-team migration requirements and explicit handoff steps
- **Tool-Connected:** Jira keys and Aha! milestones traceable from release notes back to source data
