class Solution {
    fun isMatch(s: String, p: String): Boolean {
        val n = p.length

        // A "x*" token can be skipped entirely, so jump over it
        fun closure(active: BooleanArray) {
            for (j in 0 until n) {
                if (active[j] && j + 1 < n && p[j + 1] == '*') {
                    active[j + 2] = true
                }
            }
        }

        // State j = "next we must match p[j]"; state n = whole pattern consumed
        var cur = BooleanArray(n + 1)
        cur[0] = true
        closure(cur)

        for (c in s) {
            val nxt = BooleanArray(n + 1)
            for (j in 0 until n) {
                if (cur[j] && (p[j] == c || p[j] == '.')) {
                    if (j + 1 < n && p[j + 1] == '*') {
                        nxt[j] = true // stay on "x*" to allow more matches
                    } else {
                        nxt[j + 1] = true
                    }
                }
            }
            closure(nxt)
            cur = nxt
        }

        return cur[n]
    }
}
