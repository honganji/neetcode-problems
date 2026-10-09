func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    // dp[s] = every combination that adds up to s, using the candidates seen so far
    var dp = Array(repeating: [[Int]](), count: target + 1)
    dp[0] = [[]]
    for c in candidates {
        // going up lets c be reused
        for s in stride(from: c, through: target, by: 1) {
            for combo in dp[s - c] {
                dp[s].append(combo + [c])
            }
        }
    }
    return dp[target]
}
