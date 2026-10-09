private val dr = intArrayOf(1, -1, 0, 0)
private val dc = intArrayOf(0, 0, 1, -1)

fun swimInWater(grid: Array<IntArray>): Int {
    val n = grid.size

    fun reachable(limit: Int): Boolean {
        // Flood fill from the top-left, using only cells at or below the limit.
        if (grid[0][0] > limit) return false
        val seen = BooleanArray(n * n)
        seen[0] = true
        val stack = ArrayDeque<Int>()
        stack.addLast(0)
        while (stack.isNotEmpty()) {
            val cell = stack.removeLast()
            if (cell == n * n - 1) return true
            val r = cell / n
            val c = cell % n
            for (k in 0 until 4) {
                val nr = r + dr[k]
                val nc = c + dc[k]
                if (nr in 0 until n && nc in 0 until n) {
                    val next = nr * n + nc
                    if (!seen[next] && grid[nr][nc] <= limit) {
                        seen[next] = true
                        stack.addLast(next)
                    }
                }
            }
        }
        return false
    }

    // reachable() only gets easier as the limit grows, so binary search for the first true.
    var lo = grid[0][0]
    var hi = n * n - 1
    while (lo < hi) {
        val mid = (lo + hi) / 2
        if (reachable(mid)) {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return lo
}
