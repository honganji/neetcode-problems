# Missing Number — Dart

Solutions ordered from most to least efficient. XOR and the Gauss sum have the same complexity; XOR ranks first because it can never overflow.

## 1. ⭐ XOR — `1_xor.dart`

XOR cancels out any number that appears twice, since `a ^ a = 0`. Every value from `0` to `n` appears once in the list, except the missing one, and every index from `0` to `n - 1` is a partner for one value. XOR-ing all the indices (plus `n`, which has no index) together with all the values leaves only the missing number.

- Time: O(n)
- Space: O(1)

## 2. Gauss sum — `2_gauss_sum.dart`

The numbers `0` to `n` should add up to `n * (n + 1) / 2`. Subtract the sum of the numbers actually in the list, and the gap is the missing number. Dart `int` is 64-bit, so the sum is safe for the constraints of this problem.

- Time: O(n)
- Space: O(1)

## 3. Hash set — `3_hashset.dart`

Put every number into a `Set` so lookups are fast. Then check `0, 1, 2, ..., n` in turn; the first one not in the set is the answer. It is easy to reason about, but the set takes O(n) extra memory, which the follow-up in the problem asks us to avoid.

- Time: O(n)
- Space: O(n)
