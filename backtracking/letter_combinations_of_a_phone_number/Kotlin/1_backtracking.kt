private val keypad = mapOf(
    '2' to "abc", '3' to "def", '4' to "ghi", '5' to "jkl",
    '6' to "mno", '7' to "pqrs", '8' to "tuv", '9' to "wxyz",
)

fun letterCombinations(digits: String): List<String> {
    if (digits.isEmpty()) return emptyList()

    val result = mutableListOf<String>()
    val path = StringBuilder()

    fun backtrack(i: Int) {
        if (i == digits.length) {
            result.add(path.toString())
            return
        }
        for (ch in keypad.getValue(digits[i])) {
            path.append(ch)
            backtrack(i + 1)
            path.deleteCharAt(path.length - 1)
        }
    }

    backtrack(0)
    return result
}
