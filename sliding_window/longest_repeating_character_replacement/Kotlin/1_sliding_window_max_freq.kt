fun characterReplacement(s: String, k: Int): Int {
    val counts = IntArray(26)
    var maxFreq = 0
    var left = 0
    var best = 0
    for (right in s.indices) {
        val idx = s[right] - 'A'
        counts[idx]++
        maxFreq = maxOf(maxFreq, counts[idx])
        if (right - left + 1 - maxFreq > k) {
            counts[s[left] - 'A']--
            left++
        }
        best = maxOf(best, right - left + 1)
    }
    return best
}
