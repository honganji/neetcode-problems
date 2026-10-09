class Solution {
    fun solveNQueens(n: Int): List<List<String>> {
        val res = mutableListOf<List<String>>()
        val cols = IntArray(n) // cols[row] = column of that row's queen

        fun place(row: Int) {
            if (row == n) {
                if (isValid(cols)) {
                    res.add(cols.map { c -> rowString(c, n) })
                }
                return
            }
            // Try every column for this row
            for (c in 0 until n) {
                cols[row] = c
                place(row + 1)
            }
        }

        place(0)
        return res
    }

    private fun isValid(cols: IntArray): Boolean {
        for (i in cols.indices) {
            for (j in i + 1 until cols.size) {
                // Same column, or same diagonal (equal row and column distance)
                if (cols[i] == cols[j] || kotlin.math.abs(cols[i] - cols[j]) == j - i) {
                    return false
                }
            }
        }
        return true
    }

    private fun rowString(col: Int, n: Int) = ".".repeat(col) + "Q" + ".".repeat(n - col - 1)
}
