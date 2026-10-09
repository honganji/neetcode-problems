# Find Median from Data Stream — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Two Heaps — `1_two_heaps.kt`

Split the numbers into two halves. The smaller half sits in a max-heap, so its largest value is on top. The larger half sits in a min-heap, so its smallest value is on top. Those two tops are the middle of the data. `java.util.PriorityQueue` is used for both heaps; `Collections.reverseOrder()` turns the first one into a max-heap.

Each new number goes into the lower half first, and then that half's largest value moves to the upper half. This keeps every lower value at or below every upper value. If the upper half ends up bigger, one value moves back down. The two halves then differ in size by at most one. For an odd count, the median is the top of the bigger half. For an even count, it is the average of the two tops. Reading the tops is instant, so `findMedian` is cheap.

- Time: O(log n) per `addNum`, O(1) per `findMedian`
- Space: O(n)

## 2. Sorted Insertion — `2_sorted_insertion.kt`

Keep the list sorted at all times. To add a number, use `binarySearch` to find where it belongs, then `add(index, num)` it there. Every item after that spot shifts one place to the right, and that shifting is the slow part. Once the list is sorted, the median sits in the middle index: the middle item for an odd count, or the average of the two middle items for an even count.

- Time: O(n) per `addNum` (the binary search is O(log n), but shifting the items is O(n)), O(1) per `findMedian`
- Space: O(n)

## 3. Brute Force — `3_bruteforce.kt`

Store every number in a plain list in whatever order it arrives. Adding is instant. When the median is requested, sort a copy of the list and read the middle. This is simple and always correct, but it repeats the whole sort on every query.

- Time: O(1) per `addNum`, O(n log n) per `findMedian`
- Space: O(n)
