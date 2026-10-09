class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid  // local copy so we can mark cells as visited
        let rows = grid.count
        guard rows > 0 else { return 0 }
        let cols = grid[0].count
        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        var islands = 0

        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == "1" {
                // New island found: count it, then sink every land cell connected to it.
                islands += 1
                grid[r][c] = "0"
                var stack: [(Int, Int)] = [(r, c)]
                while let cell = stack.popLast() {
                    for (dr, dc) in directions {
                        let nr = cell.0 + dr
                        let nc = cell.1 + dc
                        if nr >= 0 && nr < rows && nc >= 0 && nc < cols && grid[nr][nc] == "1" {
                            grid[nr][nc] = "0"  // mark when pushed so no cell is added twice
                            stack.append((nr, nc))
                        }
                    }
                }
            }
        }
        return islands
    }
}
