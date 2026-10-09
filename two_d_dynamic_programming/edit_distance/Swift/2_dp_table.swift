class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let a = Array(word1.utf8)
        let b = Array(word2.utf8)
        let m = a.count
        let n = b.count
        // dp[i][j] = edits needed to turn word1[:i] into word2[:j]
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for j in 0...n { dp[0][j] = j }
        for i in 0...m { dp[i][0] = i }

        for i in stride(from: 1, through: m, by: 1) {
            for j in stride(from: 1, through: n, by: 1) {
                if a[i - 1] == b[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // replace, delete, or insert
                    dp[i][j] = 1 + min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[m][n]
    }
}
