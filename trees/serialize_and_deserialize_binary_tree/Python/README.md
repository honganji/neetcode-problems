# Serialize and Deserialize Binary Tree — Python

Solutions ordered from most to least efficient. All three visit every node
once in both directions, so they are all O(n) time and O(n) space; the order
reflects how simple each one is to write and reason about.

## 1. ⭐ Pre-order DFS — `1_preorder_dfs.py`

Write the tree down in pre-order: the node's value first, then everything in
its left subtree, then everything in its right subtree. The trick that makes
this reversible is recording a marker (`N`) every time you hit an empty spot.
With those markers in place, the string describes the shape of the tree
exactly, so reading it back is the mirror image of writing it: take the next
token, and if it is not a marker, make a node and recursively build its left
child and then its right child from the tokens that follow. A single cursor
over the tokens is all the state you need.

- Time: O(n) for both directions
- Space: O(n) for the token list, plus recursion depth up to the tree height

## 2. BFS Level Order — `2_bfs_level_order.py`

Record the tree one level at a time using a queue, writing `N` for each
missing child, which is the same format LeetCode uses to display trees. To
rebuild, create the root from the first token and push it onto a queue; then
repeatedly pop a node and hand it the next two tokens as its left and right
children, pushing any real child back onto the queue so it can receive its own
children later. The queue guarantees that parents are processed in the same
order their children were written, so the pairing always lines up.

- Time: O(n) for both directions
- Space: O(n) for the queue and the token list

## 3. Post-order DFS — `3_postorder_dfs.py`

Write the left subtree, then the right subtree, then the node's own value, again
with `N` markers for empty spots. That puts the root at the very end of the
string, so you rebuild by consuming tokens from the back: the last token is the
current node, the tokens just before it describe its right subtree, and the ones
before those describe its left subtree. It works for the same reason pre-order
does, but having to build the right child before the left and read the string
backwards makes it a little harder to follow, which is why it is ranked last.

- Time: O(n) for both directions
- Space: O(n) for the token list, plus recursion depth up to the tree height
