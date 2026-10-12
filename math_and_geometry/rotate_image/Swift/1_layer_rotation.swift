class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        // Work from the outside ring inward.
        for first in 0..<(n / 2) {
            let last = n - 1 - first
            // Each step moves 4 cells in one cycle: top -> right -> bottom -> left -> top.
            for i in first..<last {
                let offset = i - first
                let top = matrix[first][i]
                matrix[first][i] = matrix[last - offset][first]              // left -> top
                matrix[last - offset][first] = matrix[last][last - offset]   // bottom -> left
                matrix[last][last - offset] = matrix[i][last]                // right -> bottom
                matrix[i][last] = top                                        // top -> right
            }
        }
    }
}
