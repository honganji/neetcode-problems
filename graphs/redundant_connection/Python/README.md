# Redundant Connection — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Union-Find (Disjoint Set Union) — `1_union_find.py`

Start with every node in its own group. Go through the edges in order. If both ends of an edge are already in the same group, that edge closes a loop, so it is the answer. Otherwise, join the two groups. Because the graph is a tree plus one extra edge, the first edge that closes a loop is always the last one in the input that can be removed.

- Time: O(n · α(n)), where α is the inverse Ackermann function (practically constant)
- Space: O(n)

## 2. Leaf Pruning — `2_leaf_pruning.py`

A node with only one edge can never be part of a cycle. Count each node's edges, then repeatedly remove leaves (degree 1) and lower their neighbors' counts. What remains is exactly the cycle. Scan the edges from the end, and the first one whose two ends both survived is the answer.

- Time: O(n)
- Space: O(n)

## 3. DFS Connectivity Check — `3_dfs_connectivity.py`

Add the edges one at a time. Before adding an edge, run a DFS to see whether its two ends are already connected. If they are, this edge would close a loop, so return it. This is the most direct idea, but it repeats a search for every edge.

- Time: O(n²)
- Space: O(n)
