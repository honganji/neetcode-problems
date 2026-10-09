# Lowest Common Ancestor of a Binary Search Tree — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative BST Walk — `1_iterative_bst_walk.py`

In a BST every value in the left subtree is smaller than the node and every
value in the right subtree is larger. So start at the root and compare: if
both `p` and `q` are smaller than the current node, they both live on the
left, and the answer must be down there too; if both are larger, go right.
The first node where they split (one on each side, or the node itself is
`p` or `q`) is the lowest common ancestor, because any deeper node can only
hold one of them. A simple loop does this with no extra memory at all.

- Time: O(h), where h is the height of the tree
- Space: O(1)

## 2. Recursive BST Walk — `2_recursive_bst_walk.py`

Exactly the same idea expressed as recursion: if both targets are smaller
than the node, recurse into the left child; if both are larger, recurse into
the right child; otherwise the node itself is the split point, so return it.
It reads very naturally but each recursive step adds a frame to the call
stack, so it uses memory proportional to the depth you descend.

- Time: O(h), where h is the height of the tree
- Space: O(h) for the recursion stack

## 3. Generic LCA — `3_generic_lca.py`

This is the fallback that works on any binary tree, not just a BST. Search
both subtrees for `p` and `q`. A call returns a node when it finds `p`, `q`,
or an ancestor of both. If the left and right searches each return something,
`p` and `q` are on different sides, so the current node is their meeting
point. If only one side returns something, pass that result up unchanged.
Because it ignores the ordering, it may have to visit every node.

- Time: O(n)
- Space: O(h) for the recursion stack
