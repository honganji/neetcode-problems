class Solution {
    fun rob(nums: IntArray): Int {
        val n = nums.size
        // dp[i] = best total using the first i houses
        val dp = IntArray(n + 1)
        for (i in 1..n) {
            val take = nums[i - 1] + (if (i >= 2) dp[i - 2] else 0)
            dp[i] = maxOf(dp[i - 1], take)
        }
        return dp[n]
    }
}
