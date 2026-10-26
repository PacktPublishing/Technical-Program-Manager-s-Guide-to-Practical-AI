# 08 — Three options for Multi-Region DR

Uses only the files from prompt 07. Estimates marked **Assumption** aren't in the files.

| Option | Earliest realistic start | What it costs | Outside-portfolio dependency | Decision-log conflict |
|---|---|---|---|---|
| **A. Absorb with current staffing** | **2026-12-14 (Assumption)**: after Program 2 M4 under the re-baseline (2026-12-12) frees Platform engineers, and after Data Eng frees up on 2026-11-28 [AM, EX] | The Program 2 M5 decommission (2027-01-16) loses 4 engineers, so O1-KR2 is at risk. Platform Eng is already 2 short from 2026-11-01 [AM]. The TPM has to come from Program 3 or 4, against the charter [TC]. SOC 2 evidence due 2027-02-01 [NP] leaves about 7 weeks. | Compliance (SOC 2 evidence owner) [NP] | None |
| **B. Absorb by descoping** (pause Program 3 M5 APM, due 2027-01-15) | **2026-12-01 (Assumption)**: after the Program 3 M4 Splunk exit frees 2 SRE and part of Aisha Okafor's time [EX, AM] | Program 3 M5 moves out. Only SRE and TPM capacity is freed; Platform and Data still come from A's timeline, because nothing else in the portfolio uses those skills [AM]. Program 3 supports BB-2 only, so this costs no reliability big bet [EX]. | Compliance [NP] | None |
| **C. Hire** | **Not before 2027-Q1, and probably after the SOC 2 date (Assumption)**: hiring lead time and ramp aren't in the files | Headcount cost (not in the files). Avoids pulling engineers from Programs 1–3. | Recruiting/HR; Compliance | ⚠️ **Conflicts with D-03** (no new Platform headcount in Q4) [EX] |

**Flags:**
- Every option still depends on Program 1 M4 and Program 2 M4 landing first [NP].
- Option C can't start in Q4 without reversing D-03.
