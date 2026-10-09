class Solution {
    fun lengthOfLIS(nums: IntArray): Int {
        // dp[i] = length of the longest increasing subsequence ending at nums[i].
        val dp = IntArray(nums.size) { 1 }
        for (i in nums.indices) {
            for (j in 0 until i) {
                if (nums[j] < nums[i]) dp[i] = maxOf(dp[i], dp[j] + 1)
            }
        }
        return dp.maxOrNull() ?: 0
    }
}
