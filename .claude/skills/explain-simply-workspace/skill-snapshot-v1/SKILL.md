---
name: explain-simply
description: Use when the user explicitly asks for a super-simple, beginner-friendly, or "explain like I'm five" explanation of code — e.g. "やさしく説明して", "小学生にもわかるように説明して", "もっと簡単に", "explain like I'm five", "kid向けに". Produces a plain-language walkthrough built on everyday metaphors instead of technical jargon. Only trigger on an explicit request for this style; a plain "explain this code" without that signal should get a normal technical explanation instead.
---

# Explain Simply

## Overview

Turn a piece of code into a story a child could follow. The reader has no CS
vocabulary — words like "hash set", "iteration", "time complexity", or "index"
mean nothing to them unless you first hand them an everyday picture to hang the
idea on. Every technical concept in the code needs a metaphor before it needs a
name.

This is a chat-only explanation — nothing gets saved to a file. If the user is
working inside this repo's problem folders and later asks for a *detailed*
technical explanation (line-by-line, complexity analysis, "why does this
work"), that is the `generate-answer` skill's job instead, and that one does
get saved to `learning/`.

## Core idea: metaphor first, code second

Don't translate the code line-by-line into simpler words — that just produces
jargon with extra steps. Instead:

1. **Find the real-world situation the code is secretly doing.** A hash set
   checking for duplicates is a kid checking "have I already seen this sticker
   in my binder?" A sliding window is a camera that only shows a few seconds
   of video at a time. A recursive function is a set of Russian nesting dolls.
   Pick something the reader has actually touched or seen — toys, candy,
   lunch lines, board games, backpacks — not something abstract.
2. **Tell the metaphor as a tiny story first, with no code at all.** Get the
   reader nodding along to the real-world version before any code appears.
3. **Walk through the code mapping each piece back to the story.** "This line
   is the part where you check your binder" — now the code line follows
   naturally from a picture they already have.
4. **Name the technical term last, and only if useful**, tying it to the
   metaphor rather than defining it coldly: "Grown-up programmers call your
   sticker binder a *hash set* — it's just a way to remember what you've
   already seen super fast."

## Language rules

- Short sentences. One idea per sentence.
- No jargon without a metaphor attached first: "array", "loop", "boolean",
  "time complexity", "O(n)" all need a plain-language stand-in before (or
  instead of) the technical word.
- Second person and playful tone are fine ("imagine you..."), but don't
  patronize — the goal is clarity, not baby talk.
- If the code has a clever trick (e.g. doing a check and an insert in one
  step), call it out as "the clever bit" and explain *why* it saves work, in
  metaphor terms (e.g. "instead of looking in the binder and then separately
  adding the sticker, you do both in one move").
- Keep it to a few short paragraphs or a few bullet steps — this should read
  fast, not become an essay.

## Output template

```
## The big idea

<One tiny real-world story, no code, 2-4 sentences>

## How the code does that

<Walk through the code, mapping each part back to the story. Can be a short
numbered list or a few sentences per chunk of code.>

## Why it's clever (optional)

<Only if there's a non-obvious trick worth calling out, explained via the
same metaphor>
```

## Common mistakes

- Defining a technical term and *then* giving an analogy — do it in the
  opposite order, metaphor first.
- Reusing a generic/overused metaphor (e.g. "a box" for everything) instead of
  one that actually matches the shape of the problem.
- Still using words like "iterate", "boolean", "hash" without ever cashing
  them out into the metaphor.
- Triggering this style unprompted — only use it when the user asks for the
  simple/beginner/kid-friendly version specifically; otherwise give a normal
  explanation.
- Saving the explanation to a file — this skill is chat-only.
