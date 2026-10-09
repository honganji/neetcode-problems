import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min

class Solution {
    fun minDistance(word1: String, word2: String): Int {
        // Try a band of width k around the diagonal; double k until the answer fits.
        var k = max(1, abs(word1.length - word2.length))
        while (true) {
            val result = banded(word1, word2, k)
            if (result <= k) return result
            k *= 2
        }
    }

    private fun banded(word1: String, word2: String, k: Int): Int {
        val m = word1.length
        val n = word2.length
        val inf = m + n + 1 // larger than any real cost
        var prev = IntArray(n + 1) { j -> if (j <= k) j else inf }
        for (i in 1..m) {
            val cur = IntArray(n + 1) { inf }
            if (i <= k) cur[0] = i
            // Only fill cells within k of the diagonal.
            for (j in max(1, i - k)..min(n, i + k)) {
                if (word1[i - 1] == word2[j - 1]) {
                    cur[j] = prev[j - 1]
                } else {
                    cur[j] = 1 + min(prev[j - 1], min(prev[j], cur[j - 1]))
                }
            }
            prev = cur
        }
        return prev[n]
    }
}
