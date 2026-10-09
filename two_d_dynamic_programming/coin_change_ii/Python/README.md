# Coin Change II — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Bottom-up 1D DP — `1_dp_1d.py`

Keep a table `dp[a]` = number of coin combinations that sum to `a`, starting with `dp[0] = 1` (the empty set of coins). Process one coin at a time. For each coin, walk up from `coin` to `amount` and add `dp[a - coin]` into `dp[a]`. Walking upward means `dp[a - coin]` already includes uses of this same coin, which is exactly what lets a coin be used many times. Because coins are the outer loop, each combination is counted once, so `[1, 2]` and `[2, 1]` are not counted as two different answers.

- Time: O(n · amount)
- Space: O(amount)

## 2. Top-down memoized recursion — `2_memoization.py`

Ask a smaller question: "how many ways are there to make `remaining` using only `coins[i:]`?" Either skip coin `i` and move on, or use coin `i` once and ask again with the same `i`, so it can be reused. Store each answer in a table indexed by `(i, remaining)` so every state is computed only once. This is the same recurrence as solution 1, just evaluated from the top down. The recursion can go about `amount` levels deep, which is why the code raises the recursion limit.

- Time: O(n · amount)
- Space: O(n · amount) for the memo table, plus O(amount + n) for the recursion stack

## 3. Brute-force recursion — `3_bruteforce.py`

Makes the same decision as solution 2 (skip or use coin `i`), but remembers nothing. Many sub-problems get solved again and again, so the running time explodes. It is correct, but too slow for large inputs.

- Time: exponential, about O(2^(amount + n)) in the worst case
- Space: O(amount + n) for the recursion stack
