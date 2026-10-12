fun setZeroes(matrix: Array<IntArray>) {
    val m = matrix.size
    val n = matrix[0].size
    // Row 0 and column 0 will be reused as markers, so remember their original zeros first.
    val firstRowHasZero = matrix[0].any { it == 0 }
    val firstColHasZero = matrix.any { it[0] == 0 }

    // A zero at (i, j) marks row i (in column 0) and column j (in row 0).
    for (i in 1 until m) {
        for (j in 1 until n) {
            if (matrix[i][j] == 0) {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }

    // Zero every inner cell whose row or column is marked.
    for (i in 1 until m) {
        for (j in 1 until n) {
            if (matrix[i][0] == 0 || matrix[0][j] == 0) {
                matrix[i][j] = 0
            }
        }
    }

    if (firstRowHasZero) {
        for (j in 0 until n) matrix[0][j] = 0
    }
    if (firstColHasZero) {
        for (i in 0 until m) matrix[i][0] = 0
    }
}
