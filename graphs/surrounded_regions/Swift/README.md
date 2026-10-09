# Surrounded Regions — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Border BFS — `1_border_bfs.swift`

An `'O'` on the border can never be surrounded, and every `'O'` connected to one is safe too. So we start a flood fill from all border `'O'`s at once and mark everything it reaches as safe (`'S'`). Whatever `'O'` is left is surrounded, so it becomes `'X'`, and the `'S'` cells go back to `'O'`.

- Time: O(m·n)
- Space: O(m·n) for the queue in the worst case

## 2. Union-Find — `2_union_find.swift`

Treat each `'O'` as a member of a group, and merge neighbouring `'O'`s into the same group. Add one extra "border" node, and join every `'O'` on the edge to it. Any `'O'` in the same group as the border node is safe; every other `'O'` is flipped.

- Time: O(m·n·α(m·n)), where α is the inverse Ackermann function (practically constant)
- Space: O(m·n) for the parent and size arrays

## 3. Brute-force DFS — `3_bruteforce_dfs.swift`

For each `'O'`, run a fresh DFS over the `'O'`s connected to it. If the search reaches the edge, the cell is safe. If it never does, the cell is surrounded. This is easy to reason about, but the same cells get searched again for every `'O'`.

- Time: O((m·n)²) in the worst case
- Space: O(m·n) for the visited set and stack
