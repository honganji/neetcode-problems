class Solution {
    fun orangesRotting(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val dr = intArrayOf(1, -1, 0, 0)
        val dc = intArrayOf(0, 0, 1, -1)
        var minutes = 0

        while (true) {
            // Find fresh oranges next to a rotten one. Rot them after the scan so
            // an orange that rots this minute can't spread again in the same minute.
            val toRot = mutableListOf<Int>()
            for (r in 0 until rows) {
                for (c in 0 until cols) {
                    if (grid[r][c] != 1) continue
                    for (k in 0 until 4) {
                        val nr = r + dr[k]
                        val nc = c + dc[k]
                        if (nr in 0 until rows && nc in 0 until cols && grid[nr][nc] == 2) {
                            toRot.add(r * cols + c)
                            break
                        }
                    }
                }
            }

            if (toRot.isEmpty()) break
            for (cell in toRot) {
                grid[cell / cols][cell % cols] = 2
            }
            minutes++
        }

        for (row in grid) {
            if (row.any { it == 1 }) return -1
        }
        return minutes
    }
}
