# Maximum Depth of Binary Tree — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Recursive DFS — `1_recursive_dfs.kt`

The depth of a tree is defined in terms of its subtrees: an empty tree has
depth 0, and any other tree is one level deeper than the deeper of its two
children. That definition translates directly into a recursive function. Ask
each child for its depth, take the larger answer, and add one for the current
node. The recursion bottoms out at the empty spots below the leaves, and the
answers bubble back up to the root.

- Time: O(n) — every node is visited once
- Space: O(h) for the call stack, where h is the tree height

## 2. Iterative BFS — `2_iterative_bfs.kt`

Instead of diving down, sweep across the tree one level at a time. Start with a
queue holding just the root. On each round, note how many nodes are currently
in the queue — that is exactly one level — pop that many, and push their
children for the next round. Every round you complete is one more level of
depth, so when the queue finally empties, the number of rounds is the answer.

- Time: O(n)
- Space: O(w) for the queue, where w is the widest level

## 3. Iterative DFS with Stack — `3_iterative_dfs_stack.kt`

This is the recursive idea with an explicit stack in place of the call stack.
Each stack entry pairs a node with the depth it sits at, starting with the root
at depth 1. Pop an entry, update the best depth seen so far, and push each
child tagged with depth plus one. Because every node carries its own depth
label, no information is lost when you jump between branches, and the largest
label you ever see is the maximum depth.

- Time: O(n)
- Space: O(h) for the stack
