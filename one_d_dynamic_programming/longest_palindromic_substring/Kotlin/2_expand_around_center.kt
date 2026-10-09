class Solution {
    fun longestPalindrome(s: String): String {
        var start = 0
        var best = 0
        for (center in s.indices) {
            // Odd-length palindromes center on a character, even-length on a gap.
            for (offset in 0..1) {
                var left = center
                var right = center + offset
                while (left >= 0 && right < s.length && s[left] == s[right]) {
                    left--
                    right++
                }
                // s.substring(left + 1, right) is the palindrome found from this center.
                val length = right - left - 1
                if (length > best) {
                    best = length
                    start = left + 1
                }
            }
        }
        return s.substring(start, start + best)
    }
}
