func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    let dRow = [1, -1, 0, 0]
    let dCol = [0, 0, 1, -1]
    // memo[r][c] = longest increasing path that starts at (r, c); 0 means not computed yet.
    var memo = Array(repeating: Array(repeating: 0, count: cols), count: rows)

    func dfs(_ r: Int, _ c: Int) -> Int {
        if memo[r][c] != 0 {
            return memo[r][c]
        }
        var best = 1
        for k in 0..<4 {
            let nr = r + dRow[k]
            let nc = c + dCol[k]
            if nr >= 0 && nr < rows && nc >= 0 && nc < cols && matrix[nr][nc] > matrix[r][c] {
                best = max(best, 1 + dfs(nr, nc))
            }
        }
        memo[r][c] = best
        return best
    }

    var answer = 0
    for r in 0..<rows {
        for c in 0..<cols {
            answer = max(answer, dfs(r, c))
        }
    }
    return answer
}
