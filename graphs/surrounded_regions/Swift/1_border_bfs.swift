class Solution {
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty, !board[0].isEmpty else { return }
        let rows = board.count
        let cols = board[0].count
        var queue: [(Int, Int)] = []
        var head = 0

        // Border 'O's are safe: mark them 'S' and start the search from them
        for r in 0..<rows {
            for c in [0, cols - 1] {
                if board[r][c] == "O" {
                    board[r][c] = "S"
                    queue.append((r, c))
                }
            }
        }
        for c in 0..<cols {
            for r in [0, rows - 1] {
                if board[r][c] == "O" {
                    board[r][c] = "S"
                    queue.append((r, c))
                }
            }
        }

        // Spread safety to every 'O' connected to a safe cell
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        while head < queue.count {
            let (r, c) = queue[head]
            head += 1
            for (dr, dc) in dirs {
                let nr = r + dr
                let nc = c + dc
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && board[nr][nc] == "O" {
                    board[nr][nc] = "S"
                    queue.append((nr, nc))
                }
            }
        }

        // Remaining 'O' are surrounded -> 'X'; restore safe cells to 'O'
        for r in 0..<rows {
            for c in 0..<cols {
                if board[r][c] == "O" {
                    board[r][c] = "X"
                } else if board[r][c] == "S" {
                    board[r][c] = "O"
                }
            }
        }
    }
}
