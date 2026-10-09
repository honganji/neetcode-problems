# Subsets — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative Cascade — `1_cascade.kt`

Start with just the empty subset. For each number, take every subset you already
have and make a copy with that number appended; add the copies to the list. Each
number doubles the count, so after all numbers you have every combination. No
recursion is needed because the list itself carries the work from one step to the next.

- Time: O(n · 2^n)
- Space: O(n · 2^n) for the output

## 2. Backtracking — `2_backtracking.kt`

Think of the subsets as a tree of choices. From the current path, record it as a
subset, then try adding each later number in turn, recurse, and remove it again
(undo the choice). Starting each loop at `start` means every subset is built in
increasing index order, so no subset is produced twice.

- Time: O(n · 2^n), since each subset is copied once and has at most n elements
- Space: O(n) recursion depth and current path, plus the O(n · 2^n) output

## 3. Bitmask Enumeration — `3_bitmask.kt`

Every subset corresponds to a yes/no pattern over the n numbers, and that pattern
is just a binary number from 0 to 2^n − 1. Loop over all of them, and for each
number check whether its bit is set. It is the most direct mapping from "choose or
skip each element" to code, but it always checks all n bits for every mask, so it
does a little more work than the other two.

- Time: O(n · 2^n), with n bit checks for each of the 2^n masks
- Space: O(n · 2^n) for the output
