class Solution {
    fun insert(intervals: Array<IntArray>, newInterval: IntArray): Array<IntArray> {
        var start = newInterval[0]
        var end = newInterval[1]

        // The intervals that overlap newInterval form one contiguous block,
        // intervals[lo until hi]. Two binary searches find its edges.
        // lo: first interval that ends at or after newInterval starts.
        val lo = firstIndex(intervals) { it[1] >= start }
        // hi: first interval that starts after newInterval ends.
        val hi = firstIndex(intervals) { it[0] > end }

        // Merge the overlapping block (if any) into newInterval.
        if (lo < hi) {
            start = minOf(start, intervals[lo][0])
            end = maxOf(end, intervals[hi - 1][1])
        }

        val result = intervals.take(lo).toMutableList()
        result.add(intArrayOf(start, end))
        result.addAll(intervals.drop(hi))
        return result.toTypedArray()
    }

    // Binary search. Works because the test is false for a prefix and true after it.
    private fun firstIndex(intervals: Array<IntArray>, test: (IntArray) -> Boolean): Int {
        var lo = 0
        var hi = intervals.size
        while (lo < hi) {
            val mid = (lo + hi) / 2
            if (test(intervals[mid])) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}
