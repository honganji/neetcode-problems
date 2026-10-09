# K Closest Points to Origin — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Quickselect — `1_quickselect.dart`

Sorting everything is more work than we need, since we only want the k closest. Quickselect uses a random pivot point to split the list into "closer than the pivot" and "not closer". The pivot then lands in its final place. If it lands at index k, everything before it is one of the k closest. Otherwise we repeat on just the side that contains index k. Each round throws away about half the remaining points, so the total work is linear on average.

- Time: O(n) on average, O(n²) worst case (only with very unlucky pivots; random pivots make this rare)
- Space: O(1) extra, since the points are rearranged in place (this modifies the input list)

## 2. Max-Heap of Size k — `2_heap.dart`

Keep a heap of the k closest points seen so far, with the farthest one at the top. For each point: if the heap has room, add it. Otherwise, if the new point is closer than the top, replace the top and fix the heap. At the end the heap holds exactly the k closest. Each operation costs only log k because the heap never grows past k.

Dart's standard library has no heap, so this file implements a small one by hand.

- Time: O(n log k)
- Space: O(k) for the heap

## 3. Sort by Distance — `3_sort.dart`

The most direct approach: sort all points by distance and take the first k. It is short and easy to trust, but it puts every point in order even though we only need k. Squared distance (x² + y²) orders points the same way as real distance, so we skip the square root.

- Time: O(n log n)
- Space: O(log n) for the sort's internal bookkeeping (the list is sorted in place)
