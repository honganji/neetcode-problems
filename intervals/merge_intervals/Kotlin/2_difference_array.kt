fun mergeIntervals(intervals: Array<IntArray>): Array<IntArray> {
    if (intervals.isEmpty()) return arrayOf()
    // Double every coordinate: point x is cell 2x, the gap (x, x+1) is cell 2x+1.
    // Then [1, 4] and [4, 5] touch (no gap cell), but [1, 4] and [5, 6] do not.
    val maxEnd = intervals.maxOf { it[1] }
    val limit = 2 * maxEnd + 2
    val diff = IntArray(limit + 1)
    for (interval in intervals) {
        diff[2 * interval[0]]++  // coverage begins at this cell
        diff[2 * interval[1] + 1]--  // and stops right after this interval's last cell
    }

    val merged = mutableListOf<IntArray>()
    var covered = 0  // how many intervals cover the current cell
    var openStart = -1  // first cell of the run we are inside, or -1
    for (cell in 0 until limit) {
        covered += diff[cell]
        if (covered > 0 && openStart == -1) {
            openStart = cell
        } else if (covered == 0 && openStart != -1) {
            merged.add(intArrayOf(openStart / 2, (cell - 1) / 2))
            openStart = -1
        }
    }
    return merged.toTypedArray()
}
