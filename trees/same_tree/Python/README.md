# Same Tree — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Recursive DFS — `1_recursive_dfs.py`

Two trees are the same when their roots match and their left subtrees are the
same and their right subtrees are the same — that sentence is already a
recursive definition, so the code just follows it. Two empty trees are trivially
identical, so return `True` when both nodes are missing. If only one is missing,
or the values differ, the trees diverge right here and you can return `False`
without looking any further. Otherwise recurse into both pairs of children.

- Time: O(n), where n is the number of nodes in the smaller tree
- Space: O(h) for the call stack, where h is the tree height

## 2. Iterative BFS — `2_iterative_bfs.py`

Same comparison, but walk the two trees side by side with a queue instead of
the call stack. Each queue entry is a pair of nodes that must match: one from
each tree at the same position. Pop a pair, check it the same way as the
recursive version, and if it passes push its left children as a pair and its
right children as a pair. If the queue empties without finding a mismatch the
trees are identical. This avoids deep recursion on very tall trees.

- Time: O(n)
- Space: O(w) for the queue, where w is the widest level of the tree

## 3. Serialize and Compare — `3_serialize_compare.py`

Turn each tree into a string by visiting its nodes in pre-order and writing a
marker like `#` wherever a child is missing. The null markers are what make
this work: without them, different shapes could produce the same sequence of
values. With them, the string pins down both the structure and the values, so
two trees are the same exactly when their strings are equal. It does more
work than the direct comparison because it always walks both trees fully, even
if they differ at the root.

- Time: O(n)
- Space: O(n) for the two serialized strings
