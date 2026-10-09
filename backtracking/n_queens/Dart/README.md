# N-Queens — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Bitmask backtracking — `1_bitmask_backtracking.dart`

Place one queen per row, from top to bottom. Before picking a column, we need to know which columns and diagonals are already under attack. Instead of storing them in sets, we keep them as bits in integers: one bit per column, and one bit per diagonal. "Is this column safe?" becomes a single bitwise operation. When we move to the next row, the diagonal masks shift by one column to match how attacks spread. If a row has no safe column left, we backtrack and try the next option.

- Time: O(n!) (pruned search; each step is a few bit operations)
- Space: O(n) for the recursion and the current row choices

## 2. Permutations (generate and test) — `2_permutations.dart`

A permutation of `0..n-1` is a list of columns, one per row. Using a permutation guarantees that every row and every column has exactly one queen, so we never have to check those. We only check diagonals: if all the `row + col` values are different and all the `row - col` values are different, no two queens share a diagonal. The code builds permutations by swapping elements in place. We keep the ones that pass. This is slower than backtracking because it does not stop early on bad partial boards.

- Time: O(n · n!)
- Space: O(n)

## 3. Brute force — `3_bruteforce.dart`

Try every way to put one queen in each row. Each row can pick any of the `n` columns, which gives `n^n` candidate boards. For each board, check every pair of queens for a shared column or diagonal. This is the simplest correct idea, but it builds and checks many boards that could have been rejected after the first conflict.

- Time: O(n^n · n²)
- Space: O(n)
