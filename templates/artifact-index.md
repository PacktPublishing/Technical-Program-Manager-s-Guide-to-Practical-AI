# Template: Artifact Index

Book: Chapter 6, *The Monday Morning Debrief*. Used by prompt P6.5 ([../prompts/ch06.md](../prompts/ch06.md)).

The context file your debrief agent reads first: one row for every Slack channel and document it may use, and why it matters. Without it, the agent has no idea which channel carries engineering updates and which document holds the executive decisions.

| Artifact Name | Artifact Type | Artifact URL | Artifact Description | Project Associated |
|---|---|---|---|---|
| [easy-to-reference name] | Comms Channel / Document | [shareable link] | [what this artifact holds and why it matters] | [project name, or General] |

## Example (fictional NovaGrid program)

| Artifact Name | Artifact Type | Artifact URL | Artifact Description | Project Associated |
|---|---|---|---|---|
| #atlas-eng | Comms Channel | https://slack.example.com/atlas-eng | Daily engineering updates and blockers for ATLAS | ATLAS |
| #atlas-status | Comms Channel | https://slack.example.com/atlas-status | The weekly status report is published here every Friday | ATLAS |
| ATLAS standup notes | Document | https://docs.example.com/atlas-standup | Daily stand-up notes, one heading per day | ATLAS |
| ATLAS decision log | Document | https://docs.example.com/atlas-decisions | Every scope and date decision, with owner and date | ATLAS |
| #platform-team | Comms Channel | https://slack.example.com/platform-team | General team channel, mostly logistics | General |

Keep it in a Markdown file or a Google Sheet, and update it whenever a channel or document is added or retired.
