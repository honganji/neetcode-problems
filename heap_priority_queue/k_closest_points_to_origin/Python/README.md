# K Closest Points to Origin — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Quickselect — `1_quickselect.py`

Sorting everything is more work than we need, since we only want the k closest. Quickselect uses a random pivot point to split the list into "closer than the pivot" and "not closer". The pivot then lands in its final place. If it lands at index k, everything before it is one of the k closest. Otherwise we repeat on just the side that contains index k. Each round throws away about half the remaining points, so the total work is linear on average.

- Time: O(n) on average, O(n²) worst case (only with very unlucky pivots; random pivots make this rare)
- Space: O(1) extra, since the points are rearranged in place (this modifies the input list)

## 2. Max-Heap of Size k — `2_heap.py`

Keep a heap of the k closest points seen so far, with the farthest one on top. Add each point. If the heap now holds more than k points, pop the top, which is the farthest. At the end the heap holds exactly the k closest. Because the heap never grows past k, each operation costs only log k.

Python's `heapq` is a min-heap, so we store negative distances to get max-heap behavior.

- Time: O(n log k)
- Space: O(k) for the heap

## 3. Sort by Distance — `3_sort.py`

The most direct approach: sort all points by distance and take the first k. It is short and easy to trust, but it puts every point in order even though we only need k. Squared distance (x² + y²) orders points the same way as real distance, so we skip the square root.

- Time: O(n log n)
- Space: O(n) for the new sorted list
