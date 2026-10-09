private val DIRECTIONS = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))

fun pacificAtlantic(heights: List<List<Int>>): List<List<Int>> {
    val m = heights.size
    val n = heights[0].size

    // Walk downhill from one cell, noting which oceans the walk touches.
    fun reachesBoth(startR: Int, startC: Int): Boolean {
        val start = startR * n + startC
        val seen = hashSetOf(start)
        val stack = ArrayDeque(listOf(start))
        var pacific = false
        var atlantic = false
        while (stack.isNotEmpty()) {
            val cell = stack.removeLast()
            val r = cell / n
            val c = cell % n
            if (r == 0 || c == 0) pacific = true
            if (r == m - 1 || c == n - 1) atlantic = true
            if (pacific && atlantic) return true
            for (d in DIRECTIONS) {
                val nr = r + d[0]
                val nc = c + d[1]
                if (nr < 0 || nr >= m || nc < 0 || nc >= n) continue
                val next = nr * n + nc
                if (next !in seen && heights[nr][nc] <= heights[r][c]) {
                    seen.add(next)
                    stack.addLast(next)
                }
            }
        }
        return false
    }

    val result = mutableListOf<List<Int>>()
    for (r in 0 until m) {
        for (c in 0 until n) {
            if (reachesBoth(r, c)) result.add(listOf(r, c))
        }
    }
    return result
}
