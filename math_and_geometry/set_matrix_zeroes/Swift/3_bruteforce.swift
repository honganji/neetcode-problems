func setZeroes(_ matrix: inout [[Int]]) {
    let m = matrix.count
    let n = matrix[0].count
    // Read zeros from an untouched copy, so the zeros we create don't spread further.
    let original = matrix

    for i in 0..<m {
        for j in 0..<n where original[i][j] == 0 {
            for c in 0..<n { matrix[i][c] = 0 }
            for r in 0..<m { matrix[r][j] = 0 }
        }
    }
}
