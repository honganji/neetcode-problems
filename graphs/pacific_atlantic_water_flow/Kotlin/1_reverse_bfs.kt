private val DIRECTIONS = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))

fun pacificAtlantic(heights: List<List<Int>>): List<List<Int>> {
    val m = heights.size
    val n = heights[0].size

    // Cells are encoded as r * n + c. Water flows downhill, so walk uphill from the edge.
    fun flood(starts: List<Int>): Set<Int> {
        val seen = starts.toHashSet()
        val queue = ArrayDeque(seen)
        while (queue.isNotEmpty()) {
            val cell = queue.removeFirst()
            val r = cell / n
            val c = cell % n
            for (d in DIRECTIONS) {
                val nr = r + d[0]
                val nc = c + d[1]
                if (nr < 0 || nr >= m || nc < 0 || nc >= n) continue
                val next = nr * n + nc
                if (next !in seen && heights[nr][nc] >= heights[r][c]) {
                    seen.add(next)
                    queue.addLast(next)
                }
            }
        }
        return seen
    }

    val pacificStarts = (0 until n).toList() + (1 until m).map { it * n }
    val atlanticStarts = (0 until n).map { (m - 1) * n + it } + (0 until m - 1).map { it * n + n - 1 }
    val pacific = flood(pacificStarts)
    val atlantic = flood(atlanticStarts)
    return pacific.filter { it in atlantic }.map { listOf(it / n, it % n) }
}
