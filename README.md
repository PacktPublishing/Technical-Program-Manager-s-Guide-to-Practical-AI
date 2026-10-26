# Practical AI for TPMs

The companion repository for **[The Technical Program Manager's Guide to Practical AI](https://www.amazon.com/dp/B0H5CVXXDT)**: *Workflows and Frameworks for Smarter, Faster, Higher-Impact TPM Execution* (Packt, 2026), by Liana Gevorgyan, Joshua Alan Teter, James Dayhuff, Malvika Sinha, Aadil Maan, and Michael Götz.

Every prompt printed in the book is here, with fictional sample data to try it on and, for the bigger use cases, a recorded output to compare against.

## Two ways to use it

### 1. Copy a prompt (no setup, any AI tool)

1. Open [prompts/](prompts/README.md) and pick your chapter.
2. Copy the prompt into the AI tool your organization approves: Claude, ChatGPT, Copilot or Gemini.
3. Paste the "Try it with" sample file underneath it, or your own material.

That's all. No account on GitHub, no install, no API keys. You can browse and copy straight from the GitHub page.

### 2. Run the example agentic OS (Claude Code)

[example-agentic-os/](example-agentic-os/README.md) shows where the book is heading: more than 60 skills, workflows and agents wired to one fictional company, NovaGrid.

```bash
git clone https://github.com/PacktPublishing/Technical-Program-Manager-s-Guide-to-Practical-AI.git tpm-practical-ai
cd tpm-practical-ai/example-agentic-os
claude
```

Answer yes when Claude Code asks whether to trust the folder, then try `/tpm-program-health SHIELD`. [START_HERE.md](START_HERE.md) walks through it step by step.

## What's in the repo

| Folder | What it is | Chapters |
|---|---|---|
| [prompts/](prompts/README.md) | Every prompt in the book, chapter by chapter, plus kits with sample inputs and recorded outputs | 1, 3, 5, 6, 7, 8, 11 |
| [prompts/ch05-payments-consolidation/](prompts/ch05-payments-consolidation/README.md) | One scenario, five planning use cases, complete prompts | 5 |
| [prompts/ch08-tpm-leadership/](prompts/ch08-tpm-leadership/README.md) | Portfolio reporting skills and agent, leadership and people prompts, tested end to end | 8 |
| [prompts/ch11-career-kit/](prompts/ch11-career-kit/README.md) | Fictional story log, resume, posting and direction statement | 11 |
| [example-agentic-os/](example-agentic-os/README.md) | The six-layer example system for Claude Code and Cursor | 3, 5 to 8 |
| [templates/](templates/README.md) | Reusable templates: persona file, RAID log, status brief, risk tracker and more | 5, 6, 8 |
| [use-cases/01-program-kickoff.md](use-cases/01-program-kickoff.md) | A worked example, from a single prompt to a full kickoff workflow | 5 |
| [docs/use-cases.md](docs/use-cases.md) | **Use Case Catalog**: every use case, tagged as in the book, with links to its prompts | 4 to 8 |
| [docs/](docs/) | The interactive Use Case Navigator and the architecture map | 3, 4 |

**Looking for a use case?** Start with the [Use Case Catalog](docs/use-cases.md): a menu at the top jumps to each chapter and opportunity type, and every book use case links to its prompts. The same catalog is also an interactive page with filters, [docs/use-case-navigator.html](docs/use-case-navigator.html): download it and open it in your browser. It holds 136 use cases: the 27 from the book chapters plus the wider collection, all tagged the way the chapters tag them. Where Chapter 4's summary tables show a different tag, the chapter itself is the one to follow.

## Before you use real data

All names, companies and numbers in this repository are fictional. Before you paste your own program data, people data or customer data into any AI tool, check your company's AI policy, remove what you don't need to share, and use an approved tool. Chapter 9 covers this in full.

## Feedback

Found a prompt that doesn't run, or a difference from the printed book? [Open an issue](https://github.com/PacktPublishing/Technical-Program-Manager-s-Guide-to-Practical-AI/issues). Released under the [MIT License](LICENSE).
