fun mergeIntervals(intervals: Array<IntArray>): Array<IntArray> {
    val merged = intervals.map { it.copyOf() }.toMutableList()

    fun overlaps(a: IntArray, b: IntArray): Boolean = a[0] <= b[1] && b[0] <= a[1]

    // returns the indices of the first overlapping pair, or null if there is none
    fun findOverlappingPair(): Pair<Int, Int>? {
        for (i in merged.indices) {
            for (j in i + 1 until merged.size) {
                if (overlaps(merged[i], merged[j])) return Pair(i, j)
            }
        }
        return null
    }

    // keep merging any overlapping pair until no two intervals overlap
    while (true) {
        val (i, j) = findOverlappingPair() ?: break
        merged[i] = intArrayOf(minOf(merged[i][0], merged[j][0]), maxOf(merged[i][1], merged[j][1]))
        merged.removeAt(j)
    }

    return merged.sortedBy { it[0] }.toTypedArray()
}
