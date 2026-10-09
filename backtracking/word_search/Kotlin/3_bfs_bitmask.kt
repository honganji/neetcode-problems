class Solution {
    // Each state holds row, col, letters matched, and a bitmask of cells used so far.
    private data class State(val r: Int, val c: Int, val n: Int, val used: Long)

    fun exist(board: Array<CharArray>, word: String): Boolean {
        val rows = board.size
        val cols = board[0].size
        val directions = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))

        val queue = ArrayDeque<State>()
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (board[r][c] == word[0]) {
                    queue.add(State(r, c, 1, 1L shl (r * cols + c)))
                }
            }
        }

        // Expand every partial path one letter at a time.
        while (queue.isNotEmpty()) {
            val state = queue.removeFirst()
            if (state.n == word.length) return true

            for (d in directions) {
                val nr = state.r + d[0]
                val nc = state.c + d[1]
                if (nr !in 0 until rows || nc !in 0 until cols) continue
                val bit = 1L shl (nr * cols + nc)
                if ((state.used and bit) == 0L && board[nr][nc] == word[state.n]) {
                    queue.add(State(nr, nc, state.n + 1, state.used or bit))
                }
            }
        }
        return false
    }
}
