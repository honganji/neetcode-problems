fun subsetsWithDup(nums: IntArray): List<List<Int>> {
    val n = nums.size
    val seen = HashSet<List<Int>>()
    val result = mutableListOf<List<Int>>()

    // Every bit pattern is one candidate subset.
    for (mask in 0 until (1 shl n)) {
        val subset = (0 until n)
            .filter { (mask and (1 shl it)) != 0 }
            .map { nums[it] }
            // Sorting makes [1, 2] and [2, 1] the same key.
            .sorted()
        if (seen.add(subset)) {
            result.add(subset)
        }
    }
    return result
}
