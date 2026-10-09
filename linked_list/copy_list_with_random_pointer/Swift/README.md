# Copy List with Random Pointer — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Interleaved Nodes — `1_interleaved_nodes.swift`

The hard part is finding the copy that matches each `random` target. Instead
of a lookup table, weave the copies into the original list: insert each copy
right after its original, so the list becomes A, A', B, B', C, C'. Now the
copy of any node is simply `node.next`, which means a copy's random pointer
is `original.random.next`. Set all the randoms with one walk, then split the
interleaved list back into originals and copies, restoring the original list
as you go.

- Time: O(n)
- Space: O(1) beyond the copied nodes themselves

## 2. Hash Map, Two Passes — `2_hashmap_two_pass.swift`

Make the mapping from original to copy explicit. In a first pass create a bare
copy of every node and store it in a map keyed by the original. In a second
pass look up each original's `next` and `random` in the map and point the
copy at the corresponding copies. Because every node already has a copy by
the time wiring begins, it doesn't matter that random pointers can jump
forward or backward.

- Time: O(n)
- Space: O(n) for the map

## 3. Recursive Hash Map — `3_hashmap_recursive.swift`

Treat the list as a graph and clone it with depth-first search. To copy a
node, first check a memo: if a copy already exists, return it so cycles and
shared targets don't cause infinite loops or duplicate nodes. Otherwise make a
new node, record it in the memo before recursing, then recursively copy its
`next` and `random`. The memo guarantees each original is cloned exactly once.

- Time: O(n)
- Space: O(n) for the memo, plus O(n) recursion depth
