# Subsets II — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Backtracking with Duplicate Skipping — `1_backtracking.kt`

Sort the numbers first so equal values sit next to each other. Then build subsets
depth-first: each call records the current path, and then tries adding each later
element in turn. The duplicate rule lives in the loop: if an element equals the one
just before it, skip it. The earlier copy has already opened that branch, so
starting another branch with the same value would only recreate subsets that exist
already. Deeper levels still reuse repeated values, which is why `[2, 2]` is found.

- Time: O(n · 2ⁿ), since there are up to 2ⁿ subsets and each one is copied in O(n)
- Space: O(n) for the path and recursion, not counting the output

## 2. Group Counts — `2_group_counts.kt`

Count how many times each distinct value appears, then go through the values in
sorted order. A subset is fully described by how many copies of each value it takes,
anywhere from 0 up to that value's count. Start with `[[]]`, and for each value
extend every subset found so far with 0, 1, … count copies. Each choice of counts
gives a different multiset, so duplicates never appear and no check is needed.

- Time: O(n · 2ⁿ)
- Space: O(n · 2ⁿ) for the output

## 3. Bitmask Brute Force with a Set — `3_bitmask_bruteforce.kt`

Every subset corresponds to a number from 0 to 2ⁿ − 1 whose bits say which elements
to include. Build each candidate, sort it so that `[1, 2]` and `[2, 1]` look the
same, and keep it only if the set has not seen it. It is correct, but it builds and
hashes every candidate, duplicates included, and does an extra sort for each one.

- Time: O(n · 2ⁿ · log n)
- Space: O(n · 2ⁿ) for the set of seen subsets and the output
