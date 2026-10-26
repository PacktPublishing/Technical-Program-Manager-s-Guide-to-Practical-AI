# Start here

Two paths. Pick the one that fits you today; you can do the other later.

## Path 1: Try a prompt from the book (5 minutes, any AI tool)

1. Open [chapter-prompts/ch01-how-ai-is-changing-the-tpm-role.md](chapter-prompts/ch01-how-ai-is-changing-the-tpm-role.md). It holds the book's first quick win: ramping up on a program that is already running.
2. Copy the prompt block.
3. Open the AI tool your organization approves and paste the prompt.
4. Open the sample file it names, [atlas-master.md](example-agentic-os/3-memory-knowledge/layer3-programs/atlas-master.md), copy its contents, and paste them underneath the prompt.
5. Read the result. Then do what the book asks: pick three items and check each one against the source.

Every chapter page in [chapter-prompts/](chapter-prompts/README.md) works the same way: a prompt, what to paste with it, and a fictional file to try it with.

## Path 2: Run the example agentic OS (15 minutes, Claude Code)

**You need:** [Claude Code](https://claude.com/claude-code) installed, and [git](https://git-scm.com/downloads) to download the repository. Nothing else: no API keys, no environment variables, no packages.

1. Download the repository:
   ```bash
   git clone https://github.com/PacktPublishing/Technical-Program-Manager-s-Guide-to-Practical-AI.git tpm-practical-ai
   ```
   The last part, `tpm-practical-ai`, gives the folder a short name, which keeps file paths short on Windows. No git? On the GitHub page, choose **Code > Download ZIP** and unzip it.
2. Open a terminal in the example folder and start Claude Code:
   ```bash
   cd tpm-practical-ai/example-agentic-os
   claude
   ```
   Start it from inside `example-agentic-os`, not from the repository root, so the skills can find their files.
3. Claude Code asks whether you trust the folder. Answer yes.
4. Type `/tpm-program-health SHIELD`. You get a health check of NovaGrid's SOC 2 program, built from its Jira, Vanta and Datadog exports.
5. Try a few more from the table in [example-agentic-os/README.md](example-agentic-os/README.md), or run the whole kickoff from [use-cases/01-program-kickoff.md](use-cases/01-program-kickoff.md).

**If something doesn't work:**

| You see | Do this |
|---|---|
| `Unknown command` | You started Claude Code in the wrong folder. Exit, `cd example-agentic-os`, run `claude` again. |
| The skill can't find a file | Same cause: start from inside `example-agentic-os`. |
| On Windows, git says "Filename too long" | Clone into a short folder such as `C:\code`, or run `git config --global core.longpaths true` first. |
| It asks for Slack, Zoom or calendar access | Those connectors are optional. Say "use the files in 1-inputs-triggers instead". |

## Path 3 (optional): Run a whole chapter kit

The Chapter 5 kit can run all its prompts on the sample inputs for you. You need Claude Code and, on Windows, Git Bash:

```bash
bash chapter-prompts/ch05-initiation-and-planning/run.sh
```

Fresh results are written next to the recorded ones as `*.new.md`, so you can compare. The Chapter 8 kit runs inside Claude Code: `cd chapter-prompts/ch08-tpm-leadership` then `claude`, and see its [README](chapter-prompts/ch08-tpm-leadership/README.md).

## Testing checklist

[TEST-CHECKLIST.md](TEST-CHECKLIST.md) lists every prompt and kit with its sample input and what a good result looks like. Use it to check a fresh clone works.
