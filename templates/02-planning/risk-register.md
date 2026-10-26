# Template: Risk Register

Referenced by: `/tpm-risk-identifier`

> A risk is an uncertain event that, if it occurs, has a positive or negative effect on program objectives.
> An issue is a risk that has already materialized — issues belong in the blocker log, not here.
> Every risk needs an owner. A risk without an owner is noise.

---

```markdown
# Risk Register — [Program Name]

**TPM:** [Name]
**Last updated:** YYYY-MM-DD
**Review cadence:** Weekly (active risks) / Monthly (full register)

---

## Risk Summary

| Total | Critical (🔴) | High (🟠) | Medium (🟡) | Low (🟢) | Closed |
|-------|--------------|----------|------------|---------|--------|
| | | | | | |

---

## Active Risks

| ID | Risk | Category | Likelihood | Impact | Score | Owner | Mitigation | Status |
|----|------|----------|-----------|--------|-------|-------|-----------|--------|
| R-001 | | Schedule/Scope/Dependency/Resource/Technical/Org | H/M/L | H/M/L | 🔴/🟠/🟡/🟢 | | | Open / Mitigated |

**Score guide:** H×H = Critical · H×M or M×H = High · M×M or H×L = Medium · L×anything = Low

---

## Risk Detail

### R-001 — [Title]

**Category:** Schedule / Scope / Dependency / Resource / Technical / Organizational
**Raised:** YYYY-MM-DD by [Name]
**Owner:** [Person responsible for monitoring and mitigating]
**Status:** 🔴 Critical / 🟠 High / 🟡 Medium / 🟢 Low / ✅ Closed

**Description:**
[What is the risk? What uncertain event might occur?]

**Trigger conditions:**
[What would cause this risk to materialize? What are the early warning signs?]

**Likelihood:** High / Medium / Low — [why this assessment]
**Impact if realized:** High / Medium / Low — [what specifically breaks — milestone, OKR, cost, relationship]

**Mitigation (preventive):**
[Actions taken or planned to reduce likelihood. Owner and timeline for each.]

| Action | Owner | Due | Done? |
|--------|-------|-----|-------|
| | | | |

**Contingency (reactive):**
[If the risk materializes despite mitigation, what is the response plan?]

**Escalation trigger:**
[At what point does this risk require escalation above TPM level?]

---

## Closed Risks

| ID | Risk | Closed date | Resolution |
|----|------|------------|-----------|
| | | | Mitigated / Accepted / Occurred / No longer applicable |

---

## Risk Trend

| Review date | New risks | Closed | Risk profile change |
|------------|-----------|--------|-------------------|
| | | | Improving / Stable / Worsening |
```

---

## Filled Example (NovaGrid — NEXUS)

```markdown
# Risk Register — NEXUS

**TPM:** Sara Lindqvist
**Last updated:** 2026-03-11

## Risk Summary

| Total | Critical (🔴) | High (🟠) | Medium (🟡) | Low (🟢) | Closed |
|-------|--------------|----------|------------|---------|--------|
| 4 | 1 | 3 | 0 | 0 | 0 |

## Active Risks

| ID | Risk | Category | Likelihood | Impact | Score | Owner | Status |
|----|------|----------|-----------|--------|-------|-------|--------|
| R-001 | Auth0 contract expires Jun 30 — 90-day renewal window, decision needed Mar 18 | Dependency | H | Critical | 🔴 | James Whitfield (CISO) | Unmitigated — CISO not responding |
| R-002 | 4 teams declining OTel migration — ownership dispute | Resource / Org | M | H | 🟠 | Yuki Tanaka | In escalation |
| R-003 | Service retirement uncovering undocumented dependencies | Technical | H | H | 🟠 | Sara Lindqvist | Buffer added to M4 timeline |
| R-004 | NEXUS competing with SHIELD for Security Eng bandwidth | Resource | H | H | 🟠 | Karl Bergstrom | Prioritization decision pending |
```
