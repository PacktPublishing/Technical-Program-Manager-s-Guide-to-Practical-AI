# Template: Cross-Program Dependencies

Referenced by: `cross-program-dependencies.md`
Review cadence: weekly (update at each SteerCo or when a new shared dependency is identified)

---

## How to use this template

1. Copy this file to the repo root as `cross-program-dependencies.md`
2. Fill in the **Dependency Registry** — one row per shared dependency between programs
3. Add shared resource conflicts in the **Shared Resource Conflicts** table
4. Log each review in the **Review Log** table
5. Add a line in `CLAUDE.md` under "Load for portfolio-level work" pointing to the file
6. Reference the **Agent loading rule** at the top — agents must read this file before individual program masters on any cross-program task

---

# Cross-Program Dependencies

Last validated: YYYY-MM-DD
Review cadence: [weekly / milestone / steering committee cycle]
Owner: [TPM name or role]

> **Agent loading rule:** For any task spanning more than one program, load this file before reading individual program masters. Canonical source designations in the **Depends on** column take precedence over conflicting values in the consuming program's files. Conflicts not resolvable by this rule escalate to the TPM owner above.

---

## Dependency Registry

| Program | Artifact | Canonical path | Last validated | Depends on | Risk ID | Notes |
|---------|----------|----------------|----------------|------------|---------|-------|
| [CONSUMING PROGRAM] | [What artifact / date / decision this program needs] | `3-memory-knowledge/layer3-programs/[provider]-master.md` | YYYY-MM-DD | [PROVIDER PROGRAM] | [DEP-XXX or —] | [Provider owns, consumer defers. Note any known gap or risk.] |

**Column guide:**
- **Program** — the program that *consumes* the dependency
- **Artifact** — the specific deliverable, date, or decision being consumed
- **Canonical path** — file where the authoritative value lives (always the *provider* program's master)
- **Last validated** — when the canonical path was last opened and confirmed current
- **Depends on** — the program that *provides / owns* the artifact
- **Risk ID** — cross-reference to RAID log or dependency risk tracker (blank if none)
- **Notes** — ownership rule and any known gap or tension

---

## Canonical Authority Rules

When two programs reference the same fact with different values:
1. The program listed under **Depends on** defers to the program listed under **Program** (the *provider* program's master is canonical).
2. If the provider program's master is stale (last validated > 14 days ago), flag it before consuming.
3. Conflicts not resolvable by this rule escalate to the TPM owner listed in the file header.

---

## Shared Resource Conflicts

| Resource | Programs competing | Total commitment | Decision owner | Status |
|----------|--------------------|-----------------|----------------|--------|
| [Team or resource name] | [Program A] + [Program B] | [e.g. 170%] | [Name] | [🔴 Unresolved / 🟡 In progress / 🟢 Resolved] |

---

## Review Log

| Date | Reviewer | Changes | Conflicts found |
|------|----------|---------|-----------------|
| YYYY-MM-DD | [TPM] | [What was added, changed, or removed] | [Any canonical source conflicts identified and how resolved] |
