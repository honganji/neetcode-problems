class Solution {
    fun partition(s: String): List<List<String>> {
        val n = s.length
        val result = mutableListOf<List<String>>()

        // Bit k of mask set means "cut after index k".
        for (mask in 0 until (1 shl (n - 1))) {
            val parts = mutableListOf<String>()
            var start = 0
            var valid = true
            for (end in 0 until n) {
                val isCut = end == n - 1 || ((mask shr end) and 1) == 1
                if (!isCut) continue
                if (!isPalindrome(s, start, end)) {
                    valid = false
                    break
                }
                parts.add(s.substring(start, end + 1))
                start = end + 1
            }
            if (valid) result.add(parts)
        }
        return result
    }

    private fun isPalindrome(s: String, from: Int, to: Int): Boolean {
        var l = from
        var r = to
        while (l < r) {
            if (s[l] != s[r]) return false
            l++
            r--
        }
        return true
    }
}
