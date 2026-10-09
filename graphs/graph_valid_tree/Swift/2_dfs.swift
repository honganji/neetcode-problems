class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n - 1 { return false }

        var adj = Array(repeating: [Int](), count: n)
        for edge in edges {
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
        }

        // Iterative DFS: each entry is (node, parent it was reached from).
        var visited = Array(repeating: false, count: n)
        var stack: [(Int, Int)] = [(0, -1)]
        while !stack.isEmpty {
            let (node, parent) = stack.removeLast()
            if visited[node] { return false }  // reached twice, so there is a cycle
            visited[node] = true
            for nei in adj[node] where nei != parent {
                stack.append((nei, node))
            }
        }

        // Every node must be reachable from node 0.
        return visited.allSatisfy { $0 }
    }
}
