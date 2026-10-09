# Network Delay Time — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Dijkstra's algorithm (min-heap) — `1_dijkstra.py`

Start at node `k` and always work on the unfinished node that is closest to `k`. Since no edge has a negative weight, once a node comes out of the heap its time is final. We then check whether it gives any neighbor a faster route. A heap entry can go stale when a faster route is found later, so we skip those.

- Time: O(E log V)
- Space: O(V + E)

## 2. Bellman-Ford — `2_bellman_ford.py`

Go through every edge and ask: "does going through this edge make the target node faster to reach?" Repeat this pass over all edges. After pass `i`, every node reachable in at most `i` hops has its correct time. A shortest path never needs more than `n - 1` hops, so `n - 1` passes are enough. If a pass changes nothing, we stop early.

- Time: O(V · E)
- Space: O(V)

## 3. Floyd-Warshall — `3_floyd_warshall.py`

Build a table of the shortest time between every pair of nodes. Then let nodes `1, 2, ..., n` act as stepping stones one at a time: the path `i → mid → j` replaces `i → j` if it is faster. When we're done, row `k` of the table is the answer. It finds more than we need, since we only care about one start node.

- Time: O(V³)
- Space: O(V²)
