# Two Sum II - Input Array Is Sorted — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Two Pointers — `1_two_pointers.kt`

Because the array is sorted, the smallest value sits at the left end and the
largest at the right. Start one pointer at each end and add the two values. If
the sum is too small, the only way to make it bigger is to move the left
pointer right; if it is too big, move the right pointer left. Each step rules
out one element for good, so the pointers meet after at most one pass, and
since the problem guarantees exactly one answer they are certain to land on it.
Add 1 to each index because the answer is 1-indexed.

- Time: O(n)
- Space: O(1)

## 2. Binary Search — `2_binary_search.kt`

For each element, the partner you need is `target - current`. Instead of
scanning for it, binary search the part of the array after the current element:
it is sorted, so you can halve the search range on every comparison. Searching
only to the right keeps the pair in order and never pairs an element with
itself. This is a nice bridge between brute force and two pointers — it uses
the sorted order, just not as fully.

- Time: O(n log n)
- Space: O(1)

## 3. Brute Force — `3_bruteforce.kt`

Try every pair of elements. For each element, look at every element after it
and check whether the two add up to the target. This ignores the fact that the
array is sorted, so it does far more work than necessary, but it is the
baseline the smarter approaches improve on.

- Time: O(n²)
- Space: O(1)
