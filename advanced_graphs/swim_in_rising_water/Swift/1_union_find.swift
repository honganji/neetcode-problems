func swimInWater(_ grid: [[Int]]) -> Int {
    let n = grid.count
    let total = n * n
    // Heights are exactly 0..n*n-1, so pos[t] is the cell that becomes usable at time t.
    var pos = [Int](repeating: 0, count: total)
    for r in 0..<n {
        for c in 0..<n {
            pos[grid[r][c]] = r * n + c
        }
    }

    var parent = Array(0..<total)
    var size = [Int](repeating: 1, count: total)
    var active = [Bool](repeating: false, count: total)

    func find(_ start: Int) -> Int {
        var x = start
        while parent[x] != x {
            parent[x] = parent[parent[x]]  // path halving
            x = parent[x]
        }
        return x
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
    }

    let dr = [1, -1, 0, 0]
    let dc = [0, 0, 1, -1]

    // Add cells in order of height. Each newly usable cell joins its usable neighbors.
    // The first time the two corners are connected, that height is the answer.
    for t in 0..<total {
        let cell = pos[t]
        active[cell] = true
        let r = cell / n
        let c = cell % n
        for k in 0..<4 {
            let nr = r + dr[k]
            let nc = c + dc[k]
            if nr >= 0 && nr < n && nc >= 0 && nc < n && active[nr * n + nc] {
                union(cell, nr * n + nc)
            }
        }
        if find(0) == find(total - 1) {
            return t
        }
    }
    return total - 1
}
