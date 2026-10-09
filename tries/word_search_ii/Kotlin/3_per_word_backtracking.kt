fun findWords(board: Array<CharArray>, words: Array<String>): List<String> {
    val rows = board.size
    val cols = board[0].size

    fun exists(r: Int, c: Int, word: String, i: Int): Boolean {
        if (board[r][c] != word[i]) return false
        if (i == word.length - 1) return true
        board[r][c] = '#'
        val ok = (r + 1 < rows && exists(r + 1, c, word, i + 1)) ||
            (r > 0 && exists(r - 1, c, word, i + 1)) ||
            (c + 1 < cols && exists(r, c + 1, word, i + 1)) ||
            (c > 0 && exists(r, c - 1, word, i + 1))
        board[r][c] = word[i]
        return ok
    }

    val found = ArrayList<String>()
    for (word in words.toSet()) {
        if (word.length > rows * cols) continue
        var hit = false
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (!hit && exists(r, c, word, 0)) hit = true
            }
        }
        if (hit) found.add(word)
    }
    return found
}
