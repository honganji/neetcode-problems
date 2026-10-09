# Kth Smallest Element in a BST — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative In-Order with Early Stop — `1_inorder_iterative_early_stop.kt`

In a binary search tree, an in-order walk (left subtree, node, right subtree)
visits the values in sorted order, so the kth node you visit is the kth
smallest. Instead of recursing, keep an explicit stack: slide left as far as
you can, pushing nodes along the way, then pop one, count it, and step into its
right child. The moment the counter hits k you return that node's value and
never look at the rest of the tree.

- Time: O(h + k), where h is the tree height
- Space: O(h) for the stack

## 2. Recursive In-Order with Counter — `2_inorder_recursive_counter.kt`

Same in-order idea, but let the call stack do the bookkeeping. A counter shared
across the recursive calls ticks up each time a node is visited between its
left and right subtrees. When it reaches k, record the value and let every
pending call return early so no extra nodes are visited. The complexity
matches approach 1; it is ranked second only because recursion depth is bounded
by the language's call stack rather than a list you control.

- Time: O(h + k)
- Space: O(h) for the recursion stack

## 3. In-Order to Array — `3_inorder_to_array.kt`

Do a full in-order traversal and append every value to an array. Because the
traversal emits values in ascending order, the array is already sorted and the
answer is simply the element at index k - 1. Simple to write, but it always
touches every node and stores every value, even when k is 1.

- Time: O(n)
- Space: O(n) for the array
