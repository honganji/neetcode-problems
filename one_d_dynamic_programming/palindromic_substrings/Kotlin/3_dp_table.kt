class Solution {
    fun countSubstrings(s: String): Int {
        val n = s.length
        // dp[i][j] is true when s[i..j] is a palindrome.
        val dp = Array(n) { BooleanArray(n) }
        var count = 0
        for (i in n - 1 downTo 0) {
            for (j in i until n) {
                // Ends must match, and the inside must itself be a palindrome (or empty/one char).
                if (s[i] == s[j] && (j - i < 2 || dp[i + 1][j - 1])) {
                    dp[i][j] = true
                    count++
                }
            }
        }
        return count
    }
}
