# Minimum Interval to Include Each Query — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Sweep + Min-Heap — `1_sweep_min_heap.dart`

Sort the queries from smallest to largest and walk through them in order. Add each interval to a heap (ordered by size) once its left end is at or before the current query. Then drop intervals from the top of the heap whose right end is already before the query, because queries only increase and those intervals can never cover a later query. The top of the heap is then the smallest interval that still covers the query.

- Time: O((n + q) log(n + q))
- Space: O(n + q)

## 2. Sort by Size + Union-Find Skip — `2_sort_by_size_dsu.dart`

Process the intervals from shortest to longest, so the first interval that covers a query is automatically the smallest one. Find the queries inside each interval by binary search on the sorted query list. Every query that gets an answer is marked as done, and a "next unanswered" pointer (union-find with path halving) lets later intervals jump straight past finished queries instead of revisiting them.

- Time: O((n + q) log(n + q))
- Space: O(n + q)

## 3. Segment Tree (Range Min Update) — `3_segment_tree.dart`

Compress the query values into positions 0..q-1. Each interval paints a contiguous range of those positions with its size, keeping the smaller value wherever paints overlap. A bottom-up segment tree makes each range paint take O(log q) time. To answer a query, walk from its leaf to the root and take the smallest value on that path, which holds every paint that covered it.

- Time: O((n + q) log q)
- Space: O(q)

The three approaches have the same time class; the order reflects typical constant factors in practice, so the ranking is a guide rather than a strict proof.
