# Number of Connected Components in an Undirected Graph — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Union-Find — `1_union_find.kt`

Start by treating every node as its own group. Go through the edges one at a time: if an edge connects two nodes that are in different groups, merge the groups and the count goes down by one. Each group is stored as a tree with a `parent` array, and `find` walks up to the group's root. Path halving and merging the smaller tree under the bigger one keep these trees very shallow, so each edge is handled almost instantly.

- Time: O(E · α(n)), where α is the inverse Ackermann function (effectively constant), so roughly O(n + E)
- Space: O(n)

## 2. DFS — `2_dfs.kt`

Build an adjacency list so each node knows its neighbors. Walk through the nodes in order. Whenever you find one that hasn't been visited, that is a brand-new component: count it, then use a stack to visit everything reachable from it. Nodes visited along the way are marked so they are never counted again.

- Time: O(n + E)
- Space: O(n + E) for the adjacency list

## 3. Label Propagation — `3_label_propagation.kt`

Give every node its own number as a label. Then repeat: for each edge, both endpoints adopt the smaller of their two labels. Labels only ever go down, so the process eventually stops. At that point every component shares the label of its smallest node, which means only that smallest node still holds its own number. Counting the nodes where `label[i] == i` gives the answer.

- Time: O(n · E) in the worst case, because the number of passes can reach n
- Space: O(n)
