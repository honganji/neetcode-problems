fun kClosest(points: Array<IntArray>, k: Int): Array<IntArray> {
    // Sort by squared distance, then keep the first k.
    return points
        .sortedBy { it[0] * it[0] + it[1] * it[1] }
        .take(k)
        .toTypedArray()
}
