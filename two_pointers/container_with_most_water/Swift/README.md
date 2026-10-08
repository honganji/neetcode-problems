# Container With Most Water — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Two Pointers — `1_two_pointers.swift`

Start with one pointer at each end of the array, so the container is as wide
as it can possibly be. Its area is limited by the shorter of the two lines.
Moving the taller line inward can never help: the width shrinks and the height
is still capped by the same shorter line. Moving the shorter line inward is the
only move that might find something taller, so always do that. Every pointer
step rules out a whole family of worse containers, and the best area seen along
the way is the answer.

- Time: O(n)
- Space: O(1)

## 2. Two Pointers with Skipping — `2_two_pointers_skip.swift`

Same idea as above, with one extra pruning step. After measuring a container,
any line that is no taller than its shorter side can't produce a bigger area
from a narrower position, so skip past all of them at once on both sides
instead of recomputing an area for each. On arrays with runs of short lines
this does noticeably fewer area calculations, but each pointer still only ever
moves inward, so the worst case is the same as the plain version.

- Time: O(n)
- Space: O(1)

## 3. Brute Force — `3_bruteforce.swift`

Try every pair of lines. For each line, measure the container it forms with
every line after it — the shorter height times the distance between them — and
keep the largest. Only looking forward means no pair is measured twice.

- Time: O(n²)
- Space: O(1)
