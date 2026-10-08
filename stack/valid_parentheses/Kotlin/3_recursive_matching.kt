fun isValid(s: String): Boolean {
    val pairs = mapOf('(' to ')', '[' to ']', '{' to '}')

    fun parse(start: Int): Int {
        if (start >= s.length) return -1
        val closing = pairs[s[start]] ?: return -1
        var i = start + 1
        while (i < s.length && s[i] != closing) {
            i = parse(i)
            if (i == -1) {
                return -1
            }
        }
        return if (i < s.length) i + 1 else -1
    }

    var i = 0
    while (i < s.length) {
        i = parse(i)
        if (i == -1) {
            return false
        }
    }
    return true
}
