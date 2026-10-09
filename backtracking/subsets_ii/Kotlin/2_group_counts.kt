fun subsetsWithDup(nums: IntArray): List<List<Int>> {
    val counts = nums.asIterable().groupingBy { it }.eachCount().toSortedMap()

    // For each distinct value, a subset takes 0, 1, ..., count copies of it.
    var result: List<List<Int>> = listOf(emptyList())
    for ((value, count) in counts) {
        val next = mutableListOf<List<Int>>()
        for (subset in result) {
            for (k in 0..count) {
                next.add(subset + List(k) { value })
            }
        }
        result = next
    }
    return result
}
