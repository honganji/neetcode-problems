class Solution {
    fun findOrder(numCourses: Int, prerequisites: Array<IntArray>): IntArray {
        val prereqs = Array(numCourses) { mutableListOf<Int>() }
        for (pair in prerequisites) {
            prereqs[pair[0]].add(pair[1])
        }

        val taken = BooleanArray(numCourses)
        val order = mutableListOf<Int>()
        while (order.size < numCourses) {
            var progress = false
            for (course in 0 until numCourses) {
                if (!taken[course] && prereqs[course].all { taken[it] }) {
                    taken[course] = true
                    order.add(course)
                    progress = true
                }
            }
            // Nothing could be taken, so every remaining course waits on another one -> cycle
            if (!progress) return IntArray(0)
        }
        return order.toIntArray()
    }
}
