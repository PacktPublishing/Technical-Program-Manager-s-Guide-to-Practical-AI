# 5 · Persona-swarm pre-mortem: from four lenses to one session

Run the four lens prompts separately, each in a fresh conversation, on the same corpus:

| Lens | Prompt | Stays inside |
|------|--------|--------------|
| SRE | [prompt-1-sre.md](prompt-1-sre.md) | Operational and reliability failures |
| Security engineer | [prompt-2-security.md](prompt-2-security.md) | Data handling, access, compliance, residency |
| Staff engineer | [prompt-3-staff-engineer.md](prompt-3-staff-engineer.md) | Architecture, interfaces, technical sequencing |
| Product manager | [prompt-4-product.md](prompt-4-product.md) | Scope, external commitments, customer impact |

The recorded outputs are `output-1-sre.md` to `output-4-product.md`.

## What you do next (no prompt for this part)

The chapter is explicit that the narratives are not a risk register yet. The next steps are yours:

1. **Deduplicate.** Four lenses describe the same failure in different vocabulary. Merge them.
2. **Rank by plausibility against what you know about the program.** The model cannot do this
   step: it does not know which teams are strained, or which risks your organization survives.
3. **Carry the top five into a one-hour session with the real people.** The swarm finds what is
   written down. The room finds what isn't: two directors who don't speak, a team interviewing
   elsewhere, a vendor one bad quarter from leaving. Nothing in the corpus encodes those, so the
   swarm never produces them.

**Check for lens collapse.** If two lenses return substantially the same narratives, their role
and boundary lines were too thin. Sharpen them before trusting the run.
