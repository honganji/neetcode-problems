# Kth Largest Element in an Array — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Quickselect — `1_quickselect.py`

Sorting the whole array does more work than we need, because we only want one
position. Quickselect borrows the partition step from quicksort: pick a random pivot,
move smaller values to its left and larger values to its right. Then the pivot lands
in its final sorted position. If that position is the one we want, we are done.
Otherwise we throw away the half that cannot contain it and repeat. Each round
roughly halves the work. Grouping equal values in the middle (3-way partition) keeps
it fast even when there are many duplicates. The random pivot makes the slow case
very unlikely.

- Time: O(n) on average (O(n²) in the unlikely worst case)
- Space: O(1) extra (the array is reordered in place)

## 2. Min-Heap of Size k — `2_min_heap.py`

Keep a small min-heap holding only the k largest values seen so far. Push each number,
and if the heap grows past k, pop the smallest. The heap never holds more than k
items, so each operation is cheap. When we finish, the smallest item left in the heap
(the root) is the kth largest overall, because all the other k − 1 items are bigger.

- Time: O(n log k)
- Space: O(k)

## 3. Sort — `3_sorting.py`

Sort the whole list ascending. The kth largest value is then k positions from the end.
It is the simplest to read and is correct for any input, but it does more work than
necessary because it orders every element when we only need one.

- Time: O(n log n)
- Space: O(n) (Python's `sorted` returns a new list)
