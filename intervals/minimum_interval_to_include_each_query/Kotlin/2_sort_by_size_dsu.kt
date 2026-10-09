fun minInterval(intervals: Array<IntArray>, queries: IntArray): IntArray {
    // Handle the smallest intervals first. Each query is answered by the first
    // interval that covers it, and a "next unanswered" pointer skips finished queries.
    val sortedQueries = queries.distinct().sorted().toIntArray()
    val m = sortedQueries.size
    val parent = IntArray(m + 1) { it } // parent[m] is a sentinel

    fun find(x: Int): Int {
        var v = x
        while (parent[v] != v) {
            parent[v] = parent[parent[v]] // path halving
            v = parent[v]
        }
        return v
    }

    val best = HashMap<Int, Int>()
    for (iv in intervals.sortedBy { it[1] - it[0] }) {
        val (left, right) = iv
        val size = right - left + 1
        var j = find(lowerBound(sortedQueries, left))
        while (j < m && sortedQueries[j] <= right) {
            best[sortedQueries[j]] = size
            parent[j] = j + 1 // mark answered; skip it from now on
            j = find(j + 1)
        }
    }
    return IntArray(queries.size) { best[queries[it]] ?: -1 }
}

private fun lowerBound(sorted: IntArray, x: Int): Int {
    var lo = 0
    var hi = sorted.size
    while (lo < hi) {
        val mid = (lo + hi) ushr 1
        if (sorted[mid] < x) lo = mid + 1 else hi = mid
    }
    return lo
}
