# Palindrome Partitioning — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Backtracking with a palindrome table — `1_backtracking.swift`

Before searching, fill a table that says whether each substring `s[i..j]` is a palindrome. A substring is a palindrome when its two ends match and the part inside it is also a palindrome, so the table can be built from the inside out. The search then starts at index 0, tries every end point where the piece is a palindrome, and recurses on the rest of the string. Because the table answers "is this a palindrome?" in one lookup, bad branches are cut off right away.

- Time: O(n · 2^n)
- Space: O(n²) for the table, plus O(n) recursion depth

## 2. Bitmask over all cut positions — `2_bitmask.swift`

A string of length `n` has `n - 1` gaps between characters, and each gap is either cut or not. That gives `2^(n-1)` possible splits. Each integer from `0` to `2^(n-1) - 1` describes one split: bit `k` set means "cut after index `k`". For each split, check that every piece is a palindrome and keep the ones that are. No recursion is needed. The downside is that every split is checked, so it is usually the slowest of the three in practice even though its time bound is the same as the first.

- Time: O(n · 2^n)
- Space: O(n) extra, not counting the output

## 3. Prefix DP that builds partitions — `3_prefix_dp.swift`

`partitions[i]` holds every valid split of the first `i` characters. To build `partitions[end]`, look at each `start` where `s[start..end-1]` is a palindrome, and add that last piece to the end of every split stored in `partitions[start]`. The answer is `partitions[n]`. This works, but it copies arrays for every prefix and keeps all of them in memory, so its worst-case bound is the largest of the three. In practice it runs about as fast as backtracking, since it only extends pieces that are palindromes.

- Time: O(n² · 2^n)
- Space: O(n · 2^n) to store every prefix's partitions
