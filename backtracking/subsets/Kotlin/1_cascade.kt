fun subsets(nums: IntArray): List<List<Int>> {
    val result = mutableListOf(listOf<Int>())
    for (num in nums) {
        // Each existing subset gets a copy with num added to it.
        val copies = result.map { it + num }
        result.addAll(copies)
    }
    return result
}
