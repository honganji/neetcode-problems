class Solution {
    fun findRedundantConnection(edges: Array<IntArray>): IntArray {
        val n = edges.size
        val adj = Array(n + 1) { mutableListOf<Int>() }
        val degree = IntArray(n + 1)
        for (edge in edges) {
            adj[edge[0]].add(edge[1])
            adj[edge[1]].add(edge[0])
            degree[edge[0]]++
            degree[edge[1]]++
        }

        // Strip leaves (degree 1). Only the cycle nodes keep degree >= 2.
        val queue = ArrayDeque<Int>()
        for (i in 1..n) {
            if (degree[i] == 1) queue.addLast(i)
        }
        while (queue.isNotEmpty()) {
            val node = queue.removeFirst()
            for (next in adj[node]) {
                degree[next]--
                if (degree[next] == 1) queue.addLast(next)
            }
        }

        // Edges between two cycle nodes are cycle edges; take the last one.
        for (i in edges.indices.reversed()) {
            val edge = edges[i]
            if (degree[edge[0]] >= 2 && degree[edge[1]] >= 2) return edge
        }

        return IntArray(0)
    }
}
