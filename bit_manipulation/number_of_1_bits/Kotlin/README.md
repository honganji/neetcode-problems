# Number of 1 Bits — Kotlin

Solutions ordered from most to least efficient. The input is an unsigned 32-bit value passed as a Kotlin `Int`, so a value with the top bit set shows up as a negative number. The solutions use unsigned shifts (`ushr`) and bit operations that work the same way for negative values.

## 1. ⭐ Parallel bit count — `1_parallel_count.kt`

Instead of looking at bits one at a time, this counts many bits at once. First it counts the 1s inside every 2-bit pair, then inside every 4-bit group, then inside every byte. A final multiplication adds the four byte counts into the top byte. `Int` multiplication wraps around at 32 bits, which is exactly what we need here. The number of steps is fixed, so the work never depends on the input.

- Time: O(1), a fixed number of operations for a 32-bit input
- Space: O(1)

## 2. Clear the lowest bit (Kernighan) — `2_kernighan.kt`

`x and (x - 1)` removes the lowest set bit of `x`. For example, `1100 and 1011 = 1000`. So we keep removing the lowest 1 and count how many times we do it until `x` becomes 0. The loop runs once per 1 bit, so it is fast when the number has few 1s.

- Time: O(k), where k is the number of 1 bits (at most 32)
- Space: O(1)

## 3. Check each bit with a shift — `3_bit_shift.kt`

Look at each of the 32 bit positions in turn. `(n ushr i) and 1` is 1 exactly when bit `i` is set, so we add it to the count. This is the most direct approach, but it always does all 32 checks, even when there are few 1s.

- Time: O(32), which is O(1) because the width is fixed
- Space: O(1)
