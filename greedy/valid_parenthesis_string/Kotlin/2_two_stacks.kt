fun checkValidString(s: String): Boolean {
    val openPositions = ArrayDeque<Int>() // indices of '(' that are not matched yet
    val starPositions = ArrayDeque<Int>() // indices of '*'
    for ((i, c) in s.withIndex()) {
        when {
            c == '(' -> openPositions.addLast(i)
            c == '*' -> starPositions.addLast(i)
            // Match ')' with a real '(' first, and save '*' for later.
            openPositions.isNotEmpty() -> openPositions.removeLast()
            starPositions.isNotEmpty() -> starPositions.removeLast()
            else -> return false
        }
    }
    // Each leftover '(' needs a '*' after it to close it.
    while (openPositions.isNotEmpty() && starPositions.isNotEmpty()) {
        if (openPositions.removeLast() > starPositions.removeLast()) return false
    }
    return openPositions.isEmpty()
}
