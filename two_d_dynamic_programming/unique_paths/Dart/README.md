# Unique Paths — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Combinatorics — `1_combinatorics.dart`

Every path from the top-left to the bottom-right corner is made of exactly `m - 1` down moves and `n - 1` right moves, just in a different order. So the answer is the number of ways to choose which of the `m + n - 2` moves are downs, which is the binomial coefficient C(m + n - 2, m - 1). The code multiplies the factors one at a time and divides as it goes, so it never needs to build huge factorials.

- Time: O(min(m, n))
- Space: O(1)

## 2. Dynamic programming (rolling row) — `2_dynamic_programming.dart`

A cell can only be reached from the cell directly above it or the cell directly to its left, so `paths(cell) = paths(above) + paths(left)`. Keep one row of counts and update it in place, left to right. Before the update `row[j]` holds the count from above, and `row[j - 1]` has already been updated, so it holds the count from the left.

- Time: O(m · n)
- Space: O(n)

## 3. Brute force recursion — `3_bruteforce.dart`

From the current cell, try both moves (down and right), and add up the paths that reach the bottom-right corner. This is correct, but the same cells are solved again and again, and the number of calls grows exponentially with the size of the grid.

- Time: O(2^(m + n))
- Space: O(m + n) for the recursion stack
