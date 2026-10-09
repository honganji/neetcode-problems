fun checkInclusion(s1: String, s2: String): Boolean {
    if (s1.length > s2.length) {
        return false
    }
    val need = IntArray(26)
    val window = IntArray(26)
    for (i in s1.indices) {
        need[s1[i] - 'a']++
        window[s2[i] - 'a']++
    }
    var matches = 0
    for (i in 0 until 26) {
        if (need[i] == window[i]) {
            matches++
        }
    }
    for (right in s1.length until s2.length) {
        if (matches == 26) {
            return true
        }
        val enter = s2[right] - 'a'
        window[enter]++
        if (window[enter] == need[enter]) {
            matches++
        } else if (window[enter] == need[enter] + 1) {
            matches--
        }
        val leave = s2[right - s1.length] - 'a'
        window[leave]--
        if (window[leave] == need[leave]) {
            matches++
        } else if (window[leave] == need[leave] - 1) {
            matches--
        }
    }
    return matches == 26
}
