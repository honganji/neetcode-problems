# Reverse Linked List — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Iterative Pointer Flip — `1_iterative.py`

Walk down the list one node at a time, carrying a `prev` pointer that starts
out as `None`. At each node, remember where its `next` points, then turn
that `next` around to point at `prev` instead. Step `prev` and `curr`
forward and repeat. The only tricky part is saving the old `next` before you
overwrite it, or you lose the rest of the list. When `curr` runs off the
end, `prev` is sitting on the last original node, which is the new head.

- Time: O(n)
- Space: O(1)

## 2. Recursive — `2_recursive.py`

Trust the recursion to reverse everything after the current node and hand
back the new head. Once that is done, the current node's old `next` is now
the tail of the reversed part, so point that tail back at the current node
and cut the current node's own `next` to `None`. A list of zero or one
node is already reversed, which is the base case. The new head found at the
bottom of the recursion is simply passed back up unchanged.

- Time: O(n)
- Space: O(n) for the recursion stack

## 3. Array Rebuild — `3_array_rebuild.py`

Sidestep pointer juggling entirely: walk the list once and copy every value
into an array, then walk the array backwards and build a brand-new list from
those values. This is easy to get right but costs an extra copy of the whole
list, and it creates fresh nodes instead of reusing the originals, which is
not what the problem is really asking you to practice.

- Time: O(n)
- Space: O(n) for the array and the new nodes
