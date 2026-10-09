func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let a = Array(text1)
    let b = Array(text2)
    let m = a.count
    let n = b.count
    // dp[i][j] = LCS length of a[i...] and b[j...]
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    for i in stride(from: m - 1, through: 0, by: -1) {
        for j in stride(from: n - 1, through: 0, by: -1) {
            if a[i] == b[j] {
                dp[i][j] = 1 + dp[i + 1][j + 1]
            } else {
                dp[i][j] = max(dp[i + 1][j], dp[i][j + 1])
            }
        }
    }
    return dp[0][0]
}
