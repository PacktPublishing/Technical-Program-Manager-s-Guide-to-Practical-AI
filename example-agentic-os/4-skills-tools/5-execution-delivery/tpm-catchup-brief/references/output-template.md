# Catch-Up Brief - Output Template

The output is the product. Emit exactly this shape as Markdown. Every item in the top three buckets
is a checkbox with a verb-first action, a deadline, an owner, and a source link, so the user can work
the list top to bottom without opening anything else first.

## The template

```markdown
# Catch-Up Brief - {name}, back after {N} days (changes since {anchor date})
**{X} need you today · {Y} to ratify · {Z} slipped · {rest} safe to skim** · coverage: {sources read}

## ⚡ ACT NOW - {count}   (do these today, in order)
- [ ] {verb} {what} - {why it can't wait / deadline} · by {when}
      ↳ {source link} {source link}
- [ ] {verb} {what} - {why it can't wait / deadline} · by {when}
      ↳ {source link}

## 🔁 RATIFY OR REVERSE - {count}   (a call was made without you)
- [ ] Confirm or push back: {decision} - decided {date} by {who}, because {reason}
      ↳ {source link}

## 🔥 NOW AT RISK - {count}   (regressed while you were out)
- [ ] {program / milestone / service}: {was} -> {now} - {the one next step} · owner {who}
      ↳ {source link}

## ➡️ MOVED WITHOUT YOU - {count}   (skim, no action)
- {one line of what progressed} ↳ {source link}

## ✅ SAFE TO IGNORE - {count}   (resolved / superseded / noise)
- {one line} (resolved {date})

---
_Blind spots: this brief only sees the connected sources ({sources read}). Hallway decisions,
anything a lead is quietly sitting on, and political shifts written down nowhere are not here.
It tells you what changed in the systems, not what it means. That read is yours._
```

## Rules

- **Order buckets by demand on the user**, most urgent first, exactly as above. Never sort by recency or by source.
- **Top three buckets are checkboxes**; the bottom two are plain bullets (they need no action).
- **Every "Act now" line needs a verb, a deadline, and a source link.** If you cannot name the action or the deadline, it is not "Act now" - move it down.
- **One screen where possible.** Overflow goes into "Moved without you" and "Safe to ignore", collapsed to one line each.
- **Headline is a count, not prose:** "3 need you today · 1 to ratify · 2 slipped · 214 safe to skim".
- **Always end with the blind-spots line.** The brief reports what changed in the systems, not what it means.
- **Persona shifts contents, not shape.** See [personas.md](personas.md). An SWE brief has the same five buckets, filled with PRs, builds, and incidents instead of escalations and decisions.
- **Mark handoff-sourced items.** If a `handoff log` (an OOO/cover channel or "while you were out" doc) was read, tag items that came from it with `🤝 flagged by {cover}` so the user knows a human raised it, not just a system. These items are the highest-signal input - rank them accordingly.
