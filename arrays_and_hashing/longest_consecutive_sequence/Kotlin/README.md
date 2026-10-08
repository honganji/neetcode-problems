# Longest Consecutive Sequence — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Hash Set — `1_hashset.kt`

Put every number into a set so membership checks are O(1), and duplicates
collapse away for free. Then only start counting from numbers that begin a
sequence — a number is a start if `num - 1` is not in the set. From each start,
keep checking `num + 1`, `num + 2`, ... until the chain breaks. Because every
number is only ever walked over as part of the one sequence it belongs to, the
total work across all starts adds up to O(n), even though there is a loop
inside a loop.

- Time: O(n)
- Space: O(n) for the set

## 2. Sorting — `2_sorting.kt`

Sort a copy of the array so that consecutive values sit next to each other.
Then scan once, tracking the length of the current run: if the next value is
exactly one more than the previous, extend the run; if it is equal, skip it
(duplicates don't lengthen a sequence); otherwise the run is broken, so start
a fresh one. Keep the longest run seen. This is simple and needs no hashing,
but the sort makes it slower than linear.

- Time: O(n log n)
- Space: O(n) for the sorted copy (O(1) extra if sorting the input array in
  place is acceptable)

## 3. Brute Force — `3_bruteforce.kt`

For every number in the array, treat it as the start of a sequence and keep
asking "is `num + 1` in the array? `num + 2`?" using a plain linear search
each time. Each lookup walks the whole array, a sequence can be up to n long,
and there are n starting points, so in the worst case this is cubic. It is
easy to understand and clearly correct, but far too slow for large inputs.

- Time: O(n³) worst case (each of the n starts can extend up to n times, and
  each extension is an O(n) linear search)
- Space: O(1)
