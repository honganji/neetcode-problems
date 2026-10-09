class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
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
        var components = n
        while components > 1 {
            // Each component finds its cheapest edge to another component.
            // Tuples (cost, i, j) compare in order, giving a fixed tie-break.
            var best = [(Int, Int, Int)?](repeating: nil, count: n)
            for i in 0..<n {
                let ri = find(i)
                for j in (i + 1)..<n {
                    let rj = find(j)
                    if ri == rj { continue }
                    let edge = (manhattan(points[i], points[j]), i, j)
                    if best[ri] == nil || edge < best[ri]! { best[ri] = edge }
                    if best[rj] == nil || edge < best[rj]! { best[rj] = edge }
                }
            }

            // Add those edges, skipping any that would form a cycle.
            for entry in best {
                guard let edge = entry else { continue }
                let (cost, i, j) = edge
                let ri = find(i)
                let rj = find(j)
                if ri != rj {
                    parent[ri] = rj
                    total += cost
                    components -= 1
                }
            }
        }
        return total
    }

    private func manhattan(_ a: [Int], _ b: [Int]) -> Int {
        return abs(a[0] - b[0]) + abs(a[1] - b[1])
    }
}
