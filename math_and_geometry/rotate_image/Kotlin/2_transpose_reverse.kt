class Solution {
    fun rotate(matrix: Array<IntArray>) {
        val n = matrix.size
        // Transpose: swap each cell with its mirror across the main diagonal.
        for (i in 0 until n) {
            for (j in i + 1 until n) {
                val tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
        // Reverse every row to finish the clockwise rotation.
        for (row in matrix) {
            row.reverse()
        }
    }
}
