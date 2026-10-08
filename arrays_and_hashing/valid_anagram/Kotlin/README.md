# Valid Anagram — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Count Array — `1_count_array.kt`

Two strings are anagrams exactly when every letter appears the same number of
times in both. Since the input is only lowercase letters, keep 26 counters: add
one for each letter of `s` and subtract one for each letter of `t`. If the
lengths match and every counter ends at zero, the letters cancel out perfectly.

- Time: O(n)
- Space: O(1) (the counter array is always 26 slots)

## 2. Sorting — `2_sorting.kt`

Anagrams contain the same letters, so once both strings are sorted they must
be identical. Sort each one and compare.

- Time: O(n log n)
- Space: O(n) for the sorted copies

## 3. Brute Force — `3_bruteforce.kt`

For each letter in `s`, search `t` for an unused copy of it and cross it
off. If some letter can't be found, they aren't anagrams. If every letter gets
matched (and the lengths are equal), they are.

- Time: O(n²)
- Space: O(n) for the mutable copy of `t`
