func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    let dRow = [1, -1, 0, 0]
    let dCol = [0, 0, 1, -1]

    // Visit cells from smallest to largest value.
    var cells: [(Int, Int)] = []
    for r in 0..<rows {
        for c in 0..<cols {
            cells.append((r, c))
        }
    }
    cells.sort { matrix[$0.0][$0.1] < matrix[$1.0][$1.1] }

    // dp[r][c] = longest increasing path that ends at (r, c).
    var dp = Array(repeating: Array(repeating: 1, count: cols), count: rows)
    for (r, c) in cells {
        // Every smaller neighbor was visited earlier, so its dp value is final.
        for k in 0..<4 {
            let nr = r + dRow[k]
            let nc = c + dCol[k]
            if nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] < matrix[r][c] {
                dp[r][c] = max(dp[r][c], dp[nr][nc] + 1)
            }
        }
    }
    return dp.map { $0.max() ?? 0 }.max() ?? 0
}
