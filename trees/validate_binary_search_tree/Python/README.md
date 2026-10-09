# Validate Binary Search Tree — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Recursive Bounds — `1_recursive_bounds.py`

Checking only that each node is bigger than its left child and smaller than its
right child is not enough — a value deep in the left subtree could still be
larger than an ancestor. Instead, pass down the range every node is allowed to
be in. The root can be anything, so its range is open on both ends. Going left
tightens the upper bound to the current value; going right tightens the lower
bound. If any node falls outside its range, the tree is not a BST. The bounds
are left as "missing" (`None`) rather than fake extreme numbers so that nodes
holding the smallest or largest possible 32-bit value are still handled.

- Time: O(n)
- Space: O(h) for the recursion stack, where h is the tree height

## 2. Iterative In-Order — `2_inorder_iterative.py`

An in-order traversal (left, node, right) of a valid BST visits values in
strictly increasing order, so you only ever need to compare each value against
the one before it. Use an explicit stack: slide down the left spine pushing
nodes, pop one, compare it to the previous value, then move into its right
subtree. The moment a value is less than or equal to the previous one, return
`False`. Keeping just the previous value avoids storing the whole
traversal.

- Time: O(n)
- Space: O(h) for the stack

## 3. In-Order to Array — `3_inorder_to_array.py`

The same in-order idea, but split into two obvious steps: first collect every
value in in-order sequence into a list, then scan the list and confirm each
entry is strictly greater than the one before. It is the easiest version to
reason about, but it always visits the whole tree and holds every value in
memory even if a violation appears early.

- Time: O(n)
- Space: O(n) for the list of values
