# Min Cost Climbing Stairs — Swift

Solutions ordered from most to least efficient.

## 1. ⭐ Rolling Bottom-Up DP — `1_rolling_dp.swift`

Work backwards from the top. The cheapest way to finish from a step is the cost of
that step plus the cheaper of the two steps you could jump to next. Each step only
depends on the two steps right after it, so you only need to remember two numbers
instead of a whole table.

- Time: O(n)
- Space: O(1)

## 2. Top-Down Memoization — `2_memoization.swift`

Write the same rule as a recursive function: the cost from step `i` is `cost[i]` plus
the cheaper of the costs from `i + 1` and `i + 2`. Without help this repeats a lot of
work, because many paths reach the same step. Saving each answer the first time it is
computed means every step is solved only once.

- Time: O(n), since each step is computed once
- Space: O(n) for the memo table and the recursion stack

## 3. Brute-Force Recursion — `3_bruteforce.swift`

Use the same rule with no saved answers. Each call branches into two more calls, so the
same steps are solved again and again. It is the most direct translation of the rule,
but the number of calls grows exponentially (roughly Fibonacci-like), so it is far too
slow for the largest inputs.

- Time: O(2^n)
- Space: O(n) for the recursion stack
