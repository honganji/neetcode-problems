class Solution {
    fun rotate(matrix: Array<IntArray>) {
        val n = matrix.size
        // Put each value at its rotated position in a new matrix.
        val rotated = Array(n) { IntArray(n) }
        for (i in 0 until n) {
            for (j in 0 until n) {
                rotated[j][n - 1 - i] = matrix[i][j]
            }
        }
        // Copy the result back into the original matrix.
        for (i in 0 until n) {
            rotated[i].copyInto(matrix[i])
        }
    }
}
