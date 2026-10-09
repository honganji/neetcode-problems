class Solution {
    fun exist(board: Array<CharArray>, word: String): Boolean {
        val rows = board.size
        val cols = board[0].size

        // If the board lacks any letter the word needs, it can never match.
        val boardCount = board.flatMap { it.toList() }.groupingBy { it }.eachCount()
        val wordCount = word.toList().groupingBy { it }.eachCount()
        if (wordCount.any { (ch, n) -> (boardCount[ch] ?: 0) < n }) return false

        // Start from the rarer end of the word to cut down the branches.
        var target = word
        if ((boardCount[word.first()] ?: 0) > (boardCount[word.last()] ?: 0)) {
            target = word.reversed()
        }

        fun dfs(r: Int, c: Int, i: Int): Boolean {
            if (i == target.length) return true
            if (r < 0 || c < 0 || r >= rows || c >= cols || board[r][c] != target[i]) {
                return false
            }

            // Mark the cell as used in place, then restore it on the way back.
            val saved = board[r][c]
            board[r][c] = '#'
            val found = dfs(r + 1, c, i + 1) || dfs(r - 1, c, i + 1) ||
                dfs(r, c + 1, i + 1) || dfs(r, c - 1, i + 1)
            board[r][c] = saved
            return found
        }

        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (dfs(r, c, 0)) return true
            }
        }
        return false
    }
}
