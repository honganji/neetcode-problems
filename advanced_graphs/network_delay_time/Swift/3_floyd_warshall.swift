class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        let inf = Int.max / 2  // half of max, so inf + inf cannot overflow
        var dist = [[Int]](repeating: [Int](repeating: inf, count: n + 1), count: n + 1)
        for i in 1...n {
            dist[i][i] = 0
        }
        for t in times {
            dist[t[0]][t[1]] = min(dist[t[0]][t[1]], t[2])
        }

        // Allow nodes 1..mid as stepping stones, one at a time.
        for mid in 1...n {
            for i in 1...n {
                for j in 1...n {
                    dist[i][j] = min(dist[i][j], dist[i][mid] + dist[mid][j])
                }
            }
        }

        let answer = dist[k][1...].max()!
        return answer == inf ? -1 : answer
    }
}
