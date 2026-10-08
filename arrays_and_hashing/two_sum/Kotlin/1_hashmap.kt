fun twoSum(nums: IntArray, target: Int): IntArray {
    val seen = HashMap<Int, Int>()
    for (i in nums.indices) {
        val complement = target - nums[i]
        val j = seen[complement]
        if (j != null) {
            return intArrayOf(j, i)
        }
        seen[nums[i]] = i
    }
    return intArrayOf()
}
