# Binary Tree Maximum Path Sum — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Recursive Gain (Post-Order) — `1_recursive_gain.kt`

Every path has a single highest node where it "bends": it climbs up from one
side, passes through that node, and heads down the other side. So visit each
node once and ask two questions. First, "what is the best path that bends
here?" — the node's value plus the best downward chain from each child, where a
negative chain is simply dropped (clamped at 0) because leaving it out is
better. That candidate updates a running best. Second, "what is the best
downward chain that starts here?" — the node's value plus the better of the two
child chains; that single number is all the parent needs. Because children are
answered before parents (post-order), each node is processed exactly once.

- Time: O(n)
- Space: O(h) for the recursion stack, where h is the tree height

## 2. Iterative Post-Order — `2_iterative_postorder.kt`

Same idea as above, but without recursion. An explicit stack holds each node
twice: once to schedule its children, and once more after they are finished so
the node itself can be processed. A map remembers the best downward chain each
finished node produced, so when a parent comes off the stack the second time it
can look up both children's chains, update the running best, and store its own
chain for its parent. This trades the call stack for a heap-allocated stack and
map, which matters on very deep trees that would otherwise overflow.

- Time: O(n)
- Space: O(n) for the stack and the gain map

## 3. Brute Force Per Node — `3_bruteforce_per_node.kt`

Treat every node as a possible bend point and compute its best path from
scratch: a separate helper walks down into each child subtree and returns the
best downward chain (never worse than 0). Taking the maximum of that candidate
and the answers for the left and right subtrees gives the result. It is correct
and easy to follow, but the helper re-explores the same subtrees over and over —
a node at depth d is visited by every ancestor — so a skewed tree costs
quadratic time.

- Time: O(n²) in the worst case (skewed tree); O(n log n) when balanced
- Space: O(h) for the recursion stack
