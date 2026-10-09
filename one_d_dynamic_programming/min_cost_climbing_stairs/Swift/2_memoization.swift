func minCostClimbingStairs(_ cost: [Int]) -> Int {
    let n = cost.count
    var memo = [Int](repeating: -1, count: n) // -1 means "not computed yet"

    func best(_ i: Int) -> Int {
        // Cheapest cost to get from step i to the top (index n).
        if i >= n { return 0 }
        if memo[i] == -1 {
            memo[i] = cost[i] + min(best(i + 2), best(i + 1))
        }
        return memo[i]
    }

    // We may start on step 0 or step 1.
    return min(best(0), best(1))
}
