# Jump Game — Kotlin

Solutions ordered from most to least efficient.

## 1. ⭐ Greedy: Farthest Reach — `1_greedy_forward.kt`

Walk from left to right and keep track of the farthest index you can reach so far. If you ever arrive at an index that is past that farthest point, you can never get there, so the answer is `false`. Otherwise, extend the farthest point with `i + nums[i]`. You never need to know which jumps were taken, only how far they can get you.

- Time: O(n)
- Space: O(1)

## 2. Greedy: Last Good Index — `2_greedy_backward.kt`

Walk from right to left. The last index is the goal, so it is "good". Keep track of the leftmost good index found so far. An index `i` is good if one jump from it lands on or past that index, because every index in between is also reachable from `i`. The answer is whether index 0 ends up good.

- Time: O(n)
- Space: O(1)

## 3. Dynamic Programming (Bottom-Up) — `3_dp_bottom_up.kt`

Make a table where `canReach[i]` says whether the last index can be reached from `i`. The last cell is `true`. Fill the table from right to left: index `i` is `true` if any index it can jump to is `true`. The answer is `canReach[0]`. This checks every possible jump, so it is slower than the greedy versions, but each step is easy to follow.

- Time: O(n²), since each index may scan up to `n` positions ahead
- Space: O(n)
