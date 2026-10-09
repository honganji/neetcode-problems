fun eraseOverlapIntervals(intervals: Array<IntArray>): Int {
    if (intervals.isEmpty()) return 0

    // Sort by end time so the interval that finishes earliest comes first.
    intervals.sortBy { it[1] }

    var removed = 0
    var lastEnd = intervals[0][1]
    for (i in 1 until intervals.size) {
        val start = intervals[i][0]
        val end = intervals[i][1]
        if (start < lastEnd) {
            // Overlaps the interval we kept, so remove this one.
            removed++
        } else {
            // No overlap, keep it and move the boundary forward.
            lastEnd = end
        }
    }
    return removed
}
