fun topKFrequent(nums: IntArray, k: Int): IntArray {
    val counts = HashMap<Int, Int>()
    for (num in nums) {
        counts[num] = (counts[num] ?: 0) + 1
    }

    return counts.entries
        .sortedByDescending { it.value }
        .take(k)
        .map { it.key }
        .toIntArray()
}
