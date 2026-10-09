fun findMin(nums: IntArray): Int {
    var left = 0
    var right = nums.size - 1
    var result = nums[0]
    while (left <= right) {
        if (nums[left] <= nums[right]) {
            result = minOf(result, nums[left])
            break
        }
        val mid = (left + right) / 2
        result = minOf(result, nums[mid])
        if (nums[mid] >= nums[left]) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return result
}
