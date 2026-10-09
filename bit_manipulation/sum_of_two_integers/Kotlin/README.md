# Sum of Two Integers — Kotlin

Solutions ordered from most to least efficient.

Only two genuinely different techniques apply to this problem. A third idea (a per-bit full-adder loop) is the same carry logic as solution 1, written out one bit at a time, so it is not listed separately.

Kotlin `Int` is 32-bit and wraps on overflow, so no masking is needed.

## 1. ⭐ Bitwise carry — `1_bitwise_carry.kt`

Adding two numbers is really two jobs. XOR adds the bits without looking at carries (`1 ^ 0 = 1`, `1 ^ 1 = 0`). AND finds the places where a carry happens (`1 & 1`), and a carry moves one position to the left, so we shift the AND result left by one. Repeat with the new pair until no carries are left. Each round pushes carries one bit further, so for 32-bit numbers there are at most 32 rounds.

- Time: O(1) (at most 32 rounds)
- Space: O(1)

## 2. Repeated increment — `2_repeated_increment.kt`

Adding `b` is the same as adding 1 to `a`, `b` times. Adding 1 with bits: turn the trailing 1s into 0s until you hit a 0, then turn that 0 into a 1. For negative `b`, do the same with subtracting 1. Subtracting 1 is `inv(increment(inv(x)))`, because `inv(x)` is `-x - 1`.

- Time: O(|b|) (each step is O(1) for 32-bit numbers; |b| is at most 1000)
- Space: O(1)
