# Subtree of Another Tree — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Serialize + KMP Search — `1_serialize_and_search.swift`

Flatten each tree into a string by walking it in pre-order and writing every
node, including the empty children, as a marker. If `subRoot` really is a
subtree of `root`, its string must appear verbatim inside `root`'s string,
so the question becomes plain substring search. Two details keep that honest:
null children are written out (so shape is captured, not just values), and a
delimiter goes before every value (so `2` can't accidentally match inside
`12`). A hand-written KMP search then finds the pattern in a single pass
instead of restarting at every position.

- Time: O(m + n) to serialize both trees and run KMP
- Space: O(m + n) for the two strings and the KMP failure table

## 2. DFS + Same Tree — `2_dfs_same_tree.swift`

Visit every node of `root` and ask the simpler question "is the tree rooted
here identical to `subRoot`?" Two trees are identical when their root values
match and their left and right subtrees are identical in turn, which is a
small recursion of its own. An empty `subRoot` is always a subtree, and an
empty `root` can't contain a non-empty one. The answer is `true` as soon as
any starting node passes the identity check.

- Time: O(m · n) — the identity check can cost O(m) at each of n nodes
- Space: O(h) recursion depth, where h is the height of `root`

## 3. Subtree Keys — `3_hash_subtrees.swift`

Build a text key for every subtree from the bottom up: a node's key is its
value wrapped together with the keys of its left and right children, and
empty children get a fixed marker. Two subtrees have the same key exactly when
they have the same shape and values. Compute `subRoot`'s key once, record a
key for every node in `root`, and check whether any of them matches. Because
each key spells out the whole subtree below it, this is collision-free but
costs a lot of string building — deeper nodes get copied into every ancestor's
key.

- Time: O(m · n) in the worst case for building and comparing the keys
- Space: O(n · m) for the per-node keys
