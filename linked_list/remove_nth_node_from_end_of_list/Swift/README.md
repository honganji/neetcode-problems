# Remove Nth Node From End of List — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Two Pointers (One Pass) — `1_two_pointers_one_pass.swift`

Start two pointers at a dummy node placed in front of the head. Move the
`fast` pointer ahead by `n + 1` steps, then advance both pointers together
until `fast` falls off the end of the list. Because the gap between them never
changes, `slow` now sits exactly one node before the one to delete, so
skipping `slow.next` removes it. The dummy node means removing the head needs
no special handling — you just return `dummy.next`.

- Time: O(L), one pass over the list
- Space: O(1)

## 2. Two Pass (Count Length) — `2_two_pass_length.swift`

Removing the nth node from the end is the same as removing node `L - n`
counting from the front (zero-based), where `L` is the length of the list.
So walk the list once to count it, then walk again from a dummy node to the
node just before position `L - n` and unlink the following node. It visits
the list twice but is easy to reason about.

- Time: O(L), two passes over the list
- Space: O(1)

## 3. Array of Nodes — `3_array_of_nodes.swift`

Walk the list and store every node in an array so you can address nodes by
position. The node to remove is at index `count - n`; if that index is 0 the
head is removed and the answer is simply `head.next`. Otherwise point the
node at `index - 1` past the one at `index`. This trades extra memory for the
convenience of random access.

- Time: O(L)
- Space: O(L) for the array of node references
