# Largest Rectangle in Histogram — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Monotonic Stack — `1_monotonic_stack.kt`

A rectangle using bar `h` as its height can stretch left and right only as
far as the bars stay at least `h` tall. Scan once while keeping a stack of
bars whose heights are increasing. When a shorter bar arrives, every taller bar
on the stack has just hit its right wall, so pop each one and compute its area
using the index where it started. The new bar then inherits the leftmost start
of the bars it popped, because it can extend back over all of them. Whatever
is still on the stack at the end reaches all the way to the right edge.

- Time: O(n) — every bar is pushed and popped at most once
- Space: O(n) for the stack

## 2. Divide and Conquer — `2_divide_and_conquer.kt`

The shortest bar in a range sets a hard ceiling on any rectangle spanning the
whole range, so the best rectangle there is either the full width times that
minimum, or lies entirely to the left or entirely to the right of it. Find the
minimum, take the full-width area, and recurse on both sides. Each level
narrows the problem until a range is empty.

- Time: O(n log n) on average, O(n²) worst case (already sorted input makes
  every split lopsided)
- Space: O(log n) recursion on average, O(n) worst case

## 3. Brute Force — `3_bruteforce.kt`

Treat each bar as the shortest bar of some rectangle. Walk left from it while
the neighbors are at least as tall, then walk right the same way; the distance
covered is the widest rectangle that bar can anchor. Multiply by the bar's
height and keep the largest result across all bars.

- Time: O(n²)
- Space: O(1)
