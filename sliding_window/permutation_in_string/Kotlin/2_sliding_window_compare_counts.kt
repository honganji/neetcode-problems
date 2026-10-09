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
    if (need.contentEquals(window)) {
        return true
    }
    for (right in s1.length until s2.length) {
        window[s2[right] - 'a']++
        window[s2[right - s1.length] - 'a']--
        if (need.contentEquals(window)) {
            return true
        }
    }
    return false
}
