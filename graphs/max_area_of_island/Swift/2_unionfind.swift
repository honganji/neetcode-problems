class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let rows = grid.count
        let cols = grid[0].count
        var parent = Array(0..<(rows * cols))  // each cell starts as its own group
        var size = Array(repeating: 1, count: rows * cols)  // valid at each group's root

        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]  // path halving: shortcut upwards
                x = parent[x]
            }
            return x
        }

        func union(_ a: Int, _ b: Int) {
            var ra = find(a)
            var rb = find(b)
            if ra == rb { return }
            if size[ra] < size[rb] {  // attach the smaller group under the larger
                swap(&ra, &rb)
            }
            parent[rb] = ra
            size[ra] += size[rb]
        }

        // Join each land cell with its land neighbours below and to the right.
        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == 1 {
                let id = r * cols + c
                if r + 1 < rows && grid[r + 1][c] == 1 { union(id, id + cols) }
                if c + 1 < cols && grid[r][c + 1] == 1 { union(id, id + 1) }
            }
        }

        var best = 0
        for r in 0..<rows {
            for c in 0..<cols where grid[r][c] == 1 {
                best = max(best, size[find(r * cols + c)])
            }
        }
        return best
    }
}
