fun minInterval(intervals: Array<IntArray>, queries: IntArray): IntArray {
    // Each interval "paints" the compressed query positions it covers with its size,
    // keeping the minimum. Painting is a range update; reading a query is a point read.
    val sortedQueries = queries.distinct().sorted().toIntArray()
    val m = sortedQueries.size
    val inf = 1 shl 30
    val tree = IntArray(2 * m) { inf } // bottom-up tree; leaves at m..2m-1

    for ((left, right) in intervals) {
        val size = right - left + 1
        var lo = lowerBound(sortedQueries, left) + m
        var hi = upperBound(sortedQueries, right) + m // exclusive
        while (lo < hi) {
            if (lo % 2 == 1) {
                tree[lo] = minOf(tree[lo], size)
                lo++
            }
            if (hi % 2 == 1) {
                hi--
                tree[hi] = minOf(tree[hi], size)
            }
            lo = lo shr 1
            hi = hi shr 1
        }
    }

    val answer = IntArray(queries.size) { -1 }
    for (i in queries.indices) {
        // Walk from the leaf up to the root; the best size painted on the path wins.
        var p = lowerBound(sortedQueries, queries[i]) + m
        var best = inf
        while (p >= 1) {
            best = minOf(best, tree[p])
            p = p shr 1
        }
        if (best != inf) answer[i] = best
    }
    return answer
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

private fun upperBound(sorted: IntArray, x: Int): Int {
    var lo = 0
    var hi = sorted.size
    while (lo < hi) {
        val mid = (lo + hi) ushr 1
        if (sorted[mid] <= x) lo = mid + 1 else hi = mid
    }
    return lo
}
