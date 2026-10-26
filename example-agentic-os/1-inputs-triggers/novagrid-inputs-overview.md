# NovaGrid inputs at a glance

A readable view of the fictional exports in this folder, one table per source, generated from the JSON files. **The skills read the JSON files**, which keep every field a real Jira, Aha!, Datadog, Salesforce, Vanta, Gmail or Calendar export would have. Use this page to see what is in them, or paste a table into any AI tool to try a prompt.

All names, companies, emails and numbers are synthetic.

> **Rebuilding this page:** if you change a JSON file, ask Claude (or any AI tool, with the JSON files attached): *"Regenerate novagrid-inputs-overview.md from the JSON files in 1-inputs-triggers, keeping the same sections and columns."*

## Aha! - programs and milestones (all 7 programs)

Source: [`aha/novagrid-aha-export.json`](aha/novagrid-aha-export.json) · 7 records

| ID | Program | TPM | Priority | Phase | Target end | RAG |
|---|---|---|---|---|---|---|
| PRG-NEXUS | NEXUS — Platform Re-architecture & Service Consolidation | sara.lindqvist@novagrid.io | P0 | Execution | 2026-12-31 | green |
| PRG-ATLAS | ATLAS — Enterprise NovaAI Launch | marcus.chen@novagrid.io | P0 | Execution | 2026-09-30 | green |
| PRG-SHIELD | SHIELD — SOC 2 Type II Certification | fatima.alhassan@novagrid.io | P0 | Execution | 2026-12-15 | amber |
| PRG-MERIDIAN | MERIDIAN — API Consolidation & v1 Deprecation | james.okonkwo@novagrid.io | P1 | Execution | 2026-09-30 | amber |
| PRG-PULSE | PULSE — Data Pipeline Overhaul (Airflow → Temporal) | yuna.park@novagrid.io | P1 | Execution | 2026-09-30 | amber |
| PRG-HORIZON | HORIZON — Mobile Platform (iOS & Android) | priya.kaur@novagrid.io | P1 | Execution | 2026-08-31 | amber |
| PRG-SPARK | SPARK — NovaAI v2 Core Platform | daniel.rios@novagrid.io | P1 | Execution | 2026-12-31 | amber |

## Jira - epics (SHIELD, PULSE, MERIDIAN)

Source: [`jira/novagrid-jira-export.json`](jira/novagrid-jira-export.json) · 16 records

| Key | Program | Summary | Status | % done | Target | Assignee |
|---|---|---|---|---|---|---|
| SHIELD-1 | SHIELD | SOC 2 Control Implementation — Wave 1 (Security & Compliance Eng) | Done | 100 | 2026-05-10 | fatima.alhassan@novagrid.io |
| SHIELD-2 | SHIELD | SOC 2 Control Implementation — Wave 2 (Core Infrastructure) | Done | 100 | 2026-06-15 | ingrid.solvang@novagrid.io |
| SHIELD-3 | SHIELD | SOC 2 Control Implementation — Wave 3 (Model Serving / NovaAI) + IAM-blocked controls | Done | 100 | 2026-07-15 | leo.nakamura@novagrid.io |
| SHIELD-4 | SHIELD | Vanta evidence collection and audit preparation | Done | 100 | 2026-07-15 | fatima.alhassan@novagrid.io |
| SHIELD-5 | SHIELD | Control operating stability — pre-observation hardening | In Progress | 20 | 2026-08-31 | fatima.alhassan@novagrid.io |
| PULSE-1 | PULSE | DataCore pipeline migration — Airflow to Temporal (180 pipelines) | Done | 100 | 2026-05-01 | yuna.park@novagrid.io |
| PULSE-2 | PULSE | FlowEngine pipeline migration — Airflow to Temporal (340 pipelines) | Done | 100 | 2026-07-25 | amara.osei@novagrid.io |
| PULSE-4 | PULSE | Airflow decommission — traffic verification, read-only mode, shutdown | In Progress | 12 | 2026-09-30 | yuna.park@novagrid.io |
| PULSE-3 | PULSE | NovaAI training pipeline migration — Airflow to Temporal (95 pipelines) | Done | 100 | 2026-06-01 | leo.nakamura@novagrid.io |
| MERIDIAN-1 | MERIDIAN | v2 API feature parity — all endpoints including mobile push notifications | Done | 100 | 2026-04-03 | james.okonkwo@novagrid.io |
| MERIDIAN-2 | MERIDIAN | Python SDK v2 GA | Done | 100 | 2026-04-30 | lara.costa@novagrid.io |
| MERIDIAN-3 | MERIDIAN | Enterprise customer v1→v2 migration (41 total enterprise customers) | Done | 100 | 2026-06-01 | james.okonkwo@novagrid.io |
| MERIDIAN-4 | MERIDIAN | Mid-market customer v1→v2 migration (210 total mid-market customers) | In Progress | 96 | 2026-08-21 | james.okonkwo@novagrid.io |
| MERIDIAN-5 | MERIDIAN | JS + Java SDK v2 GA | Done | 100 | 2026-05-31 | lara.costa@novagrid.io |
| MERIDIAN-6 | MERIDIAN | SMB customer migration — Compass Migration Partners engagement | In Progress | 94 | 2026-09-30 | james.okonkwo@novagrid.io |
| MERIDIAN-7 | MERIDIAN | v1 API shutdown sequencing and infrastructure teardown | In Progress | 25 | 2026-09-30 | james.okonkwo@novagrid.io |

## Jira - L3 engineering support tickets

Source: [`jira/novagrid-jira-l3-tickets.json`](jira/novagrid-jira-l3-tickets.json) · 21 records

| ID | Program | Title | Priority | Status | SLA breached | Incident |
|---|---|---|---|---|---|---|
| SUPP-001 | ATLAS | DataCore connection pool exhaustion under concurrent model inference requests | P1 | Resolved | True | INC-2026-001 |
| SUPP-002 | ATLAS | Model inference timeout on context windows >128 tokens — p99 latency spikes to 6.8s | P2 | Resolved | False | INC-2026-003 |
| SUPP-003 | PULSE | Airflow task retry storm causes scheduler database saturation on DAG backfill | P1 | Resolved | False | INC-2026-004 |
| SUPP-004 | MERIDIAN | v1 API rate limit headers not present in v2 — client SDKs failing silently on 429 | P2 | Resolved | False |  |
| SUPP-005 | ATLAS | Auth0 SSO session refresh race condition — users forced to re-authenticate every 15 minutes | P2 | Resolved | False | INC-2026-002 |
| SUPP-006 | ATLAS | Python SDK v2 batch inference returns results in non-deterministic order | P2 | Resolved | False |  |
| SUPP-007 | PULSE | Temporal workflow state deserialization error after 1.3→1.4 upgrade | P2 | Resolved | False | INC-2026-007 |
| SUPP-008 | MERIDIAN | v1 API response envelope differs from v2 — breaking change not in migration guide | P2 | In Progress | False |  |
| SUPP-009 | ATLAS | Missing audit log entries for high-frequency API requests (>50 req/s per tenant) | P1 | Resolved | True |  |
| SUPP-010 | HORIZON | HORIZON iOS app crashes on re-authentication after background suspend >30 minutes | P2 | Resolved | False |  |
| SUPP-011 | MERIDIAN | v2 API webhook delivery: retry exhaustion silently discards events after 3 attempts | P2 | In Progress | False |  |
| SUPP-012 | PULSE | Airflow DAG import failures on Python 3.12 — incompatible operator syntax | P3 | Resolved | False |  |
| SUPP-013 | ATLAS | NovaAI API p99 latency regression after Model Serving 65% allocation (DR-007) | P2 | In Progress | False | INC-2026-013 |
| SUPP-014 | HORIZON | HORIZON Android push notifications not delivered on Android 14 — silent failure | P3 | Open | False |  |
| SUPP-015 | MERIDIAN | v2 API pagination cursor expires after 60 seconds — incompatible with batch ETL workflows | P2 | Open | False |  |
| SUPP-016 | NEXUS | IAM token refresh cache TTL unit mismatch causing p99 latency spike | P1 | Resolved | False | INC-2026-0117 |
| SUPP-017 | ATLAS | NovaAI inference API 5xx under GA production load - capacity and circuit breaking | P1 | Resolved | True | INC-2026-0121 |
| SUPP-018 | PULSE | FlowEngine cutover batch 14 backfill saturating DataCore query engine | P3 | Resolved | False | INC-2026-0124 |
| SUPP-019 | HORIZON | Mobile session refresh token lifetime mismatch logging out beta users | P2 | Resolved | False | INC-2026-0129 |
| SUPP-020 | MERIDIAN | v1 API gateway latency for remaining mid-market batch integrations | P3 | In Progress | False | INC-2026-0131 |
| SUPP-021 | SHIELD | Quarterly access review evidence export missing pre-IAM grant history | P2 | Resolved | False |  |

## Datadog - incidents

Source: [`datadog/novagrid-datadog-export.json`](datadog/novagrid-datadog-export.json) · 23 records

| ID | Severity | Title | Start | Minutes | Customers | Programs |
|---|---|---|---|---|---|---|
| INC-2026-0034 | SEV1 | SEV1: novaai-model-serving + auth-service outage — connection pool exhaustion under enterprise beta load | 2026-03-08T14:22:00Z | 47 | 14 | ATLAS, NEXUS |
| INC-2026-0039 | SEV2 | SEV2: airflow-scheduler memory leak — 28 FlowEngine pipelines delayed 4+ hours | 2026-03-15T03:14:00Z | 28 | 3 | PULSE |
| INC-2026-0041 | SEV2 | SEV2: novaai-inference-api p99 latency spike >5s — GPU memory pressure from concurrent large model requests | 2026-03-19T10:47:00Z | 138 | 8 | ATLAS, SPARK |
| INC-2026-0045 | SEV2 | SEV2: datacore-query-engine performance regression post-deploy — 4x latency on complex scans | 2026-03-22T16:03:00Z | 40 | 3 | NEXUS |
| INC-2026-0052 | SEV1 | SEV1: auth-service + novaai-model-serving cascade — Auth0 token refresh failure under concurrent POC load | 2026-04-03T19:31:00Z | 23 | 11 | ATLAS, NEXUS |
| INC-2026-0055 | SEV2 | SEV2: airflow-scheduler worker OOM — 180 DataCore pipelines paused during peak batch run | 2026-04-07T02:08:00Z | 92 | 0 | PULSE |
| INC-2026-0061 | SEV2 | SEV2: Temporal/Airflow worker resource contention — 15 PULSE-migrated NovaAI pipelines failed during batch run | 2026-04-15T06:22:00Z | 135 | 0 | PULSE, ATLAS |
| INC-2026-0067 | SEV3 | SEV3: api-gateway-v1 rate limiter misconfiguration — enterprise customers hit unexpected HTTP 429s | 2026-04-18T14:05:00Z | 22 | 6 | MERIDIAN |
| INC-2026-0071 | SEV3 | SEV3: datacore-query-engine transformation pipeline timeout on large schema joins | 2026-04-24T11:33:00Z | 14 | 3 |  |
| INC-2026-0078 | SEV2 | SEV2: novaai-inference-api rate limiter bug — incorrect token bucket configuration caused 120 minutes degraded service | 2026-05-02T08:14:00Z | 120 | 6 | ATLAS |
| INC-2026-0082 | SEV3 | SEV3: datacore-query-engine Iceberg metadata scan timeout during large table migration | 2026-05-05T22:41:00Z | 47 | 0 |  |
| INC-2026-0089 | SEV2 | SEV2: novaai-model-serving memory leak after hot-reload of model weights — 2 enterprise beta customers impacted 85 minutes | 2026-05-13T09:07:00Z | 85 | 2 | ATLAS, SPARK |
| INC-2026-0094 | SEV2 | SEV2: airflow-scheduler process crash — 45 minute downtime, 12 pipeline jobs delayed | 2026-05-20T14:52:00Z | 45 | 0 | PULSE |
| INC-2026-0098 | SEV3 | SEV3: mobile-backend session token expiry too aggressive — 23 internal HORIZON alpha testers experienced forced logouts | 2026-06-01T10:18:00Z | 94 | 0 | HORIZON |
| INC-2026-0103 | SEV3 | SEV3: novaai-inference-api connection pool warning — auto-recovery within 8 minutes. DR-006 tuning working as intended. | 2026-06-10T15:44:00Z | 8 | 0 | ATLAS, NEXUS |
| INC-2026-0108 | SEV3 | SEV3: novaai-model-serving async inference queue depth exceeded 80% threshold — warning alert, no customer impact | 2026-06-20T11:22:00Z | 12 | 0 | ATLAS, SPARK |
| INC-2026-0112 | SEV3 | SEV3: mobile-backend push notification service timeout during Android beta stress test | 2026-06-22T16:05:00Z | 26 | 0 | HORIZON |
| INC-2026-0117 | SEV2 | SEV2: auth-service token refresh latency spike following NEXUS IAM production cutover | 2026-07-02T09:14:00Z | 204 | 2 | NEXUS, ATLAS, SHIELD |
| INC-2026-0121 | SEV2 | SEV2: novaai-inference-api 5xx surge under GA load - SLO burn alert breaches internal uptime floor | 2026-07-06T13:04:00Z | 343 | 3 | ATLAS, SPARK |
| INC-2026-0124 | SEV3 | SEV3: datacore-query-engine p99 regression during FlowEngine cutover batch 14 | 2026-07-21T02:30:00Z | 95 | 0 | PULSE |
| INC-2026-0126 | SEV2 | SEV2: airflow-scheduler task starvation during final FlowEngine cutover - 27 entangled pipelines | 2026-07-25T11:12:00Z | 526 | 0 | PULSE |
| INC-2026-0129 | SEV3 | SEV3: mobile-backend session refresh failures for beta cohort after soft GA | 2026-08-03T08:40:00Z | 92 | 2 | HORIZON, NEXUS |
| INC-2026-0131 | SEV3 | SEV3: api-gateway-v1 elevated latency as v1 traffic concentrates on remaining mid-market integrations | 2026-08-06T14:20:00Z | 75 | 3 | MERIDIAN |

## Salesforce - accounts

Source: [`salesforce/novagrid-sfdc-export.json`](salesforce/novagrid-sfdc-export.json) · 10 records

| ID | Account | Tier | ARR now | ARR potential | Depends on programs |
|---|---|---|---|---|---|
| ACC-0041 | Meridian Financial Group | Enterprise | 0 | 4200000 | ATLAS, SHIELD |
| ACC-0067 | Apex Health Systems | Enterprise | 360000 | 3800000 | SHIELD, ATLAS |
| ACC-0112 | Thornbridge Capital | Enterprise | 1200000 | 2900000 | MERIDIAN |
| ACC-0089 | Solaris Logistics | Enterprise | 0 | 2400000 | HORIZON, ATLAS |
| ACC-0134 | Nuvera Insurance | Enterprise | 0 | 2100000 | SHIELD, ATLAS |
| ACC-0178 | VantagePoint Analytics | Enterprise | 1800000 | 1800000 | SPARK, ATLAS |
| ACC-0203 | Kestrel Media Group | Enterprise | 0 | 1600000 | HORIZON |
| ACC-0055 | Brightpath Education | Enterprise | 1200000 | 1200000 | MERIDIAN, ATLAS |
| ACC-NEW-001 | Finex Capital | Enterprise | 140000 | 2500000 | ATLAS, SHIELD |
| ACC-NEW-002 | Corinthia Bank | Enterprise | 220000 | 3100000 | ATLAS, SHIELD |

## Salesforce - L1/L2 support cases

Source: [`salesforce/novagrid-sfdc-support-tickets.json`](salesforce/novagrid-sfdc-support-tickets.json) · 32 records

| ID | Level | Account | Subject | Priority | Status | To L3 |
|---|---|---|---|---|---|---|
| SC-2026-0187 | L2 | Apex Health Systems | NovaAI inference API returning 502 errors — production model calls failing | P1 | Closed | True |
| SC-2026-0201 | L2 | Nuvera Insurance | NovaAI model serving timeouts — inference p99 latency exceeding 45 seconds | P2 | Closed | False |
| SC-2026-0218 | L2 | VantagePoint Analytics | NovaAI API intermittent 500 errors — hot-reload cycle after model update | P2 | Closed | True |
| SC-2026-0234 | L2 | Apex Health Systems | NovaAI inference 502 errors — enterprise beta account reporting full outage | P1 | Closed | False |
| SC-2026-0251 | L2 | Finex Capital | NovaAI inference capacity — post-GA load causing latency regression | P2 | Open | False |
| SC-2026-0089 | L1 | Thornbridge Capital | v1 API end-of-life date — when will v1 be shut down? | P3 | Closed | False |
| SC-2026-0124 | L1 | Vertex Analytics (SMB) | Python SDK v2 migration guide — how to migrate from v1 requests to v2 client? | P3 | Closed | False |
| SC-2026-0197 | L2 | Nuvera Insurance | v1 API rate limiter returning 429 with no Retry-After header — client backoff broken | P2 | Closed | True |
| SC-2026-0242 | L1 | Quantico Research (SMB) | v1 API deprecation announcement — email received, confused about Sep 30 vs Dec 31 dates | P3 | Closed | False |
| SC-2026-0162 | L2 | ClearPath Analytics (Mid-Market) | FlowEngine DAG missed scheduled runs — pipeline delayed 6+ hours | P1 | Closed | False |
| SC-2026-0208 | L2 | Glenmore Capital (Enterprise) | FlowEngine pipeline data freshness SLA breach — customer reporting 4-hour lag | P2 | Closed | False |
| SC-2026-0229 | L2 | Glenmore Capital (Enterprise) | Airflow/Temporal mixed environment — NovaAI pipeline scheduling conflict | P2 | Closed | False |
| SC-2026-0098 | L2 | Meridian Financial Group | SOC 2 evidence package request — Meridian Financial legal team requirement | P2 | Closed | False |
| SC-2026-0147 | L2 | Apex Health Systems | SOC 2 security questionnaire — Apex Health POC approval requirement | P2 | Closed | False |
| SC-2026-0174 | L2 | Nuvera Insurance | Nuvera Insurance SOC 2 progress update request — CDO board deadline | P2 | Closed | False |
| SC-2026-0243 | L2 | Corinthia Bank | Corinthia Bank — GDPR data residency and EU hosting documentation request | P2 | Open | False |
| SC-2026-0264 | L1 | NovaGrid Internal Alpha (HORIZON) | HORIZON alpha — iOS alert center dismissal not persisting across app restart | P3 | Closed | False |
| SC-2026-0271 | L1 | NovaGrid Internal Alpha (HORIZON) | HORIZON alpha — Android push notifications not arriving when app in background | P3 | Closed | False |
| SC-2026-0289 | L1 | Kestrel Media Group | HORIZON mobile alpha — Kestrel preview offline sync dropping writes | P2 | Closed | False |
| SC-2026-0131 | L2 | VantagePoint Analytics | Auth service returning 401 on valid tokens — enterprise auth regression | P1 | Closed | True |
| SC-2026-0156 | L2 | Nuvera Insurance | SAML 2.0 SSO configuration — Nuvera Insurance cannot use OIDC | P2 | Closed | False |
| SC-2026-0244 | L2 | VantagePoint Analytics | DataCore query engine — p99 latency spike on dashboard reports post v2.3.1 deploy | P2 | Closed | False |
| SC-2026-0109 | L1 | Thornbridge Capital | Billing — how to add a second payment method for enterprise contract split invoicing | P3 | Closed | False |
| SC-2026-0259 | L2 | NovaGrid Internal Alpha (HORIZON) | Mobile session token expiry — iOS users being logged out unexpectedly | P2 | Closed | False |
| SC-2026-0388 | L2 | Apex Health Systems | Slow dashboard loads and session refresh delays after platform auth change | P2 | Closed | SUPP-016 |
| SC-2026-0391 | L2 | Apex Health Systems | Intermittent 5xx errors on NovaAI inference calls - production impact | P1 | Closed | SUPP-017 |
| SC-2026-0393 | L2 | Finex Capital | Inference latency and occasional errors during morning batch window | P2 | Closed |  |
| SC-2026-0396 | L1 | Corinthia Bank | When will our tenant provisioning complete? Onboarding appears paused | P2 | Closed |  |
| SC-2026-0399 | L2 | Nuvera Insurance | SOC 2 certification date - our board pack says August, is that confirmed? | P1 | Closed |  |
| SC-2026-0402 | L2 | Kestrel Media Group | Beta users being logged out of the mobile app unexpectedly | P2 | Closed | SUPP-019 |
| SC-2026-0405 | L1 | Solaris Logistics | Mobile app feedback - offline mode and alert filtering | P3 | Open |  |
| SC-2026-0409 | L2 | 3 mid-market accounts (aggregate) | v1 API batch jobs running slow during nightly window | P3 | Open | SUPP-020 |

## Vanta - SOC 2 controls (SHIELD)

Source: [`vanta/novagrid-vanta-export.json`](vanta/novagrid-vanta-export.json) · 31 records

| Control | Name | Status | Wave | Owner | Auditor status |
|---|---|---|---|---|---|
| CC1.1 | Board-Level Oversight of Security Program | COMPLETE | 1 | James Whitfield (CISO) | accepted |
| CC1.2 | Management Accountability — Security Roles and Responsibilities | COMPLETE | 1 | James Whitfield (CISO) | accepted |
| CC2.1 | Internal Communication of Security Policies | COMPLETE | 1 | Fatima Al-Hassan | accepted |
| CC3.2 | Annual Risk Assessment | COMPLETE | 1 | Fatima Al-Hassan | accepted |
| CC4.1 | Continuous Security Monitoring | COMPLETE | 1 | Sec Eng team | accepted |
| CC5.3 | Change Management — Production Deployment Controls | COMPLETE | 1 | DevEx team | accepted |
| CC6.7 | Encryption in Transit | COMPLETE | 2 | Core Infra team | accepted |
| CC6.8 | System Hardening Procedures | COMPLETE | 2 | Core Infra team | accepted |
| CC6.1 | Logical Access Provisioning | COMPLETE | 4 | Fatima Al-Hassan / NEXUS team | pending_evidence |
| CC6.2 | User Access Removal / Offboarding | COMPLETE | 4 | Fatima Al-Hassan / NEXUS team | pending_evidence |
| CC6.3 | Role-Based Access Control | COMPLETE | 4 | Fatima Al-Hassan / NEXUS team | pending_evidence |
| CC6.6 | Privileged Access Management | COMPLETE | 4 | Fatima Al-Hassan | pending_evidence |
| CC7.1 | Vulnerability Management | COMPLETE | 1 | Sec Eng team | accepted |
| CC8.1 | Formal Change Management Process | COMPLETE | 1 | DevEx team | accepted |
| CC9.1 | Vendor Risk Management | COMPLETE | 1 | Fatima Al-Hassan | accepted |
| A1.1 | Backup and Recovery Procedures | COMPLETE | 1 | Core Infra team | pending |
| A1.2 | Recovery Testing with Access Controls | COMPLETE | 4 | Core Infra team | pending_evidence |
| A1.3 | System Availability Monitoring — 99.9% SLA | COMPLETE | 1 | Core Infra team | accepted |
| A1.7 | Log Retention Policy | COMPLETE | 3 | DataCore team | not_yet_submitted |
| C1.2 | Encryption at Rest | COMPLETE | 2 | Core Infra team | accepted |
| C1.3 | Data Classification Policy | COMPLETE | 2 | Fatima Al-Hassan | accepted |
| C1.1 | Data Access Logging — Identity Binding | COMPLETE | 4 | DataCore team | pending_evidence |
| PI1.1 | Input Validation Controls | COMPLETE | 1 | FlowEngine team | accepted |
| PI1.3 | Data Processing Accuracy Validation | COMPLETE | 2 | FlowEngine team / NovaAI team | accepted |
| PI1.5 | Error Handling and Processing Exception Management | COMPLETE | 1 | FlowEngine team | accepted |
| P1.1 | Privacy Policy — External Notice | COMPLETE | 1 | Legal / Fatima Al-Hassan | accepted |
| P4.1 | Data Retention and Disposal Schedule | COMPLETE | 2 | Fatima Al-Hassan / Legal | accepted |
| P5.1 | Data Subject Access Request (DSAR) Process | COMPLETE | 2 | Legal / Fatima Al-Hassan | accepted |
| P7.1 | Data Subject Access Requests — IAM-Verified Identity | COMPLETE | 4 | Fatima Al-Hassan / Legal | pending_evidence |
| CC7.3 | Incident Response Plan | COMPLETE | 2 | Fatima Al-Hassan | accepted |
| CC5.1 | Security Policies — Annual Review and Approval | COMPLETE | 1 | Fatima Al-Hassan | accepted |

## Gmail - threads in the Head of TPM mailbox

Source: [`gmail/novagrid-gmail-export.json`](gmail/novagrid-gmail-export.json) · 18 records

| ID | Subject | From | Last message | Needs reply |
|---|---|---|---|---|
| THR-1001 | WYWO — Karl cover notes (Aug 11 – Sep 2) | sara.lindqvist@novagrid.io | 2026-09-02T17:40:00Z | True |
| THR-1002 | Q3 QBR moved to Sep 8 — pre-read due Sep 4 EOD | marcus.bauer@novagrid.io | 2026-08-24T09:15:00Z | True |
| THR-1003 | App Store rejection — 5.1.1(v) account deletion. Resubmitted Aug 24. | priya.kaur@novagrid.io | 2026-09-02T08:12:00Z | True |
| THR-1004 | Decision: HORIZON ships Android-only Aug 31 | ingrid.solvang@novagrid.io | 2026-08-20T15:50:00Z | True |
| THR-1005 | Solaris Logistics — need a written iOS date before Sep 4 | jennifer.wu@novagrid.io | 2026-09-01T14:22:00Z | True |
| THR-1006 | Observation window opened Sep 1 — CC6.4 / CC6.6 went in on the old evidence | fatima.alhassan@novagrid.io | 2026-09-01T09:05:00Z | True |
| THR-1007 | PULSE decommission — 14 pipelines still writing Airflow state, read-only slips to Sep 14 | yuna.park@novagrid.io | 2026-09-02T11:30:00Z | True |
| THR-1008 | SPARK M2 closed Aug 27 — proposing M3 to Oct 16 | daniel.rios@novagrid.io | 2026-08-27T17:15:00Z | True |
| THR-1009 | NEXUS M7 target — is it <200 or <175? Board chart is being built | sara.lindqvist@novagrid.io | 2026-08-26T10:40:00Z | True |
| THR-1010 | ATLAS — 4th enterprise customer live, and M9 needs a QBR slot | marcus.chen@novagrid.io | 2026-09-01T09:30:00Z | True |
| THR-1011 | MERIDIAN M6 closed Aug 20 — 210/210 | james.okonkwo@novagrid.io | 2026-08-31T12:00:00Z | False |
| THR-1012 | Re: DEP-002 ATLAS full-IAM refactor — sequencing question | marcus.chen@novagrid.io | 2026-08-25T11:00:00Z | False |
| THR-1013 | [DataDog] Weekly SLO digest — week of Aug 31 | datadog-alerts@novagrid.io | 2026-08-31T06:00:00Z | False |
| THR-1014 | Deloitte — observation period logistics and sampling schedule | e.mcbride@deloitte.com | 2026-09-01T08:00:00Z | False |
| THR-1015 | TPM hiring — two candidates at final stage, need your debrief slot | hanna.lindgren@novagrid.io | 2026-09-01T16:00:00Z | True |
| THR-1016 | RESOLVED: Auth0 renewal — signed Aug 18 | james.whitfield@novagrid.io | 2026-08-18T10:00:00Z | False |
| THR-1017 | All-hands Sep 10 + Q3 benefits enrollment closes Sep 15 | people-ops@novagrid.io | 2026-08-27T09:00:00Z | False |
| THR-1018 | Re: Re: Re: Vendor intro — observability platform (5th follow-up) | sales@obsvendor.example.com | 2026-08-30T14:00:00Z | False |

## Calendar - upcoming events (Head of TPM)

Source: [`calendar/novagrid-calendar-export.json`](calendar/novagrid-calendar-export.json) · 8 records

| ID | Title | Start | Minutes | Organizer |
|---|---|---|---|---|
| EVT-2201 | Welcome back / handover — Sara Lindqvist | 2026-09-03T16:00:00+02:00 | 30 | sara.lindqvist@novagrid.io |
| EVT-2202 | Karl / Yuki 1:1 — ATLAS M9 number before Marcus sees it | 2026-09-04T09:00:00+02:00 | 30 | yuki.tanaka@novagrid.io |
| EVT-2203 | INC-2026-0131 post-incident review (PULSE) | 2026-09-04T11:00:00+02:00 | 60 | yuna.park@novagrid.io |
| EVT-2204 | Weekly TPM SteerCo | 2026-09-04T10:00:00+02:00 | 60 | karl.bergstrom@novagrid.io |
| EVT-2205 | Q3 QBR — Marcus Bauer / Yuki Tanaka | 2026-09-08T14:00:00+02:00 | 120 | marcus.bauer@novagrid.io |
| EVT-2206 | TPM final-stage debrief — 2 Sr. TPM candidates | 2026-09-09T13:00:00+02:00 | 45 | hanna.lindgren@novagrid.io |
| EVT-2207 | VantagePoint contractual roadmap review | 2026-09-15T15:00:00+02:00 | 90 | dmitri.volkov@novagrid.io |
| EVT-2208 | Solaris Logistics — signature (Jennifer Wu) | 2026-09-15T10:00:00+02:00 | 60 | jennifer.wu@novagrid.io |
