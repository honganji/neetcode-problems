fun isInterleave(s1: String, s2: String, s3: String): Boolean {
    val m = s1.length
    val n = s2.length
    if (m + n != s3.length) return false

    // memo[i][j] is null until that state has been computed.
    val memo = Array(m + 1) { arrayOfNulls<Boolean>(n + 1) }

    fun dfs(i: Int, j: Int): Boolean {
        // Used all of s1 and s2, so s3 is fully matched.
        if (i == m && j == n) return true
        memo[i][j]?.let { return it }
        val k = i + j
        // Try to take the next character from s1, or from s2.
        val result = (i < m && s1[i] == s3[k] && dfs(i + 1, j)) ||
            (j < n && s2[j] == s3[k] && dfs(i, j + 1))
        memo[i][j] = result
        return result
    }

    return dfs(0, 0)
}
