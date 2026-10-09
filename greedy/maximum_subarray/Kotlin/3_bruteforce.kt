fun maxSubArray(nums: IntArray): Int {
    var best = nums[0]
    for (start in nums.indices) {
        var total = 0
        // Grow the subarray one element at a time from this start point.
        for (end in start until nums.size) {
            total += nums[end]
            best = maxOf(best, total)
        }
    }
    return best
}
