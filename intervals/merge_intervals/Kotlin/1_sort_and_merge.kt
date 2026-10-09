fun mergeIntervals(intervals: Array<IntArray>): Array<IntArray> {
    val sorted = intervals.sortedBy { it[0] }  // sort by start
    val merged = mutableListOf<IntArray>()
    for (interval in sorted) {
        val last = merged.lastOrNull()
        if (last != null && interval[0] <= last[1]) {  // overlaps or touches
            last[1] = maxOf(last[1], interval[1])
        } else {
            merged.add(intArrayOf(interval[0], interval[1]))
        }
    }
    return merged.toTypedArray()
}
