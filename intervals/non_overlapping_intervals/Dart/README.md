# Non-overlapping Intervals — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Greedy (Earliest End) — `1_greedy.dart`

Sort the intervals by their end time. Then walk through them in that order and
keep each interval that doesn't overlap the last one you kept. Finishing early
leaves the most room for what comes next, so always keeping the interval that
ends first is the best choice. Any interval that starts before the last kept
one ends is dropped and counted as a removal.

- Time: O(n log n) for the sort
- Space: O(1) extra (O(log n) for the sort's stack)

## 2. Dynamic Programming — `2_dp.dart`

Sort by end time, then for each interval ask: what's the longest set of
non-overlapping intervals that ends with this one? That's 1 plus the best answer
among earlier intervals that finish before this one starts. The biggest of these
values is the most intervals we can keep, and everything else gets removed.

- Time: O(n²)
- Space: O(n)

## 3. Brute Force (Keep or Skip) — `3_bruteforce.dart`

Sort by start time, then for each interval try both options: skip it, or keep it when it fits after the
last kept interval. Recurse through every combination and return the largest
number of kept intervals. The answer is the total count minus that.

- Time: O(2ⁿ)
- Space: O(n) for the recursion stack

