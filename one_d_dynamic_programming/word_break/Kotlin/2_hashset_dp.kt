class Solution {
    fun wordBreak(s: String, wordDict: List<String>): Boolean {
        val words = wordDict.toHashSet()
        val maxLen = wordDict.maxOf { it.length }

        val n = s.length
        val canReach = BooleanArray(n + 1)  // canReach[i]: s[:i] can be split
        canReach[0] = true

        for (i in 1..n) {
            // Only the last maxLen characters can form the final word.
            for (j in i - 1 downTo maxOf(0, i - maxLen)) {
                if (canReach[j] && s.substring(j, i) in words) {
                    canReach[i] = true
                    break
                }
            }
        }

        return canReach[n]
    }
}
