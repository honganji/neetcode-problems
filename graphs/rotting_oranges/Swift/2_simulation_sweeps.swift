class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var minutes = 0

        while true {
            // Find fresh oranges next to a rotten one. Rot them after the scan so
            // an orange that rots this minute can't spread again in the same minute.
            var toRot: [(Int, Int)] = []
            for r in 0..<rows {
                for c in 0..<cols where grid[r][c] == 1 {
                    let touchesRotten = dirs.contains { d in
                        let nr = r + d.0
                        let nc = c + d.1
                        return nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 2
                    }
                    if touchesRotten {
                        toRot.append((r, c))
                    }
                }
            }

            if toRot.isEmpty { break }
            for (r, c) in toRot {
                grid[r][c] = 2
            }
            minutes += 1
        }

        let anyFresh = grid.contains { $0.contains(1) }
        return anyFresh ? -1 : minutes
    }
}
