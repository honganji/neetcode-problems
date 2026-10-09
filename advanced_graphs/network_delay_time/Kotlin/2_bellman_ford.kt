class Solution {
    fun networkDelayTime(times: Array<IntArray>, n: Int, k: Int): Int {
        val inf = Int.MAX_VALUE / 2
        val dist = IntArray(n + 1) { inf }
        dist[k] = 0

        // A shortest path uses at most n - 1 edges, so n - 1 passes are enough.
        for (pass in 1 until n) {
            var changed = false
            for (t in times) {
                val u = t[0]
                val v = t[1]
                val w = t[2]
                if (dist[u] + w < dist[v]) {
                    dist[v] = dist[u] + w
                    changed = true
                }
            }
            if (!changed) break  // nothing left to improve
        }

        val answer = (1..n).maxOf { dist[it] }
        return if (answer == inf) -1 else answer
    }
}
