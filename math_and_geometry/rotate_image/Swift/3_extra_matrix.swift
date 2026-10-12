class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        // Put each value at its rotated position in a new matrix.
        var rotated = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                rotated[j][n - 1 - i] = matrix[i][j]
            }
        }
        // Replace the original matrix with the rotated copy.
        matrix = rotated
    }
}
