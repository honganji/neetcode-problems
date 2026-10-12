func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result: [Int] = []
    var top = 0, bottom = matrix.count - 1
    var left = 0, right = matrix[0].count - 1
    while top <= bottom && left <= right {
        // Walk the top edge left to right, then drop the top edge inward.
        for col in stride(from: left, through: right, by: 1) {
            result.append(matrix[top][col])
        }
        top += 1
        // Walk the right edge top to bottom.
        for row in stride(from: top, through: bottom, by: 1) {
            result.append(matrix[row][right])
        }
        right -= 1
        // These two checks stop a single row or column from being walked twice.
        if top <= bottom {
            for col in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][col])
            }
            bottom -= 1
        }
        if left <= right {
            for row in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[row][left])
            }
            left += 1
        }
    }
    return result
}
