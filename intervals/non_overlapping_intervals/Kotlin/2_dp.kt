fun eraseOverlapIntervals(intervals: Array<IntArray>): Int {
    if (intervals.isEmpty()) return 0

    // Sorting by end time means any interval that can come before interval i
    // in a chain has a smaller index.
    intervals.sortBy { it[1] }

    val n = intervals.size
    // best[i] = most intervals we can keep, ending with interval i.
    val best = IntArray(n) { 1 }
    for (i in 0 until n) {
        for (j in 0 until i) {
            if (intervals[j][1] <= intervals[i][0]) {
                best[i] = maxOf(best[i], best[j] + 1)
            }
        }
    }

    return n - best.max()
}
