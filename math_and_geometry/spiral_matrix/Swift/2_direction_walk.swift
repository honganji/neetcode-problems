func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    let m = matrix.count
    let n = matrix[0].count
    var visited = Array(repeating: Array(repeating: false, count: n), count: m)
    // Right, down, left, up.
    let dRow = [0, 1, 0, -1]
    let dCol = [1, 0, -1, 0]
    var result: [Int] = []
    var row = 0, col = 0, d = 0
    for _ in 0..<(m * n) {
        result.append(matrix[row][col])
        visited[row][col] = true
        var nextRow = row + dRow[d]
        var nextCol = col + dCol[d]
        // Turn clockwise when the next cell is off the grid or already used.
        if nextRow < 0 || nextRow >= m || nextCol < 0 || nextCol >= n ||
            visited[nextRow][nextCol] {
            d = (d + 1) % 4
            nextRow = row + dRow[d]
            nextCol = col + dCol[d]
        }
        row = nextRow
        col = nextCol
    }
    return result
}
