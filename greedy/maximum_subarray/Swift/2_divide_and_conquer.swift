func maxSubArray(_ nums: [Int]) -> Int {
    // Best subarray that lies entirely within nums[lo...hi].
    func solve(_ lo: Int, _ hi: Int) -> Int {
        if lo == hi {
            return nums[lo]
        }
        let mid = (lo + hi) / 2

        // Best subarray crossing the middle that ends at mid (left side).
        var leftBest = nums[mid]
        var running = nums[mid]
        for i in stride(from: mid - 1, through: lo, by: -1) {
            running += nums[i]
            leftBest = max(leftBest, running)
        }

        // Best subarray crossing the middle that starts at mid + 1 (right side).
        var rightBest = nums[mid + 1]
        running = nums[mid + 1]
        for i in stride(from: mid + 2, through: hi, by: 1) {
            running += nums[i]
            rightBest = max(rightBest, running)
        }

        return max(solve(lo, mid), solve(mid + 1, hi), leftBest + rightBest)
    }

    return solve(0, nums.count - 1)
}
