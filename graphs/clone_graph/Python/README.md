# Clone Graph — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Depth-First Search with a Hash Map — `1_dfs.py`

Walk the graph depth-first, starting at the given node. Keep a map from each original node to its copy. When you reach a node, if it already has a copy in the map, reuse that copy. Otherwise make a new copy, record it in the map, and then copy each of its neighbors the same way. Recording the copy *before* visiting neighbors is what handles cycles: when the walk comes back around to a node that is already in progress, the map returns its copy instead of looping forever.

- Time: O(V + E) — each node is copied once and each neighbor list is read once.
- Space: O(V) for the map and the recursion stack.

## 2. Breadth-First Search with a Hash Map — `2_bfs.py`

Use the same map idea, but walk the graph level by level with a queue. Copy the start node, put it in the map, and queue the original. Each time you pop a node, look at its neighbors: if a neighbor has no copy yet, create one and queue the neighbor. Then add the neighbor's copy to the current node's copy's neighbor list. Because a node is only queued the first time it is seen, every node is processed exactly once.

- Time: O(V + E)
- Space: O(V) for the map and the queue.

## 3. Brute Force List Search — `3_bruteforce.py`

Use the same recursive walk as the first solution, but instead of a hash map, keep a plain list of (original, copy) pairs. To check whether a node has already been copied, scan the list until you find it. This gives the right answer, but every lookup walks through the list, so it gets slow as the graph grows.

- Time: O(V · E) — every neighbor link triggers a scan of up to V pairs.
- Space: O(V) for the list and the recursion stack.
