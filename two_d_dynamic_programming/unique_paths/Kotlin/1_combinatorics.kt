class Solution {
    fun uniquePaths(m: Int, n: Int): Int {
        // Every path is a sequence of (m - 1) downs and (n - 1) rights.
        // The answer is how many ways we can pick which moves are downs: C(m + n - 2, k).
        val total = m + n - 2
        val k = minOf(m - 1, n - 1)
        // Long keeps the intermediate product from overflowing.
        var result = 1L
        for (i in 1..k) {
            // Each step keeps result an exact integer, so integer division is safe here.
            result = result * (total - k + i) / i
        }
        return result.toInt()
    }
}
