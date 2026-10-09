class Solution {
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty, !board[0].isEmpty else { return }
        let rows = board.count
        let cols = board[0].count

        // Decide for each 'O' on its own, then flip all surrounded ones at the end
        var toFlip: [(Int, Int)] = []
        for r in 0..<rows {
            for c in 0..<cols where board[r][c] == "O" && isSurrounded(board, r, c) {
                toFlip.append((r, c))
            }
        }
        for (r, c) in toFlip {
            board[r][c] = "X"
        }
    }

    private func isSurrounded(_ board: [[Character]], _ sr: Int, _ sc: Int) -> Bool {
        let rows = board.count
        let cols = board[0].count
        var seen: Set<Int> = [sr * cols + sc]
        var stack: [(Int, Int)] = [(sr, sc)]
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        while !stack.isEmpty {
            let (r, c) = stack.removeLast()
            // Reaching the border means this 'O' is connected to it, so it is not surrounded
            if r == 0 || r == rows - 1 || c == 0 || c == cols - 1 { return false }
            for (dr, dc) in dirs {
                let nr = r + dr
                let nc = c + dc
                if board[nr][nc] == "O" && !seen.contains(nr * cols + nc) {
                    seen.insert(nr * cols + nc)
                    stack.append((nr, nc))
                }
            }
        }
        return true
    }
}
