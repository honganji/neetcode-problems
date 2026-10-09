class Solution {
    fun wordBreak(s: String, wordDict: List<String>): Boolean {
        // Try every word at the current position and recurse on the rest.
        // No memo, so the same suffix may be re-checked many times.
        fun canSplit(start: Int): Boolean {
            if (start == s.length) return true
            for (word in wordDict) {
                if (s.startsWith(word, start) && canSplit(start + word.length)) return true
            }
            return false
        }

        return canSplit(0)
    }
}
