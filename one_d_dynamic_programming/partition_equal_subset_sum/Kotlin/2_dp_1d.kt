class Solution {
    fun canPartition(nums: IntArray): Boolean {
        val total = nums.sum()
        if (total % 2 != 0) return false
        val target = total / 2

        // dp[s] is true when some subset adds up to exactly s.
        val dp = BooleanArray(target + 1)
        dp[0] = true
        for (num in nums) {
            // Go backwards so each number is used at most once.
            for (s in target downTo num) {
                dp[s] = dp[s] || dp[s - num]
            }
        }

        return dp[target]
    }
}
