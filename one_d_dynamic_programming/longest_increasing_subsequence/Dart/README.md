# Longest Increasing Subsequence — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Binary search on tails — `1_binary_search.dart`

Keep a list `tails` where `tails[k]` is the smallest value that can end an increasing subsequence of length `k + 1`. This list is always sorted, so for each new number we binary search for the first tail that is `>= x`. If there is none, `x` extends the longest subsequence found so far. Otherwise `x` replaces that tail: the length stays the same, but the ending value is smaller, which leaves more room for later numbers. The length of `tails` at the end is the answer.

- Time: O(n log n)
- Space: O(n)

## 2. Fenwick tree (binary indexed tree) — `2_fenwick_tree.dart`

For each number, we want the longest increasing subsequence that ends at a smaller value seen earlier. Compress the values into ranks `1..m`, then store best lengths in a Fenwick tree indexed by rank. A prefix-max query over ranks `1..r-1` gives the best length among smaller values in O(log n), and an update records the new length at rank `r`. Each number costs one query and one update.

- Time: O(n log n)
- Space: O(n)

## 3. Dynamic programming — `3_dynamic_programming.dart`

Let `dp[i]` be the length of the longest increasing subsequence that ends at `nums[i]`. Start every entry at 1. For each `i`, check every earlier `j` with `nums[j] < nums[i]` and take the best `dp[j] + 1`. The answer is the largest value in `dp`. It is easy to reason about, but comparing every pair of positions makes it quadratic.

- Time: O(n²)
- Space: O(n)
