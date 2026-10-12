class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        // Transpose: swap each cell with its mirror across the main diagonal.
        for i in 0..<n {
            for j in (i + 1)..<n {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = tmp
            }
        }
        // Reverse every row to finish the clockwise rotation.
        for i in 0..<n {
            matrix[i].reverse()
        }
    }
}
