# Sum of Two Integers — Dart

Solutions ordered from most to least efficient.

Only two genuinely different techniques apply to this problem. A third idea (a per-bit full-adder loop) is the same carry logic as solution 1, written out one bit at a time, so it is not listed separately.

Dart `int` is 64-bit, not 32-bit, so the code does not wrap to 32 bits. This is fine for LeetCode's inputs (between -1000 and 1000), where the sum is always exact.

## 1. ⭐ Bitwise carry — `1_bitwise_carry.dart`

Adding two numbers is really two jobs. XOR adds the bits without looking at carries (`1 ^ 0 = 1`, `1 ^ 1 = 0`). AND finds the places where a carry happens (`1 & 1`), and a carry moves one position to the left, so we shift the AND result left by one. Repeat with the new pair until no carries are left. Each round pushes carries one bit further, so there are at most 64 rounds for Dart's 64-bit `int`.

- Time: O(1) (at most 64 rounds)
- Space: O(1)

## 2. Repeated increment — `2_repeated_increment.dart`

Adding `b` is the same as adding 1 to `a`, `b` times. Adding 1 with bits: turn the trailing 1s into 0s until you hit a 0, then turn that 0 into a 1. For negative `b`, do the same with subtracting 1. Subtracting 1 is `~(~x + 1)`, because `~x` is `-x - 1`.

- Time: O(|b|) (|b| is at most 1000)
- Space: O(1)
