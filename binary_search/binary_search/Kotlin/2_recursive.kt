fun search(nums: IntArray, target: Int): Int {
    fun helper(low: Int, high: Int): Int {
        if (low > high) {
            return -1
        }
        val mid = low + (high - low) / 2
        if (nums[mid] == target) {
            return mid
        }
        if (nums[mid] < target) {
            return helper(mid + 1, high)
        }
        return helper(low, mid - 1)
    }

    return helper(0, nums.size - 1)
}
