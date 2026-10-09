# Insert Interval — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Linear scan (three phases) — `1_linear_scan.py`

The intervals are already sorted, so walk through them once. First copy the intervals that end before the new one starts. Then merge every interval that overlaps the new one by growing the new interval's start and end to cover them. Finally copy the rest. The output stays sorted because the input was sorted, and each interval is visited once.

- Time: O(n)
- Space: O(n) for the output list

## 2. Binary search for the overlap range — `2_binary_search.py`

The intervals that overlap the new one are always next to each other in the sorted list. Two binary searches find the edges of that block: the first interval that ends at or after the new start, and the first interval that starts after the new end. Merge that block into one interval and splice it in. The searches take O(log n) steps, but building the new list copies up to n intervals, so the total time is still O(n).

- Time: O(n) (O(log n) comparisons, plus an O(n) copy)
- Space: O(n) for the new list

## 3. Sort and merge — `3_sort_merge.py`

Add the new interval to the end, sort everything by start time, then merge neighbours that overlap, the same way as the Merge Intervals problem. It is simple to write and easy to trust. However, it ignores that the input is already sorted, so it does more work than needed.

- Time: O(n log n)
- Space: O(n) for the combined and output lists
