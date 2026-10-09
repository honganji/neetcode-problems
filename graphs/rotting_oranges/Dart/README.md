# Rotting Oranges — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Multi-source BFS — `1_multi_source_bfs.dart`

Put every rotten orange in a queue at the start, then spread outward one layer at a time. Each layer of the search is exactly one minute, so the number of layers is the answer. Every cell is visited at most once, which makes this linear in the grid size.

- Time: O(m · n)
- Space: O(m · n)

## 2. Simulation sweeps — `2_simulation_sweeps.dart`

Simulate the minutes directly. Each minute, scan the whole grid for fresh oranges next to a rotten one, and rot them after the scan so nothing spreads twice in the same minute. Stop when a minute changes nothing. It is easy to picture, but every minute costs a full scan, and the process can last up to m · n minutes (for example, along a winding path).

- Time: O((m · n)²) worst case
- Space: O(m · n) for the grid, plus O(m · n) for the per-minute list of cells to rot (O(1) extra space if rotting is done in place)

## 3. BFS from each fresh orange — `3_bfs_from_each_fresh.dart`

Ask each fresh orange how long it takes to reach its nearest rotten orange, using a separate BFS from that orange. The answer is the largest of these times. If any fresh orange can't reach a rotten one, return -1. This gives the same answer, but it repeats a search for every fresh orange instead of sharing one search.

- Time: O((m · n)²) worst case
- Space: O(m · n)
