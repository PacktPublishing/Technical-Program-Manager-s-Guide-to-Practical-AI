---
name: tpm-roi-checker
description: "Use when you need to validate the business case and estimate ROI for a program before resources are committed."
---
# /tpm-roi-checker — Business Case / ROI Checker

**Lifecycle Stage:** Planning & Design
**Job-to-be-Done:** Validate the business case and estimate ROI for a program before resources are committed

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and description
2. Expected investment (engineering weeks, headcount, tooling costs)
3. Expected benefits (revenue, cost savings, efficiency gains, risk reduction)
4. Timeline to value
5. Alternatives considered (including "do nothing")
6. Confidence level in benefit estimates (low/medium/high)

**Step 2 — Generate**

---

## Output Format

```markdown
# Business Case / ROI Check: [Program Name]

---

## Investment Summary

| Category | Amount | Notes |
|---------|--------|-------|
| Engineering effort | [X] eng-weeks | [Y] FTEs × [Z] weeks |
| Infrastructure / tooling | $[X] | |
| Opportunity cost | [X] eng-weeks | What else won't get done |
| **Total investment** | | |

---

## Expected Benefits

| Benefit | Type | Estimated Value | Confidence | Timeline |
|---------|------|----------------|-----------|----------|
| | Revenue / Cost / Risk / Speed | | Low/Med/High | |

---

## ROI Analysis

**Simple ROI:** [Benefits − Investment] / Investment × 100 = [X]%
**Payback period:** [X months to recoup investment]
**Break-even:** [Date when cumulative benefit exceeds investment]

---

## Risk-Adjusted View

| Scenario | Probability | Benefits | ROI |
|---------|------------|---------|-----|
| Optimistic | 20% | | |
| Base case | 60% | | |
| Pessimistic | 20% | | |

---

## Alternatives Comparison

| Option | Investment | Expected Benefit | ROI | Recommendation |
|--------|-----------|-----------------|-----|---------------|
| This program | | | | |
| Do nothing | $0 | [Cost of inaction] | | |
| Lightweight alternative | | | | |

---

## Investment Decision

**Recommendation:** Proceed / Pause / Descope / Kill
**Rationale:** [2–3 sentence explanation]
**Conditions:** [What must be true for this to be worth it]
```

---

## Design Principles Applied
- Delivery First: Ties program to measurable business outcomes
- Risk Visibility: Risk-adjusted scenarios make uncertainty explicit
