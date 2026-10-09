class Solution {
    fun change(amount: Int, coins: IntArray): Int {
        val n = coins.size
        // memo[i][r] = ways to make r using coins[i..], -1 means not computed yet
        val memo = Array(n + 1) { IntArray(amount + 1) { -1 } }

        fun ways(i: Int, remaining: Int): Int {
            if (remaining == 0) return 1
            if (i == n) return 0
            if (memo[i][remaining] != -1) return memo[i][remaining]

            var total = ways(i + 1, remaining) // skip coins[i]
            if (coins[i] <= remaining) {
                total += ways(i, remaining - coins[i]) // use coins[i] again
            }
            memo[i][remaining] = total
            return total
        }

        return ways(0, amount)
    }
}
