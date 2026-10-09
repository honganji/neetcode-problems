# K Closest Points to Origin — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Quickselect — `1_quickselect.kt`

Sorting everything is more work than we need, since we only want the k closest. Quickselect uses a random pivot point to split the list into "closer than the pivot" and "not closer". The pivot then lands in its final place. If it lands at index k, everything before it is one of the k closest. Otherwise we repeat on just the side that contains index k. Each round throws away about half the remaining points, so the total work is linear on average.

- Time: O(n) on average, O(n²) worst case (only with very unlucky pivots; random pivots make this rare)
- Space: O(1) extra, since the points are rearranged in place (this modifies the input array)

## 2. Max-Heap of Size k — `2_heap.kt`

Keep a heap of the k closest points seen so far, with the farthest one at the head. Add each point. If the heap now holds more than k points, poll the head, which is the farthest. At the end the heap holds exactly the k closest. Because the heap never grows past k, each operation costs only log k.

Uses `java.util.PriorityQueue`, which is a min-heap, so the comparator is reversed to put the largest distance first.

- Time: O(n log k)
- Space: O(k) for the heap

## 3. Sort by Distance — `3_sort.kt`

The most direct approach: sort all points by distance and take the first k. It is short and easy to trust, but it puts every point in order even though we only need k. Squared distance (x² + y²) orders points the same way as real distance, so we skip the square root.

- Time: O(n log n)
- Space: O(n) for the sorted list
