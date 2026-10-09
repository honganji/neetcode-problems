class Solution {
    fun change(amount: Int, coins: IntArray): Int {
        val dp = IntArray(amount + 1)
        dp[0] = 1 // one way to make 0: use no coins

        for (coin in coins) {
            // Counting upward lets a coin be reused as many times as needed.
            for (a in coin..amount) {
                dp[a] += dp[a - coin]
            }
        }
        return dp[amount]
    }
}
