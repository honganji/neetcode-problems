fun maxSubArray(nums: IntArray): Int {
    // Best subarray that lies entirely within nums[lo..hi].
    fun solve(lo: Int, hi: Int): Int {
        if (lo == hi) {
            return nums[lo]
        }
        val mid = (lo + hi) / 2

        // Best subarray crossing the middle that ends at mid (left side).
        var leftBest = nums[mid]
        var running = nums[mid]
        for (i in mid - 1 downTo lo) {
            running += nums[i]
            leftBest = maxOf(leftBest, running)
        }

        // Best subarray crossing the middle that starts at mid + 1 (right side).
        var rightBest = nums[mid + 1]
        running = nums[mid + 1]
        for (i in mid + 2..hi) {
            running += nums[i]
            rightBest = maxOf(rightBest, running)
        }

        return maxOf(solve(lo, mid), solve(mid + 1, hi), leftBest + rightBest)
    }

    return solve(0, nums.size - 1)
}
