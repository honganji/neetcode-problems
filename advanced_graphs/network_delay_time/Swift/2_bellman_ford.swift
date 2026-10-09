class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        let inf = Int.max / 2
        var dist = [Int](repeating: inf, count: n + 1)
        dist[k] = 0

        // A shortest path uses at most n - 1 edges, so n - 1 passes are enough.
        for _ in 0..<(n - 1) {
            var changed = false
            for t in times {
                let u = t[0], v = t[1], w = t[2]
                if dist[u] + w < dist[v] {
                    dist[v] = dist[u] + w
                    changed = true
                }
            }
            if !changed { break }  // nothing left to improve
        }

        let answer = dist[1...].max()!
        return answer == inf ? -1 : answer
    }
}
