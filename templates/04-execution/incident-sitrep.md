# Template: Incident Situation Report (SitRep)

Referenced by: `/tpm-incident-check`

Use this template to communicate during an active incident. Issue a new SitRep every 30–60 minutes or when status materially changes. Increment the SitRep number with each update.

---

```markdown
# Incident SitRep — [Incident ID / Name]

**Issued:** YYYY-MM-DD HH:MM [timezone]
**SitRep #:** [1 / 2 / 3 — increment each update]
**Incident commander:** [Name]
**TPM on comms:** [Name]
**Severity:** SEV-1 (Critical) / SEV-2 (High) / SEV-3 (Medium)
**Status:** 🔴 Active / 🟡 Mitigated / 🟢 Resolved

---

## Current Status

> One sentence: what is happening right now and what is the customer impact?

---

## Impact

| Dimension | Detail |
|-----------|--------|
| **Customers affected** | [Number / percentage / segment] |
| **Services affected** | [List] |
| **Programs affected** | [e.g., ATLAS enterprise customers] |
| **Revenue at risk** | [$X / unknown] |
| **SLA breach** | Yes — [breach details] / No / At risk |
| **Duration so far** | [X] hours [X] min (since YYYY-MM-DD HH:MM) |

---

## Timeline

| Time | Event |
|------|-------|
| HH:MM | Incident detected — by [monitoring / customer report / engineer] |
| HH:MM | SEV-[N] declared by [Name] |
| HH:MM | Incident commander assigned: [Name] |
| HH:MM | [Key action or finding] |
| HH:MM | This SitRep issued |

---

## What We Know

> Confirmed facts only. Label anything uncertain as "unconfirmed" or "under investigation."

- [Confirmed fact]
- [Under investigation: suspected cause]

---

## What We're Doing

| Action | Owner | Status | ETA |
|--------|-------|--------|-----|
| | | In progress / Done / Blocked | |

---

## What We're NOT Doing (and why)

> Explicit exclusions prevent wasted parallel effort.

- [Option ruled out] — reason: [why]

---

## Root Cause Hypothesis

**Status:** Under investigation / Suspected / Confirmed
**Hypothesis:** [What do we believe caused this?]
**Evidence:** [What supports this?]
**Confidence:** High / Medium / Low

---

## Mitigation vs. Resolution

| | Status | ETA | Owner |
|--|--------|-----|-------|
| **Mitigation** (stop the bleeding) | Done / In progress / Not started | | |
| **Resolution** (fix root cause) | Done / In progress / Not started | | |

---

## Customer Communication

| Channel | Status | Sent at | Owner |
|---------|--------|---------|-------|
| Status page | Updated / Not yet | | |
| Enterprise customer Slack | Sent / Pending | | |
| Support ticket auto-reply | Active / Not set | | |
| Executive notification | Sent / Not needed | | |

**Approved external message:**
> [Exact text sent to customers — word for word]

---

## Escalations

| Escalated to | Reason | Time | Response |
|-------------|--------|------|---------|
| | | | |

---

## Next SitRep

**Scheduled:** HH:MM [timezone] (in [X] minutes)
**Or when:** [Trigger — e.g., "when mitigation is confirmed"]

---

## Post-Incident

- [ ] Post-mortem scheduled — date: [Date], owner: [Name]
- [ ] Customer follow-up communications planned
- [ ] SLA credit calculation initiated (if applicable)
```

---

## SitRep guidance

**Cadence:** Every 30–60 minutes during active SEV-1. Every 60–120 minutes for SEV-2. On material changes for SEV-3.

**Who gets it:** For NovaGrid — Incident commander + Karl Bergstrom (Head TPM) + Division Director of affected service + CS/Support lead if customers affected.

**What "mitigated" means:** Customers can use the service again, even if on a workaround. The root cause is not yet fixed.

**What "resolved" means:** Root cause fixed, service fully restored, monitoring confirms stable.
