# Every prompt in the book

All the prompts printed in *Technical Program Manager's Guide to Practical AI*, one page per chapter, checked against the Oct 25 2026 proofs. Each entry says what to paste underneath it and gives a fictional sample file to try it with, so you can see a result before you use your own data.

**How to use a prompt:** open the chapter page, copy the prompt block into any AI tool your organization approves (Claude, ChatGPT, Copilot, Gemini), then paste the input files underneath it. Placeholders in [brackets] are yours to fill. No setup needed.

Chapters 2, 4, 9, 10 and 12 print no prompts. To find a use case by chapter or opportunity type, use the [Use Case Catalog](../docs/use-cases.md) (Chapter 4's Navigator as a readable page, with links back to these prompts).

| Chapter | Prompts | Kit with sample inputs and recorded outputs |
|---|---|---|
| 1 · How AI is Changing the TPM Role | [ch01-how-ai-is-changing-the-tpm-role.md](ch01-how-ai-is-changing-the-tpm-role.md): P1.1, your first quick win | - |
| 3 · Modalities of AI Interactions | [ch03-modalities-of-ai-interactions.md](ch03-modalities-of-ai-interactions.md): P3.1 to P3.12, from one-off prompt to skill to agent | Skill: [skills/dependency-extraction/](skills/dependency-extraction/SKILL.md) |
| 5 · AI for Initiation & Planning | [ch05-initiation-and-planning.md](ch05-initiation-and-planning.md): P5.1 to P5.5, trimmed as printed | [ch05-initiation-and-planning/](ch05-initiation-and-planning/README.md): complete prompts, one running scenario, five use cases |
| 6 · AI Use Cases for Execution | [ch06-execution.md](ch06-execution.md): P6.1 to P6.13 (P6.2 is no longer in the book) | Templates: [persona.md](../templates/persona.md), [artifact-index.md](../templates/artifact-index.md), [risk-mitigation-tracker.md](../templates/risk-mitigation-tracker.md) |
| 7 · AI Usage in Delivery & Closure / Monitoring | [ch07-delivery-and-closure.md](ch07-delivery-and-closure.md): P7.0 to P7.4, plus the contributor-highlight guardrails | Sample data in [../example-agentic-os/](../example-agentic-os/) |
| 8 · AI for TPM Leadership | [ch08-tpm-leadership.md](ch08-tpm-leadership.md): 8.01 to 8.26, skills, agent and prompts | [ch08-tpm-leadership/](ch08-tpm-leadership/README.md): skills, agent and prompts, tested end to end |
| 11 · AI for Career Management | [ch11-career-management.md](ch11-career-management.md): P11.1 to P11.26 | [ch11-career-management/](ch11-career-management/README.md): fictional story log, resume, posting, direction statement |

## Skills you can upload

A skill is a saved prompt with instructions on when to use it (Chapter 3). These are plain Markdown folders. In Claude, zip a folder and upload it under Customize > Skills. In any other tool, paste the body of `SKILL.md` as the prompt.

| Skill | Chapter | Folder |
|---|---|---|
| dependency-extraction | 3 | [skills/dependency-extraction/](skills/dependency-extraction/SKILL.md) |
| program-3p-report | 8 | [ch08-tpm-leadership/skills/8-tpm-leadership/program-3p-report/](ch08-tpm-leadership/skills/8-tpm-leadership/program-3p-report/SKILL.md) |
| portfolio-executive-report | 8 | [ch08-tpm-leadership/skills/8-tpm-leadership/portfolio-executive-report/](ch08-tpm-leadership/skills/8-tpm-leadership/portfolio-executive-report/SKILL.md) |

The [example agentic OS](../example-agentic-os/README.md) holds many more skills and agents, wired together around one fictional company.

## Before you paste real data

Classify it first. Remove customer names, people's personal data and anything covered by an agreement, and use a tool your organization has approved for that level of data. Chapter 9 covers this in full. Recorded outputs in the kits are one real run each: your results will differ in wording, and every output is a draft for you to validate.
