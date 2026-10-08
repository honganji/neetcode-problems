fun threeSum(nums: IntArray): List<List<Int>> {
    nums.sort()
    val triplets = LinkedHashSet<List<Int>>()
    for (i in 0 until nums.size - 2) {
        for (j in i + 1 until nums.size - 1) {
            for (k in j + 1 until nums.size) {
                if (nums[i] + nums[j] + nums[k] == 0) {
                    triplets.add(listOf(nums[i], nums[j], nums[k]))
                }
            }
        }
    }
    return triplets.toList()
}
