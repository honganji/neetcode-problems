class Solution {
    fun networkDelayTime(times: Array<IntArray>, n: Int, k: Int): Int {
        val inf = Int.MAX_VALUE / 2  // half of max, so inf + inf cannot overflow
        val dist = Array(n + 1) { IntArray(n + 1) { inf } }
        for (i in 1..n) {
            dist[i][i] = 0
        }
        for (t in times) {
            dist[t[0]][t[1]] = minOf(dist[t[0]][t[1]], t[2])
        }

        // Allow nodes 1..mid as stepping stones, one at a time.
        for (mid in 1..n) {
            for (i in 1..n) {
                for (j in 1..n) {
                    dist[i][j] = minOf(dist[i][j], dist[i][mid] + dist[mid][j])
                }
            }
        }

        val answer = (1..n).maxOf { dist[k][it] }
        return if (answer == inf) -1 else answer
    }
}
