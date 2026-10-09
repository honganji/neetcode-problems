class Solution {
    fun countSubstrings(s: String): Int {
        val n = s.length

        // d1[i]: how many odd-length palindromes are centered at s[i].
        val d1 = IntArray(n)
        var l = 0
        var r = -1 // rightmost palindrome found so far is s[l..r]
        for (i in 0 until n) {
            // Reuse the mirror image inside the known palindrome when possible.
            var k = if (i > r) 1 else minOf(d1[l + r - i], r - i + 1)
            while (i - k >= 0 && i + k < n && s[i - k] == s[i + k]) {
                k++
            }
            d1[i] = k
            if (i + k - 1 > r) {
                l = i - k + 1
                r = i + k - 1
            }
        }

        // d2[i]: how many even-length palindromes sit between s[i-1] and s[i].
        val d2 = IntArray(n)
        l = 0
        r = -1
        for (i in 0 until n) {
            var k = if (i > r) 0 else minOf(d2[l + r - i + 1], r - i + 1)
            while (i - k - 1 >= 0 && i + k < n && s[i - k - 1] == s[i + k]) {
                k++
            }
            d2[i] = k
            if (i + k - 1 > r) {
                l = i - k
                r = i + k - 1
            }
        }

        return d1.sum() + d2.sum()
    }
}
