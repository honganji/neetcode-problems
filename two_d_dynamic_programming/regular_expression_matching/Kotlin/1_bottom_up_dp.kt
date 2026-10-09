class Solution {
    fun isMatch(s: String, p: String): Boolean {
        val m = s.length
        val n = p.length
        // nextRow[j] = does s[i+1:] match p[j:]
        var nextRow = BooleanArray(n + 1)
        for (i in m downTo 0) {
            // cur[j] = does s[i:] match p[j:]
            val cur = BooleanArray(n + 1)
            cur[n] = i == m // empty text matches an empty pattern suffix
            for (j in n - 1 downTo 0) {
                val firstMatch = i < m && (p[j] == s[i] || p[j] == '.')
                if (j + 1 < n && p[j + 1] == '*') {
                    // skip "x*" entirely, or consume one char and stay on "x*"
                    cur[j] = cur[j + 2] || (firstMatch && nextRow[j])
                } else {
                    cur[j] = firstMatch && nextRow[j + 1]
                }
            }
            nextRow = cur
        }
        return nextRow[0]
    }
}
