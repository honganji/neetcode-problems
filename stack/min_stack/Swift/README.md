# Min Stack — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Two Stacks — `1_two_stacks.swift`

Keep a second stack that runs alongside the main one. Every time you push a
value, also push the smaller of that value and the current minimum onto the
second stack, so its top always says "the minimum of everything currently in
the main stack." Popping removes one entry from each, which automatically
restores whatever the minimum was before that push. Because the answer is
always sitting on top of the helper stack, `getMin` is a single lookup.

- Time: O(1) for every operation
- Space: O(n) for the second stack

## 2. Min Difference — `2_min_difference.swift`

Instead of storing raw values, store how far each value is from the minimum at
the moment it was pushed, and keep the real minimum in a single variable. A
stored difference below zero means "this push became the new minimum," which
tells you two things: the actual value is the current minimum, and the previous
minimum can be recovered as `min - difference` when it is popped. That is
enough to rebuild the old minimum on every pop without a second stack. The
subtraction can exceed 32 bits, so the stack holds 64-bit numbers.

- Time: O(1) for every operation
- Space: O(n), one stack plus a single integer

## 3. Linear Scan — `3_linear_scan.swift`

Use an ordinary stack and do nothing special on push or pop. When asked for
the minimum, just walk through every element and keep the smallest one seen.
It is trivially correct, but `getMin` now costs time proportional to the
stack size, which breaks the problem's constant-time requirement.

- Time: O(1) for push, pop, and top; O(n) for getMin
- Space: O(n) for the stack
