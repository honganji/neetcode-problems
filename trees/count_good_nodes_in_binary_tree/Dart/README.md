# Count Good Nodes in Binary Tree — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Recursive DFS with Running Max — `1_dfs_running_max.dart`

A node is good when nothing above it on its root path is bigger, so the only
thing you need to know when you arrive at a node is the largest value seen so
far on the way down. Pass that number along as you recurse: if the current
value is at least as big, count it and the running max becomes the current
value. Each subtree only ever cares about the path above it, so the counts
from the left and right subtrees can simply be added together. Every node is
visited exactly once.

- Time: O(n)
- Space: O(h) for the recursion stack, where h is the tree height

## 2. BFS Carrying the Max — `2_bfs_with_max.dart`

Same idea, but level by level instead of depth first. Push the root into a
queue together with its own value as the starting max. Pop a pair, check
whether the node beats the max it was handed, and enqueue its children with
the updated max. Because each child receives the max from its own parent, the
path information survives even though the queue mixes nodes from different
branches.

- Time: O(n)
- Space: O(w) for the queue, where w is the widest level

## 3. Iterative DFS with Explicit Stack — `3_iterative_dfs_stack.dart`

Replace the recursion with a stack you manage yourself. Each stack entry holds
a node and the largest value on the path leading to it, which is exactly the
state the recursive call would carry in its arguments. Pop, test, push both
children with the new max. This visits nodes in the same depth-first order as
approach 1 and uses the same amount of memory, but trades the clean recursive
structure for immunity to deep-recursion limits.

- Time: O(n)
- Space: O(h) for the stack, where h is the tree height
