class Solution {
    fun findRedundantConnection(edges: Array<IntArray>): IntArray {
        val n = edges.size
        val adj = Array(n + 1) { mutableListOf<Int>() }

        fun connected(src: Int, dst: Int): Boolean {
            val seen = BooleanArray(n + 1)
            seen[src] = true
            val stack = ArrayDeque<Int>()
            stack.addLast(src)
            while (stack.isNotEmpty()) {
                val node = stack.removeLast()
                if (node == dst) return true
                for (next in adj[node]) {
                    if (!seen[next]) {
                        seen[next] = true
                        stack.addLast(next)
                    }
                }
            }
            return false
        }

        for (edge in edges) {
            // Already linked by earlier edges, so this one makes a loop.
            if (connected(edge[0], edge[1])) return edge
            adj[edge[0]].add(edge[1])
            adj[edge[1]].add(edge[0])
        }

        return IntArray(0)
    }
}
