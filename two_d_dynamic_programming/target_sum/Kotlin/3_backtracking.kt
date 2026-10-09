fun findTargetSumWays(nums: IntArray, target: Int): Int {
    fun backtrack(i: Int, current: Int): Int {
        if (i == nums.size) return if (current == target) 1 else 0
        // give nums[i] a "+" sign, then a "-" sign
        return backtrack(i + 1, current + nums[i]) + backtrack(i + 1, current - nums[i])
    }

    return backtrack(0, 0)
}
