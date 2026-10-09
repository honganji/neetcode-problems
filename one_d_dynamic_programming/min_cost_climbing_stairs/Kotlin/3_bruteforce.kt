fun minCostClimbingStairs(cost: IntArray): Int {
    val n = cost.size

    fun best(i: Int): Int {
        // Cheapest cost to get from step i to the top (index n).
        if (i >= n) return 0
        return cost[i] + minOf(best(i + 1), best(i + 2))
    }

    // We may start on step 0 or step 1.
    return minOf(best(0), best(1))
}
