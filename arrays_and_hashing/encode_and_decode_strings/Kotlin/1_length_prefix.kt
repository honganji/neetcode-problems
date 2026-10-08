fun encode(strs: List<String>): String {
    val sb = StringBuilder()
    for (s in strs) {
        sb.append(s.length).append('#').append(s)
    }
    return sb.toString()
}

fun decode(s: String): List<String> {
    val result = mutableListOf<String>()
    var i = 0
    while (i < s.length) {
        val j = s.indexOf('#', i)
        val length = s.substring(i, j).toInt()
        val start = j + 1
        result.add(s.substring(start, start + length))
        i = start + length
    }
    return result
}
