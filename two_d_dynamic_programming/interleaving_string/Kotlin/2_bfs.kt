fun isInterleave(s1: String, s2: String, s3: String): Boolean {
    val m = s1.length
    val n = s2.length
    if (m + n != s3.length) return false

    // A state (i, j) means s1[:i] and s2[:j] have been used up to s3[:i + j].
    // Start at (0, 0) and move one step at a time to reach (m, n).
    val seen = Array(m + 1) { BooleanArray(n + 1) }
    val queue = ArrayDeque<IntArray>()
    queue.add(intArrayOf(0, 0))
    seen[0][0] = true
    while (queue.isNotEmpty()) {
        val (i, j) = queue.removeFirst()
        if (i == m && j == n) return true
        val k = i + j
        if (i < m && s1[i] == s3[k] && !seen[i + 1][j]) {
            seen[i + 1][j] = true
            queue.add(intArrayOf(i + 1, j))
        }
        if (j < n && s2[j] == s3[k] && !seen[i][j + 1]) {
            seen[i][j + 1] = true
            queue.add(intArrayOf(i, j + 1))
        }
    }
    return false
}
