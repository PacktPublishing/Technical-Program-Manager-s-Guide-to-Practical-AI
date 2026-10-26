---
name: tpm-preflight
description: Data quality gate that runs before any program skill. Checks staleness, required fields, sparse coverage, and cross-program consistency. Returns PASS / WARN / BLOCK with a required action if blocked.
---
# /tpm-preflight — Pre-Flight Data Quality Gate

**Lifecycle Stage:** Meta (runs before any program skill)
**Job-to-be-Done:** Block skill execution before it produces confident-sounding output from stale or incomplete data

---

## TPM Context

The most dangerous AI output in TPM work is not obviously wrong output — it's plausible output that confidently states a stale risk as active, a closed blocker as open, or a milestone as on track when it slipped last week. Executives will act on it. Pre-flight exists to prevent that.

A status brief generated from a program master doc last updated three weeks ago is worse than no status brief — it's misinformation with TPM authority attached to it.

---

## When to Use / When NOT to Use

**When to use:**
- Before any execution skill that reads from program master docs, Jira/Aha!/Salesforce exports, or meeting notes older than the current sprint
- Before any cross-program skill (`/tpm-program-health`, `/tpm-dependency-map`, `/tpm-steerco-prep`)
- When you're unsure how fresh your data is before producing an executive artifact

**When NOT to use:**
- When inputting live verbal data collected in a meeting — use `/tpm-meeting-notes` directly
- When running strategy-level skills that don't read data files (`/tpm-boardroom`, `/tpm-premortem`) — those skills reason from context, not exports
- When you've already run pre-flight in this session and the documents haven't changed

---

## Interaction Flow

**Step 1 — Identify scope**

Before running any check:
1. Which skill is being requested?
2. Which program(s) are in scope?
3. Consult `3-memory-knowledge/layer1-always/source-registry.md` → look up each program in the **Program → Source Mapping** table → identify which sources the downstream skill will read
4. List those documents explicitly using the export paths from the registry — pre-flight only checks documents the downstream skill will actually consume

The staleness thresholds in Check 1 mirror the source registry. If they diverge, the registry is the source of truth.

Do not check documents that aren't in scope. Do not skip identifying scope.

**Step 2 — Run checks in order, block on first FAIL**

Run Checks 1–4 below. Stop and report BLOCK at the first check that fails. Do not silently continue.

**Step 3 — Produce the Pre-Flight Report**

Format output using the template below. Always specify which check produced the result.

---

## Checks (run in order, block on first FAIL)

### Check 1 — Staleness

For each input document, extract the `Last updated` or `exported_at` field.

| Input type | Maximum age | Action if exceeded |
|------------|-------------|-------------------|
| Program master doc | 7 days | BLOCK |
| Jira export | 3 days | BLOCK |
| Aha! export | 7 days | WARN (Aha! lag is expected — note it) |
| Salesforce export | 14 days | WARN |
| Meeting notes | 5 days | BLOCK if used as primary input |

If no date field found: treat as BLOCK — unknown freshness = unreliable.

### Check 2 — Required fields present

For program master docs, verify these fields exist and are non-empty:

| Field | Required for skills | Block if missing |
|-------|-------------------|-----------------|
| Overall RAG status | All execution skills | Yes |
| At least one milestone with target date | Status-brief, steerco-prep | Yes |
| At least one named risk owner | Escalation-brief, program-health | Yes |
| Last updated date | All skills | Yes |
| TPM name | All skills | Yes |
| Executive sponsor | Steerco-prep, escalation-brief | Yes |

### Check 3 — Sparse coverage

For Jira exports: block if >30% of epics have `percentComplete: null` or `assignee: null`.

For Aha! exports: block if >2 milestones have `percentComplete: 0` and status is not `not_started` — this indicates engineers stopped updating.

For Salesforce: warn if any opportunity has `programDependencies` where all statuses are `null`.

### Check 4 — Cross-program consistency

If running a cross-program skill (`/tpm-program-health`, `/tpm-dependency-map`, `/tpm-steerco-prep`), check:
- `program-index.md` RAG status matches the corresponding program master doc RAG
- `dependency-matrix.md` dep statuses match the inbound/outbound dep sections in program master docs

Mismatch = WARN (not BLOCK — documents updated at different times). Flag which doc is newer.

---

## Output Format

```
PRE-FLIGHT REPORT
Skill requested: [skill name]
Input documents: [list]
Timestamp: [now]

RESULT: [PASS / WARN / BLOCK]

--- Checks ---
✅ Check 1 — Staleness: [result]
✅ Check 2 — Required fields: [result]
⚠️  Check 3 — Sparse coverage: [result + detail]
❌ Check 4 — Cross-program consistency: [result + detail]

--- If BLOCK ---
EXECUTION HALTED.
Reason: [specific field/document/age that triggered block]
Required action: [exactly what the TPM needs to do to unblock]
To override: add "PREFLIGHT-OVERRIDE: [reason]" to your prompt.
  Override is logged to 1-inputs-triggers/preflight-override-log.json.
  Use only when you have out-of-band knowledge that the data is accurate
  despite the flag.

--- If WARN ---
Proceeding with caveats. Output will be marked DRAFT-QUALITY.
Caveats will be prepended to skill output.
```

---

## Override Protocol

TPMs may override a BLOCK with explicit justification:

```
PREFLIGHT-OVERRIDE: Program master doc stale because Sara is at customer site —
I have verbal confirmation from today's standup that M4 is still amber.
```

Override is logged to `1-inputs-triggers/preflight-override-log.json` with:
- Timestamp
- Skill being run
- Document that triggered block
- Override justification
- TPM who overrode (inferred from session context)

Overrides do not silence the caveat — output is still marked DRAFT-QUALITY with the override reason noted.

---

## Key Concepts

- **Staleness is the primary failure mode.** Aha! lags by design; Jira/Linear require manual export; program master docs are only as good as the TPM's last update.
- **WARN means proceed with a caveat.** Don't block on warnings — TPMs often have out-of-band knowledge.
- **BLOCK means stop.** The risk of misinformation outweighs the cost of delay.
- **Override with justification, not habit.** If you're overriding frequently, the data layer has a process problem.

---

## Common Rationalizations

| Rationalization | Reality |
|----------------|---------|
| "I'll skip pre-flight — this is urgent" | Urgency is exactly when stale data causes the most damage. An exec briefed on wrong status acts on it. |
| "The doc looks recent — I don't need to check the date" | "Looks recent" is not a date check. The Last updated field exists for a reason. |
| "I already know this data is accurate" | If you know it's accurate, the override protocol exists — use it with a written justification. |
| "Aha! is always behind, this is expected" | Structural lag (5–7 days) is expected. A 3-week gap is not. Check the actual delta. |
| "I'll note the caveat in my head and proceed" | Caveats not in the output get lost. Mark it DRAFT-QUALITY or it won't survive handoff. |

---

## Red Flags

Signs this skill was run poorly:

- Scope identification skipped — pre-flight ran against all documents in the folder rather than the ones the downstream skill actually reads
- BLOCK produced with no Required action specified — a BLOCK without a clear fix is useless
- BLOCK overridden with no justification text — logs an empty override, defeats audit trail
- Date field not found, result still set to PASS instead of BLOCK
- WARN treated as BLOCK and skill execution halted unnecessarily
- Pre-flight run on a doc the TPM already knew was stale, without asking them to update it first

---

## Verification Checklist

```
- [ ] Scope identified: listed which documents the downstream skill reads before any check ran
- [ ] Staleness checked against the correct threshold for each specific doc type
- [ ] Required fields verified against the list for the requested skill (not generic "all fields")
- [ ] Result is PASS, WARN, or BLOCK — no ambiguous "mostly okay" outputs
- [ ] If BLOCK: required action specifies exactly what document to update and who should update it
- [ ] If WARN: caveat text is drafted and will be prepended to skill output, not just noted internally
- [ ] If override used: justification is written, specific, and references out-of-band knowledge
```

---

## Composes With

- All skills — pre-flight runs first, always
- `/tpm-data-reconciliation` — if pre-flight passes with conflicts, run data reconciliation next
- `5-agent-harness/sub-agents/portfolio-monitor.md` — portfolio monitor runs pre-flight as its Step 1

---

## Design Principles Applied
- Risk Visibility: Surfaces data quality risk before it becomes output quality risk
- Delivery First: Prevents false confidence that slows real delivery decisions
- Context Aware: Reads domain-context.md escalation thresholds to calibrate BLOCK vs WARN
