class Solution {
    fun insert(intervals: Array<IntArray>, newInterval: IntArray): Array<IntArray> {
        val result = mutableListOf<IntArray>()
        val n = intervals.size
        var i = 0

        // 1. Intervals that end before newInterval starts: keep as-is.
        while (i < n && intervals[i][1] < newInterval[0]) {
            result.add(intervals[i])
            i++
        }

        // 2. Intervals that overlap newInterval: absorb them into one bigger interval.
        var start = newInterval[0]
        var end = newInterval[1]
        while (i < n && intervals[i][0] <= end) {
            start = minOf(start, intervals[i][0])
            end = maxOf(end, intervals[i][1])
            i++
        }
        result.add(intArrayOf(start, end))

        // 3. Intervals that start after newInterval ends: keep as-is.
        while (i < n) {
            result.add(intervals[i])
            i++
        }
        return result.toTypedArray()
    }
}
