class Solution {
    fun exist(board: Array<CharArray>, word: String): Boolean {
        val rows = board.size
        val cols = board[0].size
        val visited = Array(rows) { BooleanArray(cols) }
        val directions = arrayOf(intArrayOf(1, 0), intArrayOf(-1, 0), intArrayOf(0, 1), intArrayOf(0, -1))

        fun dfs(r: Int, c: Int, i: Int): Boolean {
            if (i == word.length) return true
            if (r < 0 || c < 0 || r >= rows || c >= cols ||
                visited[r][c] || board[r][c] != word[i]
            ) {
                return false
            }

            // Track the path in a separate grid instead of changing the board.
            visited[r][c] = true
            val found = directions.any { d -> dfs(r + d[0], c + d[1], i + 1) }
            visited[r][c] = false
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
