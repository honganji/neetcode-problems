import java.util.PriorityQueue

private val dr = intArrayOf(1, -1, 0, 0)
private val dc = intArrayOf(0, 0, 1, -1)

fun swimInWater(grid: Array<IntArray>): Int {
    val n = grid.size
    val total = n * n
    // Lowest time needed to reach each cell so far. total is above every height.
    val best = IntArray(total) { total }
    best[0] = grid[0][0]
    // Queue entries encode (time, cell) as time * total + cell, so one Int is enough.
    val heap = PriorityQueue<Int>()
    heap.add(grid[0][0] * total)

    while (heap.isNotEmpty()) {
        val top = heap.poll()
        val t = top / total
        val cell = top % total
        if (t > best[cell]) continue // stale entry, a better one was already processed
        if (cell == total - 1) return t

        val r = cell / n
        val c = cell % n
        for (k in 0 until 4) {
            val nr = r + dr[k]
            val nc = c + dc[k]
            if (nr in 0 until n && nc in 0 until n) {
                val next = nr * n + nc
                // Reaching the neighbor takes as long as the larger of our time and its height.
                val nt = maxOf(t, grid[nr][nc])
                if (nt < best[next]) {
                    best[next] = nt
                    heap.add(nt * total + next)
                }
            }
        }
    }
    return -1
}
