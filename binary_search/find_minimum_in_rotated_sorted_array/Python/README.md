# Find Minimum in Rotated Sorted Array — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Binary Search (Compare with Right) — `1_binary_search.py`

A rotated sorted array is two sorted runs glued together, and the minimum is
the first element of the second run. Look at the middle element and compare it
with the rightmost one. If the middle is bigger than the right end, the "drop"
must happen somewhere to the right of the middle, so the minimum lives there
and the middle itself can be discarded. Otherwise the middle through the right
end is in order, so the minimum is at the middle or to its left — keep the
middle as a candidate and shrink the window from the right. When the window
closes to one element, that is the minimum.

- Time: O(log n)
- Space: O(1)

## 2. Binary Search (Sorted-Half Check) — `2_binary_search_sorted_half.py`

Same divide-and-conquer idea with an early exit: before splitting, check
whether the current window is already sorted (its left end is no bigger than
its right end). If so, the window's left end is the smallest thing in it, so
stop. Otherwise the window straddles the rotation point. Compare the middle
with the left end: if the middle is at least as big, the left run is intact
and the minimum is to the right; if not, the drop is on the left. Track the
smallest value seen along the way. It performs the same number of halvings in
the worst case as the first approach, but finishes sooner on arrays that are
barely rotated or not rotated at all.

- Time: O(log n)
- Space: O(1)

## 3. Linear Scan — `3_linear_scan.py`

Walk the array from left to right and look for the one place where a value is
smaller than the value just before it. That is the rotation point, and the
smaller value is the minimum. If no such drop exists the array was never
rotated and the first element is the answer. Simple and correct, but it ignores
the sorted structure and so does not meet the O(log n) requirement.

- Time: O(n)
- Space: O(1)
