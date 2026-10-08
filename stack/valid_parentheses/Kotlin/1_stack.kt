fun isValid(s: String): Boolean {
    val pairs = mapOf(')' to '(', ']' to '[', '}' to '{')
    val stack = ArrayDeque<Char>()
    for (ch in s) {
        val opening = pairs[ch]
        if (opening != null) {
            if (stack.isEmpty() || stack.removeLast() != opening) {
                return false
            }
        } else {
            stack.addLast(ch)
        }
    }
    return stack.isEmpty()
}
