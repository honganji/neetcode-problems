class Solution {
    fun longestPalindrome(s: String): String {
        val n = s.length
        // dp[i][j] is true when s[i..j] is a palindrome.
        val dp = Array(n) { BooleanArray(n) }
        var start = 0
        var best = 0

        // Going i from right to left means dp[i + 1][...] is ready when needed.
        for (i in n - 1 downTo 0) {
            for (j in i until n) {
                // s[i..j] is a palindrome if its ends match and the inside is one too.
                if (s[i] == s[j] && (j - i < 2 || dp[i + 1][j - 1])) {
                    dp[i][j] = true
                    if (j - i + 1 > best) {
                        start = i
                        best = j - i + 1
                    }
                }
            }
        }
        return s.substring(start, start + best)
    }
}
