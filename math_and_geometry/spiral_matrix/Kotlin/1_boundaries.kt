fun spiralOrder(matrix: Array<IntArray>): List<Int> {
    val result = mutableListOf<Int>()
    var top = 0
    var bottom = matrix.size - 1
    var left = 0
    var right = matrix[0].size - 1
    while (top <= bottom && left <= right) {
        // Walk the top edge left to right, then drop the top edge inward.
        for (col in left..right) result.add(matrix[top][col])
        top++
        // Walk the right edge top to bottom.
        for (row in top..bottom) result.add(matrix[row][right])
        right--
        // These two checks stop a single row or column from being walked twice.
        if (top <= bottom) {
            for (col in right downTo left) result.add(matrix[bottom][col])
            bottom--
        }
        if (left <= right) {
            for (row in bottom downTo top) result.add(matrix[row][left])
            left++
        }
    }
    return result
}
