# Combination Sum II — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Backtracking with pruning and duplicate skipping — `1_backtracking.dart`

Sort the numbers first. Then build combinations one number at a time: at each step, pick a number at the current index or later, so every number is used at most once and no combination is built in two different orders. Sorting lets us stop the loop early as soon as a number is larger than what is left. Duplicates are handled by skipping a number that equals the one just before it at the same depth, so the same combination is never produced twice.

- Time: O(2ⁿ · n) in the worst case, usually far less because of the early stop
- Space: O(n) for the recursion and the current path (not counting the output)

## 2. Dynamic programming over sums — `2_dp.dart`

Keep a table where entry `s` holds every distinct combination that adds up to `s`. Process the sorted candidates one at a time: for each candidate `x`, extend every combination that sums to `s - x` by adding `x` to make a combination that sums to `s`. Walking the sums from high to low makes sure each candidate is used at most once. A set per sum removes duplicates.

- Time: O(n · target · K · L), where K is the number of distinct combinations for one sum and L is their length
- Space: O(target · K · L) to store the table

## 3. Bitmask brute force — `3_bitmask.dart`

Treat each subset of the candidates as a binary number: bit `i` set means "use `candidates[i]`". Check every one of the 2ⁿ subsets, keep the ones whose sum equals the target, sort each one, and drop duplicates with a set. It is simple and clearly correct, but it checks every subset, so it only works for small inputs (roughly n ≤ 20).

- Time: O(2ⁿ · n)
- Space: O(n) for the current subset, plus the output
