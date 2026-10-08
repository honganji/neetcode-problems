fun generateParenthesis(n: Int): List<String> {
    fun isValid(s: String): Boolean {
        var balance = 0
        for (ch in s) {
            balance += if (ch == '(') 1 else -1
            if (balance < 0) {
                return false
            }
        }
        return balance == 0
    }

    val result = mutableListOf<String>()
    val total = 2 * n
    for (mask in 0 until (1 shl total)) {
        val builder = StringBuilder()
        for (i in 0 until total) {
            builder.append(if ((mask shr i) and 1 == 1) '(' else ')')
        }
        val candidate = builder.toString()
        if (isValid(candidate)) {
            result.add(candidate)
        }
    }
    return result
}
