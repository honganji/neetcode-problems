class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var worst = 0

        // Each fresh orange needs as long as its nearest rotten orange is away.
        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == 1 {
                let d = minutesToNearestRotten(grid, r, c)
                if d == -1 { return -1 }
                worst = max(worst, d)
            }
        }

        return worst
    }

    private func minutesToNearestRotten(_ grid: [[Int]], _ sr: Int, _ sc: Int) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var seen = Array(repeating: Array(repeating: false, count: cols), count: rows)
        seen[sr][sc] = true

        // Breadth-first, one layer per step away from the start orange.
        var frontier = [(sr, sc)]
        var dist = 0

        while !frontier.isEmpty {
            var next: [(Int, Int)] = []
            for (r, c) in frontier {
                for d in dirs {
                    let nr = r + d.0
                    let nc = c + d.1
                    guard nr >= 0, nr < rows, nc >= 0, nc < cols else { continue }
                    if seen[nr][nc] || grid[nr][nc] == 0 { continue }
                    if grid[nr][nc] == 2 { return dist + 1 }
                    seen[nr][nc] = true
                    next.append((nr, nc))
                }
            }
            frontier = next
            dist += 1
        }

        return -1
    }
}
