# Reverse Bits — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Mask swap (divide and conquer) — `1_mask_swap.dart`

Treat the 32 bits as groups. First swap every neighbouring pair of single bits, then every neighbouring pair of 2-bit groups, then 4-bit groups, then 8-bit groups, and finally the two 16-bit halves. Each step doubles the group size, so five swaps reverse all 32 bits. The masks select the bits that move in each step.

- Time: O(1) — always exactly 5 swap steps
- Space: O(1)

## 2. Lookup table by byte — `2_lookup_table.dart`

Reversing 8 bits is a small fixed problem, so build a table once that holds the reversed value of all 256 bytes. To reverse a 32-bit number, split it into four bytes, look up each one in the table, and put it in the mirrored position. This is the fastest per call when `reverseBits` is called many times, since the table is reused (the LeetCode follow-up).

- Time: O(1) — 4 lookups
- Space: O(1) — a fixed 256-entry table

## 3. Bit-by-bit loop — `3_bit_by_bit.dart`

Take bits off `n` from the lowest end, one at a time, and push each one onto the bottom of the result. Because each new bit lands below the ones already placed, the first bit read ends up at the top, which is the reversed order.

- Time: O(1) — always 32 iterations
- Space: O(1)
