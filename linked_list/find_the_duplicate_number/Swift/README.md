# Find the Duplicate Number — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Floyd's Cycle Detection — `1_floyd_cycle_detection.swift`

Read each index as a node and the value stored there as a pointer to the next
node: starting at index 0, you go to index `nums[0]`, then to
`nums[nums[0]]`, and so on. Every value is between 1 and n, so each hop lands
on a valid index and the walk never falls off the end, which means it must
eventually loop. Because the duplicate value is stored at two different
indices, two nodes both point at the same next node, and that node is the
entrance of the loop — it is the only node with two incoming arrows. Index 0
is never pointed at (no value is 0), so it is outside the loop and the walk
from it is a linked list with a cycle. Floyd's trick finds the entrance: move
a slow pointer one hop and a fast pointer two hops until they meet, then
restart one pointer at index 0 and move both one hop at a time; where they
meet next is the cycle entrance, and its index is the duplicate value.

- Time: O(n)
- Space: O(1), and the array is never written to

## 2. Binary Search on Value — `2_binary_search_on_value.swift`

Instead of searching positions, search the range of possible answers, 1 to n.
Pick a midpoint and count how many numbers in the array are less than or equal
to it. If all values were distinct there could be at most `mid` such numbers,
so a count larger than `mid` proves the duplicate is somewhere in the lower
half; otherwise it must be in the upper half. Halving the value range each
round narrows it down to the single repeated number.

- Time: O(n log n) — a full count for each of log n halvings
- Space: O(1)

## 3. Hash Set — `3_hashset.swift`

Walk through the array once, adding each number to a set as you go. A set
can't hold duplicate values, so the first number that is already present when
you try to add it is the repeated one — return it right away. This is the
simplest approach, but the set grows with the input, so it breaks the problem's
O(1) extra-space requirement.

- Time: O(n)
- Space: O(n) for the set — violates the constant-space constraint
