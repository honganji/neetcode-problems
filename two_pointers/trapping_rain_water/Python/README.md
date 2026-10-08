# Trapping Rain Water — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Two Pointers — `1_two_pointers.py`

The water above any bar is decided by the shorter of the tallest bar to its
left and the tallest bar to its right. Start a pointer at each end and track
the tallest bar each pointer has passed so far. Whichever side currently has
the lower bar is the side whose limit is already known: the other side is
guaranteed to have something at least as tall, so the water above that bar is
its running max minus its height. Add that, step the pointer inward, and
repeat until the pointers meet. One pass, no extra arrays.

- Time: O(n)
- Space: O(1)

## 2. Prefix Max Arrays — `2_prefix_max_arrays.py`

Make the "tallest bar on each side" idea explicit. Sweep left to right filling
an array where each slot holds the tallest bar seen so far, then sweep right
to left to build the same thing from the other direction. Now every index knows
its left wall and right wall, so the water sitting on it is simply the shorter
wall minus its own height. Sum those values for the answer. This is the most
direct translation of the idea, at the cost of two extra arrays.

- Time: O(n) — three linear passes
- Space: O(n) for the two prefix-max arrays

## 3. Monotonic Stack — `3_monotonic_stack.py`

Instead of measuring water column by column, measure it in horizontal layers.
Keep a stack of bar indices whose heights only go down. When a taller bar
arrives, it closes a basin: pop the lower bar as the floor, and the new stack
top is the left wall. The layer of water is as wide as the gap between the
walls and as deep as the shorter wall minus the floor. Keep popping while the
new bar is taller, then push it. Same big-O as the prefix arrays, but with more
bookkeeping, so it ranks third; it is still worth knowing because the same
stack pattern solves many "next greater element" problems.

- Time: O(n) — each index is pushed and popped at most once
- Space: O(n) for the stack
