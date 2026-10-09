class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var adj = Array(repeating: [Int](), count: n + 1)

        func connected(_ src: Int, _ dst: Int) -> Bool {
            var seen = Array(repeating: false, count: n + 1)
            seen[src] = true
            var stack = [src]
            while let node = stack.popLast() {
                if node == dst { return true }
                for next in adj[node] where !seen[next] {
                    seen[next] = true
                    stack.append(next)
                }
            }
            return false
        }

        for edge in edges {
            // Already linked by earlier edges, so this one makes a loop.
            if connected(edge[0], edge[1]) { return edge }
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
        }

        return []
    }
}
