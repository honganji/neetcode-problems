---
name: generate-answer
description: Use when the user asks to generate, create, or write up solutions/answers for a LeetCode problem in this repo — e.g. "generate answers for two-sum", "create solutions for contains-duplicate". Also use when the user asks for a deeper explanation of a problem's code or concepts (e.g. "explain this line by line", "why does this work") so the explanation gets saved to that problem's learning/ folder. Requires an existing problem folder.
---

# Generate Answer

## Overview

Given a LeetCode problem name, this skill produces the top 3 most efficient solutions
for that problem, one set per language, laid out as:

```
PROBLEM_NAME/
  README.md          # brief problem restatement + LeetCode URL, links to each language
  Dart/
    1_<technique>.dart   # most efficient
    2_<technique>.dart
    3_<technique>.dart   # least efficient
    README.md         # all 3 explanations + complexity, best-to-worst
  Python/
    1_<technique>.py
    2_<technique>.py
    3_<technique>.py
    README.md
  learning/
    <topic-slug>.md   # detailed explanations given about this problem, on request
```

The numeric prefix is the efficiency rank (1 = best). Each language folder's
`README.md` holds every solution's explanation for that language — there are no
separate per-solution `.md` files.

## Inputs Required

- **Problem name** — used to locate the existing folder (e.g. "contains duplicate" →
  `arrays_and_hashing/contains_duplicate/`).
- **LeetCode URL** — the canonical problem statement source. If the user didn't give
  one, ask for it. Don't guess the URL slug — get it from the user.

## Languages

- **Default: Dart and Python.** Generate both unless told otherwise.
- If the user names a specific language in their request, **add** it to the default
  set rather than replacing it — e.g. asking for "also do it in Go" produces Dart,
  Python, and Go, not Go alone. Only skip a default language if the user explicitly
  says to exclude it.
- If a language subfolder already exists for this problem, keep generating for it
  even on later runs (it's now part of that problem's set).

## Learning Notes

Whenever a detailed explanation is given about something in a problem's context —
a line-by-line code walkthrough, "why does this work", a language/concept question
that came up while looking at that problem's files — save it to that problem's
`learning/` folder in addition to answering in chat. This happens automatically;
the user shouldn't have to ask for it to be saved.

- **Filename**: a short kebab-case slug describing the topic, e.g.
  `hashset-line-by-line.md`, `python-colon-usage.md`.
- **Content**: the explanation as given in chat, lightly cleaned up for standalone
  reading later (a one-line `#` heading naming the topic, then the explanation).
  No need to reference "the user asked" or this conversation.
- If a very similar topic was already saved for this problem, update that file
  instead of creating a duplicate.
- This applies whenever a deeper explanation comes up while working within a
  problem's folder — not only during the generate/create workflow below.

## Workflow

1. **Locate the folder.** Search the repo for a directory matching the slugified
   problem name (e.g. `contains-duplicate` → `contains_duplicate`). If no matching
   folder exists, stop and tell the user to create it first — don't create it
   yourself, since its placement under a category (arrays_and_hashing, two_pointers,
   etc.) follows the roadmap order in the root [README.md](../../../README.md) and is
   the user's call.

2. **Read the problem.** Fetch the statement from the given LeetCode URL (constraints,
   examples, edge cases).

3. **Read the user's existing answer, if any.** Look inside the problem folder for
   prior work — either a language subfolder from this skill, or a leftover flat file
   from before this folder structure existed. For each one found:
   - Note the **language** (from the subfolder name or file extension) and add it to
     the language set for this run.
   - If it contains real implemented logic, note its approach so the generated
     solutions add genuinely different techniques rather than trivial variations of
     it — the approach itself may still end up as one of the top 3, just rewritten
     into the new structure.
   - If it's an empty skeleton with no real logic, ignore it — don't carry it into
     the new structure.
   - A pre-existing flat file (not inside a language subfolder) is legacy layout:
     migrate this problem folder to the current structure as part of this run.

4. **Think through approaches.** Enumerate the plausible algorithmic approaches for
   this problem (brute force, hashing, sorting, two pointers, bit tricks, etc. —
   whatever applies), and reason about the time/space complexity of each. Use
   research (WebSearch) to check you're not missing a known better approach, but
   verify correctness yourself rather than copying an approach you can't justify.
   These approaches are language-agnostic — pick them once, then implement each in
   every target language.

5. **Pick the top 3** distinct approaches by efficiency (best time complexity first,
   space as tiebreaker). Skip approaches that are cosmetically different but
   algorithmically identical to each other.

6. **For each language**, write each solution as its own file in that language's
   subfolder, named `<rank>_<technique>.<ext>` (e.g. `1_hashset.dart`,
   `2_sorting.dart`, `3_bruteforce.dart`), matching that language's idioms and
   conventions.

7. **Write each language's `README.md`** as a single file containing every
   solution's explanation for that language, ordered best-to-worst, marking the
   top one with ⭐ — see template below.

8. **Write the problem's top-level `README.md`** with a brief plain-language
   restatement, the LeetCode URL, and links to each language's `README.md` — see
   template below.

## Language README Template (`<Language>/README.md`)

```markdown
# <Problem Name> — <Language>

Solutions ordered from most to least efficient.

## 1. ⭐ <Technique name> — `1_<technique>.<ext>`

<brief, simple explanation of the core idea — a few sentences, no jargon, explaining
*why* the technique works for this problem, not just what the code does line-by-line>

- Time: O(...)
- Space: O(...)

## 2. <Technique name> — `2_<technique>.<ext>`

...

## 3. <Technique name> — `3_<technique>.<ext>`

...
```

## Top-Level README Template

```markdown
# <Problem Name>

[LeetCode](<url>)

<one-sentence problem restatement in plain language>

## Languages

- [Dart](Dart/README.md)
- [Python](Python/README.md)
```

## Common Mistakes

- Guessing the LeetCode URL slug instead of asking — leads to fetching the wrong
  problem.
- Regenerating an approach that's just a stylistic variant of an existing solution
  or of another approach already picked — the point is 3 genuinely different
  techniques.
- Writing dense/academic explanations — keep them short and simple, as if explaining
  to someone learning the pattern for the first time.
- Replacing the user's requested language instead of adding to the Dart+Python
  default.
- Leaving a problem folder in the old flat-file layout instead of migrating it when
  touched.
- Answering a detailed explanation request in chat only and forgetting to save it
  to that problem's `learning/` folder.
