fun lastStoneWeight(stones: IntArray): Int {
    val rest = stones.toMutableList()  // copy, so the caller's array is untouched

    while (rest.size > 1) {
        val heaviest = rest.maxOrNull()!!
        rest.remove(heaviest)
        val second = rest.maxOrNull()!!
        rest.remove(second)
        if (heaviest != second) rest.add(heaviest - second)
    }

    return rest.firstOrNull() ?: 0
}
