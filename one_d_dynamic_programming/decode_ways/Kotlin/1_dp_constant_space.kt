class Solution {
    fun numDecodings(s: String): Int {
        val n = s.length
        // ways[i] = number of ways to decode s[i:].
        // Only the two most recent values are needed, so keep just those.
        var after = 1      // ways[i + 1], starts as ways[n] = 1 (empty suffix)
        var afterNext = 0  // ways[i + 2]

        for (i in n - 1 downTo 0) {
            var ways = 0
            if (s[i] != '0') {
                // Decode s[i] as a single letter.
                ways = after
                // Or decode s[i:i+2] as a pair, if it is 10..26.
                if (i + 1 < n) {
                    val pair = (s[i] - '0') * 10 + (s[i + 1] - '0')
                    if (pair in 10..26) {
                        ways += afterNext
                    }
                }
            }
            afterNext = after
            after = ways
        }

        return after
    }
}
