# Max Area of Island — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ DFS flood fill — `1_dfs.dart`

Scan the grid cell by cell. When you hit land, you have found a new island: walk every land cell connected to it using a stack (depth-first), counting as you go. Each visited cell is turned into water right away, so it is never counted twice. Every cell is handled a constant number of times, so one pass over the grid is enough.

- Time: O(m·n)
- Space: O(m·n) in the worst case (the stack can hold a whole island). Note: this modifies the input grid.

## 2. Union-Find — `2_unionfind.dart`

Treat every land cell as a member of a group. For each land cell, merge it with its land neighbour below and its land neighbour to the right. Each group keeps a size count, and the answer is the largest group. Finding a group's root is almost constant time thanks to path halving and union by size.

- Time: O(m·n · α(m·n)), which is effectively O(m·n)
- Space: O(m·n) for the parent and size arrays

## 3. Brute force per cell — `3_bruteforce.dart`

For every land cell, run a fresh search of its island with a brand-new visited set and keep the biggest count. Searches share nothing, so an island with k cells gets walked k times. It is easy to reason about, but it gets slow on large grids.

- Time: O((m·n)²) in the worst case (for example, an all-land grid)
- Space: O(m·n) for the visited set and stack
