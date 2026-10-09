class Solution {
    fun solve(board: Array<CharArray>) {
        if (board.isEmpty() || board[0].isEmpty()) return
        val rows = board.size
        val cols = board[0].size
        val border = rows * cols // virtual node meaning "connected to the border"
        val parent = IntArray(rows * cols + 1) { it }
        val size = IntArray(rows * cols + 1) { 1 }

        fun find(x0: Int): Int {
            var x = x0
            while (parent[x] != x) {
                parent[x] = parent[parent[x]] // path halving
                x = parent[x]
            }
            return x
        }

        fun union(a: Int, b: Int) {
            var ra = find(a)
            var rb = find(b)
            if (ra == rb) return
            if (size[ra] < size[rb]) {
                val tmp = ra
                ra = rb
                rb = tmp
            }
            parent[rb] = ra
            size[ra] += size[rb]
        }

        // Group each 'O' with its 'O' neighbours; border 'O's join the border node
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (board[r][c] != 'O') continue
                val cell = r * cols + c
                if (r == 0 || r == rows - 1 || c == 0 || c == cols - 1) union(cell, border)
                if (r + 1 < rows && board[r + 1][c] == 'O') union(cell, cell + cols)
                if (c + 1 < cols && board[r][c + 1] == 'O') union(cell, cell + 1)
            }
        }

        // Any 'O' not in the border's group is surrounded
        val safe = find(border)
        for (r in 0 until rows) {
            for (c in 0 until cols) {
                if (board[r][c] == 'O' && find(r * cols + c) != safe) board[r][c] = 'X'
            }
        }
    }
}
