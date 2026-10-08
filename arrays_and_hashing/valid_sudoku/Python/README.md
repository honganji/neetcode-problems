# Valid Sudoku — Python

Solutions ordered from most to least efficient.

The board is always 9x9, so every approach here does a fixed amount of work
and is technically O(1). The ranking is by constant factors and memory: how
many times each cell is visited and how heavy the bookkeeping is.

## 1. ⭐ Bitmask — `1_bitmask.py`

Each row, column, and box only ever needs to remember which of the nine digits
it has seen, and nine yes/no flags fit comfortably in a single integer. Keep
three arrays of nine ints, and for every digit on the board flip the bit for
that digit in its row's int, its column's int, and its box's int. If the bit
was already set in any of them, that digit is a repeat — return `False` right
away. Walking all 81 cells once with no allocations beyond 27 ints makes this
the leanest option.

- Time: O(81) — one pass over the board, constant for a 9x9 grid
- Space: O(1) — three fixed arrays of 9 ints

## 2. Hash Sets — `2_hash_sets.py`

Same single pass, but instead of bits, keep a set of seen digits for each row,
column, and box. A set rejects a value it already contains, so trying to add a
digit to any of its three sets and finding it already there means the board is
invalid. This is the most direct translation of the rules and easy to read,
but 27 sets cost more memory and more work per cell than 27 ints.

- Time: O(81) — one pass over the board
- Space: O(81) — in the worst case every cell ends up in three sets

## 3. Three Passes — `3_three_passes.py`

Check the rules one at a time: scan each row for a duplicate, then each
column, then each 3x3 box, using a fresh set of nine digits at most for every
group. The logic for "does this group of nine cells contain a repeat" is the
same in all three passes, so the code is simple, but every cell gets visited
three times instead of once.

- Time: O(243) — three full passes over the board, still constant
- Space: O(9) — only one group's set exists at a time
