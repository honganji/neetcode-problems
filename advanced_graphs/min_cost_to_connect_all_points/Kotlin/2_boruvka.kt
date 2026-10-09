class Solution {
    fun minCostConnectPoints(points: Array<IntArray>): Int {
        val n = points.size
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
        var components = n
        while (components > 1) {
            // Each component finds its cheapest edge to another component.
            // An edge is [cost, i, j]; comparing in order gives a fixed tie-break.
            val best = arrayOfNulls<IntArray>(n)
            for (i in 0 until n) {
                val ri = find(i)
                for (j in i + 1 until n) {
                    val rj = find(j)
                    if (ri == rj) continue
                    val edge = intArrayOf(manhattan(points[i], points[j]), i, j)
                    keepSmaller(best, ri, edge)
                    keepSmaller(best, rj, edge)
                }
            }

            // Add those edges, skipping any that would form a cycle.
            for (edge in best) {
                if (edge == null) continue
                val ri = find(edge[1])
                val rj = find(edge[2])
                if (ri != rj) {
                    parent[ri] = rj
                    total += edge[0]
                    components--
                }
            }
        }
        return total.toInt()
    }

    private fun keepSmaller(best: Array<IntArray?>, root: Int, edge: IntArray) {
        val current = best[root]
        if (current == null || isLess(edge, current)) best[root] = edge
    }

    private fun isLess(a: IntArray, b: IntArray): Boolean {
        for (k in 0 until 3) {
            if (a[k] != b[k]) return a[k] < b[k]
        }
        return false
    }

    private fun manhattan(a: IntArray, b: IntArray): Int =
        Math.abs(a[0] - b[0]) + Math.abs(a[1] - b[1])
}
