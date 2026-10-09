# Counting Bits — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ DP with Right Shift — `1_dp_right_shift.swift`

Removing the last binary digit of `i` (that's `i >> 1`) gives a smaller number
whose answer we already know. Adding back that last digit (`i & 1`, which is 0 or
1) gives the answer for `i`. For example, `6` is `110`; `6 >> 1` is `3` (`11`,
which has two 1s), and the last digit is 0, so `6` also has two 1s.

- Time: O(n)
- Space: O(n) for the output array

## 2. DP with Lowest Set Bit — `2_dp_lowest_bit.swift`

`i & (i - 1)` turns off the lowest 1-bit of `i`, giving a smaller number with
exactly one fewer 1-bit. So the answer for `i` is the answer for `i & (i - 1)`
plus 1. For example, `6` is `110`; `6 & 5` is `4` (`100`, one 1-bit), so `6` has
one plus one, which is two 1s. This is a different recurrence from #1, with the
same complexity.

- Time: O(n)
- Space: O(n) for the output array

## 3. Kernighan's Loop per Number — `3_kernighan_popcount.swift`

Handle each number separately, without reusing earlier answers. Repeatedly run
`x & (x - 1)`, which clears the lowest 1-bit, and count the steps until `x` is 0.
Each step removes one 1-bit, so the loop runs once per 1-bit in `i`. This is
slower than the DP versions, but it shows the bit trick on its own.

- Time: O(n log n), since each number up to `n` has at most about log n bits
- Space: O(1) beyond the output array
