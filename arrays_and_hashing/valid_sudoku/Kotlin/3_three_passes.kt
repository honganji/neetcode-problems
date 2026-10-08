fun isValidSudoku(board: Array<CharArray>): Boolean {
    fun hasDuplicate(cells: List<Char>): Boolean {
        val seen = HashSet<Char>()
        for (ch in cells) {
            if (ch == '.') continue
            if (!seen.add(ch)) return true
        }
        return false
    }

    for (r in 0 until 9) {
        if (hasDuplicate(board[r].toList())) return false
    }
    for (c in 0 until 9) {
        if (hasDuplicate((0 until 9).map { board[it][c] })) return false
    }
    for (br in 0 until 9 step 3) {
        for (bc in 0 until 9 step 3) {
            val cells = mutableListOf<Char>()
            for (r in br until br + 3) {
                for (c in bc until bc + 3) {
                    cells.add(board[r][c])
                }
            }
            if (hasDuplicate(cells)) return false
        }
    }
    return true
}
