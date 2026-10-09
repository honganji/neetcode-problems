class Solution {
    fun longestPalindrome(s: String): String {
        // Interleave '#' so every palindrome has odd length ("aba" -> "#a#b#a#").
        val t = buildString {
            append('#')
            for (c in s) {
                append(c)
                append('#')
            }
        }
        val n = t.length

        // p[i]: radius of the palindrome centered at t[i] (in t, not in s).
        val p = IntArray(n)
        var center = 0
        var right = 0 // the palindrome reaching furthest right so far
        var bestCenter = 0
        for (i in 0 until n) {
            if (i < right) {
                // Start from the mirror image's radius, capped at the known box.
                p[i] = minOf(right - i, p[2 * center - i])
            }
            while (i - p[i] - 1 >= 0 && i + p[i] + 1 < n && t[i - p[i] - 1] == t[i + p[i] + 1]) {
                p[i]++
            }
            if (i + p[i] > right) {
                center = i
                right = i + p[i]
            }
            if (p[i] > p[bestCenter]) bestCenter = i
        }

        val start = (bestCenter - p[bestCenter]) / 2
        return s.substring(start, start + p[bestCenter])
    }
}
