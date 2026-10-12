func setZeroes(_ matrix: inout [[Int]]) {
    let m = matrix.count
    let n = matrix[0].count
    // Row 0 and column 0 will be reused as markers, so remember their original zeros first.
    let firstRowHasZero = matrix[0].contains(0)
    let firstColHasZero = matrix.contains { $0[0] == 0 }

    // A zero at (i, j) marks row i (in column 0) and column j (in row 0).
    for i in 1..<m {
        for j in 1..<n where matrix[i][j] == 0 {
            matrix[i][0] = 0
            matrix[0][j] = 0
        }
    }

    // Zero every inner cell whose row or column is marked.
    for i in 1..<m {
        for j in 1..<n where matrix[i][0] == 0 || matrix[0][j] == 0 {
            matrix[i][j] = 0
        }
    }

    if firstRowHasZero {
        for j in 0..<n { matrix[0][j] = 0 }
    }
    if firstColHasZero {
        for i in 0..<m { matrix[i][0] = 0 }
    }
}
