fun isInterleave(s1: String, s2: String, s3: String): Boolean {
    val m = s1.length
    val n = s2.length
    if (m + n != s3.length) return false

    // dp[j] is true when s1[:i] and s2[:j] can interleave into s3[:i + j].
    // One row is reused: dp[j] still holds row i - 1 until it is updated.
    val dp = BooleanArray(n + 1)
    for (i in 0..m) {
        for (j in 0..n) {
            if (i == 0 && j == 0) {
                dp[j] = true
                continue
            }
            val fromTop = i > 0 && dp[j] && s1[i - 1] == s3[i + j - 1]
            val fromLeft = j > 0 && dp[j - 1] && s2[j - 1] == s3[i + j - 1]
            dp[j] = fromTop || fromLeft
        }
    }
    return dp[n]
}
