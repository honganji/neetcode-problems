fun encode(strs: List<String>): String {
    val sb = StringBuilder()
    for (s in strs) {
        sb.append(s.map { it.code }.joinToString(",")).append(';')
    }
    return sb.toString()
}

fun decode(s: String): List<String> {
    val result = mutableListOf<String>()
    val chunks = s.split(';')
    for (k in 0 until chunks.size - 1) {
        val chunk = chunks[k]
        if (chunk.isEmpty()) {
            result.add("")
        } else {
            val chars = chunk.split(',').map { it.toInt().toChar() }
            result.add(String(chars.toCharArray()))
        }
    }
    return result
}
