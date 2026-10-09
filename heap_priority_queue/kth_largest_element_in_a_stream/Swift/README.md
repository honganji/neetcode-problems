# Kth Largest Element in a Stream — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Min-Heap of Size k — `1_min_heap.swift`

Keep a min-heap that holds only the k largest values seen so far. Its root is the
smallest of those k values, and that root is exactly the kth largest value in the
whole stream. A new value bigger than the root pushes the root out, and a smaller
value can never be in the top k, so it is ignored. Because the heap never holds more
than k items, each step is cheap.

- Time: O(n log k) to load the initial list, then O(log k) per `add`
- Space: O(k)

## 2. Sorted Top-K List — `2_sorted_top_k.swift`

Keep a sorted list of only the k largest values. The first item in the list is the
kth largest value. To add a value, use binary search to find its position, then insert
it there and drop the smallest item. Finding the spot is fast, but inserting and removing
shift the items after it, which costs O(k). This is easier to read than a heap, but it
gets slower as k grows.

- Time: O(n log n) to sort the initial list, then O(k) per `add`
- Space: O(k)

## 3. Re-sort on Each Add — `3_sort_each_time.swift`

Store every value that has been seen. On each `add`, sort the whole list from largest
to smallest and read the item at position k. It always gives the right answer because
it looks at everything, but it repeats the full sort for every call, so it does far
more work than the other two.

- Time: O(n log n) per `add`, where n is the number of values seen so far
- Space: O(n)
