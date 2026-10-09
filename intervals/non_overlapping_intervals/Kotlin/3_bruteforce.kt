fun eraseOverlapIntervals(intervals: Array<IntArray>): Int {
    // Sort by start so the kept intervals are visited left to right.
    intervals.sortBy { it[0] }

    // For each interval, either keep it (if it fits after the last kept one)
    // or skip it. Try both and return the most we can keep.
    fun mostKept(i: Int, lastEnd: Int): Int {
        if (i == intervals.size) return 0

        val skip = mostKept(i + 1, lastEnd)
        val start = intervals[i][0]
        val end = intervals[i][1]
        if (start < lastEnd) return skip

        return maxOf(1 + mostKept(i + 1, end), skip)
    }

    // Int.MIN_VALUE means "nothing kept yet", so any start fits.
    return intervals.size - mostKept(0, Int.MIN_VALUE)
}
