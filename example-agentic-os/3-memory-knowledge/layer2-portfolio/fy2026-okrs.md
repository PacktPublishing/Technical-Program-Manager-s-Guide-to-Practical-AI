# NovaGrid — FY2026 OKRs
*Approved by Board | January 2026 | Owner: Priya Anand (CEO)*
*Current values as of: **August 10, 2026** · Previous restatement: March 2026*

> **Note on this file.** Between March and August 2026 the "Current" columns were not refreshed, so every value in this document was five months old while programs reported weekly against it. Any skill that compared program state to OKR state during that period was reading a contradiction. Refreshed in full Aug 10.

---

## Company OKRs

### O1: Become the undisputed enterprise-ready Data & AI platform

| Key Result | Owner | Target | Current (Aug 2026) | Status |
|-----------|-------|--------|-------------------|--------|
| KR1.1: Achieve SOC 2 Type II certification | CISO + VP Eng | ~~Aug 2026~~ **Dec 15 2026** | **100/100 controls complete**, evidence accepted by the auditor Aug 7. Readiness Aug 31; observation Sep 1–Nov 30; report Dec 15. | 🟡 At risk |
| KR1.2: Close 29 new enterprise deals (>$500K ARR) | CRO | Dec 2026 | 9 closed. Note: initial NovaAI enterprise contracts are landing at $140K–$360K with expansion gated behind the Type II report — the KR counts logos above $500K, the pipeline is landing below it. | 🔴 Behind |
| KR1.3: Hit 125% NRR across enterprise segment | CCO | Dec 2026 | 121% | 🟡 At risk |
| KR1.4: Achieve data residency in EU and APAC regions | VP Eng | Sep 2026 | Architecture spike only. Programme target is **Q1 2027** (CHG-001) — the Sep 2026 KR date has not been formally restated and cannot be met. | 🔴 Behind |

> **KR1.1 was restated by DR-014 (Jul 22).** The original "Aug 2026 certification" was never achievable: The auditor's observation period opens Sep 1. Aug 31 is audit-readiness; the Type II report is Dec 15. Amber rather than green because the dominant risk is now control **drift** during observation, not control completion.
>
> **KR1.4 carries the same class of defect DR-014 corrected in KR1.1** — a board-level KR date (Sep 2026) that no programme plan supports (Q1 2027). It should be restated deliberately rather than left to be discovered.

### O2: Scale NovaAI from pilot to production

| Key Result | Owner | Target | Current (Aug 2026) | Status |
|-----------|-------|--------|-------------------|--------|
| KR2.1: 15 enterprise customers in production on NovaAI | VP Product | Dec 2026 | **3 in production** (Apex Health, Finex Capital, Corinthia Bank). 4th onboarding since Aug 3. | 🔴 Behind |
| KR2.2: NovaAI revenue = 20% of total ARR | CFO | Dec 2026 | 17% | 🟡 At risk |
| KR2.3: NovaAI uptime ≥ 99.5% (SLA commitment) | Director NovaAI | Dec 2026 | **98.9% rolling** (Aug). Recovered from 96.8% on Jul 6. July month average 97.1% against a 99.0% commitment — **missed**. | 🟡 At risk |
| KR2.4: Launch AI Application Builder GA | VP Product | Jun 2026 | ✅ Delivered Jun 2026 | 🟢 Done |

> **KR2.1 is the KR most likely to miss outright.** 3/15 at Aug 10 requires ~2.4 new production customers per month for the rest of H2, above any pace ATLAS has demonstrated. Four weeks of onboarding were deliberately frozen under DR-011 to protect the SLA of existing customers. Renegotiate at the Q3 QBR while that cause is fresh and defensible.
>
> **KR2.3 improved 4.7 points since March** (94.2% → 98.9%) but the target is still unmet, and July demonstrated that GA load can move it 2 points in a day.

### O3: Consolidate the platform — reduce complexity, improve reliability

| Key Result | Owner | Target | Current (Aug 2026) | Status |
|-----------|-------|--------|-------------------|--------|
| KR3.1: Reduce internal service count from 340 → <200 | VP Eng | Dec 2026 | **247 services.** Retiring ~6/week since Jul 13. Note: CHG-002 tightened the internal target to <175; this KR still says <200. | 🟢 On track |
| KR3.2: Migrate 100% traffic from v1 API to v2 | Dir. DevEx | Sep 2026 | **95% of customers migrated** (844/890). Enterprise 100%, mid-market 96%, SMB 94%. | 🟡 At risk |
| KR3.3: Migrate orchestration from Airflow → Temporal | Dir. FlowEng | Aug 2026 | **100% of pipelines migrated** (677/677, Aug 7). Airflow decommission is Sep 30. | 🟢 On track |
| KR3.4: Reduce P1 incident rate by 40% YoY | VP Infra | Dec 2026 | **-38% YTD.** Zero SEV1 since May. | 🟡 At risk |

> **KR3.3 needs care in reporting.** All pipelines are migrated, but Airflow is still running and still costing $380K/month. The KR says "migrate orchestration", which is met; the business outcome arrives only at decommission (Sep 30). Do not report this as complete until Airflow is off.
>
> **KR3.1 carries two targets.** The KR says <200, CHG-002 says <175, and Redmount Capital's Jun 19 letter cited service count specifically. Confirm which number goes in the Q3 board materials before the chart is built.

### O4: Ship a world-class developer and end-user experience

| Key Result | Owner | Target | Current (Aug 2026) | Status |
|-----------|-------|--------|-------------------|--------|
| KR4.1: Launch unified v2 SDK (Python, JS, Java) | Dir. DevEx | May 2026 | ✅ All three GA — Python Apr 30, JS + Java May 31 | 🟢 Done |
| KR4.2: Achieve developer NPS ≥ 55 | Dir. DevEx | Dec 2026 | 44 | 🟡 At risk |
| KR4.3: Launch NovaGrid Mobile App (iOS + Android) | VP Product | ~~Jul 2026~~ **Aug 31 2026** (DR-008) | **Soft GA delivered Jul 31 on time.** Public App Store GA Aug 31, gated on an Apple review decision expected Aug 15–22. Play Store approved Aug 6. | 🟡 At risk |
| KR4.4: Deprecate legacy v1 API (EoL) | VP Eng | Sep 2026 | 95% migrated. 46 customers remain (8 mid-market, 38 SMB). EoL Sep 30. | 🟡 At risk |

### O5: Operate efficiently as a public company

| Key Result | Owner | Target | Current (Aug 2026) | Status |
|-----------|-------|--------|-------------------|--------|
| KR5.1: Gross margin ≥ 72% | CFO | Dec 2026 | 69.6% | 🟡 At risk |
| KR5.2: Engineering cost as % of revenue ≤ 28% | CFO + VP Eng | Dec 2026 | 30.1% | 🔴 Behind |
| KR5.3: Ship SOX compliance controls for financial reporting | CFO | Jun 2026 | ✅ Delivered Jun 2026 | 🟢 Done |
| KR5.4: Achieve Rule of 40 ≥ 45 | CFO | Dec 2026 | 40 | 🟡 At risk |

> **KR5.1 and KR5.2 both carry the PULSE dual-run cost**, now $1.42M accrued and still running at $380K/month until Airflow is decommissioned. Redmount Capital named this in their Jun 19 letter (CHG-005). Sep 30 decommission is worth roughly $1.1M of annualised margin.

---

## Division OKRs

### DataCore Platform — Director: Ethan Park

| KR | Target | Current (Aug 2026) | Status |
|----|--------|-------------------|--------|
| Migrate storage layer Delta Lake → Iceberg for 100% new tenants | Jun 2026 | ✅ Delivered | 🟢 Done |
| Achieve 99.95% query engine uptime | Dec 2026 | 99.88% | 🟡 At risk |
| Reduce data ingestion latency p99 from 8.2s → <3s | Sep 2026 | 4.6s | 🟡 At risk |
| Launch Governance Catalog v2 (lineage, tagging, access policy) | Aug 2026 | 78% — team share partly redirected to SHIELD evidence automation Jul 23 | 🟡 At risk |

### FlowEngine — Director: Amara Osei

| KR | Target | Current (Aug 2026) | Status |
|----|--------|-------------------|--------|
| Complete Airflow → Temporal migration for all production pipelines | Aug 2026 | ✅ **677/677 migrated Aug 7** | 🟢 Done |
| Reduce pipeline failure rate from 4.1% → <1% | Sep 2026 | 1.4%. Cannot be honestly assessed until Airflow is off (PULSE R-010). | 🟡 At risk |
| Launch real-time streaming SDK (Kafka-native) | Jun 2026 | Delayed — the 2 engineers reallocated under DR-009 stayed on PULSE through Sep 30 | 🟡 At risk |
| Achieve pipeline SLA ≥ 99.9% for enterprise tier | Dec 2026 | 99.6% (Aug) — above target for the first time this year | 🟡 At risk |

### NovaAI — Director: Leo Nakamura

| KR | Target | Current (Aug 2026) | Status |
|----|--------|-------------------|--------|
| AI Application Builder GA launch | Jun 2026 | ✅ Delivered | 🟢 Done |
| Model Serving uptime ≥ 99.5% | Dec 2026 | 98.9% rolling | 🟡 At risk |
| Launch Vector Store with enterprise isolation | May 2026 | ✅ Delivered May 29 — **32 days early** | 🟢 Done |
| Onboard 15 enterprise customers to production NovaAI | Dec 2026 | 3 in production | 🔴 Behind |

### Platform & Infrastructure — Director: Ingrid Solvang

| KR | Target | Current (Aug 2026) | Status |
|----|--------|-------------------|--------|
| Complete SOC 2 Type II control implementation | Jul 2026 | ✅ **100/100 complete Jul 15, on time** | 🟢 Done |
| Unify auth layer (Auth0 + Okta → single IAM) | Sep 2026 | ✅ **Live Jun 30**, hypercare exited clean Jul 10 | 🟢 Done |
| Migrate observability from Datadog → OpenTelemetry | Jun 2026 | ✅ Delivered May 2 | 🟢 Done |
| Launch Mobile App (iOS + Android) | Jul 2026 | Soft GA ✅ Jul 31; public GA Aug 31 pending Apple | 🟡 At risk |

---

## Program-to-OKR Mapping

| Program | Primary OKR | Secondary OKRs |
|---------|-------------|----------------|
| NEXUS (Platform Re-arch) | O3 (KR3.1) | O5 (cost reduction) |
| ATLAS (Enterprise Launch) | O2 (KR2.1, KR2.3) | O1 (enterprise readiness) |
| SHIELD (SOC 2) | O1 (KR1.1) | O5 (KR5.3) |
| MERIDIAN (API Consolidation) | O3 (KR3.2) | O4 (KR4.1, KR4.4) |
| PULSE (Data Pipeline) | O3 (KR3.3) | O5 (KR5.1, KR5.2) |
| HORIZON (Mobile) | O4 (KR4.3) | O1 (enterprise) |
| SPARK (AI Product) | O2 | O1 (enterprise) |

---

## OKR Risk Summary (August 10, 2026)

| Board Priority | Blocking Program | Risk Level | Change since March |
|---------------|-----------------|------------|--------------------|
| SOC 2 Type II report Dec 15 | SHIELD | 🟡 Medium — 100/100 controls complete; risk is control drift during Sep 1–Nov 30 observation | 🔴 → 🟡. The March risk ("33 controls not started") is gone entirely; a different risk replaced it. |
| NovaAI 15 enterprise customers by Dec | ATLAS | 🔴 High — 3/15, needs ~2.4/month against demonstrated pace | Unchanged. This is now the portfolio's most likely outright miss. |
| NovaAI 99.5% uptime | ATLAS + SPARK | 🟡 Medium — 98.9% rolling, circuit breaker live Jul 31 | 🔴 → 🟡 |
| v1 API deprecation by Sep 30 | MERIDIAN | 🟡 Medium — 95% migrated; 8 bespoke mid-market integrations are the constraint | 🔴 → 🟡 |
| Mobile public GA Aug 31 | HORIZON | 🟡 Medium — **gated on an Apple review decision, not on NovaGrid** | 🟡, cause changed from internal to external |
| Service reduction <200 (or <175) | NEXUS | 🟢 Low — 247 and retiring ~6/week | 🟡 → 🟢 |
| EU/APAC data residency Sep 2026 | (unassigned) | 🔴 High — **KR date and programme plan disagree by two quarters** | 🔴, and still unrestated |

**Portfolio read:** eight of twenty company KRs are now done or on track, against three in March. The two structural problems are KR2.1 (enterprise NovaAI customer count) and the pattern KR1.4 exemplifies — board-level dates that no programme plan supports, which is exactly what DR-014 had to correct for KR1.1.

*OKRs reviewed quarterly. Next review: Q3 QBR (September 2026).*
