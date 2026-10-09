class Solution {
    fun solveNQueens(n: Int): List<List<String>> {
        val res = mutableListOf<List<String>>()
        val cols = IntArray(n) // cols[row] = column of that row's queen
        val full = (1 shl n) - 1

        fun backtrack(row: Int, colMask: Int, diag1: Int, diag2: Int) {
            if (row == n) {
                res.add(cols.map { c -> rowString(c, n) })
                return
            }
            // Columns not attacked by any queen placed so far
            var free = full and (colMask or diag1 or diag2).inv()
            while (free != 0) {
                val bit = free and -free // lowest free column
                free = free xor bit
                cols[row] = bit.countTrailingZeroBits()
                // Attacked diagonals move one column per row
                backtrack(row + 1, colMask or bit, (diag1 or bit) shl 1, (diag2 or bit) shr 1)
            }
        }

        backtrack(0, 0, 0, 0)
        return res
    }

    private fun rowString(col: Int, n: Int) = ".".repeat(col) + "Q" + ".".repeat(n - col - 1)
}
