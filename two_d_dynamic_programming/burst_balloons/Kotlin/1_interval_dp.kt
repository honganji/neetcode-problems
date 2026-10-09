class Solution {
    fun maxCoins(nums: IntArray): Int {
        val n = nums.size
        // Pad with 1s so edge balloons have a neighbor on each side.
        val arr = intArrayOf(1) + nums + intArrayOf(1)
        // dp[l][r] = max coins from bursting every balloon in arr[l..r],
        // with arr[l-1] and arr[r+1] left alive as the boundaries.
        val dp = Array(n + 2) { IntArray(n + 2) }

        for (length in 1..n) {
            for (l in 1..(n - length + 1)) {
                val r = l + length - 1
                var best = 0
                // k is the last balloon burst in [l, r]; its neighbors are the boundaries.
                for (k in l..r) {
                    val coins = arr[l - 1] * arr[k] * arr[r + 1]
                    best = maxOf(best, dp[l][k - 1] + coins + dp[k + 1][r])
                }
                dp[l][r] = best
            }
        }

        return dp[1][n]
    }
}
