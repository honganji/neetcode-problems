# Reorder List — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Split, Reverse, Merge — `1_split_reverse_merge.kt`

The target order is "first node, last node, second node, second-to-last
node, …" — that is just the first half of the list zipped together with the
second half read backwards. So do exactly that in three passes. First find
the middle with a slow pointer that moves one step while a fast pointer moves
two: when the fast one runs out, the slow one is at the midpoint. Cut the list
there and reverse the second half in place by flipping each `next` pointer.
Finally walk both halves together, splicing one node from the reversed half
after each node of the front half. The front half is never shorter than the
back half, so the merge naturally ends on a front node.

- Time: O(n)
- Space: O(1) — only pointers are rewired, no extra storage

## 2. Array of Nodes — `2_array_of_nodes.kt`

The hard part of a singly linked list is that you can't walk backwards. An
array fixes that: walk the list once and store every node, and now you can
jump to any position by index. Keep one index at the front and one at the
back, and link front → back → next front → next back, stepping the two
indices toward each other. When they meet, that node is the new tail, so set
its `next` to `null` to stop the list from looping back on itself.

- Time: O(n)
- Space: O(n) for the array of node references

## 3. Repeated Tail Move — `3_repeated_tail_move.kt`

Do what the problem statement literally says: for the current node, go find
the last node of the remaining list, detach it, and insert it right after the
current node. Then skip past the node you just inserted and repeat on the
rest. Each step needs a full walk to reach the tail, and there are about n/2
steps, which is where the quadratic time comes from. Stop as soon as fewer
than three nodes remain, because a list of one or two nodes is already in
reordered form.

- Time: O(n²)
- Space: O(1)
