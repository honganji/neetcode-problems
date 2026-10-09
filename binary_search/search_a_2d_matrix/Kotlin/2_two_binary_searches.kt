fun searchMatrix(matrix: Array<IntArray>, target: Int): Boolean {
    var top = 0
    var bottom = matrix.size - 1
    while (top <= bottom) {
        val mid = (top + bottom) / 2
        if (target < matrix[mid][0]) {
            bottom = mid - 1
        } else if (target > matrix[mid].last()) {
            top = mid + 1
        } else {
            break
        }
    }
    if (top > bottom) {
        return false
    }
    val row = matrix[(top + bottom) / 2]
    var left = 0
    var right = row.size - 1
    while (left <= right) {
        val mid = (left + right) / 2
        if (row[mid] == target) {
            return true
        }
        if (row[mid] < target) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return false
}
