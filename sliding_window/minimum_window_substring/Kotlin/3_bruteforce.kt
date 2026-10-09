fun minWindow(s: String, t: String): String {
    if (t.isEmpty() || t.length > s.length) return ""
    val need = IntArray(128)
    for (ch in t) {
        need[ch.code]++
    }
    var bestStart = 0
    var bestLen = s.length + 1
    for (start in s.indices) {
        if (s.length - start < t.length) break
        val count = need.copyOf()
        var missing = t.length
        for (end in start until s.length) {
            if (end - start + 1 >= bestLen) break
            val code = s[end].code
            if (count[code] > 0) missing--
            count[code]--
            if (missing == 0) {
                bestStart = start
                bestLen = end - start + 1
                break
            }
        }
    }
    return if (bestLen > s.length) "" else s.substring(bestStart, bestStart + bestLen)
}
