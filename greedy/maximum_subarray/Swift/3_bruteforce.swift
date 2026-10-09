func maxSubArray(_ nums: [Int]) -> Int {
    var best = nums[0]
    for start in 0..<nums.count {
        var total = 0
        // Grow the subarray one element at a time from this start point.
        for end in start..<nums.count {
            total += nums[end]
            best = max(best, total)
        }
    }
    return best
}
