class Solution {
    fun orangesRotting(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        var worst = 0

        // Each fresh orange needs as long as its nearest rotten orange is away.
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] != 1) continue
                val d = minutesToNearestRotten(grid, r, c)
                if (d == -1) return -1
                worst = maxOf(worst, d)
            }
        }

        return worst
    }

    private fun minutesToNearestRotten(grid: Array<IntArray>, sr: Int, sc: Int): Int {
        val rows = grid.size
        val cols = grid[0].size
        val dr = intArrayOf(1, -1, 0, 0)
        val dc = intArrayOf(0, 0, 1, -1)
        val seen = Array(rows) { BooleanArray(cols) }
        seen[sr][sc] = true

        // Breadth-first, one layer per step away from the start orange.
        var frontier = listOf(sr to sc)
        var dist = 0

        while (frontier.isNotEmpty()) {
            val next = mutableListOf<Pair<Int, Int>>()
            for ((r, c) in frontier) {
                for (k in 0 until 4) {
                    val nr = r + dr[k]
                    val nc = c + dc[k]
                    if (nr !in 0 until rows || nc !in 0 until cols) continue
                    if (seen[nr][nc] || grid[nr][nc] == 0) continue
                    if (grid[nr][nc] == 2) return dist + 1
                    seen[nr][nc] = true
                    next.add(nr to nc)
                }
            }
            frontier = next
            dist++
        }

        return -1
    }
}
