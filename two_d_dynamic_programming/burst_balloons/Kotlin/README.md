# Burst Balloons — Kotlin

Solutions ordered from most to least efficient. Only two genuinely different techniques exist for this problem.

## 1. ⭐ Interval DP — `1_interval_dp.kt`

Think about the **last** balloon to burst inside a range. When it pops, the only balloons left are the two just outside the range, so they are its neighbors. Everything to its left and right is independent of the other side. So for each range we try every balloon as the last one, add the best results for the two smaller ranges on either side, and keep the maximum. We fill in ranges from short to long, so smaller answers are ready when needed. Padding the array with a `1` at each end handles the edge rules.

- Time: O(n³)
- Space: O(n²)

## 2. Bitmask DP — `2_bitmask_dp.kt`

Track the set of balloons **still alive** as a bitmask. A balloon's neighbors depend only on which balloons remain, not on the order they were popped, so the best score for a given set of remaining balloons can be remembered. For each set, try popping each remaining balloon first, add its coins, and look up the best score for the rest. This is correct but only practical for small inputs, since there are 2ⁿ sets (about 20 balloons at most). It is useful for seeing the problem as "choose a burst order", but Interval DP is the one to use.

- Time: O(2ⁿ · n²)
- Space: O(2ⁿ)
