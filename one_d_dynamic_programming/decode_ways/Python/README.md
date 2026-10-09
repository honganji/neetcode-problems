# Decode Ways — Python

Solutions ordered from most to least efficient.

## 1. ⭐ Bottom-up DP with two rolling variables — `1_dp_constant_space.py`

Work from the end of the string toward the start. The number of ways to decode a position is the number of ways for the next digit (if it is not `0`), plus the number of ways for the next two digits (if they form `10`–`26`). Each step only looks at the two results right after it, so two variables are enough instead of a whole table.

- Time: O(n)
- Space: O(1)

## 2. Top-down recursion with memoization — `2_memoization.py`

Ask the same question as above, but as a recursive function: "how many ways are there to decode the string starting at index `i`?" The same index can be reached through different splits, so each answer is cached the first time it is computed and reused afterward.

- Time: O(n)
- Space: O(n) for the cache plus the recursion stack

## 3. Brute-force recursion — `3_bruteforce.py`

Try every way to split the string into one-digit and two-digit pieces, with no cache. Each call branches into up to two calls, and the same suffix is solved again and again, so the work grows like the Fibonacci sequence (about 1.618^n). It is correct, but too slow for long inputs.

- Time: O(1.618^n) (exponential)
- Space: O(n) for the recursion stack
