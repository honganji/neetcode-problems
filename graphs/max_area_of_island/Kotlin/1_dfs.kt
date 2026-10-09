class Solution {
    fun maxAreaOfIsland(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val directions = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))
        var best = 0

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] == 0) continue
                // Sink the first land cell we meet so it is never counted again.
                grid[r][c] = 0
                val stack = ArrayDeque<Int>()
                stack.addLast(r * cols + c)
                var area = 0
                while (stack.isNotEmpty()) {
                    val cur = stack.removeLast()
                    area++
                    val cr = cur / cols
                    val cc = cur % cols
                    for (d in directions) {
                        val nr = cr + d[0]
                        val nc = cc + d[1]
                        if (nr in 0 until rows && nc in 0 until cols && grid[nr][nc] == 1) {
                            grid[nr][nc] = 0 // mark when pushed so no cell is added twice
                            stack.addLast(nr * cols + nc)
                        }
                    }
                }
                best = maxOf(best, area)
            }
        }
        return best
    }
}
