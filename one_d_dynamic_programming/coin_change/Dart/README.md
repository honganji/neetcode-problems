# Coin Change — Dart

Solutions ordered from most to least efficient.

## 1. ⭐ Dynamic Programming (Bottom-Up) — `1_dp.dart`

Build a table `dp` where `dp[a]` is the fewest coins that add up to `a`. Start with `dp[0] = 0`, since zero coins make 0. For each amount `a` from 1 up to `amount`, try every coin that fits. If `a - c` is reachable, one more coin `c` on top of its best answer makes `a`. Each entry only depends on smaller amounts, so the table fills in order. Amounts that no coin combination can make stay at the "impossible" value, and the answer is `dp[amount]` (or -1 if it's impossible).

- Time: O(S · N), where S is the amount and N is the number of coins
- Space: O(S) for the table

## 2. Breadth-First Search — `2_bfs.dart`

Think of each amount as a spot on a number line, and each coin as a jump forward by its value. Starting at 0, the question becomes: what is the fewest jumps to land exactly on `amount`? Breadth-first search explores every spot reachable with 1 coin, then every spot reachable with 2 coins, and so on. The first time it lands on `amount`, the number of coins used so far is the minimum. A `seen` marker stops it from revisiting a spot, since a later visit can never be a shorter route. Jumps that would go past `amount` are skipped.

- Time: O(S · N) in the worst case, but it can stop as soon as it reaches `amount`, so it is often faster than the table
- Space: O(S) for the `seen` marks and the queue

## 3. Brute-Force Recursion — `3_bruteforce.dart`

From the remaining amount, try every coin that fits, then solve the smaller remaining amount the same way. Take the smallest count found across all choices, or -1 if no choice works. Nothing is remembered between calls, so the same smaller amounts are solved again and again. The number of calls grows exponentially with the amount, which makes this practical only for small inputs.

- Time: O(N^S) in the worst case, exponential in the amount
- Space: O(S) for the recursion depth, where S is the amount
