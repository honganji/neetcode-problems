# Partition Equal Subset Sum — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Bitset DP — `1_bitset_dp.py`

Think of every sum we can make as an on/off switch in a long row: bit `s` is 1 when some group of numbers adds up to `s`. Start with only sum 0 on (`reachable = 1`). For each number, shift the whole row left by that number. Every sum that was reachable is now reachable plus that number, and all of them update in one operation. Python's big integers make this a single line. If bit `total / 2` is 1 at the end, the answer is `True`.

- Time: O(n · S / 64), where S is the sum of all numbers
- Space: O(S / 64)

## 2. Boolean DP (1D array) — `2_dp_1d.py`

`dp[s]` is `True` if some subset adds up to `s`. Go through the numbers one at a time. For each number, update the sums from the largest down to the number itself: `dp[s]` becomes `True` if `dp[s - num]` was already `True`, meaning we can add this number to an older subset. Going backwards means the same number is never used twice.

- Time: O(n · S)
- Space: O(S)

## 3. Backtracking — `3_backtracking.py`

Try every group directly. For each number, either put it in the group or skip it, and recurse. Stop as soon as the group hits exactly `total // 2`, or when it goes over. This is easy to reason about, but in the worst case it checks up to 2^n combinations, so it gets very slow with many numbers.

- Time: O(2^n)
- Space: O(n) for the recursion stack
