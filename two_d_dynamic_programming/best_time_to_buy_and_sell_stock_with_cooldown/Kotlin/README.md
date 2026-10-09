# Best Time to Buy and Sell Stock with Cooldown — Kotlin

Solutions ordered from most to least efficient.

This problem has only two truly different techniques, so there are two solutions here. A full-table DP or memoized recursion over (day, state) computes the same recurrence as the state machine below, so it is not listed as a separate technique.

## 1. ⭐ State machine (rolling DP) — `1_state_machine.kt`

On any day you are in one of three situations: holding a share, having just sold (so tomorrow is a cooldown day), or resting (not holding and free to buy). For each situation, keep the best profit so far. Tomorrow's values only depend on today's three values, so three variables are enough. Buying moves you from resting to holding, selling moves you from holding to cooldown, and the cooldown day moves you back to resting.

- Time: O(n)
- Space: O(1)

## 2. Exhaustive search — `2_bruteforce.kt`

On each day, try every legal action: do nothing, buy (only if not holding and not in cooldown), or sell (only if holding). Recurse through every combination and keep the best total. This is correct because it checks every valid plan, but the same situations are solved again and again, and the number of plans grows exponentially with the number of days. The recursion depth also grows with the number of days, so very long price lists can overflow the stack.

- Time: O(2^n)
- Space: O(n) for the recursion stack
