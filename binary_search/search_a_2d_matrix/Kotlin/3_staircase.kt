fun searchMatrix(matrix: Array<IntArray>, target: Int): Boolean {
    var row = 0
    var col = matrix[0].size - 1
    while (row < matrix.size && col >= 0) {
        val value = matrix[row][col]
        if (value == target) {
            return true
        }
        if (value > target) {
            col--
        } else {
            row++
        }
    }
    return false
}
