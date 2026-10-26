# Chapter 11 - AI for Career Management: every prompt

Each prompt exactly as printed in the book, in the order the chapter presents them. Placeholders in [brackets] are yours to fill.

**Three inputs make every prompt here specific to you:** a story log, a career ladder document and a career direction statement. Only you can write them. To try the prompts first, use the fictional samples in [ch11-career-management/](ch11-career-management/README.md).

> **Before you paste anything:** career material holds your compensation, your performance feedback and details about your employer. Use a plan where your inputs are not used to train models and where you control data retention. Read your employer's AI policy first. Remove customer names, unreleased product details and anything covered by an agreement. A prompt guardrail catches mistakes in the output; it does not make a risky input safe.

## Setting Up Your Foundation

### P11.1 · Interview me on a story

**Section:** Building Your Story Log · **Type:** Standalone, after your spoken brain dump  
**How:** Tell one story out loud first (voice mode or dictation), then paste this.  
**Try it with:** the rough notes in [ch11-career-management/brain-dump-sample.md](ch11-career-management/brain-dump-sample.md)

```
I just told you a story from my work as a spoken brain dump, so expect rough edges and a messy order. Interview me about it. Ask one question at a time and wait for my answer.

Ask critical questions that uncover how it really happened: what I knew at the time, what I tried first, who disagreed with me and why, where luck or other people made the difference, what went wrong, and what the outcome was in numbers or concrete consequences. Challenge vague or flattering answers. Do not suggest details or fill in gaps for me. When you think we have the full story, tell me what is still unclear.
```

### P11.2 · Turn the interview into an entry

**Section:** Building Your Story Log · **Type:** Follow-up, same conversation as P11.1  
**Template:** [ch11-career-management/story-log-template.md](ch11-career-management/story-log-template.md)

```
Organize our conversation into a story log entry with these fields: date, situation, action, result, lesson, skills and themes, and growth area.

Use only what I told you. Do not add details, results, or lessons I did not state. If a field is missing, write "missing" instead of filling it in.

Do not include customer names, internal code names, or confidential figures. If I mention any, replace them with a generic label and tell me you did.
```

Review the entry against your memory and redact anything confidential before you save it. Start with the three projects you are proudest of and the two that went wrong, about fifteen minutes per story.

### P11.3 · Test your direction statement

**Section:** Writing Your Career Direction Statement · **Type:** Standalone, attach your draft  
**Write the first draft yourself first.** Cover the roles you want in two to three years, what you want more and less of, your constraints, and what you are still unsure about.  
**Try it with:** [ch11-career-management/direction-statement-sample.md](ch11-career-management/direction-statement-sample.md)

```
Here is my career direction statement. Ask me questions that expose vague spots, assumptions I have not examined, and places where two of my goals pull against each other. Do not suggest goals of your own and do not rewrite the statement. After I answer, summarize what I clarified so I can revise it myself.
```

Revisit the statement every six months, and after any major change such as a new manager, a reorganization or a change at home.

**Career ladder document:** copy your current level and the next level into one three-column table (competency, expectation at your level, expectation at the next level), keeping the wording exactly as written. No formal ladder? Use three to five job postings for the next level up. Sample: [ch08-tpm-leadership/tests/chapter-8/fixtures/people/leveling-staff-tpm.md](ch08-tpm-leadership/tests/chapter-8/fixtures/people/leveling-staff-tpm.md).

## Resume Mastery

### P11.4 · Story log to job posting (light start)

**Section:** Resume Mastery · **Type:** Two light prompts (Task and Context only)  
**Try it with:** [ch11-career-management/job-posting-sample.md](ch11-career-management/job-posting-sample.md) and [ch11-career-management/story-log-sample.md](ch11-career-management/story-log-sample.md)

```
Here is a job posting and my story log. Which entries map best to what this role is asking for?
```

```
What is this posting screening for that my resume does not currently demonstrate at all?
```

### P11.5 · Resume editor

**Section:** Resume Mastery · **Type:** Full prompt  
**Paste with it:** Your full master resume, the target job listing, optionally your style notes  
**Try it with:** [ch11-career-management/master-resume-sample.md](ch11-career-management/master-resume-sample.md) and [ch11-career-management/job-posting-sample.md](ch11-career-management/job-posting-sample.md)  
**Expect:** Job priorities, a relevance table, the reordered resume in your own wording, a short summary, and the gaps. The gaps are usually the most useful part.

```
ROLE: You are a resume editor. Your job is to reorder, prioritize, and shortlist my existing resume content to align with a specific job listing. You never write new content, embellish, or infer achievements I have not stated.

INPUTS I WILL PROVIDE:
- My current resume, full text, including all bullets under each role
- The target job listing, including title, responsibilities, and required or preferred qualifications
- Optionally, my style notes or prior writing samples, if I want the summary tone matched

HARD CONSTRAINTS:
- Do not invent, exaggerate, or reword any bullet in a way that changes its factual meaning or implies scope, skills, or results I did not state
- Do not add metrics, tools, technologies, or outcomes that are not already present in my original resume
- You may reorder, shorten, cut, and re-prioritize existing bullets. You may not add new claims
- Preserve my existing phrasing, tone, and sentence structure. Match my voice rather than a generic resume voice
- If a bullet is only partially relevant, you may trim it to the relevant portion, but the retained words must be mine rather than paraphrased into new claims
- If you are uncertain whether something counts as adding new content, flag it instead of including it

TASKS:
- Read the job listing and extract the top five to eight priorities it is actually screening for
- Go through my resume bullet by bullet. Rate each as highly relevant, somewhat relevant, or not relevant
- Reorder bullets within each role so the most relevant appear first
- Cut or de-prioritize low relevance bullets if the resume is running long. Only cut for relevance, never because a bullet seems less flattering
- Write a concise two to three sentence professional summary built only from experience already in my resume
- Flag any gap. If the job asks for something my resume does not demonstrate, note it separately rather than papering over it with generic language

OUTPUT FORMAT:
- Job priorities identified
- Relevance mapping, as a table of bullet, rating, and action taken
- Revised resume, reordered and shortlisted, in my original wording
- Professional summary
- Gaps flagged
```

> **Warning (from the book):** check every line of output. Confirm that no accomplishment was invented and no scope was quietly inflated. Every bullet must be something you can talk through in detail when someone asks a follow-up question. If a line makes you hesitate, cut it.

## Practicing for Interviews

### P11.6 · Behavioral practice

**Section:** Practicing for Interviews · **Type:** Three prompts, best in voice mode  
**Try it with:** the sample posting and story log

```
Here is a job posting. Act as an interviewer for this role and ask me behavioral questions one at a time. Wait for my answer before moving on.
```

```
Here is my story log and this posting. Ask me questions that would let me use these stories as answers, then tell me which stories landed and which need work.
```

```
After each answer, tell me what was strong and what I should tighten. Be specific about where I lost the thread.
```

### P11.7 · Open-ended problem solving

**Section:** Practicing for Interviews · **Type:** Prompt

```
You are interviewing me for a senior TPM role at an infrastructure company. Present an open-ended, ambiguous problem in that domain. Let me ask clarifying questions. Push back when my reasoning is thin, and give me feedback on my problem solving at the end.
```

### P11.8 · Questions for the interviewers

**Section:** Practicing for Interviews · **Type:** Prompt

```
Here is the company, the role, and the background of the people I am meeting with. Suggest questions tailored to each interviewer's role that would tell me something real about team structure, current bottlenecks, and decision-making speed.
```

### P11.9 · The skeptical hiring manager (flattery-resistant practice)

**Section:** Spotting Flattery in Practice · **Type:** Full prompt  
**Why:** assistants lean toward agreement. Quoting your weakest sentence and the 1-to-5 rule make generic praise harder to produce, and give you a number to track across sessions.

```
Act as a skeptical hiring manager for this role. Ask me one behavioral question at a time and wait for my answer.

After each answer, give feedback in this order:
1. The weakest sentence in my answer, quoted exactly.
2. The follow-up question a real interviewer would ask about it.
3. One thing that worked, only if you can quote it.

Rate each answer from 1 to 5. Do not give a 4 or 5 unless you can name what a stronger answer would add. If my answer was thin, say so plainly. If I disagree with your feedback, hold your position unless I give you new evidence.
```

Test it: disagree on purpose with a point you know is correct. If it folds and apologizes, its praise deserves little weight.

> **Warning (from the book):** never use AI live during an actual interview. Practice beforehand is the entire use case. Show up as yourself.

## Offer Negotiations

### P11.10 · Preparing to negotiate an offer

**Section:** Offer Negotiations · **Type:** Three prompts

```
Here is what I know about this offer. What key facts should I confirm before I try to negotiate anything? Do not give me a salary figure or a market range.
```

```
Based on what I have described, does this look like a situation where negotiating makes sense, or one where accepting is the better move? Explain your reasoning.
```

```
Role play this negotiation with me. You play the hiring manager. Push back the way a real one would.
```

> **Warning (from the book):** validate any confident salary number from a casual conversation. For real market research, use a deep research mode, ask for the assumptions behind every figure, and weigh it against levelling databases, recruiters and people in your network.

## Skills and Career Decisions

### P11.11 · Ladder comparison

**Section:** Mapping Skills and Gaps · **Type:** Standalone, attach ladder document, story log and direction statement  
**Try it with:** [leveling-staff-tpm.md](ch08-tpm-leadership/tests/chapter-8/fixtures/people/leveling-staff-tpm.md), [story-log-sample.md](ch11-career-management/story-log-sample.md), [direction-statement-sample.md](ch11-career-management/direction-statement-sample.md)

```
Here is my company's career ladder for my current level and the next one up, my story log, and my career direction statement. Where does my logged work already match the level above? Where do gaps appear? My log may be incomplete, so phrase each gap as a question for me to confirm. What kinds of work might close the gaps that matter, given the direction I described?
```

### P11.12 · Cross-posting gaps

**Section:** Mapping Skills and Gaps · **Type:** Standalone, attach three postings, story log and direction statement

```
Here are three job postings for roles I want to grow into, plus my story log and my career direction statement. Which gaps appear across all three? Which of these gaps could I close in my current role, and which need a different kind of experience entirely? Which of them matter for the direction I described?
```

### P11.13 · Talking to your manager

**Section:** Mapping Skills and Gaps · **Type:** Follow-up, same conversation as P11.11 or P11.12

```
Using the gaps and matches you just identified, turn this into a short set of talking points or questions I can bring to my manager.
```

Use the output as a conversation starter with your manager, not a substitute for one.

### P11.14 · Widen the frame (deciding when to leave)

**Section:** Career Decisions · **Type:** Standalone. Attach your direction statement to any decision prompt.

```
I am considering leaving my current role. Ask me questions that push me past the job itself, including finances, family situation, timing, and what I would be moving toward.
```

### P11.15 · External offer deep dive

**Section:** Career Decisions · **Type:** Standalone

```
I am considering leaving my current role for an external offer. Ask me questions that push me past the title and basic salary, specifically covering equity vest schedules, refresher policies, expected working hours, cross-time-zone communication overhead, on-call expectations, family impact, and overall burnout risk.
```

### P11.16 · Organize two offers

**Section:** Career Decisions · **Type:** Standalone

```
I have two competing offers. Here is what I know about each. Help me organize it, then tell me what additional information would most change my decision.
```

### P11.17 · Culture friction

**Section:** Career Decisions · **Type:** Follow-up to P11.16, same conversation

```
Here is what I know about the culture at each company, and here is the environment I work best in. Where do you see friction?
```

### P11.18 · Apply decision frameworks

**Section:** Career Decisions · **Type:** Standalone or follow-up, with your situation described  
**Try it with:** George's case from the book, in [ch11-career-management/decision-case-george.md](ch11-career-management/decision-case-george.md)

```
Walk me through how regret minimization, value maximization, and stability weighting would each frame this decision differently. Which seems to fit my situation, and why?
```

### P11.19 · Evaluate an internal move

**Section:** Career Decisions · **Type:** Standalone

```
I am considering an internal move to [team/role]. Here is what I know about the current role and the new one. Help me think through whether this is actually a step forward, what I am not yet seeing, and what questions I should be asking to further validate this opportunity.
```

> **Warning (from the book):** an agent does not know your family, your finances or what keeps you up at night. Keep the decision yours. When offers carry very different equity or relocation terms, consider a financial advisor.

## Building Career Management Workflows

### P11.20 · Manual cadence (level 1)

**Section:** Continuous Story Capture · **Type:** Standalone. Also works as the scheduled prompt at level 2.

```
Interview me about the last two weeks. Ask what went well, what was hard, what I learned and observed, and what I would do differently. Ask one question at a time and follow up when my answer is vague. Then write a story log entry using my standard fields: date, situation, action, result, lesson, skills and themes, and growth area.
```

### P11.21 · Activity review (level 3, scheduled biweekly)

**Section:** Continuous Story Capture · **Type:** Scheduled task with connected sources  
**Needs:** connections to your calendar, chat, issue tracker and docs. Connect only the sources this task needs.

```
Review my activity from the past 14 days in these sources: [calendar], [Slack channels: names], [issue tracker project: name], [docs folder: name]. Ignore routine logistics and status noise. List three to five moments that may be worth reflecting on, with the date and source of each. For every moment, ask me one question about what happened, what I learned, or what went wrong. Do not write story log entries and do not guess at outcomes or lessons. I will answer, and then I will write the entries.

Do not include confidential program details, customer names, or unreleased product information. Replace any you find with a generic label and tell me.
```

### P11.22 · Turn answers into entries

**Section:** Continuous Story Capture · **Type:** Follow-up to P11.20 or P11.21

```
Here are my answers. Organize them into story log entries using my standard fields. Use only what I told you. If a field is missing, mark it as missing instead of filling it in.
```

### P11.23 · Periodic synthesis

**Section:** Continuous Story Capture · **Type:** Any level, every six months

```
Read my story log from the last six months. What themes keep appearing? Which entries would make the strongest resume bullets, and which are strongest as interview stories? Compare the themes with my career direction statement. Where do they line up, and where do they pull apart?
```

Keep the cadence light enough to survive a bad month: a 15-minute biweekly check-in that happens beats a weekly ritual that stops after three weeks.

### P11.24 · Find target companies

**Section:** Job Search Operations · **Type:** Standalone

```
Here is my full long-form resume and my career direction statement. Suggest fifteen companies where my background and my stated direction would both fit, and explain the reasoning for each.
```

### P11.25 · Pick the closest resume version

**Section:** Job Search Operations · **Type:** Standalone, attach your application tracker

```
Here is a posting and my application tracker. Which of my existing tailored resume versions is closest to this role, and what would need to change?
```

### P11.26 · Job monitoring (scheduled task, daily)

**Section:** Job Search Operations · **Type:** Scheduled task, fill in your criteria

```
Search for roles posted in the last 24 hours matching these criteria: [titles], [locations or remote], [employment type], [seniority], [domain]. For each result, give me the title, company, location, a two-line summary of what they are screening for, and a one-line assessment of fit against my resume. Skip anything I have already seen.
```

> **Warning (from the book):** think carefully before using tools that submit applications automatically. The efficiency worth pursuing is in finding and evaluating roles. The application itself deserves your attention. And networking is not a prompting task: use AI to remember who matters and why, then write the message yourself.
