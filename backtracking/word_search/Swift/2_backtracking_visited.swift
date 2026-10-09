class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        let word = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == word.count { return true }
            if r < 0 || c < 0 || r >= rows || c >= cols ||
                visited[r][c] || board[r][c] != word[i] {
                return false
            }

            // Track the path in a separate grid instead of changing the board.
            visited[r][c] = true
            let found = directions.contains(where: { d in
                dfs(r + d.0, c + d.1, i + 1)
            })
            visited[r][c] = false
            return found
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r, c, 0) { return true }
            }
        }
        return false
    }
}
