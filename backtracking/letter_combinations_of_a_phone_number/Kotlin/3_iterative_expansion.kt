private val keypad = mapOf(
    '2' to "abc", '3' to "def", '4' to "ghi", '5' to "jkl",
    '6' to "mno", '7' to "pqrs", '8' to "tuv", '9' to "wxyz",
)

fun letterCombinations(digits: String): List<String> {
    if (digits.isEmpty()) return emptyList()

    var combos = listOf("")
    for (d in digits) {
        combos = combos.flatMap { prefix -> keypad.getValue(d).map { prefix + it } }
    }
    return combos
}
