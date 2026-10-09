private val dr = intArrayOf(1, -1, 0, 0)
private val dc = intArrayOf(0, 0, 1, -1)

fun swimInWater(grid: Array<IntArray>): Int {
    val n = grid.size
    val total = n * n
    // Heights are exactly 0..n*n-1, so pos[t] is the cell that becomes usable at time t.
    val pos = IntArray(total)
    for (r in 0 until n) {
        for (c in 0 until n) {
            pos[grid[r][c]] = r * n + c
        }
    }

    val parent = IntArray(total) { it }
    val size = IntArray(total) { 1 }
    val active = BooleanArray(total)

    fun find(start: Int): Int {
        var x = start
        while (parent[x] != x) {
            parent[x] = parent[parent[x]] // path halving
            x = parent[x]
        }
        return x
    }

    fun union(a: Int, b: Int) {
        var ra = find(a)
        var rb = find(b)
        if (ra == rb) return
        if (size[ra] < size[rb]) {
            val tmp = ra
            ra = rb
            rb = tmp
        }
        parent[rb] = ra
        size[ra] += size[rb]
    }

    // Add cells in order of height. Each newly usable cell joins its usable neighbors.
    // The first time the two corners are connected, that height is the answer.
    for (t in 0 until total) {
        val cell = pos[t]
        active[cell] = true
        val r = cell / n
        val c = cell % n
        for (k in 0 until 4) {
            val nr = r + dr[k]
            val nc = c + dc[k]
            if (nr in 0 until n && nc in 0 until n && active[nr * n + nc]) {
                union(cell, nr * n + nc)
            }
        }
        if (find(0) == find(total - 1)) return t
    }
    return total - 1
}
