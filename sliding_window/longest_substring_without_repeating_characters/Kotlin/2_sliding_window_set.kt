fun lengthOfLongestSubstring(s: String): Int {
    val window = HashSet<Char>()
    var left = 0
    var best = 0
    for (right in s.indices) {
        while (s[right] in window) {
            window.remove(s[left])
            left++
        }
        window.add(s[right])
        best = maxOf(best, right - left + 1)
    }
    return best
}
