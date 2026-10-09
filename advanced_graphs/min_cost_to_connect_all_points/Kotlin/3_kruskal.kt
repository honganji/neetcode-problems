class Solution {
    fun minCostConnectPoints(points: Array<IntArray>): Int {
        val n = points.size

        // Every pair of points is a possible edge: [cost, i, j].
        val edges = ArrayList<IntArray>()
        for (i in 0 until n) {
            for (j in i + 1 until n) {
                edges.add(intArrayOf(manhattan(points[i], points[j]), i, j))
            }
        }
        edges.sortBy { it[0] }

        val parent = IntArray(n) { it }

        fun find(x: Int): Int {
            var v = x
            while (parent[v] != v) {
                parent[v] = parent[parent[v]]  // path halving
                v = parent[v]
            }
            return v
        }

        var total = 0L
        var used = 0
        // Take the cheapest edges that do not close a loop, until n - 1 are taken.
        for (edge in edges) {
            if (used == n - 1) break
            val ri = find(edge[1])
            val rj = find(edge[2])
            if (ri != rj) {
                parent[ri] = rj
                total += edge[0]
                used++
            }
        }
        return total.toInt()
    }

    private fun manhattan(a: IntArray, b: IntArray): Int =
        Math.abs(a[0] - b[0]) + Math.abs(a[1] - b[1])
}
