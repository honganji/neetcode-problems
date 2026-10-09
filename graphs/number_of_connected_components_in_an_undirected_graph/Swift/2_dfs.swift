class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = Array(repeating: [Int](), count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }

        var visited = Array(repeating: false, count: n)
        var components = 0
        for start in 0..<n where !visited[start] {
            // Every unvisited node starts a new component.
            components += 1
            visited[start] = true
            var stack = [start]
            while let node = stack.popLast() {
                for neighbor in graph[node] where !visited[neighbor] {
                    visited[neighbor] = true
                    stack.append(neighbor)
                }
            }
        }

        return components
    }
}
