func swimInWater(_ grid: [[Int]]) -> Int {
    let n = grid.count
    let dr = [1, -1, 0, 0]
    let dc = [0, 0, 1, -1]

    func reachable(_ limit: Int) -> Bool {
        // Flood fill from the top-left, using only cells at or below the limit.
        if grid[0][0] > limit { return false }
        var seen = [Bool](repeating: false, count: n * n)
        seen[0] = true
        var stack = [0]
        while let cell = stack.popLast() {
            if cell == n * n - 1 { return true }
            let r = cell / n
            let c = cell % n
            for k in 0..<4 {
                let nr = r + dr[k]
                let nc = c + dc[k]
                if nr >= 0 && nr < n && nc >= 0 && nc < n {
                    let next = nr * n + nc
                    if !seen[next] && grid[nr][nc] <= limit {
                        seen[next] = true
                        stack.append(next)
                    }
                }
            }
        }
        return false
    }

    // reachable() only gets easier as the limit grows, so binary search for the first true.
    var lo = grid[0][0]
    var hi = n * n - 1
    while lo < hi {
        let mid = (lo + hi) / 2
        if reachable(mid) {
            hi = mid
        } else {
            lo = mid + 1
        }
    }
    return lo
}
