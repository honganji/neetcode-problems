fun maxSubArray(nums: IntArray): Int {
    var best = nums[0]
    var current = 0
    for (num in nums) {
        // Either extend the running subarray or restart at this number.
        current = maxOf(num, current + num)
        best = maxOf(best, current)
    }
    return best
}
