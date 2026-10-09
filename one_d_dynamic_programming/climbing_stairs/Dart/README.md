# Climbing Stairs — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Matrix power — `1_matrix_power.dart`

The number of ways follows the Fibonacci rule: the ways to reach step `n` equal the ways to reach `n-1` plus the ways to reach `n-2`. That rule can be written as a 2x2 matrix, `[[1, 1], [1, 0]]`, and multiplying by it moves the pair of numbers one step forward. Raising the matrix to the `n`-th power jumps there directly, and repeated squaring (M, M², M⁴, …) gets there in about log₂(n) multiplications.

- Time: O(log n)
- Space: O(1)

## 2. Iterative DP — `2_iterative_dp.dart`

To reach step `i` you must come from step `i-1` (take 1 step) or step `i-2` (take 2 steps), so `ways[i] = ways[i-1] + ways[i-2]`. A loop builds these values from the bottom up. Only the last two values are needed, so we keep just those two variables.

- Time: O(n)
- Space: O(1)

## 3. Memoized recursion — `3_memoized_recursion.dart`

This is the same rule written as a recursive function: `ways(i)` calls `ways(i-1)` and `ways(i-2)`. Without help, the same subproblems get recomputed over and over. The memo stores each result the first time it is computed, so every value is calculated only once.

- Time: O(n)
- Space: O(n) for the memo and the call stack
