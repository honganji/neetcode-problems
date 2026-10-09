fun characterReplacement(s: String, k: Int): Int {
    val counts = IntArray(26)
    var left = 0
    var best = 0
    for (right in s.indices) {
        counts[s[right] - 'A']++
        while (right - left + 1 - counts.max() > k) {
            counts[s[left] - 'A']--
            left++
        }
        best = maxOf(best, right - left + 1)
    }
    return best
}
