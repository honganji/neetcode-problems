# Pacific Atlantic Water Flow — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Reverse Flood Fill (BFS) — `1_reverse_bfs.dart`

Instead of asking whether each cell can reach the oceans, flip the question: which
cells can the ocean reach? Water flows downhill, so starting at the ocean edge and
walking uphill finds exactly the cells that drain there. Do this once from the Pacific
edge and once from the Atlantic edge, then keep the cells reached by both. Each cell is
visited at most once per ocean.

- Time: O(m · n)
- Space: O(m · n)

## 2. Sort by Height — `2_sort_by_height.dart`

Sort all cells from lowest to highest. A cell drains to an ocean if it is on that
ocean's edge, or if it has a neighbor that is lower or equal and already known to drain.
Going from low to high means those lower neighbors are always decided first. Cells with
the same height can help each other, so each height group gets a small flood fill.

- Time: O(m · n · log(m · n)), dominated by the sort
- Space: O(m · n)

## 3. Brute Force DFS — `3_brute_force.dart`

Try every cell on its own. From that cell, walk downhill (to neighbors that are equal or
lower) and record whether the walk touches the Pacific edge and the Atlantic edge. Stop
as soon as both are found. It is simple to reason about, but the same cells get
re-explored for every starting point.

- Time: O((m · n)²) in the worst case
- Space: O(m · n) for the visited set
