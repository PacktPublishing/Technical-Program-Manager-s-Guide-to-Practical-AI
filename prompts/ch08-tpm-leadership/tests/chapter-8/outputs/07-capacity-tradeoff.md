# 07 — What breaks first if we take on Multi-Region DR

**Files used:**
- [EX] portfolio-reports/executive/ad-hoc/platform-modernization-exec-2026-10-20-adhoc.md
- [AM] fixtures/resource/allocation-map.md
- [TC] fixtures/resource/team-charter.md
- [NP] fixtures/resource/new-program-dr.md

## 1. Platform Eng breaks first, before DR even starts

Platform Eng has 14 engineers, all allocated: 9 on Program 2, 3 on Program 1 and 2 on toil. Two of them leave on 2026-11-01 and the backfill is denied [AM], so on 2026-11-01 the team is 2 short of its current commitments. DR asks for 4 more Platform engineers from 2026-11-02 [NP], which makes the gap 6.

- **First commitment to slip:** Program 2, which holds the largest Platform allocation and is already Red with a re-baseline pending [EX].
- **Size of the slip:** moving 4 engineers off Program 2 takes it from 9 to 5. **Assumption:** if output scales with headcount, the work left after 2026-11-02 takes about 1.8x as long. That moves the re-baselined M4 (2026-12-12) to about mid-January 2027, and M5 (2027-01-16) to about March 2027. O1-KR2 (2027-01-31) would miss [EX].

## 2. Program 1 M4 is the first committed date at risk

Data Eng's 6 engineers are all needed on Program 1 through 2026-11-28 [AM]. If DR takes 2 of them on 2026-11-02 [NP], Program 1 loses a third of its data engineers in the 2 weeks before M4 (2026-11-14, committed under D-01).

- **Size of the slip (Assumption):** 1–2 weeks. That puts O1-KR1 (2026-11-30) at risk.

## 3. Program 3 M4 if SRE comes from Program 3

SRE has 8 engineers: 4 on Program 3 and 4 on on-call [AM]. Taking 2 from Program 3 halves its team right before M4, the Splunk exit on 2026-12-01 [EX]. The Splunk go/no-go on 2026-11-10 already depends on Program 2 [EX].

- **Size of the slip (Assumption):** 2–4 weeks on M4, which puts O2-KR1 at risk.

## 4. TPM coverage breaks a charter rule

Every TPM is fully allocated [AM]. DR is proposed as P0 [NP], and the charter allows one P0 per TPM and no TPM above 100% [TC].

- The only TPMs without a P0 are Aisha Okafor (Program 3 at 60% plus on-call tooling at 40%) and Rahul Mehta (Program 4 at 80% plus security liaison at 20%) [AM].
- Either one would leave their program, or the on-call tooling or security liaison work, without coverage. The charter says those duties stay staffed [TC].

## 5. Engineers would sit idle on DR

DR needs Program 1 M4 and Program 2 M4 to land first [NP]. Program 2 M4 is 2026-11-21 today, and 2026-12-12 if the re-baseline is approved [EX]. Engineers pulled on 2026-11-02 would have little DR work they can do until then.

- **Assumption:** about 3–6 weeks of partial idle time.
