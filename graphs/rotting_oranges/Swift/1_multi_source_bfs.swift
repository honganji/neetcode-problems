class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var queue: [(Int, Int)] = []
        var head = 0  // index of the next cell to process (avoids O(n) removeFirst)
        var fresh = 0

        for r in 0..<rows {
            for c in 0..<cols {
                if grid[r][c] == 2 {
                    queue.append((r, c))
                } else if grid[r][c] == 1 {
                    fresh += 1
                }
            }
        }

        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var minutes = 0

        // Each BFS layer is one minute of spreading.
        while head < queue.count && fresh > 0 {
            let levelEnd = queue.count
            while head < levelEnd {
                let (r, c) = queue[head]
                head += 1
                for (dr, dc) in dirs {
                    let nr = r + dr
                    let nc = c + dc
                    guard nr >= 0, nr < rows, nc >= 0, nc < cols, grid[nr][nc] == 1 else {
                        continue
                    }
                    grid[nr][nc] = 2
                    fresh -= 1
                    queue.append((nr, nc))
                }
            }
            minutes += 1
        }

        return fresh == 0 ? minutes : -1
    }
}
