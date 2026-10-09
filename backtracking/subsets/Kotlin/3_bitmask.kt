fun subsets(nums: IntArray): List<List<Int>> {
    val n = nums.size
    val result = mutableListOf<List<Int>>()
    // Each mask from 0 to 2^n - 1 is a yes/no pattern: bit i set means nums[i] is included.
    for (mask in 0 until (1 shl n)) {
        val subset = mutableListOf<Int>()
        for (i in 0 until n) {
            if ((mask and (1 shl i)) != 0) subset.add(nums[i])
        }
        result.add(subset)
    }
    return result
}
