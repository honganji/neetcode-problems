class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grid = grid  // local mutable copy; we sink visited cells
        let rows = grid.count
        let cols = grid[0].count
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var best = 0

        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == 1 {
                // Sink the first land cell we meet so it is never counted again.
                grid[r][c] = 0
                var stack = [(r, c)]
                var area = 0
                while !stack.isEmpty {
                    let (cr, cc) = stack.removeLast()
                    area += 1
                    for (dr, dc) in directions {
                        let nr = cr + dr
                        let nc = cc + dc
                        if nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1 {
                            grid[nr][nc] = 0  // mark when pushed so no cell is added twice
                            stack.append((nr, nc))
                        }
                    }
                }
                best = max(best, area)
            }
        }
        return best
    }
}
