fun combinationSum(candidates: IntArray, target: Int): List<List<Int>> {
    // dp[s] = every combination that adds up to s, using the candidates seen so far
    val dp = Array(target + 1) { mutableListOf<List<Int>>() }
    dp[0].add(emptyList())
    for (c in candidates) {
        // going up lets c be reused
        for (s in c..target) {
            for (combo in dp[s - c]) {
                dp[s].add(combo + c)
            }
        }
    }
    return dp[target]
}
