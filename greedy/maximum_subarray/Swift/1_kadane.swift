func maxSubArray(_ nums: [Int]) -> Int {
    var best = nums[0]
    var current = 0
    for num in nums {
        // Either extend the running subarray or restart at this number.
        current = max(num, current + num)
        best = max(best, current)
    }
    return best
}
