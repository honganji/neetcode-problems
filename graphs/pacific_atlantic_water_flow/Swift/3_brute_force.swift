private let directions: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]

func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    let m = heights.count
    let n = heights[0].count

    // Walk downhill from one cell, noting which oceans the walk touches.
    func reachesBoth(_ startR: Int, _ startC: Int) -> Bool {
        let start = startR * n + startC
        var seen: Set<Int> = [start]
        var stack = [start]
        var pacific = false
        var atlantic = false
        while let cell = stack.popLast() {
            let r = cell / n
            let c = cell % n
            if r == 0 || c == 0 { pacific = true }
            if r == m - 1 || c == n - 1 { atlantic = true }
            if pacific && atlantic { return true }
            for (dr, dc) in directions {
                let nr = r + dr
                let nc = c + dc
                guard nr >= 0, nr < m, nc >= 0, nc < n else { continue }
                let next = nr * n + nc
                if !seen.contains(next) && heights[nr][nc] <= heights[r][c] {
                    seen.insert(next)
                    stack.append(next)
                }
            }
        }
        return false
    }

    var result: [[Int]] = []
    for r in 0..<m {
        for c in 0..<n where reachesBoth(r, c) {
            result.append([r, c])
        }
    }
    return result
}
