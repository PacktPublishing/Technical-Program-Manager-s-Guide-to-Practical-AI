# TPM Leadership Prompts — Claude Code configuration

Read `domain-context.md` before running any skill. The RAG definitions in `skills/8-tpm-leadership/program-3p-report/SKILL.md` are authoritative.

## Skills
- `/program-3p-report` → `skills/8-tpm-leadership/program-3p-report/SKILL.md` (program configs in `configs/`)
- `/portfolio-executive-report` → `skills/8-tpm-leadership/portfolio-executive-report/SKILL.md` (portfolio config in `configs/`)

## Agents
- `portfolio-reporting-agent` → `agents/portfolio-reporting-agent.md` (runs `/program-3p-report` for each program, then `/portfolio-executive-report`)

## Prompts
- Leadership prompts 05–26 → `prompts/8-tpm-leadership/`
- Test inputs and expected outputs → `tests/chapter-8/` (see `RUNS.md`)

## Rules
- **Today is 2026-10-20 in this example.** The Platform Modernization sources were last updated on 2026-10-20. Use that date as "today" for every date calculation and as the default report date, not the real date. *Using your own data? Delete this rule.*
- Never invent a date, number, owner, or status. Cite sources.
- Never overwrite a report; save `-v2`.
- Ad hoc runs never change program configs.
