# Merge Intervals — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Sort and Merge — `1_sort_and_merge.py`

Sort the intervals by their start. Once sorted, any interval that overlaps the previous one must sit right next to it, so one pass is enough. Keep the last merged interval. If the next interval starts at or before its end, the two touch or overlap, so extend the end with `max`. Otherwise, start a new merged interval.

- Time: O(n log n), dominated by the sort
- Space: O(n) for the output

## 2. Difference Array (Coordinate Sweep) — `2_difference_array.py`

Skip comparing intervals and mark coverage on a number line instead. Each interval adds `+1` where it starts and `-1` just after it ends. A running total then says how many intervals cover each spot. Every stretch with a total above 0 is one merged interval. Coordinates are doubled so that touching intervals like `[1, 4]` and `[4, 5]` join, while `[1, 4]` and `[5, 6]` stay apart. Assumes non-negative integer coordinates.

- Time: O(n + C), where C is the largest end value (at most 10⁴ under LeetCode's constraints)
- Space: O(C) for the difference array

## 3. Pairwise Merge (Brute Force) — `3_pairwise_merge.py`

Repeatedly search for any two intervals that overlap, replace them with their union, and search again. When no overlapping pair is left, sort the result by start. Each merge removes one interval, so there are at most n − 1 merges, and each search checks all pairs.

- Time: O(n³) in the worst case
- Space: O(n) for the working copy
