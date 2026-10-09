# Combination Sum — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Backtracking — `1_backtracking.dart`

Sort the candidates so the smallest come first. Build a combination one number at a time, trying each candidate from the current position onward. Starting from the current position (not the one after it) is what lets the same number be picked again. Because the list is sorted, once a candidate is bigger than what's left of the target, every later candidate is too, so the loop stops early. When the remaining amount reaches 0, the current path is a valid answer.

- Time: O(N^(T/M)), where N is the number of candidates, T is the target, and M is the smallest candidate (the search tree's worst case; in practice it only visits sums that stay under the target)
- Space: O(T/M) for the recursion depth, not counting the output

## 2. Dynamic Programming — `2_dp.dart`

Build the answer from the bottom up. `dp[s]` holds every combination that adds up to `s`. Start with the empty combination at `0`. For each candidate `c`, every combination that sums to `s - c` can be extended by one more `c` to make a combination summing to `s`. Going up in `s` lets `c` be used several times. Handling one candidate at a time means each multiset is built exactly once, so there are no duplicates. The answer is `dp[target]`.

- Time: O(N · T · K), where K is the number of combinations stored for a single sum
- Space: O(T · K) for the table

## 3. Brute Force — `3_bruteforce.dart`

Treat each candidate as a counter of how many copies to use, from 0 up to `target ~/ candidate`. Step through every combination of counter values (like an odometer rolling over), add up each one, and keep the ones that equal the target. There is no sorting and no early stopping, so every possibility gets checked.

- Time: O(N · ∏(⌊T/cᵢ⌋ + 1)), one check for every combination of counts
- Space: O(N) for the counters, not counting the output
