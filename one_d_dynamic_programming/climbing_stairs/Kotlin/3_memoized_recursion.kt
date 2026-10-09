class Solution {
    fun climbStairs(n: Int): Int {
        val memo = HashMap<Int, Int>()

        fun ways(i: Int): Int {
            if (i <= 1) return 1
            val cached = memo[i]
            if (cached != null) return cached
            val result = ways(i - 1) + ways(i - 2)
            memo[i] = result
            return result
        }

        return ways(n)
    }
}
