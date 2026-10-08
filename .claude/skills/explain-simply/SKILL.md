---
name: explain-simply
description: Use when the user explicitly asks for a simplified, beginner-friendly, or "explain like I'm five" explanation of code — e.g. "explain this simply", "explain like I'm five", "break this down for a beginner", "もっと簡単に説明して". Produces a clear, high-school-level walkthrough of how the code works, written in English, using plain language and real programming vocabulary (loop, array, function, Big-O, etc.) rather than baby talk, and closes with one general software-development tip unrelated to the specific problem. Only trigger on an explicit request for this style; a plain "explain this code" without that signal should get a normal technical explanation instead.
---

# Explain Simply

## Overview

Turn a piece of code into an explanation a high-school student learning to
program could follow comfortably on their own — someone who's taken an intro
programming class or two, understands basic concepts like loops, arrays, and
functions, but hasn't yet built strong intuition for data structures, Big-O
thinking, or "why would anyone write it this way." Unlike explaining to a much
younger child, it's fine — good, even — to use real programming vocabulary
directly. The job isn't to hide technical words, it's to make sure none of
them go unexplained.

**Always output in English**, regardless of what language the user's request
was written in. This reader works in an English-language dev environment, so
the explanation should too.

This is a chat-only explanation — nothing gets saved to a file. If the user is
working inside this repo's problem folders and separately asks for a detailed
technical explanation (line-by-line, complexity analysis, "why does this
work") for later reference, that's the `generate-answer` skill's job instead,
which does save to that problem's `learning/` folder.

## Core idea: concept first, jargon welcome, metaphor as backup

1. **Name the core concept or technique the code relies on** (e.g. "a Set
   gives constant-time membership checks", "sorting turns a search problem
   into a neighbor-comparison problem"). State it plainly using the real
   term, then immediately explain what that term means in a sentence a
   learner could reuse correctly themselves.
2. **Reach for a metaphor only where it genuinely clarifies something
   non-obvious** — not as mandatory decoration for every line. A
   high-schooler doesn't need "a loop is like walking down a hallway" spelled
   out; they do benefit from a metaphor for a genuinely tricky idea, like why
   checking-and-inserting as one atomic step saves work.
3. **Walk through the code**, explaining what each meaningful chunk does and
   *why* it's written that way — not a line-by-line restatement of syntax.
4. **Call out the efficiency story (Big-O) in plain terms** when it's
   relevant. This is usually the actual "aha" moment for this kind of code —
   explain it directly, don't dodge it because it sounds technical.

## Language and tone

- Output in English, always — even when the request itself was phrased in
  another language.
- Use terms like "array", "loop", "hash set", "O(n)", "boolean" directly —
  just define any term the first time it shows up, in one clear clause,
  rather than assuming it's already known.
- Keep sentences direct and confident, like a good TA explaining things in
  office hours — not corporate, and not childish.
- Still avoid stacking undefined jargon on top of other undefined jargon —
  each new term should land on ground the reader already has.

## Output template

```
## What this code is doing

<1-3 sentences: the core idea/technique, stated plainly>

## Walking through it

<The code explained section by section — what each part does and why,
not just a restatement of syntax>

## Why it matters

<Optional — the efficiency/trade-off story in plain terms, when relevant>

## One thing worth remembering

<One general software-development tip or habit that is NOT specific to
solving this particular problem — e.g. a debugging habit, a naming
convention, a "when to actually reach for this data structure in a real
project" heuristic, or a common pitfall with this pattern. Something the
reader could carry into their next, unrelated project.>
```

## Common mistakes

- Dumbing down past the point of usefulness — a high-schooler doesn't need
  every syntax token re-explained; focus on the ideas, not a character-by-
  character narration of the code.
- Skipping the efficiency/Big-O explanation because it feels "too
  technical" — it's usually the single most important idea here, so explain
  it plainly instead of avoiding it.
- Forgetting the closing "One thing worth remembering" tip, or making it
  about this specific problem instead of something transferable.
- Answering in the user's input language instead of English.
- Saving the explanation to a file — this skill is chat-only.
