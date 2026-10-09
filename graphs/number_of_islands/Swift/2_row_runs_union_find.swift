class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }

        // Step 1: split each row into runs of consecutive land, e.g. "11011" -> (0, 1), (3, 4).
        var runStart: [Int] = []
        var runEnd: [Int] = []
        var rowBegin: [Int] = []  // index in runStart where each row's runs start
        for row in grid {
            rowBegin.append(runStart.count)
            var start = -1
            for c in 0...row.count {
                let isLand = c < row.count && row[c] == "1"
                if isLand && start < 0 {
                    start = c
                } else if !isLand && start >= 0 {
                    runStart.append(start)
                    runEnd.append(c - 1)
                    start = -1
                }
            }
        }
        rowBegin.append(runStart.count)

        // Step 2: each run starts as its own island; runs that touch in adjacent rows merge.
        let n = runStart.count
        var parent = Array(0..<n)
        var size = Array(repeating: 1, count: n)
        var islands = n

        func find(_ start: Int) -> Int {
            var x = start
            while parent[x] != x {
                parent[x] = parent[parent[x]]
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
            islands -= 1
        }

        for r in 1..<grid.count {
            var i = rowBegin[r - 1]
            let iEnd = rowBegin[r]
            var j = rowBegin[r]
            let jEnd = rowBegin[r + 1]
            while i < iEnd && j < jEnd {
                // Columns overlap, so the two runs touch.
                if runStart[i] <= runEnd[j] && runStart[j] <= runEnd[i] {
                    union(i, j)
                }
                // The run that ends first cannot touch any later run in the other row.
                if runEnd[i] < runEnd[j] {
                    i += 1
                } else {
                    j += 1
                }
            }
        }
        return islands
    }
}
