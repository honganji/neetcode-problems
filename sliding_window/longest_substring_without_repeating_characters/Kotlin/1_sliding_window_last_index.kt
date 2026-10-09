fun lengthOfLongestSubstring(s: String): Int {
    val lastIndex = HashMap<Char, Int>()
    var left = 0
    var best = 0
    for (right in s.indices) {
        val prev = lastIndex[s[right]]
        if (prev != null && prev >= left) {
            left = prev + 1
        }
        lastIndex[s[right]] = right
        best = maxOf(best, right - left + 1)
    }
    return best
}
