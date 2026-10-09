fun characterReplacement(s: String, k: Int): Int {
    var best = 0
    for (start in s.indices) {
        val counts = IntArray(26)
        var maxCount = 0
        for (end in start until s.length) {
            val idx = s[end] - 'A'
            counts[idx]++
            maxCount = maxOf(maxCount, counts[idx])
            if (end - start + 1 - maxCount > k) {
                break
            }
            best = maxOf(best, end - start + 1)
        }
    }
    return best
}
