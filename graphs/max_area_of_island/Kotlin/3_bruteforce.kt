class Solution {
    fun maxAreaOfIsland(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val directions = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))
        var best = 0

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] == 0) continue
                // Search from this cell with its own visited set. Nothing is shared
                // with other starts, so every island is re-explored from each of its cells.
                val start = r * cols + c
                val visited = HashSet<Int>()
                visited.add(start)
                val stack = ArrayDeque<Int>()
                stack.addLast(start)
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
                            val nid = nr * cols + nc
                            if (visited.add(nid)) stack.addLast(nid)
                        }
                    }
                }
                best = maxOf(best, area)
            }
        }
        return best
    }
}
