class Solution {
    fun rob(nums: IntArray): Int {
        val n = nums.size
        if (n == 1) return nums[0]
        // Breaking the circle at either end leaves a straight line of houses.
        return maxOf(robRange(nums, 0, n - 2), robRange(nums, 1, n - 1))
    }

    private fun robRange(nums: IntArray, start: Int, end: Int): Int {
        // Classic "House Robber" on a straight line, using two rolling values.
        var prev2 = 0 // best total up to two houses back
        var prev1 = 0 // best total up to one house back
        for (i in start..end) {
            val current = maxOf(prev1, prev2 + nums[i])
            prev2 = prev1
            prev1 = current
        }
        return prev1
    }
}
