# Permutation in String — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Sliding Window + Match Counter — `1_sliding_window_matches.swift`

A permutation of `s1` is just any substring of `s2` with exactly the same
letter counts, and every such substring has length `len(s1)`. So slide a
window of that fixed size across `s2` and keep a 26-slot count of what is
inside it. Instead of comparing all 26 slots after every move, keep a
`matches` counter of how many letters currently agree with `s1`'s counts.
When a letter enters or leaves the window only its own slot changes, so the
counter can be fixed up in constant time, and the moment it reaches 26 the
window is a permutation — return `true`.

- Time: O(n) where n is the length of `s2`
- Space: O(1) — two fixed arrays of 26 counts

## 2. Sliding Window + Full Count Compare — `2_sliding_window_compare_counts.swift`

Same fixed-size window and same two count arrays, but without the running
match counter. After each slide, one letter's count goes up and one goes down,
and then the whole 26-slot array is compared against `s1`'s counts. It is a
little more work per step, but the comparison is bounded by the alphabet size
rather than the input, so it still scales linearly.

- Time: O(26 · n), which is O(n)
- Space: O(1)

## 3. Brute Force with Sorting — `3_bruteforce_sort.swift`

Two strings are permutations of each other exactly when they look identical
after sorting. Sort `s1` once, then take every substring of `s2` with the
same length, sort it, and check whether it matches. This re-sorts overlapping
windows from scratch each time, which is where the extra log factor comes from.

- Time: O(n · k log k) where k is the length of `s1`
- Space: O(k) for each sorted window
