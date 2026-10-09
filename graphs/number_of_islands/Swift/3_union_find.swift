class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        let rows = grid.count
        guard rows > 0 else { return 0 }
        let cols = grid[0].count

        var parent = Array(0..<(rows * cols))  // every cell starts alone
        var size = Array(repeating: 1, count: rows * cols)

        func find(_ start: Int) -> Int {
            var x = start
            while parent[x] != x {
                parent[x] = parent[parent[x]]
                x = parent[x]
            }
            return x
        }

        // Every land cell starts as its own island; each successful merge removes one.
        var islands = 0
        for row in grid {
            for cell in row where cell == "1" {
                islands += 1
            }
        }

        func union(_ a: Int, _ b: Int) {
            var ra = find(a)
            var rb = find(b)
            if ra == rb { return }
            if size[ra] < size[rb] {
                swap(&ra, &rb)
            }
            parent[rb] = ra
            size[ra] += size[rb]
            islands -= 1
        }

        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == "1" {
                // Only check right and down so each pair of neighbors is handled once.
                let id = r * cols + c
                if c + 1 < cols && grid[r][c + 1] == "1" {
                    union(id, id + 1)
                }
                if r + 1 < rows && grid[r + 1][c] == "1" {
                    union(id, id + cols)
                }
            }
        }
        return islands
    }
}
