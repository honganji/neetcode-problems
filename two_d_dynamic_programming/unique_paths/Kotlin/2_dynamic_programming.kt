class Solution {
    fun uniquePaths(m: Int, n: Int): Int {
        // row[j] = number of paths to the cell at column j of the current row.
        val row = IntArray(n) { 1 } // the first row: one way to each cell
        repeat(m - 1) {
            for (j in 1 until n) {
                // row[j] holds the count from above; row[j - 1] was already updated
                // for this row, so it holds the count from the left.
                row[j] += row[j - 1]
            }
        }
        return row[n - 1]
    }
}
