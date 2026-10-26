# NovaGrid — Stakeholder Personas

*Read by `/tpm-stakeholder-update`. Structure from `templates/persona.md` (Book Chapter 6).*
*Replace this file with your own stakeholders. Names and roles below match `3-memory-knowledge/layer1-always/org-chart.md`.*

---

## Engineering Teams

### What They Care About
- Root cause and what changed
- Technical tradeoffs and dependencies on other teams
- Blockers, with who owns each one
- Whether their sprint plan still holds

### Preferred Update Style
- Bullet points, direct language
- Owners and dates on every action
- No executive framing and no business narrative
- Lead with the problem

### Common Questions
- What broke, and what changed since last week?
- Who owns the fix, and by when?
- Which of our tickets are blocked by another team?
- Does this move a milestone?

### Example Prompt Instructions
When generating updates for Engineering:
- Lead with the problem or the change.
- Include the technical detail and the dependency chain.
- End with an action table: action, owner, due date.

---

## Executive Sponsor — Yuki Tanaka, VP Engineering

### What They Care About
- Status and the one thing that changed
- Whether a decision or escalation is needed from them
- Cross-division impact

### Preferred Update Style
- One page, two-minute read
- Headline first, then what changed, then the ask
- One explicit ask per update, or "no action required"

### Common Questions
- What do you need from me, and by when?
- What happens if I do nothing?
- Which other programs does this touch?

### Example Prompt Instructions
When generating updates for the executive sponsor:
- Put the ask in the first three lines.
- Give the cost of not deciding.
- Yuki is slow to say no: when the ask is to stop or cut something, state it as a direct choice between two options.

---

## Finance — Marcus Bauer, CFO

### What They Care About
- Cost and COGS impact, in dollars
- Dual-run and overrun costs, and when they stop
- Anything that moves a cost OKR

### Preferred Update Style
- Numbers first, with the date each number was taken
- Monthly cadence for program costs; weekly only when COGS moves

### Common Questions
- What does this cost per month, and until when?
- Is this inside the approved ceiling?

### Example Prompt Instructions
When generating updates for Finance:
- Lead with the cost figure and its trend.
- Name the date a cost stops, or say that no date exists yet.

---

## CTO — David Okonkwo

### What They Care About
- Architectural consequences and technical risk
- Decisions that set precedent across programs

### Preferred Update Style
- Written and asynchronous; reads carefully, so completeness beats brevity
- Link the decision record rather than summarising it

### Common Questions
- Which decision record covers this?
- What did we trade away?

### Example Prompt Instructions
When generating updates for the CTO:
- Reference decision records by ID.
- State the tradeoff explicitly.

---

## Customer Success Team

### What They Care About
- Which customers are affected, and how
- What they can tell customers today, and when they will know more
- SLA and contract exposure

### Preferred Update Style
- Customer-impact language, no internal system names
- A short "what to say" paragraph they can reuse

### Common Questions
- Which accounts are affected?
- Is there an SLA or credit exposure?
- When is the next update?

### Example Prompt Instructions
When generating updates for Customer Success:
- Lead with customer impact.
- Use the same impact numbers as the executive version.
- Never state "no customer impact" unless the data shows none.

---

## Special cases

### Program goes Red
- Order: executive sponsor first, then engineering, then Customer Success, within the same hour.
- Every version carries the same impact numbers and the same date for the next update.
- The executive version contains the decision needed; the Customer Success version contains what to say to customers.

### Date slip or scope change
- State the old date and the new date side by side.
- Name the decision record, or say that the decision is still open.
