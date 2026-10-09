# Number of Islands — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Flood fill (iterative DFS) — `1_flood_fill.kt`

Scan the grid one cell at a time. When you hit land, it belongs to a new island, so count it. Then flood outward from that cell with a stack, turning each connected land cell into water as you reach it. The whole island gets "used up," so the scan never counts it again. Every cell is touched a constant number of times.

- Time: O(m·n)
- Space: O(m·n) worst case for the stack (one giant island). Modifies the input grid.

## 2. Row runs + union-find — `2_row_runs_union_find.kt`

Instead of looking at single cells, first break each row into runs of consecutive land (for example `"11011"` has two runs). Runs in the same row never touch each other directly, but a run touches a run in the row below when their column ranges overlap. Each run starts as its own island. Each time two touching runs in different groups are joined, the island count drops by one. Because a run covers many cells, this works with fewer nodes than the cell-by-cell version on typical grids.

- Time: O(m·n) to scan the grid, plus near-constant work per merge
- Space: O(m·n) worst case for the runs (fewer on typical grids). Does not modify the input grid.

## 3. Union-find over cells — `3_union_find.kt`

Treat every land cell as its own group. For each land cell, merge it with the land cell to its right and the land cell below it. Each merge that joins two different groups means two islands became one, so subtract one from the count. Union-find uses path halving and union by size to keep the groups shallow.

- Time: O(m·n·α(m·n)), where α is the inverse Ackermann function (effectively constant)
- Space: O(m·n) for the parent and size arrays. Does not modify the input grid.
