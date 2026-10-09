import kotlin.math.max

class Solution {
    fun leastInterval(tasks: CharArray, n: Int): Int {
        val counts = tasks.toList().groupingBy { it }.eachCount()
        val maxFreq = counts.values.max()
        // How many letters tie for the highest count
        val maxCount = counts.values.count { it == maxFreq }

        // (maxFreq - 1) gaps of size n + 1, plus one final slot per tied letter
        val formula = (maxFreq - 1) * (n + 1) + maxCount
        // If there are more tasks than the layout holds, no idle time is needed
        return max(tasks.size, formula)
    }
}
