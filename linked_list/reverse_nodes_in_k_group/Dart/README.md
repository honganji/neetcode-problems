# Reverse Nodes in k-Group — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative In-Place — `1_iterative_in_place.dart`

Put a dummy node in front of the list so the first group is handled the same
way as every other one. Standing just before a group, walk forward `k` steps
to find its last node; if you run out of nodes first, the remaining tail is
shorter than `k` and must be left alone, so you are done. Otherwise reverse
the `k` nodes by flipping their `next` pointers one at a time, starting the
chain at the node that follows the group so the reversed block already points
to the rest of the list. Finally hook the node before the group onto the new
front, and move the "before" pointer to what is now the group's last node.
Only the links change, never the values.

- Time: O(n)
- Space: O(1)

## 2. Recursive — `2_recursive.dart`

Think of the problem as "reverse the first `k` nodes, then do the same thing
to whatever is left". First count forward to make sure there really are `k`
nodes; if there aren't, return the head unchanged and the tail keeps its
order. If there are, reverse exactly `k` nodes with the usual three-pointer
trick. The original head is now the end of this block, so point its `next`
at the recursive result for the rest of the list and return the new front.

- Time: O(n)
- Space: O(n / k) for the recursion stack, one frame per group

## 3. Array of Nodes — `3_array_of_nodes.dart`

Collect every node into an array first. Now the groups are just slices of
length `k`, and reversing a slice in an array is easy; any partial slice at
the end is skipped so it keeps its order. Once the array holds the nodes in
their final order, walk it once and rewire each node's `next` to the one that
follows it, clearing the last node's `next`. It is the most direct way to see
the problem, at the cost of extra memory.

- Time: O(n)
- Space: O(n) for the array of nodes
