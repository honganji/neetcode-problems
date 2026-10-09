class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var best = 0

        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == 1 {
                // Search from this cell with its own visited set. Nothing is shared
                // with other starts, so every island is re-explored from each of its cells.
                var visited: Set<Int> = [r * cols + c]
                var stack = [(r, c)]
                var area = 0
                while !stack.isEmpty {
                    let (cr, cc) = stack.removeLast()
                    area += 1
                    for (dr, dc) in directions {
                        let nr = cr + dr
                        let nc = cc + dc
                        if nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == 1 {
                            let nid = nr * cols + nc
                            if visited.insert(nid).inserted {
                                stack.append((nr, nc))
                            }
                        }
                    }
                }
                best = max(best, area)
            }
        }
        return best
    }
}
