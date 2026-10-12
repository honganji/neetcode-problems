# Set Matrix Zeroes — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ In-place markers (first row and column) — `1_inplace_markers.dart`

The first row and first column can store "this row/column must be zeroed" for the rest of the matrix. They also hold their own zeros, so we first save whether they contain any zero, using two booleans. Then we scan the inner cells. A zero at `(i, j)` marks row `i` in column 0 and column `j` in row 0. A second pass zeros each inner cell whose row or column is marked. Last, we zero the first row and column if they were flagged at the start.

- Time: O(m·n)
- Space: O(1)

## 2. Flag arrays — `2_flag_arrays.dart`

Keep one boolean per row and one per column. Scan the whole matrix; each zero flips its row flag and its column flag. Then a second scan sets a cell to `0` if its row flag or column flag is set. This is the easiest to reason about, but it needs O(m + n) extra memory.

- Time: O(m·n)
- Space: O(m + n)

## 3. Brute force on a copy — `3_bruteforce.dart`

Copy the matrix so we can tell original zeros from zeros we create. For each original zero, overwrite its whole row and column in the real matrix. This rescans rows and columns once per zero, so it is slow when there are many zeros. It is the naive baseline for the flag idea.

- Time: O(m·n·(m + n)) worst case (when every cell is zero)
- Space: O(m·n) for the copy
