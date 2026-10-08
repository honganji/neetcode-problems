fun isAnagram(s: String, t: String): Boolean {
    if (s.length != t.length) return false
    val remaining = t.toMutableList()
    for (ch in s) {
        val index = remaining.indexOf(ch)
        if (index == -1) return false
        remaining.removeAt(index)
    }
    return true
}
