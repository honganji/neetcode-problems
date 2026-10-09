# Balanced Binary Tree — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Bottom-Up Height — `1_bottom_up_height.swift`

Compute each subtree's height from the leaves upward, but let the height
function also carry a verdict: if a subtree is ever found to be unbalanced,
return `-1` instead of a real height. A parent first asks its children for
their heights; if either child reports `-1`, or the two heights differ by more
than one, the parent reports `-1` too. Otherwise it reports one more than the
taller child. Every node is visited exactly once, and the whole tree is
balanced only if the root doesn't end up reporting `-1`.

- Time: O(n)
- Space: O(h) for the recursion stack, where h is the tree height

## 2. Iterative Post-Order — `2_iterative_postorder.swift`

The same idea without recursion. Use an explicit stack where each node is
pushed twice: once to schedule its children, and once more to be processed
after both children are finished. When a node comes off the stack the second
time, its children's heights are already stored in a map, so you can compare
them, bail out with `false` if they differ by more than one, and record this
node's own height. Reaching the end of the stack means every node passed.

- Time: O(n)
- Space: O(n) for the stack and the height map

## 3. Top-Down — `3_top_down.swift`

Take the definition literally. For each node, measure the height of its left
and right subtrees with a plain height function, check that they differ by at
most one, and then ask the same question of both children. This is easy to
read but repeats work: a node deep in the tree has its height recomputed once
for every ancestor, which is what makes the worst case quadratic.

- Time: O(n²) in the worst case (a skewed tree), O(n log n) when balanced
- Space: O(h) for the recursion stack
