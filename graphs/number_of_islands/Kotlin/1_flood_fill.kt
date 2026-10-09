class Solution {
    fun numIslands(grid: Array<CharArray>): Int {
        if (grid.isEmpty()) return 0

        val rows = grid.size
        val cols = grid[0].size
        val directions = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))
        var islands = 0

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] != '1') continue

                // New island found: count it, then sink every land cell connected to it.
                islands++
                grid[r][c] = '0'
                val stack = ArrayDeque<IntArray>()
                stack.addLast(intArrayOf(r, c))
                while (stack.isNotEmpty()) {
                    val cell = stack.removeLast()
                    for (d in directions) {
                        val nr = cell[0] + d[0]
                        val nc = cell[1] + d[1]
                        if (nr in 0 until rows && nc in 0 until cols && grid[nr][nc] == '1') {
                            grid[nr][nc] = '0' // mark when pushed so no cell is added twice
                            stack.addLast(intArrayOf(nr, nc))
                        }
                    }
                }
            }
        }
        return islands
    }
}
