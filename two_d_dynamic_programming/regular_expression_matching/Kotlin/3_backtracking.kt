class Solution {
    fun isMatch(s: String, p: String): Boolean {
        fun match(i: Int, j: Int): Boolean {
            if (j == p.length) return i == s.length
            val firstMatch = i < s.length && (p[j] == s[i] || p[j] == '.')
            if (j + 1 < p.length && p[j + 1] == '*') {
                // try zero matches first, then one match staying on "x*"
                return match(i, j + 2) || (firstMatch && match(i + 1, j))
            }
            return firstMatch && match(i + 1, j + 1)
        }

        return match(0, 0)
    }
}
