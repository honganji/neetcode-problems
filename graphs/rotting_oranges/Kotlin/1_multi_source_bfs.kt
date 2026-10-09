import java.util.ArrayDeque

class Solution {
    fun orangesRotting(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val queue = ArrayDeque<Int>() // cell encoded as r * cols + c
        var fresh = 0

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                when (grid[r][c]) {
                    2 -> queue.add(r * cols + c)
                    1 -> fresh++
                }
            }
        }

        val dr = intArrayOf(1, -1, 0, 0)
        val dc = intArrayOf(0, 0, 1, -1)
        var minutes = 0

        // Each BFS layer is one minute of spreading.
        while (queue.isNotEmpty() && fresh > 0) {
            repeat(queue.size) {
                val cell = queue.poll()
                val r = cell / cols
                val c = cell % cols
                for (k in 0 until 4) {
                    val nr = r + dr[k]
                    val nc = c + dc[k]
                    if (nr in 0 until rows && nc in 0 until cols && grid[nr][nc] == 1) {
                        grid[nr][nc] = 2
                        fresh--
                        queue.add(nr * cols + nc)
                    }
                }
            }
            minutes++
        }

        return if (fresh == 0) minutes else -1
    }
}
