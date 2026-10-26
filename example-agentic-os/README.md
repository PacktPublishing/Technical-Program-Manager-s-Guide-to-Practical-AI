# Example agentic OS

> **Fictional company.** NovaGrid, Inc. and everything about it in this folder (people, customers, programs, numbers, events) is invented for the book. It is not a real company, and any resemblance to real companies or people is coincidental.

A complete, working example of the agentic system the book builds toward: more than 60 skills, 8 workflows and over 20 agents for running a program portfolio, wired to the data of one fictional company, NovaGrid. Use it to see what the book's ideas look like when they are connected, then copy the parts you need.

You do not need this folder to use the book. Every printed prompt works on its own from [../prompts/](../prompts/README.md).

## Run it in 5 minutes

You need [Claude Code](https://claude.com/claude-code). Nothing else: no API keys, no packages, no environment variables.

1. Open a terminal in this folder: `cd example-agentic-os`
2. Start Claude Code: `claude`
3. If Claude Code asks whether you trust this folder, answer yes. That lets it read `CLAUDE.md`, which lists every skill.
4. Type one of these:

| Try | What you get |
|---|---|
| `/tpm-program-health SHIELD` | A health check of the SOC 2 program from its Jira, Vanta and Datadog data |
| `/tpm-boardroom NEXUS` | Eight advisors stress-testing a program's strategy |
| `/tpm-workflow-program-kickoff` | The full kickoff sequence from [../use-cases/01-program-kickoff.md](../use-cases/01-program-kickoff.md) |
| `/tpm-raid-log ATLAS` | A RAID log built from the program master doc and exports |

Using Cursor? Open this folder; the rules in `.cursor/` route the same commands. Using another tool? Paste a skill file from `4-skills-tools/` as the prompt and attach the files it names.

**The story is set on 2026-09-04.** `CLAUDE.md` tells every skill to treat that date as today, so the data looks current whenever you run it. One warning is intended: the tool-system exports (Aha!, Jira, Datadog, Salesforce, Vanta) date from 2026-08-10, because they missed a refresh during a three-week PTO blackout. That is the scenario `/tpm-catchup-brief` is built for. To watch the staleness checks fire on the real date, delete the "Today is 2026-09-04" rule in `CLAUDE.md`.

## How it is organized

The folders are the six layers of an agentic system ([../docs/agentic-architecture-map.md](../docs/agentic-architecture-map.md)):

| Layer | Folder | What's in it |
|---|---|---|
| 1. Inputs and triggers | [1-inputs-triggers/](1-inputs-triggers/README.md) | Tool exports and working files. [Readable overview](1-inputs-triggers/novagrid-inputs-overview.md) |
| 2. Goals and policies | [2-goals-policies/](2-goals-policies/) | Org context, your personal profile, decision records |
| 3. Memory and knowledge | [3-memory-knowledge/](3-memory-knowledge/) | Company, portfolio, seven program master docs, weekly logs |
| 4. Skills and tools | [4-skills-tools/](4-skills-tools/) | Skills by lifecycle stage, from strategy to closure |
| 5. Agent harness | [5-agent-harness/](5-agent-harness/) | Orchestrator, sub-agents, workflows |
| 6. Outputs | [6-outputs/](6-outputs/) | Example decisions and reports |

The full list of commands is in [CLAUDE.md](CLAUDE.md).

## Make it yours

1. Delete the "Today is 2026-09-04" rule at the top of [CLAUDE.md](CLAUDE.md), so skills use the real date.
2. Fill in [2-goals-policies/personal-context.md](2-goals-policies/personal-context.md) with your role and preferences.
3. Replace NovaGrid's context in `2-goals-policies/domain-context.md` and `3-memory-knowledge/` with your own organization, one file at a time.
4. Swap the exports in `1-inputs-triggers/` for your own, or connect the real tools.

Before you put real data in, check your company's AI policy and remove personal and customer data. Everything shipped here is synthetic.

## Some skills expect connectors

The daily-workflow skills (`/start-day-prep`, `/ramp-up`, `/zoom-meeting-assets`, `/org-weekly-digest`) are designed around Slack, Zoom and calendar connectors. Without them, they use the Gmail, Calendar and org files in `1-inputs-triggers/` and tell you which sources were missing.
