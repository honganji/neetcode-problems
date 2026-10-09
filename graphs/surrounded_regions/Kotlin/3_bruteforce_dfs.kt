class Solution {
    fun solve(board: Array<CharArray>) {
        if (board.isEmpty() || board[0].isEmpty()) return
        val rows = board.size
        val cols = board[0].size

        // Decide for each 'O' on its own, then flip all surrounded ones at the end
        val toFlip = mutableListOf<Int>()
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (board[r][c] == 'O' && isSurrounded(board, r, c)) toFlip.add(r * cols + c)
            }
        }
        for (cell in toFlip) board[cell / cols][cell % cols] = 'X'
    }

    private fun isSurrounded(board: Array<CharArray>, sr: Int, sc: Int): Boolean {
        val rows = board.size
        val cols = board[0].size
        val dr = intArrayOf(1, -1, 0, 0)
        val dc = intArrayOf(0, 0, 1, -1)
        val seen = HashSet<Int>()
        val stack = ArrayDeque<Int>()
        seen.add(sr * cols + sc)
        stack.addLast(sr * cols + sc)
        while (stack.isNotEmpty()) {
            val cell = stack.removeLast()
            val r = cell / cols
            val c = cell % cols
            // Reaching the border means this 'O' is connected to it, so it is not surrounded
            if (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) return false
            for (d in 0 until 4) {
                val nr = r + dr[d]
                val nc = c + dc[d]
                if (board[nr][nc] == 'O' && seen.add(nr * cols + nc)) stack.addLast(nr * cols + nc)
            }
        }
        return true
    }
}
