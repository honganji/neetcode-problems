class Solution {
    fun validTree(n: Int, edges: Array<IntArray>): Boolean {
        // A tree on n nodes has exactly n - 1 edges.
        if (edges.size != n - 1) return false

        val parent = IntArray(n) { it }
        val size = IntArray(n) { 1 }

        fun find(x: Int): Int {
            var node = x
            while (parent[node] != node) {
                parent[node] = parent[parent[node]] // path halving
                node = parent[node]
            }
            return node
        }

        for (edge in edges) {
            var rootA = find(edge[0])
            var rootB = find(edge[1])
            if (rootA == rootB) return false // this edge would close a cycle
            if (size[rootA] < size[rootB]) {
                val tmp = rootA
                rootA = rootB
                rootB = tmp
            }
            parent[rootB] = rootA
            size[rootA] += size[rootB]
        }

        return true
    }
}
