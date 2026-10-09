fun longestIncreasingPath(matrix: Array<IntArray>): Int {
    val rows = matrix.size
    val cols = matrix[0].size
    val dRow = intArrayOf(1, -1, 0, 0)
    val dCol = intArrayOf(0, 0, 1, -1)
    // memo[r][c] = longest increasing path that starts at (r, c); 0 means not computed yet.
    val memo = Array(rows) { IntArray(cols) }

    fun dfs(r: Int, c: Int): Int {
        if (memo[r][c] != 0) return memo[r][c]
        var best = 1
        for (k in 0 until 4) {
            val nr = r + dRow[k]
            val nc = c + dCol[k]
            if (nr in 0 until rows && nc in 0 until cols && matrix[nr][nc] > matrix[r][c]) {
                best = maxOf(best, 1 + dfs(nr, nc))
            }
        }
        memo[r][c] = best
        return best
    }

    var answer = 0
    for (r in 0 until rows) {
        for (c in 0 until cols) {
            answer = maxOf(answer, dfs(r, c))
        }
    }
    return answer
}
