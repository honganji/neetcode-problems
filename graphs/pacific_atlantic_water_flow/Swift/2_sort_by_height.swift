private let directions: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]

func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let m = heights.count
    let n = heights[0].count

    func heightOf(_ cell: Int) -> Int { heights[cell / n][cell % n] }

    func neighborsOf(_ cell: Int) -> [Int] {
        let r = cell / n
        let c = cell % n
        var result: [Int] = []
        for (dr, dc) in directions {
            let nr = r + dr
            let nc = c + dc
            if nr >= 0 && nr < m && nc >= 0 && nc < n { result.append(nr * n + nc) }
        }
        return result
    }

    // Cells encoded as r * n + c, sorted from lowest to highest.
    let order = (0..<(m * n)).sorted { heightOf($0) < heightOf($1) }

    func drains(_ isEdge: (Int, Int) -> Bool) -> [Bool] {
        var reached = [Bool](repeating: false, count: m * n)
        var i = 0
        while i < order.count {
            let h = heightOf(order[i])
            var j = i
            while j < order.count && heightOf(order[j]) == h { j += 1 }
            // Seed edge cells, and cells that can flow to a lower cell that already drains.
            var stack: [Int] = []
            for cell in order[i..<j] {
                let flowsDown = neighborsOf(cell).contains { heightOf($0) < h && reached[$0] }
                if isEdge(cell / n, cell % n) || flowsDown {
                    reached[cell] = true
                    stack.append(cell)
                }
            }
            // Equal-height cells can flow into each other, so spread through them.
            while let cell = stack.popLast() {
                for nb in neighborsOf(cell) where !reached[nb] && heightOf(nb) == h {
                    reached[nb] = true
                    stack.append(nb)
                }
            }
            i = j
        }
        return reached
    }

    let pacific = drains { r, c in r == 0 || c == 0 }
    let atlantic = drains { r, c in r == m - 1 || c == n - 1 }
    return (0..<(m * n))
        .filter { pacific[$0] && atlantic[$0] }
        .map { [$0 / n, $0 % n] }
}
