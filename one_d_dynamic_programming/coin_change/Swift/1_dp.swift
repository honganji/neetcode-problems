func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    // dp[a] = fewest coins that make amount a (inf = not reachable yet)
    let inf = amount + 1
    var dp = [Int](repeating: inf, count: amount + 1)
    dp[0] = 0
    for a in stride(from: 1, through: amount, by: 1) {
        for c in coins where c <= a {
            dp[a] = min(dp[a], dp[a - c] + 1)
        }
    }
    return dp[amount] == inf ? -1 : dp[amount]
}
