func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var row = 0
    var col = matrix[0].count - 1
    while row < matrix.count && col >= 0 {
        let value = matrix[row][col]
        if value == target {
            return true
        }
        if value > target {
            col -= 1
        } else {
            row += 1
        }
    }
    return false
}
