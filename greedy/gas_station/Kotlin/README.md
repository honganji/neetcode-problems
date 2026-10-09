# Gas Station — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Greedy (single pass) — `1_greedy.kt`

Each station adds `gas[i] - cost[i]` to your fuel. If the total over the whole circle is negative, no start can work. Otherwise, drive around keeping a running tank. If the tank drops below zero on the way to station `i + 1`, then no station from the current start up to `i` can work either, because each of them would reach `i` with even less fuel. So the next station becomes the new start. Since the total is non-negative, the last start that survives is the answer.

- Time: O(n)
- Space: O(1)

## 2. Prefix sum minimum — `2_prefix_sum.kt`

Keep a running balance of `gas[i] - cost[i]`. The point where this balance is lowest is where the trip is "most in debt". Starting one station after that point means the balance never falls below its starting level, so the tank never runs dry. The final balance is the total surplus, which decides whether a start exists at all. This uses the same total-surplus fact as solution 1, but finds the start by looking for the lowest point instead of resetting as you go.

- Time: O(n)
- Space: O(1)

## 3. Brute force — `3_bruteforce.kt`

Try every station as the start and simulate one full lap, stopping as soon as the tank runs out. It is simple and obviously correct, but it can repeat a lot of work when most starts fail late.

- Time: O(n²)
- Space: O(1)
