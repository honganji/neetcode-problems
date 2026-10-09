class Solution {
    fun canFinish(numCourses: Int, prerequisites: Array<IntArray>): Boolean {
        val graph = Array(numCourses) { mutableListOf<Int>() }
        for (pair in prerequisites) {
            graph[pair[0]].add(pair[1])
        }

        // 0 = not visited, 1 = on the current DFS path, 2 = fully explored
        val state = IntArray(numCourses)
        val nextEdge = IntArray(numCourses)  // next prerequisite to check per course

        // Iterative DFS with an explicit stack.
        for (start in 0 until numCourses) {
            if (state[start] != 0) continue
            state[start] = 1
            val stack = ArrayDeque<Int>()
            stack.addLast(start)
            while (stack.isNotEmpty()) {
                val node = stack.last()
                if (nextEdge[node] < graph[node].size) {
                    val next = graph[node][nextEdge[node]]
                    nextEdge[node]++
                    if (state[next] == 1) return false  // back edge to the current path -> cycle
                    if (state[next] == 0) {
                        state[next] = 1
                        stack.addLast(next)
                    }
                } else {
                    state[node] = 2
                    stack.removeLast()
                }
            }
        }
        return true
    }
}
