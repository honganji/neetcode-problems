fun encode(strs: List<String>): String {
    val sb = StringBuilder()
    for (s in strs) {
        sb.append(s.replace("/", "//")).append("/:")
    }
    return sb.toString()
}

fun decode(s: String): List<String> {
    val result = mutableListOf<String>()
    val current = StringBuilder()
    var i = 0
    while (i < s.length) {
        if (s[i] == '/') {
            if (s[i + 1] == '/') {
                current.append('/')
            } else {
                result.add(current.toString())
                current.setLength(0)
            }
            i += 2
        } else {
            current.append(s[i])
            i++
        }
    }
    return result
}
