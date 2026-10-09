private let directions: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]

func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let m = heights.count
    let n = heights[0].count

    // Cells are encoded as r * n + c. Water flows downhill, so walk uphill from the edge.
    func flood(_ starts: [Int]) -> Set<Int> {
        var seen = Set(starts)
        var queue = Array(seen)
        var head = 0
        while head < queue.count {
            let cell = queue[head]
            head += 1
            let r = cell / n
            let c = cell % n
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                guard nr >= 0, nr < m, nc >= 0, nc < n else { continue }
                let next = nr * n + nc
                if !seen.contains(next) && heights[nr][nc] >= heights[r][c] {
                    seen.insert(next)
                    queue.append(next)
                }
            }
        }
        return seen
    }

    let pacificStarts = (0..<n).map { $0 } + (1..<m).map { $0 * n }
    let atlanticStarts = (0..<n).map { (m - 1) * n + $0 } + (0..<(m - 1)).map { $0 * n + n - 1 }
    let pacific = flood(pacificStarts)
    let atlantic = flood(atlanticStarts)
    return pacific.filter { atlantic.contains($0) }.map { [$0 / n, $0 % n] }
}
