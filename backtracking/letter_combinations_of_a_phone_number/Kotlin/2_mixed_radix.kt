private val keypad = mapOf(
    '2' to "abc", '3' to "def", '4' to "ghi", '5' to "jkl",
    '6' to "mno", '7' to "pqrs", '8' to "tuv", '9' to "wxyz",
)

fun letterCombinations(digits: String): List<String> {
    if (digits.isEmpty()) return emptyList()

    val options = digits.map { keypad.getValue(it) }
    var total = 1
    for (letters in options) total *= letters.length

    val result = ArrayList<String>(total)
    for (k in 0 until total) {
        // Decode k like a mixed-radix number: the last digit varies fastest.
        val chars = CharArray(options.size)
        var rest = k
        for (j in options.indices.reversed()) {
            val letters = options[j]
            chars[j] = letters[rest % letters.length]
            rest /= letters.length
        }
        result.add(chars.concatToString())
    }
    return result
}
