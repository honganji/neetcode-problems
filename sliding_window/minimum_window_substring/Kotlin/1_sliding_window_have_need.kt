fun minWindow(s: String, t: String): String {
    if (t.isEmpty() || t.length > s.length) return ""
    val need = IntArray(128)
    var required = 0
    for (ch in t) {
        if (need[ch.code] == 0) required++
        need[ch.code]++
    }
    val window = IntArray(128)
    var have = 0
    var bestStart = 0
    var bestLen = s.length + 1
    var left = 0
    for (right in s.indices) {
        val code = s[right].code
        window[code]++
        if (need[code] > 0 && window[code] == need[code]) have++
        while (have == required) {
            if (right - left + 1 < bestLen) {
                bestStart = left
                bestLen = right - left + 1
            }
            val out = s[left].code
            window[out]--
            if (need[out] > 0 && window[out] < need[out]) have--
            left++
        }
    }
    return if (bestLen > s.length) "" else s.substring(bestStart, bestStart + bestLen)
}
