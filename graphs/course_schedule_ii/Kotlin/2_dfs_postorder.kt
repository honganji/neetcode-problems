class Solution {
    fun findOrder(numCourses: Int, prerequisites: Array<IntArray>): IntArray {
        val nextCourses = Array(numCourses) { mutableListOf<Int>() }
        for (pair in prerequisites) {
            nextCourses[pair[1]].add(pair[0])
        }

        // 0 = unvisited, 1 = on the current path, 2 = finished
        val state = IntArray(numCourses)
        val order = mutableListOf<Int>() // a course is added after every course that depends on it

        fun dfs(course: Int): Boolean {
            if (state[course] == 1) return false // back to the current path -> cycle
            if (state[course] == 2) return true
            state[course] = 1
            for (next in nextCourses[course]) {
                if (!dfs(next)) return false
            }
            state[course] = 2
            order.add(course)
            return true
        }

        for (c in 0 until numCourses) {
            if (!dfs(c)) return IntArray(0)
        }
        // Reversed post-order puts prerequisites before the courses that need them
        return order.reversed().toIntArray()
    }
}
