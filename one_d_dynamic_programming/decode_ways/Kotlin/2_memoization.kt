class Solution {
    fun numDecodings(s: String): Int {
        val n = s.length
        val memo = HashMap<Int, Int>()

        // Number of ways to decode s[i:].
        fun ways(i: Int): Int {
            if (i == n) return 1
            if (s[i] == '0') return 0
            memo[i]?.let { return it }

            // Decode one digit, then optionally decode two digits.
            var result = ways(i + 1)
            if (i + 1 < n) {
                val pair = (s[i] - '0') * 10 + (s[i + 1] - '0')
                if (pair in 10..26) {
                    result += ways(i + 2)
                }
            }

            memo[i] = result
            return result
        }

        return ways(0)
    }
}
