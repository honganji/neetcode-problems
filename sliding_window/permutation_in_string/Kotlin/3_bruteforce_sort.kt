fun checkInclusion(s1: String, s2: String): Boolean {
    if (s1.length > s2.length) {
        return false
    }
    val target = s1.toCharArray().sorted()
    for (start in 0..s2.length - s1.length) {
        if (s2.substring(start, start + s1.length).toCharArray().sorted() == target) {
            return true
        }
    }
    return false
}
