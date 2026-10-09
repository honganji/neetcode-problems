class Solution {
    fun minCostConnectPoints(points: Array<IntArray>): Int {
        val n = points.size
        // dist[v] = cheapest known link from point v to the tree built so far
        val dist = IntArray(n) { Int.MAX_VALUE }
        val inTree = BooleanArray(n)
        dist[0] = 0
        var total = 0L

        repeat(n) {
            // Pick the closest point that is not in the tree yet.
            var u = -1
            for (v in 0 until n) {
                if (!inTree[v] && (u == -1 || dist[v] < dist[u])) u = v
            }
            inTree[u] = true
            total += dist[u]

            // The new tree point may offer cheaper links to the rest.
            for (v in 0 until n) {
                if (!inTree[v]) dist[v] = minOf(dist[v], manhattan(points[u], points[v]))
            }
        }
        return total.toInt()
    }

    private fun manhattan(a: IntArray, b: IntArray): Int =
        Math.abs(a[0] - b[0]) + Math.abs(a[1] - b[1])
}
