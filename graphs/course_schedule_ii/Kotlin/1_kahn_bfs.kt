class Solution {
    fun findOrder(numCourses: Int, prerequisites: Array<IntArray>): IntArray {
        // nextCourses[p] = courses that get one step closer to unlocked once p is taken
        val nextCourses = Array(numCourses) { mutableListOf<Int>() }
        val indegree = IntArray(numCourses) // unfinished prerequisites per course
        for (pair in prerequisites) {
            nextCourses[pair[1]].add(pair[0])
            indegree[pair[0]]++
        }

        val queue = ArrayDeque<Int>()
        for (c in 0 until numCourses) {
            if (indegree[c] == 0) queue.addLast(c)
        }

        val order = IntArray(numCourses)
        var count = 0
        while (queue.isNotEmpty()) {
            val course = queue.removeFirst()
            order[count++] = course
            for (next in nextCourses[course]) {
                indegree[next]--
                if (indegree[next] == 0) queue.addLast(next)
            }
        }

        // Courses left out are stuck in a cycle
        return if (count == numCourses) order else IntArray(0)
    }
}
