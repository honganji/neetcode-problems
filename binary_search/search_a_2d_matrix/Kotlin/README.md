# Search a 2D Matrix — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Flattened Binary Search — `1_flattened_binary_search.kt`

Because every row is sorted and each row starts after the previous one ends,
reading the matrix row by row gives one long sorted list of m × n numbers. You
never actually build that list: an index `idx` into it lives at row
`idx / n` and column `idx % n`. So run an ordinary binary search over the
range `0 .. m*n - 1`, translating each middle index into a cell on the fly,
and halve the search space on every comparison.

- Time: O(log(m · n))
- Space: O(1)

## 2. Two Binary Searches — `2_two_binary_searches.kt`

First find the only row that could hold the target: binary search over rows,
comparing the target with each row's first and last element. If the target is
smaller than the first element, look at earlier rows; if it is larger than the
last, look at later rows; otherwise this is the row. Then binary search within
that single row. Since log m + log n equals log(m · n), this is the same
big-O as the flattened search — it is ranked second only because it makes two
passes instead of one.

- Time: O(log m + log n)
- Space: O(1)

## 3. Staircase Search — `3_staircase.kt`

Start at the top-right corner. That cell is the largest in its row and the
smallest in its column, so a single comparison rules out a whole line: if it
is bigger than the target, nothing else in this column can match, so step
left; if it is smaller, nothing else in this row can match, so step down. Each
step discards one row or one column, so you reach an answer within m + n
moves. This works even without the "each row starts after the previous ends"
guarantee, but it does not take advantage of it.

- Time: O(m + n)
- Space: O(1)
