class Solution {
    fun maxAreaOfIsland(grid: Array<IntArray>): Int {
        val rows = grid.size
        val cols = grid[0].size
        val total = rows * cols
        val parent = IntArray(total) { it }  // each cell starts as its own group
        val size = IntArray(total) { 1 }     // group size, valid at each group's root

        fun find(x: Int): Int {
            var cur = x
            while (parent[cur] != cur) {
                parent[cur] = parent[parent[cur]]  // path halving: shortcut upwards
                cur = parent[cur]
            }
            return cur
        }

        fun union(a: Int, b: Int) {
            var ra = find(a)
            var rb = find(b)
            if (ra == rb) return
            if (size[ra] < size[rb]) {  // attach the smaller group under the larger
                val tmp = ra
                ra = rb
                rb = tmp
            }
            parent[rb] = ra
            size[ra] += size[rb]
        }

        // Join each land cell with its land neighbours below and to the right.
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] == 0) continue
                val id = r * cols + c
                if (r + 1 < rows && grid[r + 1][c] == 1) union(id, id + cols)
                if (c + 1 < cols && grid[r][c + 1] == 1) union(id, id + 1)
            }
        }

        var best = 0
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (grid[r][c] == 1) {
                    best = maxOf(best, size[find(r * cols + c)])
                }
            }
        }
        return best
    }
}
