class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count

        // Every pair of points is a possible edge: (cost, i, j).
        var edges: [(Int, Int, Int)] = []
        for i in 0..<n {
            for j in (i + 1)..<n {
                edges.append((manhattan(points[i], points[j]), i, j))
            }
        }
        edges.sort { $0.0 < $1.0 }

        var parent = Array(0..<n)

        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]  // path halving
                x = parent[x]
            }
            return x
        }

        var total = 0
        var used = 0
        // Take the cheapest edges that do not close a loop, until n - 1 are taken.
        for (cost, i, j) in edges {
            if used == n - 1 { break }
            let ri = find(i)
            let rj = find(j)
            if ri != rj {
                parent[ri] = rj
                total += cost
                used += 1
            }
        }
        return total
    }

    private func manhattan(_ a: [Int], _ b: [Int]) -> Int {
        return abs(a[0] - b[0]) + abs(a[1] - b[1])
    }
}
