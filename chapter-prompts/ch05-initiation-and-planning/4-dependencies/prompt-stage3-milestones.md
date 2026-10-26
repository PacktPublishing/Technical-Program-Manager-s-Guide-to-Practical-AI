# 4c · From map to milestones: back-scheduling (stage 3)

**Book:** Chapter 5, *Technical Dependency and Architecture Synthesizing* → *From map to milestones*
**Paste underneath:** the validated map ([output.md](output.md) plus [architecture-review-notes.md](architecture-review-notes.md)), the charter ([../1-charter/output.md](../1-charter/output.md)) and the assumption log ([../3-assumptions/output.md](../3-assumptions/output.md))
**Run it:** in the same conversation as stage 2, or in a fresh one with the files above pasted underneath.

## The prompt

```
Using the validated map, the charter, and the assumption log, back-schedule to 30 September. List 6-8 milestones with: depends on, duration and the artifact row it came from, latest finish, and gate owner. Then give the critical path and the float in weeks. Where two durations conflict, plan on the longer and show both. Do not shorten anything to make the date fit.
```

## The validation step

Take each gate to its owner with one question: can you commit to this date? The answers turn the
skeleton into the first draft of the program's schedule, and the pre-mortem (use case 5) reads it
alongside the map.

Check the durations yourself before you trust the float. Every duration must trace to a row in one
of the artifacts. In the book's run, the scope document promises a two-week contract review, but the
2024 review actually took eleven weeks, and that one row decides the float. Look for the same kind of
row in your output.

Recorded run: [output-milestones.md](output-milestones.md).

> **Why the recorded run differs from the book.** The book's worked example follows the short critical
> path (contract review, then dual run, then cutover) and shows the float dropping from ten weeks to one
> once the real eleven-week review is used. The recorded run read every duration in the artifacts,
> including the Q2 planning cycle that sequencing waits on, applied "plan on the longer" to all of them,
> and came back with negative float. Both reach the same conclusion: the date does not fit the plan as
> written, and that is the first steering committee conversation.
