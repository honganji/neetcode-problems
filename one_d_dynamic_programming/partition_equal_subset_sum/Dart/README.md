# Partition Equal Subset Sum — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Bitset DP — `1_bitset_dp.dart`

Think of every sum we can make as an on/off switch in a long row: switch `s` is on when some group of numbers adds up to `s`. Start with only sum 0 on. For each number, shift the whole row left by that number. Every sum that was reachable is now reachable plus that number, and all of them update in one operation. Dart's `BigInt` does this for many sums at once. If the switch for `total / 2` is on at the end, the answer is `true`.

- Time: O(n · S / 64), where S is the sum of all numbers
- Space: O(S / 64)

## 2. Boolean DP (1D array) — `2_dp_1d.dart`

`dp[s]` is `true` if some subset adds up to `s`. Go through the numbers one at a time. For each number, update the sums from the largest down to the number itself: `dp[s]` becomes `true` if `dp[s - num]` was already `true`, meaning we can add this number to an older subset. Going backwards means the same number is never used twice.

- Time: O(n · S)
- Space: O(S)

## 3. Backtracking — `3_backtracking.dart`

Try every group directly. For each number, either put it in the group or skip it, and recurse. Stop as soon as the group hits exactly `total / 2`, or when it goes over. This is easy to reason about, but in the worst case it checks up to 2^n combinations, so it gets very slow with many numbers.

- Time: O(2^n)
- Space: O(n) for the recursion stack
