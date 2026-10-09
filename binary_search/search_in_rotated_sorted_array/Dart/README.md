# Search in Rotated Sorted Array — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ One-Pass Binary Search — `1_one_pass_binary_search.dart`

A rotated sorted array has one useful property: if you cut it at any point,
at least one of the two halves is still properly sorted. So at each step of a
binary search, compare the left end with the middle to figure out which half
is the sorted one. A sorted half is easy to reason about — you can tell with
two comparisons whether the target could possibly live inside it. If it can,
narrow to that half; if not, the target must be in the other half (or
nowhere). Either way you throw out half the array every step, just like a
normal binary search.

- Time: O(log n)
- Space: O(1)

## 2. Find Pivot, Then Search — `2_find_pivot_then_search.dart`

Split the problem in two. First, binary search for the rotation point — the
index of the smallest element. Whenever the middle value is bigger than the
rightmost value, the drop must be somewhere to the right, so move left past
the middle; otherwise the drop is at or before the middle. Once you know where
the array "restarts", the array is really two sorted runs glued together.
Check which run the target belongs to by comparing it against the first run's
range, then do an ordinary binary search inside that run.

- Time: O(log n) — two binary searches, same big-O as one
- Space: O(1)

## 3. Linear Scan — `3_linear_scan.dart`

Ignore the sorted structure entirely and walk the array from start to finish,
returning the first index whose value equals the target. It is obviously
correct and a good sanity check for the smarter versions, but it never takes
advantage of the ordering, so it can't meet the problem's O(log n) requirement.

- Time: O(n)
- Space: O(1)
