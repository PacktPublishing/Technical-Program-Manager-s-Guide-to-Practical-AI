---
name: tpm-programclosure
description: "Use when you need to generate a systematic program closure checklist — covering handoffs, documentation, KPIs, sign-offs, and team transition."
---
# /tpm-programclosure — Program Closure Checklist Generator

**Lifecycle Stage:** Program Closure
**Job-to-be-Done:** Generate a systematic program closure checklist — covering handoffs, documentation, KPIs, sign-offs, and team transition

---

## Instructions

Read `domain-context.md` and `personal-context.md` before starting.

---

## Interaction Flow

**Step 1 — Intake**

1. Program name and end date
2. Teams and people involved
3. Systems or services being handed off
4. Any outstanding items or loose ends
5. What happens to the team after closure (disperses / moves to new program / ongoing ops)

**Step 2 — Generate**

---

## Output Format

```markdown
# Program Closure Checklist: [Program Name]

**Program end date:** [Date]
**TPM:** [Name]
**Closure owner:** [Name]
**Status:** In progress / Complete

---

## 1. Delivery Verification

- [ ] All program objectives achieved (or documented as intentionally descoped)
- [ ] All epics/stories closed in Jira (or moved to backlog with rationale)
- [ ] Final milestone completed and signed off
- [ ] Success metrics measured and documented
- [ ] Scope delta from original charter documented

---

## 2. Technical Handoff

- [ ] Runbooks published and reviewed with on-call team
- [ ] System documentation updated in Confluence
- [ ] Architecture decisions recorded (ADRs up to date)
- [ ] Monitoring and alerting confirmed active
- [ ] SLOs set and baselined in DataDog
- [ ] Known tech debt documented in Jira backlog
- [ ] Code repositories archived or ownership transferred

---

## 3. Operational Handoff

- [ ] On-call rotation updated
- [ ] Support team briefed on new features / changes
- [ ] Customer Success enablement completed
- [ ] External documentation published
- [ ] Ownership of recurring tasks assigned

---

## 4. Stakeholder Sign-Off

- [ ] Executive sponsor: ☐ Signed off — [Name] — [Date]
- [ ] Engineering lead: ☐ Signed off — [Name] — [Date]
- [ ] Product lead: ☐ Signed off — [Name] — [Date]
- [ ] Security: ☐ Signed off (if required)

---

## 5. Program Documentation

- [ ] Program Charter archived with final status
- [ ] Decision records finalized
- [ ] Risk register closed with final statuses
- [ ] Lessons learned documented
- [ ] Program retrospective completed

---

## 6. Team Transition

- [ ] Team members notified of next assignments
- [ ] Knowledge transfer sessions completed
- [ ] Access and permissions reviewed (remove where no longer needed)
- [ ] Program communication channels archived or transitioned

---

## 7. Financial Closure

- [ ] Budget reconciliation completed
- [ ] Any open POs or contracts closed
- [ ] Final spend vs budget documented

---

## Outstanding Items

| Item | Owner | Due Date | Blocker? |
|------|-------|---------|---------|
| | | | |

---

## Closure Sign-Off

**All items above complete:** ☐ Yes / ☐ No (see outstanding items)
**Program officially closed:** [Date]
**Signed by:** [TPM name]
```

---

## Design Principles Applied
- Delivery First: Closure checklist ensures nothing falls through the cracks
- Cross-Team Alignment: Handoffs to on-call, CS, and support teams explicit
- Risk Visibility: Outstanding items tracked until closure is confirmed
