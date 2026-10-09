# Binary Tree Right Side View — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ DFS, Right Child First — `1_dfs_right_first.swift`

Imagine standing to the right of the tree: at every depth you see exactly one
node, the rightmost one that exists on that level. Walk the tree depth-first,
but always step into the right child before the left one. That way the first
node you ever reach at a given depth is guaranteed to be the rightmost node of
that level, so record it the moment the depth is one you have not seen yet.
Later visits to the same depth (coming from left subtrees) are simply ignored,
which handles the case where a left branch is deeper than the right one.

- Time: O(n)
- Space: O(h) for the recursion stack, where h is the tree height

## 2. BFS, Last Node in Each Level — `2_bfs_last_in_level.swift`

Level-order traversal visits the tree one row at a time, left to right. Count
how many nodes are in the queue when a row begins so you know where the row
ends; the last node pulled from that row is the one visible from the right.
Push each node's children as you go so the next row is ready when this one is
done. Nothing is stored beyond the current row of the queue.

- Time: O(n)
- Space: O(w), where w is the widest level of the tree

## 3. Full Level Order, Then Pick — `3_level_order_then_pick.swift`

Do the same level-order traversal, but keep the complete list of values for
every level instead of just the last one. Once the whole tree has been laid out
row by row, run through the rows and take the final value from each. It is the
most literal reading of the problem and easy to follow, but it stores every
node's value before producing an answer that only needs one value per level.

- Time: O(n)
- Space: O(n) for the per-level lists
