private val DIRECTIONS = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))

fun pacificAtlantic(heights: List<List<Int>>): List<List<Int>> {
    val m = heights.size
    val n = heights[0].size

    fun heightOf(cell: Int): Int = heights[cell / n][cell % n]

    fun neighborsOf(cell: Int): List<Int> {
        val r = cell / n
        val c = cell % n
        val result = mutableListOf<Int>()
        for (d in DIRECTIONS) {
            val nr = r + d[0]
            val nc = c + d[1]
            if (nr >= 0 && nr < m && nc >= 0 && nc < n) result.add(nr * n + nc)
        }
        return result
    }

    // Cells encoded as r * n + c, sorted from lowest to highest.
    val order = (0 until m * n).sortedBy { heightOf(it) }

    fun drains(isEdge: (Int, Int) -> Boolean): BooleanArray {
        val reached = BooleanArray(m * n)
        var i = 0
        while (i < order.size) {
            val h = heightOf(order[i])
            var j = i
            while (j < order.size && heightOf(order[j]) == h) j++
            // Seed edge cells, and cells that can flow to a lower cell that already drains.
            val stack = ArrayDeque<Int>()
            for (cell in order.subList(i, j)) {
                val flowsDown = neighborsOf(cell).any { heightOf(it) < h && reached[it] }
                if (isEdge(cell / n, cell % n) || flowsDown) {
                    reached[cell] = true
                    stack.addLast(cell)
                }
            }
            // Equal-height cells can flow into each other, so spread through them.
            while (stack.isNotEmpty()) {
                val cell = stack.removeLast()
                for (nb in neighborsOf(cell)) {
                    if (!reached[nb] && heightOf(nb) == h) {
                        reached[nb] = true
                        stack.addLast(nb)
                    }
                }
            }
            i = j
        }
        return reached
    }

    val pacific = drains { r, c -> r == 0 || c == 0 }
    val atlantic = drains { r, c -> r == m - 1 || c == n - 1 }
    return (0 until m * n)
        .filter { pacific[it] && atlantic[it] }
        .map { listOf(it / n, it % n) }
}
