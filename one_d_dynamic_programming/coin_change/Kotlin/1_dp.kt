fun coinChange(coins: IntArray, amount: Int): Int {
    // dp[a] = fewest coins that make amount a (inf = not reachable yet)
    val inf = amount + 1
    val dp = IntArray(amount + 1) { inf }
    dp[0] = 0
    for (a in 1..amount) {
        for (c in coins) {
            if (c <= a) dp[a] = minOf(dp[a], dp[a - c] + 1)
        }
    }
    return if (dp[amount] == inf) -1 else dp[amount]
}
