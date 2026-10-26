# Confidence Model

Confidence level logic for pattern ratings. Referenced by `rounds/score.md`.

Every pattern rating in the Round 2 output carries a mandatory confidence level. No naked labels.

---

## Confidence Levels

| Level | Criteria |
|---|---|
| **HIGH** | 3+ corroborating signals, all from fresh artifacts (≤ 2 weeks), no conflicting signals |
| **MEDIUM** | 2 corroborating signals, OR 3+ signals from stale artifacts, OR 1 conflicting signal |
| **LOW** | 1 signal only, OR required information category missing, OR heavily stale data |
| **UNASSESSABLE** | The information category required to detect this pattern is absent entirely |

---

## Freshness Thresholds

| Data type | Fresh | Stale | Very stale |
|---|---|---|---|
| Status reports | ≤ 1 week | 1–3 weeks | 3+ weeks |
| Delivery data (Jira/tracker) | ≤ 1 week | 1–2 weeks | 2+ weeks |
| Risk register | ≤ 2 weeks | 2–4 weeks | 4+ weeks |
| Decision log | ≤ 2 weeks | 2–4 weeks | 4+ weeks |
| Dependency map | ≤ 4 weeks | 4–8 weeks | 8+ weeks |
| Team signal / retros | ≤ 3 weeks | 3–6 weeks | 6+ weeks |
| Scope definition | ≤ 4 weeks | 4–8 weeks | 8+ weeks |

---

## Applying Confidence to Pattern Detection

When scoring a pattern in Round 2:

1. Count the number of corroborating signals present
2. Check freshness of the artifacts those signals came from
3. Check for conflicting signals (e.g., velocity declining but team explicitly said this was due to PTO — human confirmed)
4. Apply the confidence level from the table above
5. If the required information category is absent, rate UNASSESSABLE — do not skip the pattern

### Conflicting signals and human annotations

When Checkpoint 1 human annotations explain a signal (e.g., "velocity dropped because 2 engineers were on PTO"), downgrade the signal weight:
- If the explanation fully accounts for the signal: remove it from the corroborating count
- If the explanation is partial: keep the signal but note it in the evidence

### Multiple patterns

A single initiative can exhibit multiple patterns simultaneously. Score each independently. The most severe pattern is PRIMARY; additional patterns are SECONDARY. Patterns do not cancel each other out.

---

## Confidence in the Context Audit (Round 1)

In Round 1 (assess.md), confidence is not a rating — it is a pre-assessment:
- Which patterns will be UNASSESSABLE due to missing categories
- Which patterns have strong preliminary signal (3+ signals visible before human input)
- Which contradictions are most significant

This pre-assessment frames Checkpoint 1 — it tells the human where their annotation matters most.

---

## Common Confidence Errors to Avoid

| Error | Correction |
|---|---|
| Giving HIGH confidence based on a single strong signal | HIGH requires 3+ signals. One strong signal = MEDIUM at best. |
| Downgrading to LOW because one artifact is stale | Stale artifacts still count. Check if 2+ other signals corroborate. |
| Skipping a pattern because its category is missing | Missing category = UNASSESSABLE, not absent. State it explicitly. |
| Upgrading confidence after human annotations that don't fully explain the contradiction | Partial explanations don't restore confidence — note the uncertainty. |
| Rating everything MEDIUM to hedge | MEDIUM has specific criteria. Use it precisely, not as a default. |
