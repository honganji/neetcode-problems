fun setZeroes(matrix: Array<IntArray>) {
    val m = matrix.size
    val n = matrix[0].size
    // Read zeros from an untouched copy, so the zeros we create don't spread further.
    val original = Array(m) { matrix[it].copyOf() }

    for (i in 0 until m) {
        for (j in 0 until n) {
            if (original[i][j] == 0) {
                for (c in 0 until n) matrix[i][c] = 0
                for (r in 0 until m) matrix[r][j] = 0
            }
        }
    }
}
