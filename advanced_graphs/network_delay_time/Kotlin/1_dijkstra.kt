import java.util.PriorityQueue

class Solution {
    fun networkDelayTime(times: Array<IntArray>, n: Int, k: Int): Int {
        val graph = Array(n + 1) { mutableListOf<IntArray>() }
        for (t in times) {
            graph[t[0]].add(intArrayOf(t[1], t[2]))  // [to, weight]
        }

        val inf = Int.MAX_VALUE / 2
        val dist = IntArray(n + 1) { inf }
        dist[k] = 0

        // Min-heap of [time, node], smallest time first.
        val heap = PriorityQueue<IntArray>(compareBy<IntArray> { it[0] })
        heap.add(intArrayOf(0, k))

        while (heap.isNotEmpty()) {
            val (d, u) = heap.poll()
            if (d > dist[u]) continue  // stale entry

            for ((v, w) in graph[u]) {
                if (d + w < dist[v]) {
                    dist[v] = d + w
                    heap.add(intArrayOf(dist[v], v))
                }
            }
        }

        val answer = (1..n).maxOf { dist[it] }
        return if (answer == inf) -1 else answer
    }
}
