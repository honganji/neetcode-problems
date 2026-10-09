class Solution {
    fun validTree(n: Int, edges: Array<IntArray>): Boolean {
        if (edges.size != n - 1) return false

        val adj = Array(n) { mutableListOf<Int>() }
        for (edge in edges) {
            adj[edge[0]].add(edge[1])
            adj[edge[1]].add(edge[0])
        }

        // Iterative DFS: each entry is (node, parent it was reached from).
        val visited = BooleanArray(n)
        val stack = ArrayDeque<IntArray>()
        stack.addLast(intArrayOf(0, -1))
        while (stack.isNotEmpty()) {
            val (node, parent) = stack.removeLast()
            if (visited[node]) return false // reached twice, so there is a cycle
            visited[node] = true
            for (nei in adj[node]) {
                if (nei != parent) {
                    stack.addLast(intArrayOf(nei, node))
                }
            }
        }

        // Every node must be reachable from node 0.
        return visited.all { it }
    }
}
