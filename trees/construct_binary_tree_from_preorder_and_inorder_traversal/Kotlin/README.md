# Construct Binary Tree from Preorder and Inorder Traversal — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Hash Map Index + Recursion — `1_hashmap_index_recursion.kt`

Preorder always lists a subtree's root first, and inorder lists everything in
that root's left subtree before it and everything in its right subtree after
it. So the next unused preorder value is the root of whatever range of inorder
you're currently looking at, and finding that value's position in inorder tells
you exactly how to split the range into left and right halves. A map from value
to inorder index makes that lookup instant, and a shared pointer walking
through preorder hands out roots in the right order. Each recursive call works
on a pair of indices instead of copying arrays, so every node is touched once.

- Time: O(n)
- Space: O(n) for the map, plus O(h) recursion depth

## 2. Iterative Stack — `2_iterative_stack.kt`

Walk preorder left to right, keeping a stack of nodes whose right child hasn't
been decided yet. As long as the top of the stack is not the next inorder
value, the tree is still descending leftward, so the new node is the top's
left child. When the top does match the next inorder value, you've finished
that node's left subtree — pop every node that matches the inorder sequence,
and the last one popped is the parent whose right child the new node becomes.
Inorder acts as a signal for when to turn right, so the whole tree is built in
one pass with no recursion.

- Time: O(n)
- Space: O(n) for the stack in the worst case

## 3. Slicing + Recursion — `3_slicing_recursion.kt`

The same root-first insight, written in the most direct way: the first
preorder value is the root, search inorder linearly to find it, then slice both
arrays into the parts belonging to the left subtree and the right subtree and
recurse on each. It's the easiest version to read, but each level of recursion
scans and copies arrays, so a skewed tree can cost quadratic time and memory.

- Time: O(n²) worst case for the linear searches and slicing
- Space: O(n²) worst case for the sliced copies
