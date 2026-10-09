fun lengthOfLongestSubstring(s: String): Int {
    var best = 0
    for (start in s.indices) {
        val seen = HashSet<Char>()
        for (end in start until s.length) {
            if (!seen.add(s[end])) {
                break
            }
        }
        best = maxOf(best, seen.size)
    }
    return best
}
