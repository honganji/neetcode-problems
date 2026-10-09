class Solution {
    fun partition(s: String): List<List<String>> {
        val n = s.length
        // isPal[i][j] is true when s[i..j] is a palindrome.
        val isPal = Array(n) { BooleanArray(n) }
        for (i in n - 1 downTo 0) {
            for (j in i until n) {
                isPal[i][j] = s[i] == s[j] && (j - i < 2 || isPal[i + 1][j - 1])
            }
        }

        val result = mutableListOf<List<String>>()
        val current = mutableListOf<String>()

        fun backtrack(start: Int) {
            if (start == n) {
                result.add(current.toList())
                return
            }
            for (end in start until n) {
                if (isPal[start][end]) {
                    current.add(s.substring(start, end + 1))
                    backtrack(end + 1)
                    current.removeAt(current.size - 1)
                }
            }
        }

        backtrack(0)
        return result
    }
}
