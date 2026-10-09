class Solution {
    fun solve(board: Array<CharArray>) {
        if (board.isEmpty() || board[0].isEmpty()) return
        val rows = board.size
        val cols = board[0].size
        val queue = ArrayDeque<Int>()

        // Border 'O's are safe: mark them 'S' and start the search from them
        fun markSafe(r: Int, c: Int) {
            if (board[r][c] == 'O') {
                board[r][c] = 'S'
                queue.addLast(r * cols + c)
            }
        }

        for (r in 0 until rows) {
            markSafe(r, 0)
            markSafe(r, cols - 1)
        }
        for (c in 0 until cols) {
            markSafe(0, c)
            markSafe(rows - 1, c)
        }

        // Spread safety to every 'O' connected to a safe cell
        val dr = intArrayOf(1, -1, 0, 0)
        val dc = intArrayOf(0, 0, 1, -1)
        while (queue.isNotEmpty()) {
            val cell = queue.removeFirst()
            val r = cell / cols
            val c = cell % cols
            for (d in 0 until 4) {
                val nr = r + dr[d]
                val nc = c + dc[d]
                if (nr in 0 until rows && nc in 0 until cols) markSafe(nr, nc)
            }
        }

        // Remaining 'O' are surrounded -> 'X'; restore safe cells to 'O'
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (board[r][c] == 'O') {
                    board[r][c] = 'X'
                } else if (board[r][c] == 'S') {
                    board[r][c] = 'O'
                }
            }
        }
    }
}
