class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        let word = Array(word)
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        // Each state holds row, col, letters matched, and a bitmask of cells used so far.
        var queue: [(r: Int, c: Int, n: Int, used: Int)] = []
        for r in 0..<rows {
            for c in 0..<cols where board[r][c] == word[0] {
                queue.append((r, c, 1, 1 << (r * cols + c)))
            }
        }

        // Expand every partial path one letter at a time. A head index avoids costly removeFirst.
        var head = 0
        while head < queue.count {
            let state = queue[head]
            head += 1
            if state.n == word.count { return true }

            for d in directions {
                let nr = state.r + d.0
                let nc = state.c + d.1
                guard nr >= 0, nc >= 0, nr < rows, nc < cols else { continue }
                let bit = 1 << (nr * cols + nc)
                if (state.used & bit) == 0 && board[nr][nc] == word[state.n] {
                    queue.append((nr, nc, state.n + 1, state.used | bit))
                }
            }
        }
        return false
    }
}
