class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        // dist[v] = cheapest known link from point v to the tree built so far
        var dist = [Int](repeating: Int.max, count: n)
        var inTree = [Bool](repeating: false, count: n)
        dist[0] = 0
        var total = 0

        for _ in 0..<n {
            // Pick the closest point that is not in the tree yet.
            var u = -1
            for v in 0..<n where !inTree[v] {
                if u == -1 || dist[v] < dist[u] { u = v }
            }
            inTree[u] = true
            total += dist[u]

            // The new tree point may offer cheaper links to the rest.
            for v in 0..<n where !inTree[v] {
                dist[v] = min(dist[v], manhattan(points[u], points[v]))
            }
        }
        return total
    }

    private func manhattan(_ a: [Int], _ b: [Int]) -> Int {
        return abs(a[0] - b[0]) + abs(a[1] - b[1])
    }
}
