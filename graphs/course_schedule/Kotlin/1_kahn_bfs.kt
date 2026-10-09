class Solution {
    fun canFinish(numCourses: Int, prerequisites: Array<IntArray>): Boolean {
        val graph = Array(numCourses) { mutableListOf<Int>() }
        val indegree = IntArray(numCourses)  // prerequisites each course still waits on
        for (pair in prerequisites) {
            graph[pair[1]].add(pair[0])
            indegree[pair[0]]++
        }

        // Start with courses that have no prerequisites.
        val queue = ArrayDeque<Int>()
        for (i in 0 until numCourses) {
            if (indegree[i] == 0) queue.addLast(i)
        }

        var finished = 0
        while (queue.isNotEmpty()) {
            val node = queue.removeFirst()
            finished++
            for (next in graph[node]) {
                indegree[next]--
                if (indegree[next] == 0) queue.addLast(next)
            }
        }

        // Courses in a cycle never reach zero prerequisites, so they are never taken.
        return finished == numCourses
    }
}
