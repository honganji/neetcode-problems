# Longest Common Subsequence — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Bit-Parallel Matching — `1_bit_parallel.kt`

Give each position in `text2` one bit in a single big number `v`, starting with every bit set to 1. For each letter in `text1`, one addition and a few bit operations update every position that holds that letter at the same time. A 0 bit that is left at the end marks one character of the LCS. Each operation handles up to 64 positions at once, so this is the fastest of the three, but the bit tricks are harder to follow.

- Time: O(m · n / w), where w is the number of bits handled per machine operation (64)
- Space: O(n) bits

## 2. 2D DP Table — `2_dp_table.kt`

Let `dp[i][j]` be the LCS length of the suffixes `text1[i:]` and `text2[j:]`. If the current letters match, take that letter and add 1 to the answer for the rest: `dp[i][j] = 1 + dp[i+1][j+1]`. If they do not match, drop one letter from either side and keep the better result: `max(dp[i+1][j], dp[i][j+1])`. Filling the table from the bottom-right means each cell only uses cells that are already computed. The answer is `dp[0][0]`. Only the row below is ever read, so the table could be shrunk to two rows, but the time stays the same.

- Time: O(m · n)
- Space: O(m · n) for the table

## 3. Match Pairs + Longest Increasing Subsequence — `3_match_list_lis.kt`

Only pairs of positions with the same letter can be part of the LCS. For each letter, list its positions in `text2`, then go through `text1` from left to right. A common subsequence is a chain of these matches whose `text2` positions keep increasing, which is the same as a longest increasing subsequence. For each chain length, keep the smallest end position seen so far in a sorted list, and find where a new position fits with binary search. Each letter's positions are processed from right to left so one letter of `text1` cannot be used twice in one chain. This does much less work than the table when few letters match, but when every letter matches, it does more work than the table, so it is listed last.

- Time: O((m + r) · log n), where r is the number of matching pairs; worst case (all letters equal) O(m · n · log n)
- Space: O(n)
