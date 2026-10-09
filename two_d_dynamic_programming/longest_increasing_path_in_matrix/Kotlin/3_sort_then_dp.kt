fun longestIncreasingPath(matrix: Array<IntArray>): Int {
    val rows = matrix.size
    val cols = matrix[0].size
    val dRow = intArrayOf(1, -1, 0, 0)
    val dCol = intArrayOf(0, 0, 1, -1)

    // Visit cells from smallest to largest value.
    val cells = (0 until rows).flatMap { r -> (0 until cols).map { c -> Pair(r, c) } }
        .sortedBy { (r, c) -> matrix[r][c] }

    // dp[r][c] = longest increasing path that ends at (r, c).
    val dp = Array(rows) { IntArray(cols) { 1 } }
    for ((r, c) in cells) {
        // Every smaller neighbor was visited earlier, so its dp value is final.
        for (k in 0 until 4) {
            val nr = r + dRow[k]
            val nc = c + dCol[k]
            if (nr in 0 until rows && nc in 0 until cols && matrix[nr][nc] < matrix[r][c]) {
                dp[r][c] = maxOf(dp[r][c], dp[nr][nc] + 1)
            }
        }
    }
    return dp.maxOf { row -> row.max() }
}
