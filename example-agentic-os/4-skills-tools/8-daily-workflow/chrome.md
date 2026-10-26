---
name: chrome
description: Use when you need a fast set of search queries, relevant URLs, or MCP-accessible docs for a topic or program without manually hunting across tabs. Trigger phrases include: "find me docs on", "what should I search for", "where do I find", "pull up resources on", "chrome search for". Returns curated search queries, bookmarked URLs, and MCP-accessible document links in one pass.
---
# /chrome — Browser & Resource Assist

**Lifecycle Stage:** Daily Workflow | **Job-to-be-Done:** Return curated search queries, relevant URLs, and MCP-accessible docs for any topic or program — eliminating tab-hunting and context switching

---

## Overview

The cost of finding the right resource is usually higher than using it. This skill takes a topic, program name, or question and returns three things in one response: targeted search queries ready to paste into Google or Glean, known URLs and bookmarks relevant to the topic from loaded context, and MCP-accessible documents (Google Drive, Confluence, Jira filters) that can be opened directly. Designed for the moments when you know what you need but not where it lives.

## When to Use

- Before a meeting when you need to quickly orient on a topic
- When a stakeholder asks for a reference you know exists but can't locate
- When starting a new area of work and need a fast research starting point
- When looking for a doc, tracker, or filter that was shared in the past

**When NOT to use:**
- To generate a comprehensive ramp-up on a new domain — use `/ramp-up`
- To pull Jira ticket status — use `/jira-lookup-table`
- To save something for later reading — use `/save-to-read`

---

## Interaction Flow

```
Topic / program name / question
       |
       v
Match to known URLs in context + Jira/Aha/Drive references
       |
       v
Generate targeted search queries
       |
       v
Return: queries + known URLs + MCP doc links
```

**Step 1 — Intake**

Provide:
- A topic (e.g., "NovaGrid Shield rollout plan")
- A program name (e.g., "Project Atlas")
- A question (e.g., "where is the Q2 OKR tracker?")
- A doc type (e.g., "find the architecture review template")

**Step 2 — Resolve**

Check loaded context for known references:
- Program master docs in `3-memory-knowledge/layer3-programs/`
- Data source paths in `1-inputs-triggers/`
- Aha! milestone links from `1-inputs-triggers/aha/novagrid-aha-export.json`
- Jira project keys from `domain-context.md`

**Step 3 — Return**

Return three sections: search queries, known URLs, MCP-accessible docs.

---

## Output Format

```markdown
# Resource Lookup: [Topic / Program]

---

## Search Queries

Paste these into Google, Glean, or Slack search:

1. `[Targeted query 1]`
2. `[Targeted query 2]`
3. `[Targeted query 3]`

**Glean-specific:** `[Query optimized for internal search — uses team/project filters if known]`

---

## Known URLs & Bookmarks

| Resource | URL / Path | Notes |
|----------|-----------|-------|
| [Resource name] | [URL or file path] | [When last referenced / what it contains] |

---

## MCP-Accessible Docs

| Doc | Source | How to Open |
|-----|--------|-------------|
| [Doc name] | Google Drive / Confluence / Jira | [Filter name or direct path] |

---

*If a resource has moved or the link is stale, let me know and I'll update the reference.*
```

If no known URLs are found:

```markdown
No bookmarked resources found for "[topic]" in loaded context.

Search queries above are your fastest path. If you find the right doc, use `/save-to-read` to add it to the backlog for next time.
```

---

## Behavioral Notes

- Generate 3-4 search queries max — more is noise
- Tailor Glean queries with known team names or Jira project keys from `domain-context.md`
- If the topic maps to an active program, include the program master doc path automatically
- Do not fabricate URLs — if a URL is not in context, omit it and note the gap

---

## Verification

- [ ] Search queries are specific (not generic like "NovaGrid documentation")
- [ ] All URLs listed are from loaded context — no invented links
- [ ] MCP-accessible doc section is present even if empty (with explanation)
- [ ] No more than 4 search queries returned

---

## Design Principles Applied

- **Delivery First:** Resources surfaced in one response — no tab-hunting required
- **Context Aware:** Known URLs and doc paths pulled from loaded program context, not invented
