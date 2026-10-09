class Solution {
    fun numIslands(grid: Array<CharArray>): Int {
        if (grid.isEmpty()) return 0

        val rows = grid.size
        val cols = grid[0].size
        val parent = IntArray(rows * cols) { it } // every cell starts alone
        val size = IntArray(rows * cols) { 1 }

        fun find(start: Int): Int {
            var x = start
            while (parent[x] != x) {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }

        // Every land cell starts as its own island; each successful merge removes one.
        var islands = 0
        for (row in grid) {
            for (cell in row) {
                if (cell == '1') islands++
            }
        }

        fun union(a: Int, b: Int) {
            var ra = find(a)
            var rb = find(b)
            if (ra == rb) return
            if (size[ra] < size[rb]) {
                val t = ra
                ra = rb
                rb = t
            }
            parent[rb] = ra
            size[ra] += size[rb]
            islands--
        }

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] != '1') continue
                // Only check right and down so each pair of neighbors is handled once.
                val id = r * cols + c
                if (c + 1 < cols && grid[r][c + 1] == '1') union(id, id + 1)
                if (r + 1 < rows && grid[r + 1][c] == '1') union(id, id + cols)
            }
        }
        return islands
    }
}
