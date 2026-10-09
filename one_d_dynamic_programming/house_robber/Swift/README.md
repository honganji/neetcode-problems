# House Robber — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Rolling DP (two variables) — `1_rolling_dp.swift`

At each house you either skip it (keeping the best total so far) or rob it and add it to the best total from two houses back, since the neighbor is off-limits. You only ever look back two steps, so two variables are enough instead of a full array.

- Time: O(n)
- Space: O(1)

## 2. Tabulation (DP array) — `2_tabulation.swift`

Same recurrence as above, but it stores the best total for every prefix of the street in an array. It is easier to follow step by step, at the cost of extra memory.

- Time: O(n)
- Space: O(n)

## 3. Brute-force recursion — `3_brute_force_recursion.swift`

For each house, try both choices: skip it and move on, or rob it and jump to the house after the next. This explores every valid plan, but it recomputes the same subproblems over and over, so the number of calls grows exponentially (roughly like Fibonacci, about 1.618^n).

- Time: O(2^n) upper bound (about 1.618^n in practice)
- Space: O(n) call stack
