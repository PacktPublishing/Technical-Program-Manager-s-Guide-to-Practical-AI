# 3-memory-knowledge/

> **Fictional company.** NovaGrid, Inc. and everything about it in this folder (people, customers, programs, numbers, events) is invented for the book. It is not a real company, and any resemblance to real companies or people is coincidental.

Layer 3 of the example OS: structured program state, the system's long-term memory. Skills read from here to ground their output in program context instead of guessing. Every file describes NovaGrid, a fictional post-IPO B2B data platform with 7 active programs, so you can run any skill immediately. To use it for your own programs, replace these files with your own; the skills read by path, not by content.

---

## The four layers

Memory is tiered by how often it changes and how broadly it applies. Load the narrowest layer that answers the question.

```
3-memory-knowledge/
├── layer1-always/        # Rarely changes — company facts true for every program
│   ├── company-snapshot.md          # ARR, headcount, board mandates
│   ├── org-chart.md                 # Execs, divisions, escalation paths
│   ├── tech-stack.md                # Platform and tooling baseline
│   ├── company-changes-q2-2026.md   # Exec decisions affecting priorities
│   ├── source-registry.md           # Connected sources, cadences, staleness thresholds
│   └── skill-testing-scenarios.md   # Scenarios for exercising skills
│
├── layer2-portfolio/     # Changes quarterly — cross-program truth
│   ├── program-index.md             # All 7 programs, RAG status, OKR alignment
│   ├── fy2026-okrs.md               # Company + division OKRs
│   └── dependency-matrix.md         # Dependency grid, shared-resource conflicts
│
├── layer3-programs/      # Changes weekly — one master doc per program
│   └── {nexus,atlas,shield,meridian,pulse,horizon,spark}-master.md
│
├── layer4-weekly/        # Changes daily — live operating state
│   ├── this-week.md                 # Current week: escalations, SteerCo prep
│   └── 2026-W*.md                   # Archived prior weeks
│
├── cross-program-dependencies.md    # Integration contracts + source authority rules
└── raid-log.md                      # Portfolio Risks, Assumptions, Issues, Decisions
```

---

## Loading rules

| Task | Load |
|------|------|
| Single-program deep dive | `layer3-programs/[program]-master.md` |
| Anything cross-program | `cross-program-dependencies.md` **first**, then the program masters |
| SteerCo, QBR, exec deliverable | `layer1-always/company-changes-q2-2026.md` + `layer2-portfolio/` |
| Weekly ops, daily briefing | `layer4-weekly/this-week.md` |
| Risk sweep | `raid-log.md` alongside `cross-program-dependencies.md` (match `DEP-*` IDs) |

`cross-program-dependencies.md` is loaded before individual program masters on cross-program work because it defines which program owns which shared fact. Program masters can disagree with each other; the dependency contract is the tiebreaker.

---

## Write permissions

| File | Who writes |
|------|-----------|
| `layer4-weekly/this-week.md` | `5-agent-harness/sub-agents/portfolio-monitor.md` |
| `layer3-programs/*-master.md` | `5-agent-harness/sub-agents/portfolio-simulator.md`, or the TPM weekly |
| `raid-log.md` | `4-skills-tools/5-execution-delivery/tpm-raid-log.md` |
| `cross-program-dependencies.md` | TPM only — it is the canonical authority record |

Everything else is read-only to skills.

---

## Replacing NovaGrid with your own org

1. Rewrite `layer1-always/company-snapshot.md` and `org-chart.md` with your company and escalation paths.
2. Rewrite `layer2-portfolio/program-index.md` with your live programs.
3. Create one `layer3-programs/<program>-master.md` per program — use `../templates/02-planning/program-master-template.md` as the starting point, or run `/tpm-master-document`.
4. Point `layer1-always/source-registry.md` at your real exports.
5. Delete the `layer4-weekly/2026-W*.md` archives — they are NovaGrid history.

Skills resolve these by path, so once the files are in place every skill picks up your context with no prompt changes.
