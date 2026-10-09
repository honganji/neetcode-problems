import kotlin.math.min

class Solution {
    fun minDistance(word1: String, word2: String): Int {
        val m = word1.length
        val n = word2.length

        // word1[i:] and word2[j:] are the parts still to match
        fun solve(i: Int, j: Int): Int {
            if (i == m) return n - j // insert the rest of word2
            if (j == n) return m - i // delete the rest of word1
            if (word1[i] == word2[j]) return solve(i + 1, j + 1)
            return 1 + min(
                solve(i + 1, j + 1), // replace
                min(solve(i + 1, j), // delete
                    solve(i, j + 1)) // insert
            )
        }

        return solve(0, 0)
    }
}
