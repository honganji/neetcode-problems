class Solution {
    fun countComponents(n: Int, edges: Array<IntArray>): Int {
        val graph = Array(n) { mutableListOf<Int>() }
        for (edge in edges) {
            graph[edge[0]].add(edge[1])
            graph[edge[1]].add(edge[0])
        }

        val visited = BooleanArray(n)
        var components = 0
        for (start in 0 until n) {
            if (visited[start]) continue
            // Every unvisited node starts a new component.
            components++
            visited[start] = true
            val stack = ArrayDeque<Int>()
            stack.addLast(start)
            while (stack.isNotEmpty()) {
                val node = stack.removeLast()
                for (neighbor in graph[node]) {
                    if (!visited[neighbor]) {
                        visited[neighbor] = true
                        stack.addLast(neighbor)
                    }
                }
            }
        }

        return components
    }
}
