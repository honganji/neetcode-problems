# 3Sum — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Sort + Two Pointers — `1_sort_two_pointers.swift`

Sort the array first. Then fix one number at a time and ask: "which two numbers
to the right of it add up to its negative?" That smaller question is Two Sum
on a sorted range, so one pointer starts just after the fixed number and one
at the far end. If the three values sum to less than zero, move the left
pointer right to make it bigger; if more, move the right pointer left. Because
the array is sorted, equal values sit next to each other, so skipping over a
value you just used (for the fixed number and for both pointers) is all it
takes to avoid duplicate triplets. Once the fixed number is positive, no
triplet to its right can reach zero, so you can stop early.

- Time: O(n²), plus O(n log n) for the sort
- Space: O(1) extra beyond the output (the sort is in place)

## 2. Sort + Hash Set — `2_hashset.swift`

Same outer idea: sort, then fix one number and look for a pair among the
numbers after it. Instead of two pointers, scan that range once with a set of
values seen so far. For each number, the partner that would complete the
triplet is `-(fixed + current)`; if the set already holds it, record the
triplet. Sorting is still needed so that duplicate fixed numbers can be
skipped and so that a run of equal values only produces one triplet.

- Time: O(n²)
- Space: O(n) for the set

## 3. Brute Force — `3_bruteforce.swift`

Try every combination of three positions, always picking the second after the
first and the third after the second so no combination is checked twice.
Sorting up front means every matching triplet comes out in ascending order, so
dropping them into a set removes duplicates automatically.

- Time: O(n³)
- Space: O(n) for the set of triplets, in the worst case
