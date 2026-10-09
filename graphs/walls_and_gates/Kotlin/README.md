# Walls and Gates — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Multi-Source BFS — `1_multi_source_bfs.kt`

Instead of searching from one room at a time, start from every gate at the same time. Put all the gates in a queue, then expand outward one step at a time, like ripples spreading from several stones dropped in a pond. Rooms are reached in order of distance, so the first time an empty room is touched, that distance is already the shortest one, and it never needs to change.

- Time: O(m·n) — each cell goes into the queue at most once.
- Space: O(m·n) — the queue can hold a large part of the grid.

## 2. Depth-First Search — `2_dfs.kt`

Start a depth-first search from each gate, going as far as possible in one direction before backtracking. Each step adds 1 to the distance. A room is only updated when we arrive with a shorter distance than it already has, so later, shorter routes can fix earlier, longer ones. This gives the right answer, but a room may be updated more than once, so it is slower than the BFS approach.

- Time: O(g·m·n), where g is the number of gates. The worst case can be higher, since a room can be revisited each time a shorter route is found.
- Space: O(m·n) — the stack of pending cells can grow large.

## 3. BFS from Each Room — `3_bfs_per_room.kt`

For each empty room, run a BFS from that room alone and stop as soon as a gate is reached. The first gate found is the nearest one, so that BFS distance is the answer. This is easy to reason about, but every room repeats a search that may cover most of the grid, so there is a lot of duplicate work.

- Time: O((m·n)²) — up to m·n rooms, each searched across up to m·n cells.
- Space: O(m·n) — the queue and visited set for a single search.
