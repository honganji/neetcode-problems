fun lastStoneWeight(stones: IntArray): Int {
    val sorted = stones.sorted().toMutableList()  // ascending, so the heaviest are at the end

    while (sorted.size > 1) {
        val heaviest = sorted.removeAt(sorted.size - 1)
        val second = sorted.removeAt(sorted.size - 1)
        if (heaviest != second) {
            val diff = heaviest - second
            // binarySearch returns the index if found, otherwise -(insertionPoint) - 1
            val found = sorted.binarySearch(diff)
            sorted.add(if (found >= 0) found else -found - 1, diff)
        }
    }

    return sorted.firstOrNull() ?: 0
}
