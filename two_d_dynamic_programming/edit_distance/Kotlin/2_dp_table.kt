import kotlin.math.min

class Solution {
    fun minDistance(word1: String, word2: String): Int {
        val m = word1.length
        val n = word2.length
        // dp[i][j] = edits needed to turn word1[:i] into word2[:j]
        val dp = Array(m + 1) { IntArray(n + 1) }
        for (j in 0..n) dp[0][j] = j
        for (i in 0..m) dp[i][0] = i

        for (i in 1..m) {
            for (j in 1..n) {
                if (word1[i - 1] == word2[j - 1]) {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    // replace, delete, or insert
                    dp[i][j] = 1 + min(dp[i - 1][j - 1], min(dp[i - 1][j], dp[i][j - 1]))
                }
            }
        }
        return dp[m][n]
    }
}
