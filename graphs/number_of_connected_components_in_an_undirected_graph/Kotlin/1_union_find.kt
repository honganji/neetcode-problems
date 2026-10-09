class Solution {
    fun countComponents(n: Int, edges: Array<IntArray>): Int {
        val parent = IntArray(n) { it }
        val size = IntArray(n) { 1 }
        var components = n

        fun find(x: Int): Int {
            var node = x
            // Path halving: point each visited node at its grandparent.
            while (parent[node] != node) {
                parent[node] = parent[parent[node]]
                node = parent[node]
            }
            return node
        }

        for (edge in edges) {
            var rootA = find(edge[0])
            var rootB = find(edge[1])
            if (rootA == rootB) continue // already in the same group

            // Attach the smaller group under the bigger one.
            if (size[rootA] < size[rootB]) {
                val tmp = rootA
                rootA = rootB
                rootB = tmp
            }
            parent[rootB] = rootA
            size[rootA] += size[rootB]
            components-- // two groups became one
        }

        return components
    }
}
