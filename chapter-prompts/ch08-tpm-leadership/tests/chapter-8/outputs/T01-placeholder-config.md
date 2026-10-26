# T01 — program-3p-report with an unfilled config (negative test)

**Input:** tests/chapter-8/fixtures/negative/program-9.md (template with only the name filled in) · report date 2026-10-20

| Run type | Expected (per SKILL.md) | Result |
|---|---|---|
| Scheduled | Return "Skipped — [reason]", save nothing | `Skipped — config program-9.md has 17 unfilled placeholders (owner, portfolio, last report date, cadence, audience, charter, dependency file, Jira project/board/epics, Slack channels, Confluence space/pages, other tools); charter inaccessible.` No file written. ✅ |
| Ad hoc (direct) | Stop and ask | Asked: "program-9.md is not filled in. Before I can run: who owns Program 9, where is the charter, and which Jira project and Slack channels should I read?" No file written. ✅ |
| Ad hoc (via agent) | Return "Needs input — …" so the agent asks once at the end | Returned `Needs input — program-9.md is unfilled (17 placeholders); charter path missing.` ✅ |

**Finding:** with the chapter's original text, the ad hoc behavior conflicted. The skill says "ad hoc runs stop and ask" and the agent says "log failures and continue". The fixed skill adds the "Needs input" return for agent calls.
