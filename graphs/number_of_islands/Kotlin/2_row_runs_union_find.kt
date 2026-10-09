class Solution {
    fun numIslands(grid: Array<CharArray>): Int {
        if (grid.isEmpty()) return 0

        // Step 1: split each row into runs of consecutive land, e.g. "11011" -> (0, 1), (3, 4).
        val runStart = ArrayList<Int>()
        val runEnd = ArrayList<Int>()
        val rowBegin = ArrayList<Int>() // index in runStart where each row's runs start
        for (row in grid) {
            rowBegin.add(runStart.size)
            var start = -1
            for (c in 0..row.size) {
                val isLand = c < row.size && row[c] == '1'
                if (isLand && start < 0) {
                    start = c
                } else if (!isLand && start >= 0) {
                    runStart.add(start)
                    runEnd.add(c - 1)
                    start = -1
                }
            }
        }
        rowBegin.add(runStart.size)

        // Step 2: each run starts as its own island; runs that touch in adjacent rows merge.
        val n = runStart.size
        val parent = IntArray(n) { it }
        val size = IntArray(n) { 1 }
        var islands = n

        fun find(start: Int): Int {
            var x = start
            while (parent[x] != x) {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
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

        for (r in 1 until grid.size) {
            var i = rowBegin[r - 1]
            val iEnd = rowBegin[r]
            var j = rowBegin[r]
            val jEnd = rowBegin[r + 1]
            while (i < iEnd && j < jEnd) {
                // Columns overlap, so the two runs touch.
                if (runStart[i] <= runEnd[j] && runStart[j] <= runEnd[i]) {
                    union(i, j)
                }
                // The run that ends first cannot touch any later run in the other row.
                if (runEnd[i] < runEnd[j]) {
                    i++
                } else {
                    j++
                }
            }
        }
        return islands
    }
}
