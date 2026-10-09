class Solution {
    fun canFinish(numCourses: Int, prerequisites: Array<IntArray>): Boolean {
        // Edge prerequisite -> course.
        val graph = Array(numCourses) { mutableListOf<Int>() }
        for (pair in prerequisites) {
            graph[pair[1]].add(pair[0])
        }

        // A course is on a cycle if we can walk from it back to itself.
        fun reachesItself(start: Int): Boolean {
            val seen = HashSet<Int>()
            val stack = ArrayDeque(graph[start])
            while (stack.isNotEmpty()) {
                val node = stack.removeLast()
                if (node == start) return true
                if (!seen.add(node)) continue
                stack.addAll(graph[node])
            }
            return false
        }

        for (course in 0 until numCourses) {
            if (reachesItself(course)) return false
        }
        return true
    }
}
