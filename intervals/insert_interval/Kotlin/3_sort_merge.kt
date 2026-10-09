class Solution {
    fun insert(intervals: Array<IntArray>, newInterval: IntArray): Array<IntArray> {
        // Add the new interval, then sort everything by start time.
        val combined = (intervals.toList() + listOf(newInterval)).sortedBy { it[0] }

        // Merge neighbours that overlap, like the Merge Intervals problem.
        val merged = mutableListOf<IntArray>()
        for (interval in combined) {
            val last = merged.lastOrNull()
            if (last != null && interval[0] <= last[1]) {
                last[1] = maxOf(last[1], interval[1])
            } else {
                merged.add(intArrayOf(interval[0], interval[1]))
            }
        }
        return merged.toTypedArray()
    }
}
