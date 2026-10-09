class Solution {
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty, !board[0].isEmpty else { return }
        let rows = board.count
        let cols = board[0].count
        let border = rows * cols  // virtual node meaning "connected to the border"
        var parent = Array(0...(rows * cols))
        var size = [Int](repeating: 1, count: rows * cols + 1)

        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]  // path halving
                x = parent[x]
            }
            return x
        }

        func union(_ a: Int, _ b: Int) {
            var ra = find(a)
            var rb = find(b)
            if ra == rb { return }
            if size[ra] < size[rb] { swap(&ra, &rb) }
            parent[rb] = ra
            size[ra] += size[rb]
        }

        // Group each 'O' with its 'O' neighbours; border 'O's join the border node
        for r in 0..<rows {
            for c in 0..<cols where board[r][c] == "O" {
                let cell = r * cols + c
                if r == 0 || r == rows - 1 || c == 0 || c == cols - 1 {
                    union(cell, border)
                }
                if r + 1 < rows && board[r + 1][c] == "O" { union(cell, cell + cols) }
                if c + 1 < cols && board[r][c + 1] == "O" { union(cell, cell + 1) }
            }
        }

        // Any 'O' not in the border's group is surrounded
        let safe = find(border)
        for r in 0..<rows {
            for c in 0..<cols where board[r][c] == "O" && find(r * cols + c) != safe {
                board[r][c] = "X"
            }
        }
    }
}
