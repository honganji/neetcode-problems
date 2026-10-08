fun twoSum(nums: IntArray, target: Int): IntArray {
    val indexed = nums.indices.sortedBy { nums[it] }
    var left = 0
    var right = nums.size - 1
    while (left < right) {
        val total = nums[indexed[left]] + nums[indexed[right]]
        if (total == target) {
            return intArrayOf(indexed[left], indexed[right])
        }
        if (total < target) {
            left++
        } else {
            right--
        }
    }
    return intArrayOf()
}
