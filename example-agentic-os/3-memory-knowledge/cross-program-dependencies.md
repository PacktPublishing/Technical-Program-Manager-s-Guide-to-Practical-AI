# Cross-Program Dependencies

> *Fictional example: NovaGrid, Inc. is an invented company. All people, customers, numbers and events in this file are made up for the book.*

Last validated: 2026-08-10
Review cadence: weekly (SteerCo alignment every steering committee cycle)
Owner: TPM (Karl Bergstrom)

> **Agent loading rule:** For any task spanning more than one program, load this file before reading individual program masters. Canonical source designations in the **Depends on** column take precedence over conflicting values in the consuming program's files. Conflicts not resolvable by this rule escalate to the TPM owner above.

> **Structural note (Aug 10):** NEXUS IAM going live on Jun 30 resolved five of the twelve registry entries at once. **Every internal blocking dependency in this registry is now closed.** The two live gates on the portfolio are external — Apple's App Store review (HORIZON) and the auditor's observation period (SHIELD) — and neither is a cross-program dependency. This registry has changed character: it is now a record of what was, plus two provider relationships that still carry live dates.

---

## Dependency Registry

| Program | Artifact | Canonical path | Last validated | Depends on | Risk ID | Status | Notes |
|---------|----------|----------------|----------------|------------|---------|--------|-------|
| HORIZON | IAM handoff date | `3-memory-knowledge/layer3-programs/nexus-master.md` | 2026-08-10 | NEXUS | DEP-001 | 🟢 Closed | NEXUS IAM live Jun 30 22:05. HORIZON beta opened Jul 2 — 48h behind plan, absorbed. M6 closed Jul 22. |
| ATLAS | IAM workaround date + full delivery date | `3-memory-knowledge/layer3-programs/nexus-master.md` | 2026-08-10 | NEXUS | DEP-002 | 🟡 Open — planning | IAM delivered Jun 30. Full-IAM refactor planning started Jul 13 once IAM proved stable through hypercare. Refactor sprint Aug–Sep. Auth0 workaround debt stops accruing when the refactor lands, not when IAM shipped. |
| SHIELD | IAM delivery date (14 controls gated) | `3-memory-knowledge/layer3-programs/nexus-master.md` | 2026-08-10 | NEXUS | DEP-005 | 🟢 Closed | 14 controls assigned Jul 1 from pre-staged assignments, closed Jul 11–14. Blocker was open 137 days. SHIELD M4 closed Jul 15 on time. |
| HORIZON | Mobile API endpoint delivery date | `3-memory-knowledge/layer3-programs/meridian-master.md` | 2026-08-10 | MERIDIAN | DEP-003 | 🟢 Closed | Delivered Apr 3. |
| SPARK | Temporal infra availability | `3-memory-knowledge/layer3-programs/pulse-master.md` | 2026-08-10 | PULSE | DEP-006 | 🟢 Closed | PULSE M5 closed Jun 10 — NovaAI training pipelines 100% on Temporal. Full estate (677/677) complete Aug 7. |
| **SPARK** | **Multi-tenant model serving integration path (M2)** | `3-memory-knowledge/layer3-programs/atlas-master.md` | 2026-08-10 | **ATLAS** | **DEP-008** | 🔴 **Open — contended** | **NEW. SPARK M2's final 12% is integration testing against ATLAS multi-tenant serving (ATLAS F1, 88%). ATLAS engineers spent July on the uptime response. This is the live cross-program contention as of today, and M2 is due tomorrow.** |
| ATLAS | SOC 2 evidence availability | `3-memory-knowledge/layer3-programs/shield-master.md` | 2026-08-10 | SHIELD | — | 🟡 Open — date changed | 100/100 controls complete, evidence accepted Aug 7. **The consumable artifact changed under DR-014:** readiness evidence is available now; the Type II report is Dec 15, not Aug 31. ATLAS expansion revenue ($9.4M across three accounts) re-baselined to Q4. |
| ATLAS | Vector Store v2 delivery date | `3-memory-knowledge/layer3-programs/spark-master.md` | 2026-08-10 | SPARK | — | 🟢 Closed | Delivered May 29 — 32 days early. |
| SHIELD | API audit logging availability | `3-memory-knowledge/layer3-programs/meridian-master.md` | 2026-08-10 | MERIDIAN | — | 🟢 Closed | Delivered Apr 3. 8 controls unblocked. |
| **SHIELD** | **Pipeline audit trail (Temporal) — 2 controls in remediation** | `3-memory-knowledge/layer3-programs/pulse-master.md` | 2026-08-10 | **PULSE** | — | 🟡 **Open — action needed** | **PULSE M4 closed Aug 7, so the Temporal audit trail is now real for the FlowEngine estate. The 2 controls documented to the auditor as "in remediation" should be re-evidenced before SHIELD's Sep 1 observation window opens. Yuna owes Fatima confirmation.** |
| ATLAS · SHIELD · PULSE · SPARK | OTel migration completion | `3-memory-knowledge/layer3-programs/nexus-master.md` | 2026-08-10 | NEXUS | — | 🟢 Closed | Delivered May 2. All 15 teams. *(Consolidated from four identical rows.)* |

---

## Canonical Authority Rules

When two programs reference the same fact with different values:
1. The program listed under **Depends on** defers to the program listed under **Program** (inverted: the *provider* program's master is canonical).
2. If the provider program's master is stale (last validated > 14 days ago), flag it before consuming.
3. Conflicts not resolvable by this rule escalate to the TPM owner listed in the file header.

> **Rule 2 failed silently between Jun 29 and Aug 10.** Every program master sat at Jun 28–29 while `this-week.md` and `raid-log.md` had been advanced to Jul 5–6, so consuming programs were reading masters that were six weeks stale without anything flagging it. The rule exists; nothing enforced it. `scripts/check_novagrid_consistency.py` now checks export and layer freshness mechanically.

---

## Shared Resource Conflicts

| Resource | Programs competing | Total commitment | Decision owner | Status |
|----------|--------------------|-----------------|----------------|--------|
| Model Serving team (13 people) | SPARK (60% actual / 65% nominal) + ATLAS (35%) + BAU (5%) | ~100% | Leo N. | 🟡 **Nominally resolved, practically contended.** DR-007 set the split and it held on paper all quarter. From Jul 6 the ATLAS uptime response drew shared engineers onto the F6 circuit breaker, and the shortfall landed on SPARK M2 integration testing. **A paper split does not survive a sibling program's production incident** — see SPARK R-010 and DEP-008. |
| Security & Compliance Eng (8 people) | SHIELD (80%) + ATLAS IAM refactor (15%) + BAU (5%) | 100% | Ingrid S. | 🟢 Resolved. The 25% NEXUS IAM allocation ended Jul 10 at hypercare exit and was redistributed. |
| Core Infrastructure team | NEXUS M7 retirement + ATLAS F7 autoscaling + EU data residency spike | ~105% | Ingrid S. | 🟡 Active. CI/CD finished Jul 3, freeing capacity — but EU data residency (CHG-001) now competes directly with M7 retirement, and Corinthia Bank has made residency a live commercial question. |
| Stream Processing (7 people) | PULSE decommission (30%) + FlowEngine SDK launch (60%) + BAU (10%) | 100% | Amara O. | 🟡 Active. The 2 engineers reallocated under DR-009 stayed with PULSE past M4 close and roll onto decommission through Sep 30. The SDK launch absorbs the delay — visible in the FlowEngine division OKR. |

---

## Review Log

| Date | Reviewer | Changes | Conflicts found |
|------|----------|---------|-----------------|
| 2026-08-10 | Karl Bergstrom | Full re-validation after 11 weeks without one. All 12 entries re-dated. Five dependencies closed by the Jun 30 IAM go-live. DEP-008 opened (SPARK→ATLAS multi-tenant serving). Four identical OTel rows consolidated. SHIELD→PULSE audit trail row added. Shared resource table rebuilt against current Jira `team_capacity`. | **Three.** (1) The file had not been validated since May 26 despite a weekly cadence — 11 weeks stale while five of its entries silently resolved. (2) Rule 2 (stale-provider flagging) never fired during the Jun 29 – Aug 10 split between the weekly layer and the program masters. (3) DR-014 changed what the ATLAS→SHIELD dependency actually delivers (readiness Aug 31 vs report Dec 15) without the registry recording it. |
| 2026-05-26 | Karl Bergstrom | Post-simulation update. DEP-005 notes updated: SHIELD M3 closed May 26. DEP-001 context: NEXUS IAM at 28%. | SHIELD M3 milestone change is event-driven trigger — DEP-005 re-validated. |
| 2026-05-22 | Karl Bergstrom | Initial file created from dependency-matrix.md and program master docs | None — baseline established |
| 2026-05-21 | Karl Bergstrom | Portfolio scan completed; ATLAS Watermelon pattern confirmed | ATLAS/NEXUS IAM date delta carried forward from DEP-001/002/005 |
