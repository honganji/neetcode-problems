# Diameter of Binary Tree — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Recursive Height — `1_recursive_height.py`

The longest path through any node is just the height of its left subtree plus
the height of its right subtree, counted in edges. So compute heights bottom-up
with a post-order recursion: once a node knows both children's heights, it
checks whether `left + right` beats the best diameter seen so far, then
reports `1 + max(left, right)` as its own height to its parent. Every node is
visited once and does constant work, so the running best is the answer when the
recursion unwinds.

- Time: O(n)
- Space: O(h) for the recursion stack, where h is the tree height

## 2. Iterative Post-Order — `2_iterative_postorder.py`

Same idea as the recursive version, but the call stack is replaced by an
explicit one so deep or skewed trees can't overflow it. Peek at the top node:
if it has a child whose height isn't known yet, push that child and keep going.
Only when both children have recorded heights is the node popped, its
`left + right` compared against the best, and its own height stored in a map
for its parent to read later. The map is what lets a parent "remember" results
without a return value.

- Time: O(n)
- Space: O(n) for the heights map and the stack

## 3. Brute Force — `3_bruteforce.py`

Ask the question directly at every node: "what is the longest path that bends
here?" That is the height of the left subtree plus the height of the right
subtree, each computed by a fresh recursive walk. Then recurse into both
children and keep the biggest of the three. It gives the right answer, but the
height work is repeated for every ancestor, so on a tall skewed tree each level
re-walks everything beneath it.

- Time: O(n²) in the worst case (a skewed tree), O(n log n) when balanced
- Space: O(h) for the recursion stack
