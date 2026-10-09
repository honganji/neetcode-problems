# Binary Tree Level Order Traversal — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ BFS with a Queue — `1_bfs_queue.kt`

A queue naturally visits the tree one level at a time: start with the root,
and every time you take a node out, put its children in at the back. The trick
for grouping by level is to note how many nodes are in the queue before each
round — exactly that many belong to the current level. Pop just those, collect
their values, and whatever got added meanwhile is the next level. Since
children go in left before right, each level comes out left-to-right.

- Time: O(n)
- Space: O(w) for the queue, where w is the widest level (plus the output)

## 2. DFS Carrying Depth — `2_dfs_with_depth.kt`

Recurse through the tree the usual way, but pass down how deep you are. When
you reach a node at a depth you haven't seen yet, start a new list for that
level; otherwise append to the existing one. Because the recursion always
explores a node's left subtree completely before its right, nodes land in each
level's list in left-to-right order even though you never walk a level as a
whole.

- Time: O(n)
- Space: O(h) for the recursion stack, where h is the tree height (plus the
  output)

## 3. Iterative DFS with a Stack — `3_iterative_dfs_stack.kt`

The same depth-tagging idea, but with an explicit stack of (node, depth) pairs
instead of recursion. A stack is last-in-first-out, so to visit the left child
first you push the right child before the left one. Each popped node is placed
into the list for its depth, and the push order guarantees every level fills
left-to-right. Handy when the tree is deep enough that recursion limits are a
concern.

- Time: O(n)
- Space: O(h) for the stack (plus the output)
