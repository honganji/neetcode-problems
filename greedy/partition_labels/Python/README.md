# Partition Labels — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Last occurrence + greedy scan — `1_last_index_greedy.py`

First record where each letter appears last. Then walk the string once, keeping `end`, the furthest last-occurrence of any letter in the current part. When the index reaches `end`, every letter seen so far finishes inside this part, so we can cut here. Cutting as early as possible gives the most parts.

- Time: O(n)
- Space: O(1) (at most 26 letters)

## 2. Interval merging — `2_interval_merging.py`

Treat each letter as an interval from its first to its last occurrence. Sort the intervals by start and merge the ones that overlap. Each merged block is exactly one part. This finds the same cuts as solution 1, just by a different route: it sorts intervals instead of scanning once.

- Time: O(n + k log k), where k ≤ 26 is the number of distinct letters, so O(n) in practice
- Space: O(1) (at most 26 intervals)

## 3. Brute force cut check — `3_bruteforce.py`

Start a part at the current index and extend its end one step at a time. Stop at the first end where no letter inside the part appears after it. That check is done by comparing the two halves directly, with no precomputed data.

- Time: O(n²)
- Space: O(n) for the temporary substrings
