fun generateParenthesis(n: Int): List<String> {
    val result = mutableListOf<String>()
    val current = StringBuilder()

    fun backtrack(openCount: Int, closeCount: Int) {
        if (current.length == 2 * n) {
            result.add(current.toString())
            return
        }
        if (openCount < n) {
            current.append('(')
            backtrack(openCount + 1, closeCount)
            current.setLength(current.length - 1)
        }
        if (closeCount < openCount) {
            current.append(')')
            backtrack(openCount, closeCount + 1)
            current.setLength(current.length - 1)
        }
    }

    backtrack(0, 0)
    return result
}
