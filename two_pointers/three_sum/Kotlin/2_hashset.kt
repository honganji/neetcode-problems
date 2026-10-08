fun threeSum(nums: IntArray): List<List<Int>> {
    nums.sort()
    val result = mutableListOf<List<Int>>()
    for (i in 0 until nums.size - 2) {
        if (i > 0 && nums[i] == nums[i - 1]) continue
        if (nums[i] > 0) break
        val seen = HashSet<Int>()
        var j = i + 1
        while (j < nums.size) {
            val complement = -nums[i] - nums[j]
            if (complement in seen) {
                result.add(listOf(nums[i], complement, nums[j]))
                while (j + 1 < nums.size && nums[j] == nums[j + 1]) {
                    j++
                }
            }
            seen.add(nums[j])
            j++
        }
    }
    return result
}
