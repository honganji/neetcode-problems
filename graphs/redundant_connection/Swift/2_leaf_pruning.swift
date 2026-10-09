class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var adj = Array(repeating: [Int](), count: n + 1)
        var degree = Array(repeating: 0, count: n + 1)
        for edge in edges {
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
            degree[edge[0]] += 1
            degree[edge[1]] += 1
        }

        // Strip leaves (degree 1). Only the cycle nodes keep degree >= 2.
        var queue = (1...n).filter { degree[$0] == 1 }
        var head = 0
        while head < queue.count {
            let node = queue[head]
            head += 1
            for next in adj[node] {
                degree[next] -= 1
                if degree[next] == 1 { queue.append(next) }
            }
        }

        // Edges between two cycle nodes are cycle edges; take the last one.
        for edge in edges.reversed() where degree[edge[0]] >= 2 && degree[edge[1]] >= 2 {
            return edge
        }

        return []
    }
}
