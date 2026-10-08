# Top K Frequent Elements — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Bucket Sort — `1_bucket_sort.dart`

First count how many times each number appears. The key insight is that a
frequency can never be larger than the array length, so instead of sorting the
counts you can make one bucket per possible frequency and drop each number into
the bucket matching its count. Walking the buckets from the highest frequency
down and collecting numbers until you have k of them gives the answer without
ever sorting.

- Time: O(n)
- Space: O(n) for the count map and the buckets

## 2. Min-Heap — `2_heap.dart`

Count the frequencies, then feed each (frequency, number) pair into a min-heap
that is only allowed to hold k entries. Whenever the heap grows past k, pop the
smallest frequency off the top — the heap always keeps the k most frequent
numbers seen so far, and anything it evicts could never be in the answer. Once
every number has been pushed, the heap's contents are the k most frequent
elements.

- Time: O(n log k)
- Space: O(n) for the count map (the heap itself is only O(k))

## 3. Sorting — `3_sorting.dart`

Count the frequencies, then sort the distinct numbers by their count from
highest to lowest and take the first k. This is the most direct translation of
the problem statement; it does more work than needed because it fully orders
every number when you only care about the top k.

- Time: O(n log n)
- Space: O(n) for the count map and the sorted list
