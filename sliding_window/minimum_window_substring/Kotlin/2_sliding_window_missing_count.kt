fun minWindow(s: String, t: String): String {
    if (t.isEmpty() || t.length > s.length) return ""
    val count = IntArray(128)
    for (ch in t) {
        count[ch.code]++
    }
    var missing = t.length
    var bestStart = 0
    var bestLen = s.length + 1
    var left = 0
    for (right in s.indices) {
        val code = s[right].code
        if (count[code] > 0) missing--
        count[code]--
        while (missing == 0) {
            if (right - left + 1 < bestLen) {
                bestStart = left
                bestLen = right - left + 1
            }
            val out = s[left].code
            count[out]++
            if (count[out] > 0) missing++
            left++
        }
    }
    return if (bestLen > s.length) "" else s.substring(bestStart, bestStart + bestLen)
}
