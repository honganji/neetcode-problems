import kotlin.math.abs

fun findTargetSumWays(nums: IntArray, target: Int): Int {
    val total = nums.sum()
    // Out of reach, or the parity is wrong: no way to hit the target.
    if (abs(target) > total || (total + target) % 2 != 0) return 0

    // Numbers given "+" form a group P, the rest get "-":
    // sum(P) - (total - sum(P)) = target, so sum(P) = (total + target) / 2.
    // Counting sign choices is the same as counting subsets with that sum.
    val goal = (total + target) / 2
    val ways = IntArray(goal + 1)  // ways[s] = subsets summing to s
    ways[0] = 1  // the empty subset

    for (num in nums) {
        // Go downward so each number is used at most once.
        for (s in goal downTo num) {
            ways[s] += ways[s - num]
        }
    }

    return ways[goal]
}
