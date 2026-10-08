fun evalRPN(tokens: Array<String>): Int {
    var index = tokens.size - 1

    fun evaluate(): Int {
        val token = tokens[index]
        index--
        return when (token) {
            "+", "-", "*", "/" -> {
                val b = evaluate()
                val a = evaluate()
                when (token) {
                    "+" -> a + b
                    "-" -> a - b
                    "*" -> a * b
                    else -> a / b
                }
            }
            else -> token.toInt()
        }
    }

    return evaluate()
}
