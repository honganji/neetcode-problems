# Invert Binary Tree — Python

Solutions ordered from most to least efficient.

All three approaches visit every node exactly once and swap its children, so
they are all O(n) in time. The ranking below is by memory profile and
simplicity rather than by a real speed difference.

## 1. ⭐ Recursive DFS — `1_recursive_dfs.py`

Mirroring a tree is the same as mirroring each subtree and then swapping the
two of them. So for any node, invert its left subtree, invert its right
subtree, and hang them back on the opposite sides. The recursion bottoms out
at an empty subtree, which is already its own mirror. This is the shortest and
clearest version, and the call stack only grows as deep as the tree.

- Time: O(n)
- Space: O(h) for the call stack, where h is the tree height (O(n) worst case
  for a skewed tree)

## 2. Iterative BFS — `2_iterative_bfs.py`

Walk the tree level by level with a queue. Pull a node off the front, swap its
two children, then push whichever children exist onto the back so they get
processed later. Every node gets swapped exactly once, and because nothing is
recursive there is no risk of a stack overflow on a very deep tree. The queue
holds at most one level at a time, so its size is bounded by the widest level.

- Time: O(n)
- Space: O(w) for the queue, where w is the maximum width of the tree (up to
  roughly n/2 for a full tree)

## 3. Iterative DFS with Stack — `3_iterative_dfs_stack.py`

Same idea as the recursive version, but you manage the stack yourself instead
of letting the language do it. Pop a node, swap its children, push the
children that exist. The order of visiting doesn't matter for this problem
because each node's swap is independent of every other node's. This trades the
elegance of recursion for a few extra lines, which is why it ranks last even
though it uses the same memory as approach 1.

- Time: O(n)
- Space: O(h) for the explicit stack, where h is the tree height
