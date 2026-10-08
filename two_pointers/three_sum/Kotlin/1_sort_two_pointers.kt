fun threeSum(nums: IntArray): List<List<Int>> {
    nums.sort()
    val result = mutableListOf<List<Int>>()
    for (i in 0 until nums.size - 2) {
        if (i > 0 && nums[i] == nums[i - 1]) continue
        if (nums[i] > 0) break
        var left = i + 1
        var right = nums.size - 1
        while (left < right) {
            val total = nums[i] + nums[left] + nums[right]
            if (total < 0) {
                left++
            } else if (total > 0) {
                right--
            } else {
                result.add(listOf(nums[i], nums[left], nums[right]))
                left++
                right--
                while (left < right && nums[left] == nums[left - 1]) {
                    left++
                }
                while (left < right && nums[right] == nums[right + 1]) {
                    right--
                }
            }
        }
    }
    return result
}
