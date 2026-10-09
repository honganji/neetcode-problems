# Median of Two Sorted Arrays — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Binary Search on the Partition — `1_binary_search_partition.dart`

The median splits the combined numbers into a left half and a right half of
(almost) equal size. Instead of building that combined list, guess how many
elements of the shorter array belong in the left half; the longer array must
then contribute exactly enough to fill the rest. The guess is correct when the
biggest value on each left side is no larger than the smallest value on the
other right side. If the shorter array's left piece is too big, move the cut
left; otherwise move it right — a binary search over cut positions. Sentinels
of minus and plus infinity stand in for the missing neighbours when a cut sits
at the very start or end of an array, which also covers an empty array.

- Time: O(log(min(m, n)))
- Space: O(1)

## 2. Merge Count — `2_merge_count.dart`

Walk both arrays with two pointers exactly as a merge would, always taking the
smaller front value, but never store the result. You only need to reach the
middle: keep the last two values you stepped past, stop once you have taken
half of the total plus one, and the median is the latest value (odd total) or
the average of the last two (even total).

- Time: O(m + n)
- Space: O(1)

## 3. Merge and Index — `3_merge_and_index.dart`

Merge the two sorted arrays into one sorted array, then read the median
straight out of the middle: the centre element when the length is odd, or the
average of the two centre elements when it is even. Simple and obviously
correct, but it builds a whole new array just to look at one or two slots.

- Time: O(m + n)
- Space: O(m + n) for the merged array
