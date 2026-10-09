# Graph Valid Tree — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Union-Find (Disjoint Set) — `1_union_find.kt`

Start with every node in its own group. Each edge joins two groups. If an edge connects two nodes that are already in the same group, it closes a cycle, so the graph is not a tree. A tree on `n` nodes has exactly `n - 1` edges, so that count is checked first. If there is no cycle and there are `n - 1` edges, all nodes end up in one group.

- Time: O(n · α(n)), effectively O(n) (α is the inverse Ackermann function, which is at most 4 for any realistic n)
- Space: O(n)

## 2. Depth-First Search — `2_dfs.kt`

Build an adjacency list, then walk the graph from node 0. Each step remembers the node it came from, so the edge back to the parent is not mistaken for a cycle. If the walk reaches a node that was already visited by another route, there is a cycle. At the end, every node must have been visited, which means the graph is connected.

- Time: O(n)
- Space: O(n)

## 3. Leaf Trimming — `3_leaf_trimming.kt`

A leaf (a node with one edge) cannot be part of a cycle. Repeatedly remove leaves. In a tree, every node eventually gets removed. If a cycle exists, the nodes on it always keep at least two neighbors, so they are never removed. This method also needs the `n - 1` edge check, because a disconnected forest would also be fully trimmed. It works, but it builds the most extra structure (adjacency list, degree array, queue), so it is the least efficient in practice.

- Time: O(n)
- Space: O(n)
