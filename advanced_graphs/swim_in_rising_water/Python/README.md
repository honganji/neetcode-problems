# Swim in Rising Water — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Union-Find (Add Cells by Height) — `1_union_find.py`

Picture the water rising one height at a time. At time `t`, the cell with height `t` becomes usable, and we connect it to any neighbors that are already usable. A union-find (disjoint set) structure keeps track of which cells belong to the same connected group. The moment the top-left and bottom-right corners land in the same group, the current time is the answer. Heights are exactly `0` to `n² − 1`, so we can look up the cell for each height directly without sorting.

- Time: O(n² · α(n²)), which is effectively O(n²). α is the inverse Ackermann function, which stays tiny for any input size.
- Space: O(n²)

## 2. Dijkstra (Minimax Path) — `2_dijkstra.py`

Treat each cell as a node. The cost of a path is the tallest cell on it, because that is the time you have to wait before the whole path is usable. Dijkstra's algorithm finds the cheapest such path: keep a min-heap of cells ordered by their cost so far, and always expand the cheapest one. Stepping onto a neighbor costs the larger of our current cost and the neighbor's height. The first time we pop the bottom-right corner, its cost is the answer.

- Time: O(n² log n), since there are up to 4n² heap operations and each costs O(log n²)
- Space: O(n²) for the best-cost table and the heap

## 3. Binary Search on Time + Flood Fill — `3_binary_search_flood.py`

Ask a yes/no question: "If the water level is `t`, can we walk from the top-left to the bottom-right?" Answering it is a simple flood fill (DFS) over cells whose height is at most `t`. The answer is monotonic: if time `t` works, every larger time works too. So we binary search for the smallest `t` where the answer is yes. The search needs about log(n²) flood fills, and each one touches every cell once.

- Time: O(n² log n)
- Space: O(n²) for the visited grid and the stack

---

**Why this order:** Union-Find is the only approach that is nearly linear, so it ranks first. Dijkstra and binary search are both O(n² log n), and the two are close. Dijkstra makes one pass over the grid, while binary search repeats a full flood fill about 2 · log n times, so it ranks last.
