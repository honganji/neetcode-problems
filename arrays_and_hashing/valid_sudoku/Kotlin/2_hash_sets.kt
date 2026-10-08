fun isValidSudoku(board: Array<CharArray>): Boolean {
    val rows = Array(9) { HashSet<Char>() }
    val cols = Array(9) { HashSet<Char>() }
    val boxes = Array(9) { HashSet<Char>() }
    for (r in 0 until 9) {
        for (c in 0 until 9) {
            val ch = board[r][c]
            if (ch == '.') continue
            val b = (r / 3) * 3 + c / 3
            if (!rows[r].add(ch) || !cols[c].add(ch) || !boxes[b].add(ch)) {
                return false
            }
        }
    }
    return true
}
