class Solution {
    fun findRedundantConnection(edges: Array<IntArray>): IntArray {
        val n = edges.size
        val parent = IntArray(n + 1) { it }
        val size = IntArray(n + 1) { 1 }

        fun find(x: Int): Int {
            var cur = x
            while (parent[cur] != cur) {
                parent[cur] = parent[parent[cur]] // path halving
                cur = parent[cur]
            }
            return cur
        }

        for (edge in edges) {
            var ra = find(edge[0])
            var rb = find(edge[1])
            if (ra == rb) return edge // already connected, so this edge closes a loop
            if (size[ra] < size[rb]) {
                val tmp = ra
                ra = rb
                rb = tmp
            }
            parent[rb] = ra
            size[ra] += size[rb]
        }

        return IntArray(0)
    }
}
