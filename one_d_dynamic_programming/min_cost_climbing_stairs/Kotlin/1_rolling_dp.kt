fun minCostClimbingStairs(cost: IntArray): Int {
    // next1: cheapest cost to reach the top from the step after the current one.
    // next2: cheapest cost to reach the top from two steps ahead.
    var next1 = 0 // the top
    var next2 = 0
    for (i in cost.indices.reversed()) {
        val current = cost[i] + minOf(next1, next2)
        next2 = next1
        next1 = current
    }
    // We may start on step 0 or step 1.
    return minOf(next1, next2)
}
