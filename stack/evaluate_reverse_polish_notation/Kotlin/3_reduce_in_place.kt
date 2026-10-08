fun evalRPN(tokens: Array<String>): Int {
    val operators = setOf("+", "-", "*", "/")
    val list = tokens.toMutableList()
    while (list.size > 1) {
        var i = 0
        while (list[i] !in operators) {
            i++
        }
        val a = list[i - 2].toInt()
        val b = list[i - 1].toInt()
        val result = when (list[i]) {
            "+" -> a + b
            "-" -> a - b
            "*" -> a * b
            else -> a / b
        }
        list.subList(i - 2, i + 1).clear()
        list.add(i - 2, result.toString())
    }
    return list[0].toInt()
}
