class Solution {
    fun numDecodings(s: String): Int {
        val n = s.length

        // Try every possible split of s[i:] into 1-digit and 2-digit pieces.
        fun ways(i: Int): Int {
            if (i == n) return 1
            if (s[i] == '0') return 0

            var total = ways(i + 1)
            if (i + 1 < n) {
                val pair = (s[i] - '0') * 10 + (s[i + 1] - '0')
                if (pair in 10..26) {
                    total += ways(i + 2)
                }
            }
            return total
        }

        return ways(0)
    }
}
