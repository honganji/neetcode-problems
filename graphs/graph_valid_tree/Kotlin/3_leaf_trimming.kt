class Solution {
    fun validTree(n: Int, edges: Array<IntArray>): Boolean {
        if (edges.size != n - 1) return false

        val adj = Array(n) { mutableListOf<Int>() }
        val degree = IntArray(n)
        for (edge in edges) {
            adj[edge[0]].add(edge[1])
            adj[edge[1]].add(edge[0])
            degree[edge[0]]++
            degree[edge[1]]++
        }

        // Repeatedly strip leaves (degree <= 1). A tree gets fully stripped;
        // a cycle keeps its nodes at degree >= 2 forever.
        val queue = ArrayDeque<Int>()
        for (i in 0 until n) {
            if (degree[i] <= 1) queue.addLast(i)
        }

        val removed = BooleanArray(n)
        var removedCount = 0
        while (queue.isNotEmpty()) {
            val node = queue.removeFirst()
            removed[node] = true
            removedCount++
            for (nei in adj[node]) {
                if (!removed[nei]) {
                    degree[nei]--
                    if (degree[nei] == 1) queue.addLast(nei)
                }
            }
        }

        return removedCount == n
    }
}
