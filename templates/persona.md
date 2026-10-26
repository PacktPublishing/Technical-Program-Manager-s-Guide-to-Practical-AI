# Template: Stakeholder Personas

Referenced by: `/tpm-stakeholder-update`
Book: Chapter 6, *Communicating with Stakeholders*

One file that says, per stakeholder group or person, what they care about and how they want
to hear it. Keep it in version control and edit it whenever you learn something new about a
stakeholder. It pays off every time one set of facts has to reach several audiences.

**How to use:** fill it in, save it as `persona.md`, and paste it with prompt P6.1 ([../chapter-prompts/ch06-execution.md](../chapter-prompts/ch06-execution.md)). A filled example: [../example-agentic-os/2-goals-policies/stakeholder-personas.md](../example-agentic-os/2-goals-policies/stakeholder-personas.md).
In the example OS, `/tpm-stakeholder-update` reads the filled version from that location.

---

## The structure

One section per stakeholder group or named person, each with the same four parts:

```markdown
## [Stakeholder group or person]

### What They Care About
- [What this audience needs to learn from every update]

### Preferred Update Style
- [Length, format, tone, what to leave out]

### Common Questions
- [What they ask after reading an update. Answer these in the update itself.]

### Example Prompt Instructions
When generating updates for [audience]:
- [Instruction 1: what to lead with]
- [Instruction 2: what to include]
- [Instruction 3: how to end]
```

End the file with a **Special cases** section for updates that need different handling:
a program going Red, a slipped date, a scope change, anything of a difficult nature.

```markdown
## Special cases

### Program goes Red
- [Who hears first, in what order, through which channel]
- [What every version must contain, e.g. the same impact numbers]
```

---

## Filled example (Chapter 6)

```markdown
## Engineering Team

### What They Care About
- Root cause
- Technical tradeoffs
- Dependencies
- Risks
- Required actions

### Preferred Update Style
- Bullet points
- Direct language
- Include owners and dates
- Avoid executive-level summaries
- Don't bury the lede

### Common Questions
- What broke?
- What changed?
- Who owns the fix?
- Does this impact launch?

### Example Prompt Instructions
When generating updates for Engineering:
- Lead with the problem.
- Include technical details.
- Call out blockers and dependencies.
- End with action items and owners.
```

---

## Starter prompt (Chapter 6)

Paste the filled persona file and the situation into any chat model:

```
I have provided two inputs:

1. `persona.md` containing communication preferences for my stakeholders.
2. The situation described below.

Read the stakeholder information from `persona.md` and create tailored communications
for the following audiences:

* Engineering Team
* Executive Sponsor
* Customer Success Team

Keep all facts consistent across versions, but adjust the level of detail, tone, and
focus based on what each audience cares about.

Situation:
[Paste incident report, scope change, meeting notes, email thread, or project update here]
```

"Keep all facts consistent across versions" is the line that matters most. A customer-facing
version must never soften a risk that the executive version states plainly.
