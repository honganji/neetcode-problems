func setZeroes(_ matrix: inout [[Int]]) {
    let m = matrix.count
    let n = matrix[0].count
    var zeroRows = [Bool](repeating: false, count: m)
    var zeroCols = [Bool](repeating: false, count: n)

    // Record which rows and columns contain a zero.
    for i in 0..<m {
        for j in 0..<n where matrix[i][j] == 0 {
            zeroRows[i] = true
            zeroCols[j] = true
        }
    }

    // Clear every cell whose row or column was recorded.
    for i in 0..<m {
        for j in 0..<n where zeroRows[i] || zeroCols[j] {
            matrix[i][j] = 0
        }
    }
}
